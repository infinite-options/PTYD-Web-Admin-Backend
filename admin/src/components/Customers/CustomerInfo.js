import React, { useState, useEffect } from "react";
import axios from "axios";
import { Grid, Cell } from "react-mdl";
import { Typography } from "@material-ui/core";

export default function CustomerInfo(props) {
  const [subscribed, setSubscribed] = useState(false);
  const [mondayAvailable, setMondayAvailable] = useState(false);
  const [purchaseAll, setPurchaseAll] = useState([]);
  const [nextAddonCharge, setNextAddonCharge] = useState(0);

  useEffect(() => {
    fetchData();
  }, [props.searchID]);

  const fetchData = async () => {
    const res = await axios.get(`${props.PURCHASE_API_URL}/${props.searchID}`);
    const purchasesApi = res.data;
    console.log(purchasesApi, "api");

    if (purchasesApi.result.length !== 0) {
      // currPur = purchasesApi.result[0];
      // purchaseId = purchasesApi.result[0].purchase_id;
      setSubscribed(true);
      setMondayAvailable(purchasesApi.result[0].monday_available);
      setPurchaseAll(purchasesApi.result);
      setNextAddonCharge(purchasesApi.result[0].total_charge);
    }
  };

  let subscription_selection = purchaseAll[0];
  if (subscription_selection == null) {
    return <div></div>;
  }
  return (
    <Grid>
      <Cell col={3}>
        {" "}
        <Grid>
          <Cell col={8}>
            <Typography variant="h4">
              Hi, {subscription_selection.delivery_first_name}
              {/* <th colSpan="2">{this.subscription_dropdown()}</th> */}
            </Typography>
          </Cell>
          {/* <MakeChanges
                user_uid={this.searchCookie4UserID("loginStatus")}
                loggedInBy={this.searchCookie4LoggedInBy("loginStatus")}
                DEV_URL={this.props.DEV_URL}
                DELETE_URL={this.props.DELETE_URL}
                UPDATE_URL={this.props.UPDATE_URL}
                UPDATE_URL_PAYMENT={this.props.UPDATE_URL_PAYMENT}
                meal_plan_id={this.state.purchase.meal_plan_id}
                subscription={this.state.purchase.meal_plan_desc}
                meal_plan_price={this.state.purchase.amount_due}
                paymentplan={this.state.paymentPlans}
                payment_plan={this.state.purchase.payment_frequency}
                cc_num={this.state.purchase.cc_num}
                cc_exp_date={this.state.purchase.cc_exp_date}
                cc_cvv={this.state.purchase.cc_cvv}
                delivery_address={this.state.purchase.delivery_address}
                delivery_address_unit={
                  this.state.purchase.delivery_address_unit
                }
                delivery_city={this.state.purchase.delivery_city}
                delivery_state={this.state.purchase.delivery_state}
                delivery_zip={this.state.purchase.delivery_zip}
                delivery_instructions={
                  this.state.purchase.delivery_instructions
                }
                purchase_id={this.state.purchase.purchase_id}
              /> */}
          {/* {displayrows} */}
          <div>
            <h4>Subscription Details</h4>
            <p>My Subscription: {subscription_selection.meal_plan_desc}</p>
            <p>Payment Plan: {subscription_selection.payment_frequency}</p>
            <p>
              Paid Weeks Remaining:{" "}
              {subscription_selection.paid_weeks_remaining}
            </p>
            <p>
              Next Charge: ${subscription_selection.amount_due_before_addon}
            </p>
            <p>Next Charge Date: {subscription_selection.next_charge_date}</p>
            <p>Next Addon Charge: ${nextAddonCharge}</p>
            <p>
              Next Addon Charge Date:{" "}
              {subscription_selection.next_addon_charge_date}
            </p>
            <p>
              Coupons:{" "}
              {subscription_selection.coupon_id
                ? subscription_selection.coupon_id
                : "None"}
            </p>
            <h4>Credit Card Details</h4>{" "}
            <p>Credit Card: {subscription_selection.cc_num}</p>
            <p>Expiration Date: {subscription_selection.cc_exp_date}</p>
            <p>CVV: {subscription_selection.cc_cvv}</p>
            <h4>Delivery Details</h4>{" "}
            <p>Address: {subscription_selection.delivery_address}</p>
            <p>Unit: {subscription_selection.delivery_address_unit}</p>
            <p>
              City, State ZIP: {subscription_selection.delivery_city},{" "}
              {subscription_selection.delivery_state}{" "}
              {subscription_selection.delivery_zip}
            </p>
            <p>Instructions: {subscription_selection.delivery_instructions}</p>
          </div>
        </Grid>
      </Cell>{" "}
    </Grid>
  );
}
