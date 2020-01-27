import React, { Component } from "react";
import ReactDOM from 'react-dom';

import Button from "react-bootstrap/Button";
import Popover from "react-bootstrap/Popover";
import OverlayTrigger from "react-bootstrap/OverlayTrigger";
import InputGroup from "react-bootstrap/InputGroup";
import FormControl from "react-bootstrap/FormControl";

import axios from "axios";

export default class Login extends Component {
  constructor(props) {
    super(props);

    this.textInput = React.createRef();

    this.state = {
      email: "",
      password: "",
      loginErrors: "",
      loginStatus: "Sign In",
      users: [
        {user: "mickey"},
        {user: "donald"}
      ]
    };

    this.changeStatus = this.changeStatus.bind(this);

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  changeStatus() {
    this.setState( {loginStatus: "Signed In"}, function () {
        console.log(this.state.loginStatus);
    } );
  }

  handleChange(event) {
    this.setState({
      [event.target.name]: event.target.value
    });
  }

  handleSubmit(event) {
    const { email, password } = this.state;

    axios
      .post(
        "http://localhost:3001/sessions",
        {
          user: {
            email: email,
            password: password
          }
        },
        { withCredentials: true }
      )
      .then(response => {
        if (response.data.logged_in) {
          this.props.handleSuccessfulAuth(response.data);
        }
      })
      .catch(error => {
        console.log("login error", error);
      });
    event.preventDefault();
  }

  getUser() {
    return this.textInput.current.value;
  }

  render() {

    function checkLogin() {
        var arr = getState();
        console.log(arr);
        for (var i = 0; i < arr.length; i++) {
          var r = (arr[i].user);
          if (r === user()) {
            console.log(user());
            document.getElementById("loginStatus").innerHTML = "Signed In";
            login();
            i = arr.length;
          } 
        
        }
      }
  
      const user = () => this.getUser();

      const login = () => this.changeStatus();
  
      const getState = () => {
        console.log(this.state);
        return this.state.users;
      }
  
      const popover = (
        <Popover id="popover-basic" size="sm">
          <Popover.Title as="h3">Signup or Login</Popover.Title>
          <Popover.Content>
            <InputGroup className="mb-3">
              <InputGroup.Prepend>
                <InputGroup.Text id="basic-addon1">@</InputGroup.Text>
              </InputGroup.Prepend>
              <FormControl
                ref={this.textInput}
                onChange={() => this.getUser()}
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
                placeholder="Password"
                aria-label="Password"
                aria-describedby="basic-addon2"
              />
            </InputGroup>
            <Button onClick={checkLogin}>Sign In</Button>
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
            { this.state.loginStatus }
        </p>
      </div>
    );
  }
}