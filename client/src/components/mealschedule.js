import React, { Component } from "react";
import { ButtonToolbar, Button } from "react-bootstrap";
import { Grid, Cell } from "react-mdl";
import IMG8 from "../img/img8.jpeg";
import MealButton from "./meal-button";

class Mealschedule extends Component {
  constructor(props) {
    super(props);
    this.state = { menu: [] };
  }

  async componentDidMount() {
    console.log(this.props);
    const res = await fetch(`${this.props.API_URL}`);
    const api = await res.json();

    let key;
    let sixWeekMenu = [];
    let weekNum;
    for (weekNum = 1; weekNum < 7; weekNum++) {
      key = "MenuForWeek" + weekNum;
      let currentWeek = {};
      console.log(api.result[key]);
      currentWeek.sun = api.result[key].Sunday;
      currentWeek.mon = api.result[key].Monday;
      currentWeek.menu = api.result[key].Meals;
      sixWeekMenu.push(currentWeek);
    }
    this.setState( {menu: sixWeekMenu} );

//  const users_res = await fetch(`${this.props.USERS_API_URL}`);
//  const users_api = await users_res.json();
  }

  render() {
    return (
      <div>
        <section class="content-section">
          <div class="container">
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
                    <h4>Hi, Prashant</h4>
                  </Cell>
                </Grid>
                <button
                  type="button"
                  class="btn2 btn2-primary"
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
                <h4>Subscription Details</h4> <p>My Subscription:</p>
                <p>Payment Plan:</p>
                <p>Paid Weeks Remaining:</p>
                <p>Next Charge:</p>
                <p>Next Charge Date:</p>
                <p>Coupons:</p>
                <p>Account Status:</p>
                <h4>Credit Card Details</h4> <p>Credit Card:</p>
                <p>Expiration Date:</p>
                <p>CVV:</p>
                <h4>Delivery Details</h4> <p>Address:</p>
                <p>Unit:</p>
                <p>City, State ZIP:</p>
                <p>Instructions:</p>
              </Cell>{" "}
              <Cell col={9}>
                <br />
                <br />
                <h3>Select Meals Around Your Schedule</h3>
                <br />
                <div class="meals-button">
                  {this.state.menu.map(eachWeek => (
                  <MealButton
                    day1="Sunday"
                    day2="Monday"
                    date1={eachWeek.sun}
                    date2={eachWeek.mon}
                  />
                  ))}
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
