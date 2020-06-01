import React, {Component} from "react";

export default class AccountInfo extends Component {
  constructor(props) {
    super();
    this.state = {
      currentPurchase: null // this will be passed from meal schedule
    };
  }
  render() {
    return (
      <div>
        <h4>Subscription Details</h4>
        <p>My Subscription: </p>
        <p>Payment Plan: </p>
        <p>Paid Weeks Remaining:</p>
        <p>Next Charge:</p>
        <p>Next Charge Date:</p>
        <p>Next Addon Charge: </p>
        <p>Next Addon Charge Date:</p>
        <p>Coupons: </p>
        <h4>Credit Card Details</h4> <p>Credit Card: </p>
        <p>Expiration Date: </p>
        <p>CVV: </p>
        <h4>Delivery Details</h4> <p>Address: </p>
        <p>Unit:</p>
        <p>City, State ZIP:</p>
        <p>Instructions:</p>
      </div>
    );
  }
}
