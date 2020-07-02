import React, {Component} from "react";

// import { Button, Form, Row, Col, Container } from "react-bootstrap";
import TruckIcon from "../../img/prepTruckIcon.png";

class CheckoutSuccess extends Component {
  render() {
    return (
      <div className='container text-center'>
        <h1>Checkout Successful!</h1>
        <div>
          <a href='/mealschedule'>
            <img src={TruckIcon} alt='Truck Icon' />
          </a>
        </div>
        <div>
          <a href='/mealschedule'>Go to Meal Schedule</a>
        </div>
      </div>
    );
  }
}

export default CheckoutSuccess;
