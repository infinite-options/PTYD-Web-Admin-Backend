import React, { useState, useEffect } from "react";

import Button from "react-bootstrap/Button";
import InputGroup from "react-bootstrap/InputGroup";
import FormControl from "react-bootstrap/FormControl";
import Container from "react-bootstrap/Button";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import Form from "react-bootstrap/Form";

import crypto from "crypto";

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

  useEffect(() => {
    onLoad();
    //componentDidMount();
  }, []);

  async function onLoad() {
    // fill it up when needed
    const res = await fetch(props.API_URL);
    const api = await res.json();
    const logins = api.result;
    setUsers(logins);
  }

  async function componentDidMount() {
    const res = await fetch(props.API_URL);
    const api = await res.json();
    const logins = api.result;
    setUsers(logins);
  }

  async function grabLoginInfoForUser(userEmail, userPass) {
    const salt = users.find(user => user.user_name === userEmail).password_salt;
    const res = await fetch(props.SINGLE_ACC_API_URL + '/' + userEmail + '/' + crypto.createHash('sha512').update(userPass + salt).digest('hex'));
    const api = await res.json();
    return api;
  }

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
            </Container>
            <Col>
            </Col>
          </div>
          <div className="text-center">
            <a href="/signup">New User? Sign Up Here</a>
          </div>
        </div>
    </main>
  );
}
