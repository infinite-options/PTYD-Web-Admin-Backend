import React, {useState, useEffect, Fragment} from "react";
import {useHistory} from "react-router-dom";

import Button from "react-bootstrap/Button";
import InputGroup from "react-bootstrap/InputGroup";
import FormControl from "react-bootstrap/FormControl";
import Container from "react-bootstrap/Button";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import Form from "react-bootstrap/Form";

import crypto from "crypto";
// import FacebookLogin from "react-facebook-login";
import GoogleLogin from "react-google-login";
import axios from "axios";
export default function Login(props) {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [loginStatus, setLoginStatus] = useState("");
  const [salt, setSalt] = useState("");
  const [error, RaiseError] = useState(null);

  function validateForm() {
    return email.length > 0 && password.length > 0;
  }

  function handleSubmit(event) {
    event.preventDefault();
  }

  useEffect(() => {
    (async function ByPassLogin() {
      await onLoad();
    })();
    //componentDidMount();
    // eslint-disable-next-line
  }, []);

  function onLoad() {
    // fill it up when needed
    let data;
    let params = props.match.params;
    let LogIn = (e, p) => {
      if (props.SINGLE_ACC_API_URL !== undefined) {
        axios(`${props.SINGLE_ACC_API_URL}/${e}/${p}`)
          .then(res => {
            data = res.data.result.result[0];
            document.cookie = ` loginStatus: Hello ${data.first_name}! ,  user_uid: ${data.uid} , ; path=/ `;
            props.history.push("/selectmealplan");
            window.location.reload(false);
          })
          .catch(err => {
            console.log(err);
            document.cookie = ` loginStatus: Sign In , user_uid: null , ; path=/ `;
            props.history.push("/login");
            window.location.reload(false);
          });
      }
    };
    if (params.email !== undefined && params.password !== undefined) {
      LogIn(params.email, params.password);
    }
  }
  async function componentDidMount() {
    const res = await fetch(props.API_URL);
    const api = await res.json();
    setSalt(api.result[0].password_salt);
  }

  // API GET Request for Social Media User Data
  async function checkForSocial(user) {
    const res = await fetch(props.SOCIAL_API_URL + "/" + user);
    const api = await res.json();
    const social = api.result.result[0];
    return social;
  }

  async function grabSocialUserInfor(uid) {
    const res = await fetch(props.SOCIAL_API_URL + "acc/" + uid);
    const api = await res.json();
    const login = api.result.result[0];
    return login;
  }

  const responseGoogle = response => {
    console.log("Google Response: ", response);
    const e = response.profileObj.email;
    const at = response.accessToken;
    const rt = response.googleId;

    checkForSocial(e)
      .then(res1 => {
        console.log("Social Media User: ", res1);
        grabSocialUserInfor(res1.user_uid)
          .then(res2 => socialLogin(res2))
          .catch(err => console.log(err));
      })
      .catch(err => {
        console.log(err);
        // Redirect to Signup Page for Social Media Users
        props.history.push({
          pathname: "/socialsignup",
          state: {
            email: e,
            social: "google",
            accessToken: at,
            refreshToken: rt
          }
        });
        window.location.reload(false);
      });
  };

  // const responseFacebook = response => {
  //   console.log(response);
  // };

  function socialLogin(user) {
    console.log("Login Social Media User: " + user);
    let uid = user.user_uid;
    let name = user.first_name;

    document.cookie = ` loginStatus: Hello ${name} ! , user_uid: ${uid} , `;
    console.log(document.cookie);

    // redirect & reload page for buttons and login status
    props.history.push("/");
    window.location.reload(false);

    console.log("Social Media Login Complete!");
  }

  // Direct Login
  async function grabLoginInfoForUser(userEmail, userPass) {
    let saltres;
    if (props.API_URL !== undefined) {
      saltres = await fetch(`${props.API_URL}/${userEmail}`);
    } else {
      saltres = await fetch(`${props.SINGLE_ACC_API_URL}salt/${userEmail}`);
    }
    const saltapi = await saltres.json();
    if (saltapi.result.length === 0) {
      throw "Invalid Email Address.";
    }
    const salt = saltapi.result[0].password_salt;
    const res = await fetch(
      props.SINGLE_ACC_API_URL +
        "/" +
        userEmail +
        "/" +
        crypto
          .createHash("sha512")
          .update(userPass + salt)
          .digest("hex")
    );
    const api = await res.json();
    if (api.auth_success === false) {
      throw "Sorry, Wrong Password.";
    } else {
      return api;
    }
  }

  async function checkLogin() {
    // let t = [];
    await grabLoginInfoForUser(email, password)
      .then(res => login(res))
      .catch(err => RaiseError(err));

    // await login(t);
  }

  async function login(response) {
    let userId = response.result.result[0].user_uid;
    console.log(userId);
    if (response.auth_success === true) {
      // setLoginStatus("Logged In");

      document.cookie =
        " loginStatus: Hello " +
        response.result.result[0].first_name +
        "! , " +
        " user_uid: " +
        response.result.result[0].user_uid +
        " , ";

      // redirect & reload page for buttons and login status

      // if (props.redirect_after_login !== null) {
      //   console.log(props.redirect_after_login); this redirect_after_login still !== null. It is undefined
      //   alert("prepare to redirect");
      //   props.history.push(props.redirect_after_login);
      //   window.location.reload(false);
      // } else {
      //   props.history.push("/");
      //   window.location.reload(false);
      // }

      //check for purchases
      const checkPurchases = await fetch(
        `${props.SINGLE_ACC_API_URL}purchases/${userId}`
      );

      if (checkPurchases.status === 200) {
        // if success
        let purchases = await checkPurchases.json();
        if (purchases !== undefined && purchases.result.length !== 0) {
          props.history.push("/mealschedule");
        } else if (purchases !== undefined && purchases.result.length === 0) {
          props.history.push("/selectmealplan");
        } else {
          props.history.push("/");
        }
        window.location.reload(false);
      } else {
        props.history.push("/"); // should prompt something or asking for re-login
      }
    } else {
      document.cookie = " loginStatus: Sign In , user_uid: null , ";
      // need code for failed authentication here
    }
  }

  return (
    <main Style='margin-top:-80px;'>
      <div class='container text-center' Style='margin-top:-40px;'>
        <h1>Login</h1>
        {error !== null && (
          <Fragment>
            <h6>
              <span className='icon has-text-danger'>
                <i className='fa fa-info-circle'></i>
              </span>
              <span className='has-text-danger'>{error}</span>
            </h6>
          </Fragment>
        )}
        <div class='row'>
          <Col></Col>
          <Container className='justify-content-center bg-success'>
            <Row>
              <Col>
                <Form onSubmit={handleSubmit} autoComplete='off'>
                  <Form.Label>Email</Form.Label>
                  <InputGroup className='mb-3'>
                    <FormControl
                      type='email'
                      value={email}
                      onChange={e => {
                        setEmail(e.target.value);
                        RaiseError(null);
                      }}
                      id='userForm'
                      placeholder='Enter Email'
                      aria-label='Email'
                      aria-describedby='basic-addon1'
                    />
                  </InputGroup>

                  <Form.Label>Password</Form.Label>
                  <InputGroup className='mb-3'>
                    <FormControl
                      value={password}
                      onChange={e => {
                        setPassword(e.target.value);
                        RaiseError(null);
                      }}
                      id='passForm'
                      placeholder='Enter Password'
                      aria-label='Password'
                      aria-describedby='basic-addon2'
                      type='password'
                    />
                  </InputGroup>

                  <Button
                    variant='dark'
                    onClick={checkLogin}
                    disabled={!validateForm()}
                    type='submit'
                  >
                    Sign In
                  </Button>
                </Form>
              </Col>
            </Row>

            <h4>Or Login With Social Media!</h4>

            <Row>
              {/*
                <Col>
                  <div 
                    Style={{
                      width: '200px'
                    }}
                  > 
                    <FacebookLogin
                      appId="508721976476931"
                      //autoLoad={true}
                      fields="name,email,picture"
                      onClick={console.log('test')}
                      callback={responseFacebook} 
                      size="small"
                      textButton="FB Login"
                    />
                  </div>
                </Col>
                */}

              <Col>
                <GoogleLogin
                  clientId='333899878721-tc2a70pn73hjcnegh2cprvqteiuu39h9.apps.googleusercontent.com'
                  buttonText='Login'
                  onSuccess={responseGoogle}
                  onFailure={responseGoogle}
                  cookiePolicy={"single_host_origin"}
                />
              </Col>
            </Row>
          </Container>
          <Col></Col>
        </div>
        <div className='text-center'>
          <a href='/signup'>New User? Sign Up Here</a>
        </div>
      </div>
    </main>
  );
}
