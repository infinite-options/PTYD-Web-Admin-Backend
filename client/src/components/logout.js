import React, { useState, useEffect } from "react";

import Button from "react-bootstrap/Button";
import Popover from "react-bootstrap/Popover";
import OverlayTrigger from "react-bootstrap/OverlayTrigger";
import InputGroup from "react-bootstrap/InputGroup";
import FormControl from "react-bootstrap/FormControl";
import Container from "react-bootstrap/Button";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import Form from "react-bootstrap/Form";

//import crypto from "crypto";

export default function Logout (props) {

  useEffect(() => {
    onLoad();
  }, []);

  async function onLoad() {
      checkLogin();
  }

  function checkLogin() {
    document.cookie = "Sign In";
  }

  return (
    <div className="text-center">
      <h3>You've been logged out!</h3>
    </div>
  );
}