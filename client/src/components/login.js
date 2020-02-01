import React, { useState, useEffect } from "react";

import Button from "react-bootstrap/Button";
import Popover from "react-bootstrap/Popover";
import OverlayTrigger from "react-bootstrap/OverlayTrigger";
import InputGroup from "react-bootstrap/InputGroup";
import FormControl from "react-bootstrap/FormControl";

//import crypto from "crypto";

export default function Login (props) {

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [loginStatus, setLoginStatus] = useState("")

  const users = [
    {user: "mickey", pass:"4c4699dcce2d8f4655a4a9be1afaf888c1655d0b2ca5ff64d4492cc0e7044bdfec6f52f70a6c75f6a55392417ecb975a6e557805134e2d1b701b6d92ede5bb34"},
    {user: "donald", pass:"39818fb2d074d0f356392539d68b67afbc4e3768e78b6375936b63555c6928452dcc96e50aeefbf01a56a01d958ad518d29aa9b5c46a6162363cf2438eab5066"}
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
      if (u === email ){//&& p == ( crypto.createHash('sha512').update( password ).digest('hex')) ) {
        document.getElementById("loginStatus").innerHTML = "Signed In";
        setLoginStatus("Logged In");
        document.cookie = "Logged In";
        //props.userHasAuthenticated(true);

        i = arr.length;
      } 
      else {
        document.getElementById("loginStatus").innerHTML = "Sign In";
        document.cookie = "Sign In";
        console.log(email, " ", u);
      }
    
    }
  }

  const popover = (
    <Popover id="popover-basic" size="sm">
      <Popover.Title as="h3">Signup or Login</Popover.Title>
      <Popover.Content>
        <form onSubmit={handleSubmit}>
          <InputGroup className="mb-3">
            <InputGroup.Prepend>
              <InputGroup.Text id="basic-addon1">@</InputGroup.Text>
            </InputGroup.Prepend>
            <FormControl
              value={email}
              onChange={e => setEmail(e.target.value)}
              id="userForm"
              placeholder="Username"
              aria-label="Username"
              aria-describedby="basic-addon1"
            />
          </InputGroup>
          <InputGroup className="mb-3">
            <InputGroup.Prepend>
              <InputGroup.Text id="basic-addon2">@</InputGroup.Text>
            </InputGroup.Prepend>
            <FormControl
              value={password}
              onChange={e => setPassword(e.target.value)}
              id="passForm"
              placeholder="Password"
              aria-label="Password"
              aria-describedby="basic-addon2"
            />
          </InputGroup>
          <Button onClick={checkLogin} disabled={!validateForm()} type="submit" >Sign In</Button>
        </form>

        <p>
          Or <strong><a href="/">Signup</a></strong> Here!
        </p>
      </Popover.Content>
    </Popover>
  );

  const Example = () => (
    <OverlayTrigger trigger="click" placement="right" overlay={popover}>
      <Button variant="success" size="sm">Get Started</Button>
    </OverlayTrigger>
  );

  return (
    <div>
      <Example></Example>
      <p id="loginStatus" Style="font-size:12px; text-align:right; color:black;">
        { document.cookie }
      </p>
    </div>
  );
}