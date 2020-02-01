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
                <br />
                <h3>Subscription Details</h3>{" "}
                <Grid>
                  <Cell col={7}>
                    <h6>My Subscription:</h6>
                    <h6>Payment Plan:</h6>
                    <h6>Paid Weeks Remaining:</h6>
                    <h6>Next Charge:</h6>
                    <h6>Next Charge Date:</h6>
                    <h6>Coupons:</h6>
                    <h6>Account Status:</h6>
                    <Cell col={5}></Cell>
                  </Cell>
                </Grid>
                <h3>Credit Card Details</h3>{" "}
                <Grid>
                  <Cell col={7}>
                    <h6>Credit Card:</h6>
                    <h6>Expiration Date:</h6>
                    <h6>CVV:</h6>

                    <Cell col={5}></Cell>
                  </Cell>
                </Grid>
                <h3>Delivery Details</h3>{" "}
                <Grid>
                  <Cell col={7}>
                    <h6>Address:</h6>
                    <h6>Unit:</h6>
                    <h6>City, State ZIP:</h6>
                    <h6>Instructions:</h6>
                    <Cell col={5}></Cell>
                  </Cell>
                </Grid>
              </Cell>{" "}
              <Cell col={7}>
                <br />
                <h3>Select Meals Around Your Schedule</h3>
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
