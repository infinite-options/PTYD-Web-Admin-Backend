import React, { Component } from "react";
import {
  ButtonToolbar,
  ToggleButtonGroup,
  ToggleButton
} from "react-bootstrap";
import { Grid, Cell } from "react-mdl";
import IMG8 from "../img/img8.jpeg";

import { Link } from "react-router-dom";

class Mealschedule extends Component {
  changeDisable(btn, color) {
    this.button.disabled = !this.button.disabled;
    this.button2.disabled = !this.button2.disabled;
  }
  stayDisable(btn) {
    if (!this.button.disabled) {
      this.button.disabled = !this.button.disabled;
      this.button2.disabled = !this.button2.disabled;
    } else {
      this.button.disabled = this.button.disabled;
      this.button2.disabled = this.button2.disabled;
    }
  }
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
                {/* <Grid>
                  <Cell col={2}>
                    <svg width="400" height="110">
                      <rect
                        width="70"
                        height="70"
                        style={{
                          fill: "none",
                          fillOpacity: "0.1",
                          strokeWidth: "1",
                          stroke: "rgb(0,0,0)"
                        }}
                      />
                      <text x="3%" y="35%" fill="black">
                        Sunday
                      </text>
                    </svg>
                  </Cell>
                  <Cell col={2}>
                    <svg width="400" height="110">
                      <rect
                        width="70"
                        height="70"
                        style={{
                          fill: "none",
                          fillOpacity: "0.1",
                          strokeWidth: "1",
                          stroke: "rgb(0,0,0)"
                        }}
                      />
                      <text x="3%" y="35%" fill="black">
                        Monday
                      </text>
                    </svg>
                  </Cell>
                  <Cell col={2}>
                    <svg width="400" height="110">
                      <rect
                        width="70"
                        height="70"
                        style={{
                          fill: "none",
                          fillOpacity: "0.1",
                          strokeWidth: "1",
                          stroke: "rgb(0,0,0)"
                        }}
                      />
                      <text x="3%" y="25%" fill="black">
                        Skip
                      </text>
                      <text x="3%" y="35%" fill="black">
                        This
                      </text>
                      <text x="3%" y="45%" fill="black">
                        Week
                      </text>
                    </svg>
                  </Cell>
                </Grid> */}
                <button onClick={this.changeDisable}>Sunday</button>
                <button onClick={this.changeDisable.bind(this)}>Monday</button>
                <button onClick={this.stayDisable.bind(this)}>
                  Skip This Week
                </button>
                &nbsp;&nbsp;&nbsp;
                <button
                  className="add-item__button"
                  ref={button => (this.button = button)}
                >
                  Select Meal
                </button>
                <button ref={button => (this.button2 = button)}>
                  Surprise Me!
                </button>
              </Cell>
            </Grid>
          </div>
        </section>
      </div>
    );
  }
}

export default Mealschedule;
