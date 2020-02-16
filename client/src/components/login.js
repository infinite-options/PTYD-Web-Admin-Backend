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
    componentDidMount();
  }, []);

  async function onLoad() {
    // fill it up when needed
  }

  async function componentDidMount() {
    const res = await fetch(props.API_URL);
    const api = await res.json();
    const logins = api.result;
    setUsers(logins);
  }

  function checkLogin() {
    let arr = users;
    console.log(arr);
    for (var i = 0; i < arr.length; i++) {
      var u = arr[i].user_name;
      var p = arr[i].password_sha512;
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
        document.cookie = " loginStatus: Sign In , ";
      }
    
    }
  }

  return (
    <main Style="margin-top:-80px;">
        <div class="container text-center" Style="margin-top:-40px;">
            <h1>Login</h1>
        <div class="row">
            <Col></Col>

            <Container className="justify-content-center">
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

                    <Button variant="success" onClick={checkLogin} disabled={!validateForm()} type="submit" >Sign In</Button>

                  </Form>
                </Col>
              </Row>
            </Container>

            <Col></Col>
          </div>
        </div>
    </main>
  );
}
