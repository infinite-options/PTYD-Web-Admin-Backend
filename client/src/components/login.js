import React, { useState, useEffect } from "react";

import Button from "react-bootstrap/Button";
import InputGroup from "react-bootstrap/InputGroup";
import FormControl from "react-bootstrap/FormControl";
import Container from "react-bootstrap/Button";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import Form from "react-bootstrap/Form";

import crypto from "crypto";
import FacebookLogin from 'react-facebook-login';
import GoogleLogin from 'react-google-login';

export default function Login (props) {

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [loginStatus, setLoginStatus] = useState("");
  const [salt, setSalt] = useState("");

  function validateForm() {
    return email.length > 0 && password.length > 0;
  }

  function handleSubmit(event) {
    event.preventDefault();
  }

  useEffect(() => {  }, []);

  // Social Media 

  // API GET Request for Social Media User Data
  async function checkForSocial(user) {
    const res = await fetch(props.SOCIAL_API_URL + '/' + user );
    const api = await res.json();
    const social = api.result.result[0];
    return social;
  }

  async function grabSocialUserInfor(uid) {
    const res = await fetch(props.SOCIAL_API_URL + 'acc/' + uid );
    const api = await res.json();
    const login = api.result.result[0];
    return login;
  }

  const responseGoogle = (response) => {
    console.log("Google Response: ", response);
    const e = response.profileObj.email
    const at = response.accessToken
    const rt = response.googleId

    checkForSocial(e)
    .then(res1 => { 
      console.log("Social Media User: ", res1)
      grabSocialUserInfor(res1.user_uid)
      .then(res2 => socialLogin(res2))
      .catch(err => console.log(err)) }
    )
    .catch(err => {
      console.log(err)
      // Redirect to Signup Page for Social Media Users
      props.history.push({
        pathname: "/socialsignup",
        state: {
          email: e,
          social: "google",
          accessToken: at,
          refreshToken: rt
        }
      })
      window.location.reload(false)
    })
  }
  // Maria Alejcgfbaifeg Changsky	104605834561957	pnkuzirrok_1587274227@tfbnw.net

  const responseFacebook = (response) => {
    console.log("Facebook Response ", response);
    const e = response.email
    const at = response.accessToken
    const rt = response.id
    console.log(e, at, rt)

    checkForSocial(e)
    .then(res1 => { 
      console.log("Social Media User: ", res1)
      grabSocialUserInfor(res1.user_uid)
      .then(res2 => socialLogin(res2))
      .catch(err => console.log(err)) }
    )
    .catch(err => {
      console.log(err)
      // Redirect to Signup Page for Social Media Users
      props.history.push({
        pathname: "/socialsignup",
        state: {
          email: e,
          social: "facebook",
          accessToken: at,
          refreshToken: rt
        }
      })
      window.location.reload(false)
    })
  }

  function socialLogin(user) {
    console.log("Login Social Media User: " + user)
    let uid = user.user_uid
    let name = user.first_name
      
    document.cookie = " loginStatus: Hello " + name  + "! , " + " user_uid: " + uid + " , ";
    console.log(document.cookie)

    // redirect & reload page for buttons and login status
    props.history.push("/");
    window.location.reload(false);
    
    console.log('Social Media Login Complete!');
  }

  // Direct Login

  // API GET Request for User Data
  async function grabLoginInfoForUser(userEmail, userPass) {
    const saltres = await fetch(props.API_URL + '/' + userEmail);
    const saltapi = await saltres.json();
    const salt = saltapi.result[0].password_salt;
    console.log(salt);
    const res = await fetch(props.SINGLE_ACC_API_URL + '/' + userEmail + '/' + crypto.createHash('sha512').update(userPass + salt).digest('hex'));
    const api = await res.json();
    return api;
  }

  // Direct User Login
  function checkLogin() {
    let t = [];
    grabLoginInfoForUser(email, password)
    .then(res => login(res))
    .catch(err => console.log(err));
    login(t);
  }

  function login(response) {
    if (response.auth_success == true) {
      setLoginStatus("Logged In");

      document.cookie = " loginStatus: Hello " + response.result.result[0].first_name  + "! , " + " user_uid: " + response.result.result[0].user_uid + " , ";

      // redirect & reload page for buttons and login status
      if (props.redirect_after_login !== null) {
        props.history.push(props.redirect_after_login);
        window.location.reload(false);
      }
      else {
        props.history.push('/');
        window.location.reload(false);
      }

    } 
    else {
      document.cookie = " loginStatus: Sign In , user_uid: null , ";
      // need code for failed authentication here
    }
  }

  return (
    <main Style="margin-top:-80px;">
        <div class="container text-center" Style="margin-top:-40px;">
            <h1>Login</h1>
        <div class="row">
            <Col></Col>

            <Container className="justify-content-center bg-success">
              <Row>
                <Col>               
                  <Form onSubmit={handleSubmit} autoComplete="off">

                    <Form.Label>Email</Form.Label>
                    <InputGroup className="mb-3">
                      <FormControl
                        type="email"
                        value={email}
                        onChange={e => setEmail(e.target.value)}
                        id="userForm"
                        placeholder="Enter Email"
                        aria-label="Email"
                        aria-describedby="basic-addon1"
                      />
                    </InputGroup>

                    <Form.Label>Password</Form.Label>
                    <InputGroup className="mb-3">
                      <FormControl
                        value={password}
                        onChange={e => setPassword(e.target.value)}
                        id="passForm"
                        placeholder="Enter Password"
                        aria-label="Password"
                        aria-describedby="basic-addon2"
                        type="password"
                      />
                    </InputGroup>

                    <Button variant="dark" onClick={ checkLogin } disabled={!validateForm()} type="submit" >Sign In</Button>

                  </Form>
                </Col>
              </Row>

              <h4>
                Or Login With Social Media!
              </h4>

              <Row>
                {
                <Col>
                  <div 
                    Style={{
                      width: '200px'
                    }}
                  > 
                    <FacebookLogin
                      appId="508721976476931"
                      autoLoad={true}
                      fields="name,email,picture"
                      onClick={console.log('test')}
                      callback={responseFacebook} 
                      size="small"
                      textButton="FB Login"
                    />
                  </div>
                </Col>
                }
                
                <Col>
                  <GoogleLogin
                    clientId="333899878721-tc2a70pn73hjcnegh2cprvqteiuu39h9.apps.googleusercontent.com"
                    buttonText="Login"
                    onSuccess={responseGoogle}
                    onFailure={responseGoogle}
                    cookiePolicy={'single_host_origin'}
                  />
                </Col>
              </Row>
            </Container>

            <Col></Col>
          </div>
          <div className="text-center">
            <a href="/signup">New User? Sign Up Here</a>
          </div>
        </div>
    </main>
  );
}
