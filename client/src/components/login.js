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
  const [loginStatus, setLoginStatus] = useState("")

  const users = [
    {user: "mickey", pass:"4c4699dcce2d8f4655a4a9be1afaf888c1655d0b2ca5ff64d4492cc0e7044bdfec6f52f70a6c75f6a55392417ecb975a6e557805134e2d1b701b6d92ede5bb34"},
    {user: "donald", pass:"39818fb2d074d0f356392539d68b67afbc4e3768e78b6375936b63555c6928452dcc96e50aeefbf01a56a01d958ad518d29aa9b5c46a6162363cf2438eab5066"},
    {user: "Strother", pass:"b109f3bbbc244eb82441917ed06d618b9008dd09b3befd1b5e07394c706a8bb980b1d7785e5976ec049b46df5f1326af5a2ea6d103fd07c95385ffab0cacbc86"}
  ];

  function validateForm() {
    return email.length > 0 && password.length > 0;
  }

  function handleSubmit(event) {
    event.preventDefault();
  }

  useEffect(() => {
    onLoad();
  }, []);

  async function onLoad() {
  }

  function checkLogin() {
    var arr = users;
    console.log(arr);
    for (var i = 0; i < arr.length; i++) {
      var u = arr[i].user;
      var p = arr[i].pass;
      if (u === email && p === ( crypto.createHash('sha512').update( password ).digest('hex')) ) {
        document.getElementById("loginStatus").innerHTML = "Logged In";
        setLoginStatus("Logged In");
        document.cookie = loginStatus;
        document.cookie = "Hello " +  u  + "!";
        i = arr.length;
        // redirect & reload page for buttons and login status
        props.history.push("/");
        window.location.reload(false);
      } 
      else {
        document.getElementById("loginStatus").innerHTML = "Sign In";
        document.cookie = "Sign In";
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