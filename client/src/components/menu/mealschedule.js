import React, {Component} from "react";
import {Grid, Cell} from "react-mdl";
import IMG8 from "../../img/img8.jpeg";
import MealButton from "./meal-button";
import MakeChanges from "./make-account-changes";
import MenuItem from "@material-ui/core/MenuItem";
import FormControl from "@material-ui/core/FormControl";
import Select from "@material-ui/core/Select";
import {ButtonToolbar, Button, Modal, Card, Form} from "react-bootstrap";
import Cookies from "js-cookie";
import axios from "axios";

class Mealschedule extends Component {
  constructor(props) {
    super(props);

    this.state = {
      select_date: this.props.match.params.startdate,
      menu: [],
      user_uid: this.props.appProps.user_uid,
      purchase: {NextCharge: 0},
      subscribed: false,
      monday_available: false,
      paymentPlans: [],
      purchase_all: [], //hold all subscriptions
      selection: 0,
      api: null,
      nextAddonCharge: 0
    };
    this.changeMenuButtons = this.changeMenuButtons.bind(this);
    this.handleChange = this.handleChange.bind(this);
    // this.getRefresh = this.getRefresh.bind(this);
    this.nextAddonChargeChange = this.nextAddonChargeChange.bind(this);
  }

  getCookieAttrHelper(cname, type) {
    const values = Cookies.get(cname);
    if (values === "" || values === undefined) {
      return null;
    } else {
      for (let val of values.split(",")) {
        let [n, v] = val.split(":");
        if (n === type) {
          return v;
        }
      }
      return null;
    }
  }
  searchCookie4LoggedInBy(cname) {
    return this.getCookieAttrHelper(cname, "loggedInBy");
  }
  searchCookie4Name(cname) {
    return this.getCookieAttrHelper(cname, "first_name");
  }
  searchCookie4UserID(cname) {
    return this.getCookieAttrHelper(cname, "user_uid");
  }
  async changeMenuButtons() {
    let currPur = this.state.purchase_all[this.state.selection]; //t - change
    let purchaseId = currPur.purchase_id; //

    const res = await fetch(
      this.props.match.params.startdate
        ? this.props.API_URL + "/" + this.props.match.params.startdate
        : this.props.API_URL
    );
    const api = await res.json();

    let monday_available = currPur.monday_available;
    // let api = this.state.api;
    if (api === null) return;
    const mselect_res = await fetch(
      `${this.props.MEAL_SELECT_API_URL}/${purchaseId}`
    );
    const mselect_api = await mselect_res.json();

    let key;
    let sixWeekMenu = [];
    let weekNum;
    if (api.result === null) {
      return;
    }
    for (weekNum = 1; weekNum < 7; weekNum++) {
      key = "MenuForWeek" + weekNum;
      if (!(key in api.result)) break;

      let currentWeek = {};
      currentWeek.sat = api.result[key].SaturdayDate;
      currentWeek.sun = api.result[key].Sunday;
      currentWeek.mon = api.result[key].Monday;
      currentWeek.menu = api.result[key].Meals;
      currentWeek.addons = api.result[key].Addons;
      currentWeek.mealQuantities = api.result[key].MealQuantities;
      currentWeek.addonQuantities = Object.assign(
        {},
        currentWeek.mealQuantities
      );
      currentWeek.addonPrice = api.result[key].AddonPrice;
      currentWeek.maxmeals = currPur.MaximumMeals;
      currentWeek.deliverDay = "Sunday";
      currentWeek.surprise = true;
      currentWeek.addonsSelected = false;

      for (let week in mselect_api.result.Meals) {
        if (mselect_api.result.Meals[week].week_affected === currentWeek.sat) {
          if (mselect_api.result.Meals[week].meal_selection === "SKIP") {
            currentWeek.deliverDay = "SKIP";
          } else if (
            mselect_api.result.Meals[week].meal_selection === "SURPRISE"
          ) {
            currentWeek.deliverDay =
              mselect_api.result.Meals[week].delivery_day;
          } else {
            for (let mealId in mselect_api.result.Meals[week].meals_selected) {
              currentWeek.mealQuantities[mealId] =
                mselect_api.result.Meals[week].meals_selected[mealId];
              currentWeek.maxmeals -=
                mselect_api.result.Meals[week].meals_selected[mealId];
              currentWeek.deliverDay =
                mselect_api.result.Meals[week].delivery_day;
              currentWeek.surprise = false;
            }
          }
        }
      }

      for (let week in mselect_api.result.Addons) {
        if (mselect_api.result.Addons[week].week_affected == currentWeek.sat) {
          for (let mealId in mselect_api.result.Addons[week].meals_selected) {
            if (mealId === "") {
              continue;
            }
            currentWeek.addonQuantities[mealId] =
              mselect_api.result.Addons[week].meals_selected[mealId];
            currentWeek.addonsSelected = true;
          }
        }
      }

      sixWeekMenu.push(currentWeek);
    }
    const plans_res = await fetch(this.props.PLANS_URL);
    const plans_api = await plans_res.json();

    const plans = plans_api.result;
    var keys = Object.keys(plans);
    let new_plans = [];

    for (let i in keys) {
      let x = plans[keys[i]].result;
      for (let j = 1; j < x.length; j++) {
        new_plans.push(x[j]);
      }
    }
    this.setState({
      menu: sixWeekMenu,
      purchase: currPur,
      paymentPlans: new_plans,
      monday_available: monday_available
    });
  }
  async componentDidMount() {
    this.setState({first_name: this.searchCookie4Name("loginStatus")});

    let currPur = {};
    let purchaseId = 0;
    //  Handle startdate parameter on URL with ternary operator
    //  Use this to turn back / forward time
    //  Make sure to disable this when putting into production
    const res = await fetch(
      this.props.match.params.startdate
        ? this.props.API_URL + "/" + this.props.match.params.startdate
        : this.props.API_URL
    );

    // API_URL: https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/meals
    const api = await res.json();
    console.log("api", api);
    if (this.state.user_uid !== null) {
      if (this.state.select_date === undefined) {
        this.setState({select_date: null});
      }
      const purchases = await axios.get(
        `${this.props.PURCHASE_API_URL}/${this.state.user_uid}`,
        {params: {startdate: this.state.select_date}}
      );
      const purchasesApi = purchases.data;
      console.log("purchaseApi", purchasesApi);
      // const purchasesApi = await purchases.json();

      // Check if user has any active subscriptions
      if (purchasesApi.result.length != 0) {
        currPur = purchasesApi.result[this.state.selection];
        purchaseId = purchasesApi.result[this.state.selection].purchase_id;
        this.setState({subscribed: true});
        this.setState({
          subscribed: true,
          monday_available:
            purchasesApi.result[this.state.selection].monday_available,
          purchase_all: purchasesApi.result,
          api: api,
          nextAddonCharge:
            purchasesApi.result[this.state.selection].total_charge
        });
      }
    }

    const mselect_res = await fetch(
      `${this.props.MEAL_SELECT_API_URL}/${purchaseId}`
    );
    const mselect_api = await mselect_res.json();
    console.log("mselect_api", mselect_api);
    let key;
    let sixWeekMenu = [];
    let weekNum;
    for (weekNum = 1; weekNum < 7; weekNum++) {
      key = "MenuForWeek" + weekNum;
      if (!(key in api.result)) break;

      let currentWeek = {};
      currentWeek.sat = api.result[key].SaturdayDate;
      currentWeek.sun = api.result[key].Sunday;
      currentWeek.mon = api.result[key].Monday;
      currentWeek.menu = api.result[key].Meals;
      currentWeek.addons = api.result[key].Addons;
      currentWeek.mealQuantities = api.result[key].MealQuantities;
      currentWeek.addonQuantities = Object.assign(
        {},
        currentWeek.mealQuantities
      );
      currentWeek.addonPrice = api.result[key].AddonPrice;
      console.log("addonprice", api.result[key].AddonPrice);
      console.log("meal quantities", currentWeek.mealQuantities);
      console.log("addon quantities2", currentWeek.addonQuantities);
      currentWeek.maxmeals = currPur.MaximumMeals;
      currentWeek.deliverDay = "Sunday";
      currentWeek.surprise = true;
      currentWeek.addonsSelected = false;

      for (let week in mselect_api.result.Meals) {
        if (mselect_api.result.Meals[week].week_affected === currentWeek.sat) {
          if (mselect_api.result.Meals[week].meal_selection === "SKIP") {
            currentWeek.deliverDay = "SKIP";
          } else if (
            mselect_api.result.Meals[week].meal_selection == "SURPRISE"
          ) {
            currentWeek.deliverDay =
              mselect_api.result.Meals[week].delivery_day;
          } else {
            for (let mealId in mselect_api.result.Meals[week].meals_selected) {
              currentWeek.mealQuantities[mealId] =
                mselect_api.result.Meals[week].meals_selected[mealId];
              currentWeek.maxmeals -=
                mselect_api.result.Meals[week].meals_selected[mealId];
              currentWeek.deliverDay =
                mselect_api.result.Meals[week].delivery_day;
              currentWeek.surprise = false;
            }
          }
        }
      }

      for (let week in mselect_api.result.Addons) {
        if (mselect_api.result.Addons[week].week_affected == currentWeek.sat) {
          for (let mealId in mselect_api.result.Addons[week].meals_selected) {
            currentWeek.addonQuantities[mealId] =
              mselect_api.result.Addons[week].meals_selected[mealId];
            currentWeek.addonsSelected = true;
          }
        }
      }
      sixWeekMenu.push(currentWeek);
    }
    console.log("sixWeekMenu", sixWeekMenu);
    const plans_res = await fetch(this.props.PLANS_URL);
    const plans_api = await plans_res.json();
    const plans = plans_api.result;
    console.log("plans_api", plans);

    var keys = Object.keys(plans);
    console.log("plans: ", plans);
    console.log("keys: ", keys);
    let new_plans = [];
    let skip = 0;

    for (let k of Object.keys(plans)) {
      if (k !== "MealPlans") {
        let x = plans[k].result;
        for (let j = 0; j < x.length; j++) {
          new_plans.push(x[j]);
        }
      }
    }

    this.setState({
      menu: sixWeekMenu,
      purchase: currPur,
      paymentPlans: new_plans
    });
  }
  //dropdown for different subscription
  async handleChange(event) {
    await this.setState({
      selection: event.target.value
    });
    this.setState(() => {
      this.changeMenuButtons();
    });
  }
  // async getRefresh() {
  //   if (this.state.user_uid == null) return;
  //   console.log("getting refresh", this.state);
  //   let currPur = {};
  //   let purchaseId = 0;
  //   if (this.state.user_uid !== null) {
  //     const purchases = await fetch(
  //       `${this.props.PURCHASE_API_URL}/${this.state.user_uid}`
  //     );
  //     const purchasesApi = await purchases.json();

  //     // Check if user has any active subscriptions
  //     if (purchasesApi.result.length != 0) {
  //       currPur = purchasesApi.result[this.state.selection];
  //       purchaseId = purchasesApi.result[this.state.selection].purchase_id;
  //       this.setState({
  //         purchase_all: purchasesApi.result
  //       });
  //     }
  //   }
  //   console.log("done getting refresh");
  // }
  nextAddonChargeChange = newTotal => {
    this.setState({nextAddonCharge: newTotal});
  };

  render() {
    let displayrows = [];
    let subscription_selection = this.state.purchase_all[this.state.selection];
    if (subscription_selection == null) {
      return <div></div>;
    }
    console.log("selection", subscription_selection);
    // for (let i = 0; i < subscription_selection.length; i++) {
    // let tempelement = (
    // <div>
    //   <h4>Subscription Details</h4>
    //   <p>My Subscription: {subscription_selection.meal_plan_desc}</p>
    //   <p>Payment Plan: {subscription_selection.payment_frequency}</p>
    //   <p>
    //     Paid Weeks Remaining: {subscription_selection.paid_weeks_remaining}
    //   </p>
    //   <p>Next Charge: ${subscription_selection.amount_due_before_addon}</p>
    //   <p>Next Charge Date: {subscription_selection.next_charge_date}</p>
    //   <p>Next Addon Charge: ${subscription_selection.total_charge}</p>
    //   <p>
    //     Next Addon Charge Date:{" "}
    //     {subscription_selection.next_addon_charge_date}
    //   </p>
    //   <p>
    //     Coupons:{" "}
    //     {subscription_selection.coupon_id
    //       ? subscription_selection.coupon_id
    //       : "None"}
    //   </p>
    //   <h4>Credit Card Details</h4>{" "}
    //   <p>Credit Card: {subscription_selection.cc_num}</p>
    //   <p>Expiration Date: {subscription_selection.cc_exp_date}</p>
    //   <p>CVV: {subscription_selection.cc_cvv}</p>
    //   <h4>Delivery Details</h4>{" "}
    //   <p>Address: {subscription_selection.delivery_address}</p>
    //   <p>Unit: {subscription_selection.delivery_address_unit}</p>
    //   <p>
    //     City, State ZIP: {subscription_selection.delivery_city},{" "}
    //     {subscription_selection.delivery_state}{" "}
    //     {subscription_selection.delivery_zip}
    //   </p>
    //   <p>Instructions: {subscription_selection.delivery_instructions}</p>
    // </div>
    // );
    // displayrows.push(tempelement);

    // let addon_price_saved = subscription_selection.weekly_addon_cost;
    return (
      // <div>
      //   <section class="content-section">
      <div class='container font2'>
        <Grid>
          <Cell col={3}>
            {" "}
            <Grid>
              <Cell col={8}>
                <h4 style={{overflowWrap: "anywhere"}}>
                  Hi, {this.searchCookie4Name("loginStatus")}
                  <th colSpan='2'>{this.subscription_dropdown()}</th>
                </h4>
              </Cell>
              <MakeChanges
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
              />
              {displayrows}
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
                <p>
                  Next Charge Date: {subscription_selection.next_charge_date}
                </p>
                <p>Next Addon Charge: ${this.state.nextAddonCharge}</p>
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
                <p>
                  Instructions: {subscription_selection.delivery_instructions}
                </p>
              </div>
            </Grid>
          </Cell>{" "}
          <Cell col={1}></Cell>
          <Cell col={8}>
            <h3 className='font1'>
              <b>Select Meals Around Your Schedule</b>
            </h3>
            <div>{console.log(this.state.menu)}</div>
            <div className='meals-button'>
              {this.state.menu.map(eachWeek => (
                <MealButton
                  day1='Sunday'
                  day2='Monday'
                  saturdayDate={eachWeek.sat}
                  date1={eachWeek.sun}
                  date2={eachWeek.mon}
                  menu={eachWeek.menu}
                  addons={eachWeek.addons}
                  mealQuantities={eachWeek.mealQuantities}
                  addonQuantities={eachWeek.addonQuantities}
                  addon_price_saved={this.create_addon_price(eachWeek)}
                  maxmeals={eachWeek.maxmeals}
                  purchase_id={this.state.purchase.purchase_id}
                  deliverDay={eachWeek.deliverDay}
                  subscribed={this.state.subscribed}
                  surprise={eachWeek.surprise}
                  addonsSelected={eachWeek.addonsSelected}
                  monday_available={this.state.monday_available}
                  MEAL_SELECT_API_URL={this.props.MEAL_SELECT_API_URL}
                  DEV_URL={this.props.DEV_URL}
                  // api_refresh={this.getRefresh}
                  nextAddonChargeDate={
                    this.state.purchase_all[this.state.selection]
                      .next_addon_charge_date
                  }
                  nextAddonChargeChange={this.nextAddonChargeChange}
                />
              ))}
            </div>
          </Cell>
        </Grid>
      </div>
      //   </section>
      // </div>
    );
  }

  create_addon_price = eachWeek => {
    console.log("xxx");
    let addon_price_saved = {};
    let quantity = eachWeek.addonQuantities;
    let price = eachWeek.addonPrice;
    console.log("yyy", quantity, price);
    for (var key in quantity) {
      console.log(key);
      let tempQuantity = quantity[key];
      let tempPrice = price[key];
      if (isNaN(tempQuantity * tempPrice)) {
        console.log("naughty value");
        addon_price_saved[key] = 0;
        continue;
      }
      addon_price_saved[key] = tempQuantity * tempPrice;
      // console.log(tempQuantity * tempPrice);
    }
    return addon_price_saved;
  };

  subscription_dropdown = () => {
    if (this.state.purchase_all === null) {
      return <div />;
    }
    let temp = [];
    let existed_meal_subscription = {};

    for (let i = 0; i < this.state.purchase_all.length; i++) {
      if (
        !(
          this.state.purchase_all[i].meal_plan_desc in existed_meal_subscription
        )
      ) {
        temp.push(
          <MenuItem value={i}>
            {this.state.purchase_all[i].meal_plan_desc}
          </MenuItem>
        );
        existed_meal_subscription[
          this.state.purchase_all[i].meal_plan_desc
        ] = 1;
      } else {
        existed_meal_subscription[
          this.state.purchase_all[i].meal_plan_desc
        ] += 1;
        temp.push(
          <MenuItem value={i}>
            {this.state.purchase_all[i].meal_plan_desc +
              " " +
              existed_meal_subscription[
                this.state.purchase_all[i].meal_plan_desc
              ]}
          </MenuItem>
        );
      }
    }
    return (
      <FormControl>
        <Select
          labelId='demo-simple-select-label'
          id='demo-simple-select'
          value={this.state.selection}
          onChange={this.handleChange}
          // style={{ color: "white" }}
        >
          {temp}
        </Select>
      </FormControl>
    );
  };
}

export default Mealschedule;
