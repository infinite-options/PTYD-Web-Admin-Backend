import React, { Component } from "react";
import { Grid, Cell } from "react-mdl";
import IMG8 from "../../img/img8.jpeg";
import MealButton from "./meal-button";

class Mealschedule extends Component {
  constructor(props) {
    super(props);

    this.state = {
      menu: [],
      user_uid: searchCookie4UserID(document.cookie),
      user: { NextCharge: 0 }
    };

    function searchCookie4UserID(str) {
      let arr = str.split(" ");
      let i = arr.indexOf("user_uid:");
      return arr[i + 1];
    }
  }

  searchCookie4Name(str) {
    let arr = str.split(" ");
    let i = arr.indexOf("loginStatus:");
    return arr[i + 2];
  }

  async componentDidMount() {
    let currUser = {};
    let purchaseId = 0;

    const res = await fetch(this.props.API_URL);
    const api = await res.json();

    if (this.state.user_uid !== null) {
      const users = await fetch(`${this.props.PURCHASE_API_URL}/${this.state.user_uid}`);
      const usersApi = await users.json();
      if (usersApi.result.length != 0) {
        currUser = usersApi.result[0];
        purchaseId = usersApi.result[0].purchase_id;
      }
    }

    const mselect_res = await fetch(`${this.props.MEAL_SELECT_API_URL}/${purchaseId}`);
    const mselect_api = await mselect_res.json();

    let key;
    let sixWeekMenu = [];
    let weekNum;
    for (weekNum = 1; weekNum < 2; weekNum++) {
      key = "MenuForWeek" + weekNum;
      if(!(key in api.result)) break

      let currentWeek = {};
      currentWeek.sat = api.result[key].SaturdayDate;
      currentWeek.sun = api.result[key].Sunday;
      currentWeek.mon = api.result[key].Monday;
      currentWeek.menu = api.result[key].Meals;
      currentWeek.addons = api.result[key].Meals.Addons;
      currentWeek.mealQuantities = 5 //currUser.mealQuantities;
      currentWeek.maxmeals = currUser.MaximumMeals;
      currentWeek.deliverDay = 'Sunday';
      currentWeek.surprise = true;

      for (let week in mselect_api.result) {
        if (mselect_api.result[week].week_affected == currentWeek.sat) {
          if (mselect_api.result[week].meal_selection == 'SKIP') {
            currentWeek.deliverDay = 'SKIP';
          }
          else if (mselect_api.result[week].meal_selection == 'SURPRISE') {
            currentWeek.deliverDay = mselect_api.result[week].delivery_day;
          }
          else {
            for (let mealId in mselect_api.result[week].meals_selected) {
              currentWeek.mealQuantities[mealId] = mselect_api.result[week].meals_selected[mealId];
              currentWeek.maxmeals -= mselect_api.result[week].meals_selected[mealId];
              currentWeek.deliverDay = mselect_api.result[week].delivery_day;
              currentWeek.surprise = false;
            }
          }
        }
      }
      sixWeekMenu.push(currentWeek);
    }
    this.setState({ menu: sixWeekMenu, user: currUser });
  }

  render() {
    return (
      <div>
        <section class="content-section">
          <div class="container font2">
            <Grid>
              <Cell col={3}>
                {" "}
                <Grid>
                  <Cell col={4}>
                    <img
                      style={{
                        borderRadius: "50%",
                        width: "70px",
                        height: "70px",
                        marginTop: "10px"
                      }}
                      src={IMG8}
                      alt="Avatar"
                    ></img>
                  </Cell>
                  <Cell col={8}>
                    <h4>Hi, {this.searchCookie4Name(document.cookie)}</h4>
                  </Cell>
                </Grid>
                <button
                  type="button"
                  class="btn2 btn2-primary font4"
                  style={{
                    marginTop: "10px",
                    paddingLeft: "10px",
                    paddingRight: "10px",
                    paddingTop: "5px",
                    paddingBottom: "5px",
                    color: "white",
                    fontSize: "12px"
                  }}
                >
                  Make Account Changes
                </button>
                <br />
                <h4>Subscription Details</h4>{" "}
                <p>My Subscription: {this.state.user.meal_plan_desc}</p>
                <p>Payment Plan: {this.state.user.payment_frequency}</p>
                <p>
                  Paid Weeks Remaining: {this.state.user.PaidWeeksRemaining}
                </p>
                <p>Next Charge: ${this.state.user.amount_due}</p>
                <p>Next Charge Date: {this.state.user.NextChargeDate}</p>
                <p>Coupons:</p>
                <p>Account Status: {this.state.user.purchase_status}</p>
                <h4>Credit Card Details</h4>{" "}
                <p>Credit Card: {this.state.user.cc_num}</p>
                <p>Expiration Date: {this.state.user.cc_exp_date}</p>
                <p>CVV: {this.state.user.cc_cvv}</p>
                <h4>Delivery Details</h4>{" "}
                <p>Address: {this.state.user.delivery_address}</p>
                <p>Unit: {this.state.user.delivery_address_unit}</p>
                <p>
                  City, State ZIP: {this.state.user.delivery_city},{" "}
                  {this.state.user.delivery_state} {this.state.user.delivery_zip}
                </p>
                <p>Instructions: {this.state.user.delivery_instructions}</p>
              </Cell>{" "}
              <Cell col={1}></Cell>
              <Cell col={8}>
                <br />
                <br />
                <h3 class="font1">
                  <b>Select Meals Around Your Schedule</b>
                </h3>
                <br />
                <div>
                  { console.log(this.state.menu) }
                </div>
                <div class="meals-button">
                  {
                  this.state.menu.map(eachWeek => 
                    <MealButton
                      day1="Sunday"
                      day2="Monday"
                      saturdayDate={eachWeek.sat}
                      date1={eachWeek.sun}
                      date2={eachWeek.mon}
                      menu={eachWeek.menu}
                      addons={eachWeek.addons}
                      mealQuantities={eachWeek.mealQuantities}
                      maxmeals={eachWeek.maxmeals}
                      purchase_id={this.state.user.purchase_id}
                      deliverDay={eachWeek.deliverDay}
                      surprise={eachWeek.surprise}
                      API_URL={this.props.API_URL}
                    />
                  )
                  }
                </div>
              </Cell>
            </Grid>
          </div>
        </section>
      </div>
    );
  }
}

export default Mealschedule;
