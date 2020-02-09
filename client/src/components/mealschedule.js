import React, { Component } from "react";
import { ButtonToolbar, Button } from "react-bootstrap";
import { Grid, Cell } from "react-mdl";
import IMG8 from "../img/img8.jpeg";
import MealButton from "./meal-button";

class Mealschedule extends Component {
  render() {
    return (
      <div>
        <section class="content-section">
          <div class="container">
            <Grid>
              <Cell col={5}>
                {" "}
                <Grid>
                  <Cell col={3}>
                    <img
                      style={{
                        borderRadius: "50%",
                        width: "80px",
                        height: "80px",
                        marginTop: "10px"
                      }}
                      src={IMG8}
                      alt="Avatar"
                    ></img>
                  </Cell>
                  <Cell col={9}>
                    <h3>Hi, Prashant</h3>
                  </Cell>
                </Grid>
                <button
                  type="button"
                  class="btn2 btn2-primary"
                  style={{
                    marginLeft: "50px",
                    marginTop: "10px",
                    paddingLeft: "10px",
                    paddingRight: "10px",
                    paddingTop: "5px",
                    paddingBottom: "5px",
                    color: "white",
                    fontSize: "15px"
                  }}
                >
                  Make Account Changes
                </button>
                <br />
                <Grid>
                  <Cell col={7}>
                    <h4>Subscription Details</h4> <p>My Subscription:</p>
                    <p>Payment Plan:</p>
                    <p>Paid Weeks Remaining:</p>
                    <p>Next Charge:</p>
                    <p>Next Charge Date:</p>
                    <p>Coupons:</p>
                    <p>Account Status:</p>
                    <Cell col={5}></Cell>
                    <h4>Credit Card Details</h4> <p>Credit Card:</p>
                    <p>Expiration Date:</p>
                    <p>CVV:</p>
                    <Cell col={5}></Cell>
                    <h4>Delivery Details</h4> <p>Address:</p>
                    <p>Unit:</p>
                    <p>City, State ZIP:</p>
                    <p>Instructions:</p>
                    <Cell col={5}></Cell>
                  </Cell>
                </Grid>
              </Cell>{" "}
              <Cell col={7}>
                <br />
                <br />
                <h3>Select Meals Around Your Schedule</h3>
                <br />
                <div class="meals-button">
                  <MealButton
                    day1="Sunday"
                    day2="Monday"
                    date1="Jan 26"
                    date2="Jan 27"
                  />
                  <MealButton
                    day1="Sunday"
                    day2="Monday"
                    date1="Feb 2"
                    date2="Feb 3"
                  />
                  <MealButton
                    day1="Sunday"
                    day2="Monday"
                    date1="Feb 9"
                    date2="Feb 10"
                  />
                  <MealButton
                    day1="Sunday"
                    day2="Monday"
                    date1="Feb 16"
                    date2="Feb 17"
                  />
                  <MealButton
                    day1="Sunday"
                    day2="Monday"
                    date1="Feb 23"
                    date2="Feb 24"
                  />
                  <MealButton
                    day1="Sunday"
                    day2="Monday"
                    date1="Mar 3"
                    date2="Mar 4"
                  />
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
