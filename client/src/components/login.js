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
  const [users, setUsers] = useState([]);

  function validateForm() {
    return email.length > 0 && password.length > 0;
  }

  function handleSubmit(event) {
    event.preventDefault();
  }

  useEffect(() => {}, []);
 
  const responseGoogle = (response) => {
    console.log(response.Qt);
    const e = response.Qt.zu;
    const fn = response.Qt.vW;
    const ln = response.Qt.wU;
    const u = fn + ln;
    setEmail(u);
    console.log(email);
    setPassword(u);
    grabLoginInfoForUser(u, u)
    .then(res => login(res))
    .catch(err => console.log(err));
  }

  const responseFacebook = (response) => {
    console.log(response);
  }

  async function checkSocialMedia() {
    try {
      checkLogin();
      return "success";
    } catch {
      return "err";
    }
  }

  async function grabLoginInfoForUser(userName, userPass) {
    const res = await fetch(props.SINGLE_ACC_API_URL + '/' + userName + '/' + userPass);
    const api = await res.json();
    const login = api.result;
    console.log(login);
    return login;
  }

  function checkLogin() {
    //let t = []
    grabLoginInfoForUser(email, password)
    .then(res => {login(res); console.log(res);})
    .catch(err => console.log(err));
    //login(t);
  }

  function login(user) {
    let arr = user
    console.log(arr);
    for (var i = 0; i < arr.length; i++) {
      var u = arr[i].user_name;
      var p = arr[i].password_sha512;
      console.log(i);
      if (u === email && p === ( crypto.createHash('sha512').update( password ).digest('hex')) ) {
        setLoginStatus("Logged In");

        document.cookie = " loginStatus: Hello " + arr[i].first_name  + "! , " + " user_uid: " + arr[i].user_uid + " , ";
        console.log(document.cookie)
        i = arr.length;

        // redirect & reload page for buttons and login status
        props.history.push("/");
        window.location.reload(false);
      } 
      else {
        document.cookie = " loginStatus: Sign In , user_uid: null , ";
      }
    console.log('end of login');
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
                        value={email}
                        onChange={e => setEmail(e.target.value)}
                        id="userForm"
                        placeholder="Enter Email"
                        aria-label="Username"
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
                <Col>
                  <h4>
                    Or Login With Social Media!
                  </h4>
                  <Row>
                    <Col>
                      <div Style="width:150px;"> 
                      <FacebookLogin
                        appId="1088597931155576"
                        autoLoad={true}
                        fields="name,email,picture"
                        onClick={console.log('test')}
                        callback={responseFacebook} 
                        size="small"
                        textButton="FB Login"
                      />
                      </div>
                    </Col>
                    
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
                </Col>
              <Row>

              </Row>
            </Container>

            <Col></Col>
          </div>
        </div>
    </main>
  );
}
