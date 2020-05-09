import React, {useState, useEffect, Fragment} from "react";
import {useHistory} from "react-router-dom";

import Button from "react-bootstrap/Button";
import InputGroup from "react-bootstrap/InputGroup";
import FormControl from "react-bootstrap/FormControl";
import Container from "react-bootstrap/Button";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import Form from "react-bootstrap/Form";

import axios from "axios";
import crypto from "crypto";
import FacebookLogin from "react-facebook-login";
import GoogleLogin from "react-google-login";

import {getIp, getBrowser} from "../functions/getClientInfo";

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

  async function onLoad() {
    // fill it up when needed
    let data;
    let params = props.match.params;
    let ip_res = await getIp();
    let browser_type = getBrowser().browser_type;
    let LogIn = (e, p) => {
      if (props.SINGLE_ACC_API_URL !== undefined) {
        axios
          .post(`${props.SINGLE_ACC_API_URL}/${e}/${p}`, {
            ip_address: ip_res.ip,
            browser_type: browser_type
          })
          .then(res => {
            data = res.data.result.result[0];
            let first = data.first_name;
            let uid = data.user_uid;
            let login_id = data.login_id;
            let session_id = data.session_id;
            document.cookie = `loginStatus=loggedInBy:direct,first_name:${first},user_id:${uid},login_id:${login_id},session_id:${session_id}; path=/`;
            props.history.push("/selectmealplan");
            window.location.reload(false);
          })
          .catch(err => {
            console.log(err);
            document.cookie = `loginStatus=; path=/`;
            props.history.push("/login");
            window.location.reload(false);
          });
      }
    };
    if (params.email !== undefined && params.password !== undefined) {
      LogIn(params.email, params.password);
    }
  }
  // async function componentDidMount() {
  //   const res = await fetch(props.API_URL);
  //   const api = await res.json();
  //   setSalt(api.result[0].password_salt);
  // }

  // API GET Request for Social Media User Data
  async function grabSocialUserInfo(email) {
    try {
      let res = await axios.get(`${props.SOCIAL_API_URL}/${email}`);
      console.log(res.data);
      if (res.data !== undefined && res.data.result.result.length === 0) {
        // throw "No record found.";
        return null;
      }
      let uid = res.data.result.result[0].user_uid;
      const ip_res = await getIp();
      const browser_type = getBrowser().browser_type;
      const res1 = await axios.post(
        `${props.SOCIAL_API_URL}acc/${uid}`,
        {
          ip_address: ip_res.ip,
          browser_type: browser_type
        },
        {
          headers: {
            "Content-Type": "application/json;charset=UTF-8",
            "Access-Control-Allow-Origin": "*" // use this to prevent 405 error on Chrome
          }
        }
      );
      //success
      if (res1.data !== undefined && res1.data.result.result.length === 0) {
        // throw "No record found.";
        return null;
      } else {
        return res1.data;
      }
    } catch (err) {
      console.log(err);
    }
  }

  const responseGoogle = async response => {
    if (response.profileObj !== null || response.profileObj !== undefined) {
      const e = response.profileObj.email;
      const at = response.accessToken;
      const rt = response.googleId;
      const first_name = response.profileObj.givenName;
      const last_name = response.profileObj.familyName;
      let data = await grabSocialUserInfo(e);

      if (data === null) {
        //email not found --> render to signup for social
        props.history.push({
          pathname: "/socialsignup",
          state: {
            lastname: last_name,
            firstname: first_name,
            email: e,
            // social: "facebook",
            accessToken: at,
            refreshToken: rt,
            SOCIAL_API_URL: `${props.SOCIAL_API_URL}acc`
          }
        });
      } else {
        socialLogin(data);
      }
    } else {
      console.log("Google does not have file on this user. lol");
    }
  };
  // Maria Alejcgfbaifeg Changsky	104605834561957	pnkuzirrok_1587274227@tfbnw.net

  const responseFacebook = async response => {
    if (response.email !== null && response.email !== undefined) {
      const e = response.email;
      const at = response.accessToken;
      const rt = response.id;
      const name = response.name.split(" ");
      const last_name = name[name.length - 1];
      let first_name = "";
      for (let n = 0; n < name.length - 1; n++) {
        first_name += name[n] + " ";
      }
      let data = await grabSocialUserInfo(e);
      if (data === null) {
        //email not found --> render to signup for social
        props.history.push({
          pathname: "/socialsignup",
          state: {
            lastname: last_name,
            firstname: first_name,
            email: e,
            // social: "facebook",
            accessToken: at,
            refreshToken: rt,
            SOCIAL_API_URL: `${props.SOCIAL_API_URL}acc`
          }
        });
      } else {
        socialLogin(data);
      }
    } else {
      console.log(`Facebook does not have any info about this user.`);
    }
  };

  function socialLogin(data) {
    console.log(data);
    const log_attemp = data.login_attempt_log;
    const result = data.result.result[0];
    let uid = result.user_uid;
    let name = result.first_name;
    let session_id = log_attemp.session_id;
    let login_id = log_attemp.login_id;
    document.cookie = `loginStatus=loggedInBy:social,first_name:${name},user_uid:${uid},login_id:${login_id},session_id:${session_id}; path=/`;
    checkForPurchased(uid);
  }

  // Direct Login
  async function checkForPurchased(userId) {
    try {
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
    } catch (e) {
      console.log(e);
    }
  }
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

    const ip_res = await getIp();
    const browser_type = getBrowser().browser_type;
    const pass = crypto
      .createHash("sha512")
      .update(userPass + salt)
      .digest("hex");
    try {
      const res = await axios.post(
        props.SINGLE_ACC_API_URL + "/" + userEmail + "/" + pass,
        {
          ip_address: ip_res.ip,
          browser_type: browser_type
        }
      );
      if (res.status === 200) {
        //success
        return res.data;
      } else {
        RaiseError("Wrong password");
      }
    } catch (err) {
      RaiseError(err);
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
    if (response.auth_success === true) {
      // setLoginStatus("Logged In");
      let first = response.result.result[0].first_name;
      let uid = response.result.result[0].user_uid;
      let login_id = response.login_attempt_log.login_id;
      let session_id = response.login_attempt_log.session_id;
      document.cookie = `loginStatus=loggedInBy:direct,first_name:${first},user_uid:${uid},login_id:${login_id},session_id:${session_id}; path=/`;
      //check for purchases
      checkForPurchased(uid);
    } else {
      document.cookie = `loginStatus=; path=/`;
    }
  }

  return (
    <main Style='margin-top:-80px;'>
      <div class='container text-center' Style='margin-top:-40px;'>
        <h1>Login</h1>
        {error !== null && error !== undefined && (
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
              <Col>
                <div
                  Style={{
                    width: "200px"
                  }}
                >
                  <FacebookLogin
                    appId='228246798404476'
                    autoLoad={false}
                    fields='name,email,picture'
                    onClick='return false'
                    callback={responseFacebook}
                    size='small'
                    textButton='FB Login'
                  />
                </div>
              </Col>

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
