import React, { Component } from "react";

import { Button, Form, Row, Col, Container } from "react-bootstrap";
import TruckIcon from "../../img/prepTruckIcon.png";

class CheckoutSuccess extends Component {
  render() {
    return (
      <div class="container text-center">
        <h1>Checkout Successful!</h1>
        <a href="/">
          <img src={TruckIcon} alt="Truck Icon" />
        </a>
      </div>
    );
  }
}

export default CheckoutSuccess;
