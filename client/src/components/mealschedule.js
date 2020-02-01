import React, { Component } from "react";
import { ButtonToolbar, Button } from "react-bootstrap";
import { Grid, Cell } from "react-mdl";
import IMG8 from "../img/img8.jpeg";

class Mealschedule extends Component {
  state = {
    count: 0,
    buttonS: false,
    buttonM: false,
    buttonSkip: false,
    buttonSelect: false,
    buttonSurprise: false
  };

  // changeDisable(btn) {
  //   // this.button3.style.backgroundColor = "white";
  //   // this.button4.style.backgroundColor = "white";

  //   // var target = btn.target;
  //   // if (this.state.count == 0) {
  //   //   target.style.backgroundColor = "white";
  //   //   target.style.color = "gray";
  //   //   this.state.count = 1;
  //   // } else {
  //   //   target.style.backgroundColor = "pink";
  //   //   target.style.color = "gray";
  //   //   this.state.count = 0;
  //   // }
  //   this.button.disabled = this.button.enabled;
  //   this.button2.disabled = this.button2.enabled;
  // }
  // stayDisable(btn) {
  //   if (!this.button.disabled) {
  //     this.button.disabled = !this.button.disabled;
  //     this.button2.disabled = !this.button2.disabled;
  //   } else {
  //     this.button.disabled = this.button.disabled;
  //     this.button2.disabled = this.button2.disabled;
  //   }
  // }
  // changeColor(btn) {
  //   var target = btn.target;
  //   if (this.state.count1 == 0) {
  //     target.style.backgroundColor = "white";
  //     this.state.count1 = 1;
  //   } else {
  //     target.style.backgroundColor = "blue";
  //     target.style.color = "gray";
  //     this.state.count1 = 0;
  //   }
  // }

  changeButtonS = () => {
    this.setState({
      buttonS: true,
      buttonM: false,
      buttonSkip: false
    });

    this.button.disabled = this.button.enabled;
    this.button2.disabled = this.button2.enabled;
  };

  changeButtonM = () => {
    this.setState({
      buttonM: true,
      buttonS: false,
      buttonSkip: false
    });

    this.button.disabled = this.button.enabled;
    this.button2.disabled = this.button2.enabled;
  };

  changeButtonSkip = () => {
    this.setState({
      buttonM: false,
      buttonS: false,
      buttonSkip: true,

      buttonSurprise: false,
      buttonSelect: false
    });
    this.button.disabled = !this.button.disabled;
    this.button2.disabled = !this.button2.disabled;
  };

  changeButtonSelect = () => {
    this.setState({
      buttonSelect: true,
      buttonSurprise: false
    });
  };
  changeButtonSurprise = () => {
    this.setState({
      buttonSelect: false,
      buttonSurprise: true
    });
  };

  render() {
    const pink = {
      width: "80px",
      height: "80px",
      backgroundColor: "pink",
      color: "gray"
    };

    const hide = {
      width: "80px",
      height: "80px",
      backgroundColor: "white",
      color: "gray"
    };
    const green = {
      width: "80px",
      height: "80px",
      backgroundColor: "green",
      color: "white"
    };

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
                <div class="meals-button">
                  <ButtonToolbar>
                    <div className="radio">
                      <Button
                        variant="outline-secondary"
                        ref={button => (this.button = button)}
                        onClick={this.changeButtonS}
                        style={this.state.buttonS ? pink : hide}
                      >
                        Sunday
                      </Button>
                      &nbsp;
                      <Button
                        variant="outline-secondary"
                        onClick={this.changeButtonM}
                        style={this.state.buttonM ? pink : hide}
                      >
                        Monday
                      </Button>
                      &nbsp;
                      <Button
                        variant="outline-secondary"
                        onClick={this.changeButtonSkip}
                        style={{ width: "80px", height: "80px" }}
                      >
                        Skip This Week
                      </Button>
                    </div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <Button
                      variant="outline-secondary"
                      ref={button => (this.button = button)}
                      onClick={this.changeButtonSelect}
                      style={this.state.buttonSelect ? green : hide}
                    >
                      Select Meal
                    </Button>
                    &nbsp;
                    <Button
                      variant="outline-secondary"
                      ref={button => (this.button2 = button)}
                      onClick={this.changeButtonSurprise}
                      style={this.state.buttonSurprise ? green : hide}
                    >
                      Surprise Me!
                    </Button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <Button
                      variant="outline-secondary"
                      style={{ width: "80px", height: "80px" }}
                    >
                      Special Requests
                    </Button>
                  </ButtonToolbar>
                  {/* <br />
                  <ButtonToolbar>
                    <Button
                      variant="outline-secondary"
                      onClick={this.changeDisable.bind(this)}
                      style={{ width: "80px", height: "80px" }}
                    >
                      Sunday
                    </Button>
                    &nbsp;
                    <Button
                      variant="outline-secondary"
                      onClick={this.changeDisable.bind(this)}
                      style={{ width: "80px", height: "80px" }}
                    >
                      Monday
                    </Button>
                    &nbsp;
                    <Button
                      variant="outline-secondary"
                      onClick={this.stayDisable.bind(this)}
                      style={{ width: "80px", height: "80px" }}
                    >
                      Skip This Week
                    </Button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <Button
                      variant="outline-secondary"
                      ref={button => (this.button = button)}
                      style={{ width: "80px", height: "80px" }}
                    >
                      Select Meal
                    </Button>
                    &nbsp;
                    <Button
                      variant="outline-secondary"
                      ref={button => (this.button2 = button)}
                      style={{ width: "80px", height: "80px" }}
                    >
                      Surprise Me!
                    </Button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <Button
                      variant="outline-secondary"
                      style={{ width: "80px", height: "80px" }}
                    >
                      Special Requests
                    </Button>
                  </ButtonToolbar>
                  <br />
                  <ButtonToolbar>
                    <Button
                      variant="outline-secondary"
                      onClick={this.changeDisable.bind(this)}
                      style={{ width: "80px", height: "80px" }}
                    >
                      Sunday
                    </Button>
                    &nbsp;
                    <Button
                      variant="outline-secondary"
                      onClick={this.changeDisable.bind(this)}
                      style={{ width: "80px", height: "80px" }}
                    >
                      Monday
                    </Button>
                    &nbsp;
                    <Button
                      variant="outline-secondary"
                      onClick={this.stayDisable.bind(this)}
                      style={{ width: "80px", height: "80px" }}
                    >
                      Skip This Week
                    </Button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <Button
                      variant="outline-secondary"
                      ref={button => (this.button = button)}
                      style={{ width: "80px", height: "80px" }}
                    >
                      Select Meal
                    </Button>
                    &nbsp;
                    <Button
                      variant="outline-secondary"
                      ref={button => (this.button2 = button)}
                      style={{ width: "80px", height: "80px" }}
                    >
                      Surprise Me!
                    </Button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <Button
                      variant="outline-secondary"
                      style={{ width: "80px", height: "80px" }}
                    >
                      Special Requests
                    </Button>
                  </ButtonToolbar>
                  <br />
                  <ButtonToolbar>
                    <Button
                      variant="outline-secondary"
                      onClick={this.changeDisable.bind(this)}
                      style={{ width: "80px", height: "80px" }}
                    >
                      Sunday
                    </Button>
                    &nbsp;
                    <Button
                      variant="outline-secondary"
                      onClick={this.changeDisable.bind(this)}
                      style={{ width: "80px", height: "80px" }}
                    >
                      Monday
                    </Button>
                    &nbsp;
                    <Button
                      variant="outline-secondary"
                      onClick={this.stayDisable.bind(this)}
                      style={{ width: "80px", height: "80px" }}
                    >
                      Skip This Week
                    </Button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <Button
                      variant="outline-secondary"
                      ref={button => (this.button = button)}
                      style={{ width: "80px", height: "80px" }}
                    >
                      Select Meal
                    </Button>
                    &nbsp;
                    <Button
                      variant="outline-secondary"
                      ref={button => (this.button2 = button)}
                      style={{ width: "80px", height: "80px" }}
                    >
                      Surprise Me!
                    </Button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <Button
                      variant="outline-secondary"
                      style={{ width: "80px", height: "80px" }}
                    >
                      Special Requests
                    </Button>
                  </ButtonToolbar>
                  <br />
                  <ButtonToolbar>
                    <Button
                      variant="outline-secondary"
                      onClick={this.changeDisable.bind(this)}
                      style={{ width: "80px", height: "80px" }}
                    >
                      Sunday
                    </Button>
                    &nbsp;
                    <Button
                      variant="outline-secondary"
                      onClick={this.changeDisable.bind(this)}
                      style={{ width: "80px", height: "80px" }}
                    >
                      Monday
                    </Button>
                    &nbsp;
                    <Button
                      variant="outline-secondary"
                      onClick={this.stayDisable.bind(this)}
                      style={{ width: "80px", height: "80px" }}
                    >
                      Skip This Week
                    </Button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <Button
                      variant="outline-secondary"
                      ref={button => (this.button = button)}
                      style={{ width: "80px", height: "80px" }}
                    >
                      Select Meal
                    </Button>
                    &nbsp;
                    <Button
                      variant="outline-secondary"
                      ref={button => (this.button2 = button)}
                      style={{ width: "80px", height: "80px" }}
                    >
                      Surprise Me!
                    </Button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <Button
                      variant="outline-secondary"
                      style={{ width: "80px", height: "80px" }}
                    >
                      Special Requests
                    </Button>
                  </ButtonToolbar>
                  <br />
                  <ButtonToolbar>
                    <Button
                      variant="outline-secondary"
                      onClick={this.changeDisable.bind(this)}
                      style={{ width: "80px", height: "80px" }}
                    >
                      Sunday
                    </Button>
                    &nbsp;
                    <Button
                      variant="outline-secondary"
                      onClick={this.changeDisable.bind(this)}
                      style={{ width: "80px", height: "80px" }}
                    >
                      Monday
                    </Button>
                    &nbsp;
                    <Button
                      variant="outline-secondary"
                      onClick={this.stayDisable.bind(this)}
                      style={{ width: "80px", height: "80px" }}
                    >
                      Skip This Week
                    </Button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <Button
                      variant="outline-secondary"
                      ref={button => (this.button = button)}
                      style={{ width: "80px", height: "80px" }}
                    >
                      Select Meal
                    </Button>
                    &nbsp;
                    <Button
                      variant="outline-secondary"
                      ref={button => (this.button2 = button)}
                      style={{ width: "80px", height: "80px" }}
                    >
                      Surprise Me!
                    </Button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <Button
                      variant="outline-secondary"
                      style={{ width: "80px", height: "80px" }}
                    >
                      Special Requests
                    </Button>
                  </ButtonToolbar> */}
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
