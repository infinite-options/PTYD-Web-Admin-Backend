import React, {Component} from "react";

export default class AccountInfo extends Component {
  constructor(props) {
    super(props);
    this.state = {
      currentPurchase: this.props.currentPurchase // this will be passed from meal schedule
    };
  }
  componentDidUpdate = prevProps => {
    if (prevProps.currentPurchase !== this.props.currentPurchase) {
      this.setState({
        currentPurchase: this.props.currentPurchase
      });
    }
  };
  render() {
    // lazy to type whole thing multiple times
    let current = this.state.currentPurchase;
    return (
      <div>
        <h4>Subscription Details</h4>
        <p>My Subscription: {current.meal_plan_desc}</p>
        <p>Payment Plan: {current.payment_frequency}</p>
        <p>Paid Weeks Remaining: {current.paid_weeks_remaining}</p>
        <p>
          Next Charge:{" "}
          {(
            parseFloat(current.meal_plan_price) * (1 + this.props.tax_rate) +
            this.props.shipping
          ).toFixed(2)}
        </p>
        <p>Next Charge Date: {current.next_charge_date}</p>
        <p>
          Next Addon Charge: {parseFloat(this.props.addonCharge).toFixed(2)}
        </p>
        <p>Next Addon Charge Date: {current.next_addon_charge_date}</p>
        <p>Coupons: {current.coupon_id ? current.coupon_id : 0}</p>
        <h4>Credit Card Details</h4>
        <p>Credit Card: {current.cc_num} </p>
        <p>Expiration Date: {current.cc_exp_date}</p>
        <p>CVV: {current.cc_cvv}</p>
        <h4>Delivery Details</h4>
        <p>
          Name: {current.delivery_first_name} {current.delivery_last_name}
        </p>
        <p>Address: {current.delivery_address} </p>
        <p>Unit: {current.delivery_address_unit}</p>
        <p>
          City, State ZIP: {current.delivery_city}, {current.delivery_zip}{" "}
        </p>
        <p>Instructions: {current.delivery_instructions}</p>
      </div>
    );
  }
}
