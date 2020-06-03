import React, { Component } from "react";
import {
  Button,
  ButtonToolbar,
  Tooltip,
  Card,
  Modal,
  OverlayTrigger,
} from "react-bootstrap";
import { Grid, Cell } from "react-mdl";

import EachMeal from "./EachMeal";
import EachAddon from "./EachAddon";

export default class MealButton extends Component {
  constructor(props) {
    super(props);
    this.state = {
      currentPurchase: {}, // get from meal schedule
      sixWeekMenu: [], // get from meal schedule. this is 6 week menu

      //some variable to control button
      sundayButton: {
        chosen: false,
        isDisabled: false,
      },
      mondayButton: {
        chosen: false,
        isDisabled: false,
      },
      skipButton: {
        chosen: false,
        isDisabled: false,
      },
      selectButton: {
        chosen: false,
        red: false,
        showModal: false,
        isDisabled: false,
      },
      surpriseButton: {
        chosen: false,
        isDisabled: false,
      },
      addonButton: {
        chosen: false,
        red: false,
        showModal: false,
        isDisabled: false,
      },

      // Local variable
      mealLeft: 0,
    };
  }
  componentDidMount = (prevProps) => {
    // watching on changing of purchase_id from parent to load the newest currentPurchase
  };

  clickSunday = () => {
    this.setState((prevState) => ({
      sundayButton: {
        ...prevState.sundayButton,
        chosen: true,
      },
      mondayButton: {
        ...prevState.mondayButton,
        chosen: false,
      },
      skipButton: {
        ...prevState.skipButton,
        chosen: false,
        isDisabled: false,
      },
      selectButton: {
        ...prevState.selectButton,
        isDisabled: false,
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        isDisabled: false,
      },
      addonButton: {
        ...prevState.addonButton,
        isDisabled: false,
      },
    }));
  };

  clickMonday = () => {
    this.setState((prevState) => ({
      sundayButton: {
        ...prevState.sundayButton,
        chosen: false,
      },
      mondayButton: {
        ...prevState.mondayButton,
        chosen: true,
      },
      skipButton: {
        ...prevState.skipButton,
        chosen: false,
        isDisabled: false,
      },
      selectButton: {
        ...prevState.selectButton,
        isDisabled: false,
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        isDisabled: false,
      },
      addonButton: {
        ...prevState.addonButton,
        isDisabled: false,
      },
    }));
  };

  clickSkip = () => {
    this.setState((prevState) => ({
      sundayButton: {
        ...prevState.sundayButton,
        chosen: false,
        isDisabled: false,
      },
      mondayButton: {
        ...prevState.mondayButton,
        chosen: false,
        isDisabled: false,
      },
      skipButton: {
        ...prevState.skipButton,
        chosen: true,
        isDisabled: false,
      },
      selectButton: {
        chosen: false,
        red: false,
        showModal: false,
        isDisabled: true,
      },
      surpriseButton: {
        chosen: false,
        isDisabled: true,
      },
      addonButton: {
        chosen: false,
        red: false,
        showModal: false,
        isDisabled: true,
      },
    }));
    // send a form to database to write a
  };
  clickSelect = () => {
    this.setState((prevState) => ({
      sundayButton: {
        ...prevState.sundayButton,
        // chosen: false,
        isDisabled: true,
      },
      mondayButton: {
        ...prevState.mondayButton,
        // chosen: false,
        isDisabled: true,
      },
      skipButton: {
        ...prevState.skipButton,
        isDisabled: false,
      },
      selectButton: {
        chosen: true,
        red: true,
        showModal: true,
        isDisabled: false,
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        chosen: false,
        isDisabled: false,
      },
      addonButton: {
        ...prevState.addonButton,
        isDisabled: true,
      },
    }));
  };
  clickSurprise = () => {
    this.setState((prevState) => ({
      sundayButton: {
        ...prevState.sundayButton,
        isDisabled: false,
      },
      mondayButton: {
        ...prevState.mondayButton,
        isDisabled: false,
      },
      skipButton: {
        ...prevState.skipButton,
        isDisabled: false,
      },
      selectButton: {
        ...prevState.selectButton,
        showModal: false,
        chosen: false,
        isDisabled: false,
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        chosen: true,
        isDisabled: false,
      },
      addonButton: {
        ...prevState.addonButton,
        isDisabled: false,
      },
    }));
    //send a request to database
  };
  /* Addon button is clicked. All others button will inactive. until Agree to Pay is clicked */
  clickAddOn = () => {
    this.setState((prevState) => ({
      sundayButton: {
        ...prevState.sundayButton,
        isDisabled: true,
      },
      mondayButton: {
        ...prevState.mondayButton,
        isDisabled: true,
      },
      skipButton: {
        ...prevState.skipButton,
        isDisabled: false,
      },
      selectButton: {
        ...prevState.selectButton,
        isDisabled: true,
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        isDisabled: true,
      },
      addonButton: {
        ...prevState.addonButton,
        chosen: true,
        red: true,
        showModal: true,
        isDisabled: false,
      },
    }));
  };

  closeAddonModal = () => {
    this.setState((prevState) => ({
      sundayButton: {
        ...prevState.sundayButton,
        isDisabled: false,
      },
      mondayButton: {
        ...prevState.mondayButton,
        isDisabled: false,
      },
      skipButton: {
        ...prevState.skipButton,
        isDisabled: false,
      },
      selectButton: {
        ...prevState.selectButton,
        isDisabled: false,
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        isDisabled: false,
      },
      addonButton: {
        ...prevState.addonButton,
        chosen: false,
        red: false,
        showModal: false,
        isDisabled: false,
      },
    }));
  };

  incrementMaxMeal = () => {
    this.setState({ mealLeft: this.state.mealLeft + 1 });
  };

  decrementMaxMeal = () => {
    this.setState({ mealLeft: this.state.mealLeft - 1 });
  };

  saveSelectMeal = () => {
    // set state for all button
    this.setState((prevState) => ({
      sundayButton: {
        ...prevState.sundayButton,
        active: true,
      },
      mondayButton: {
        ...prevState.mondayButton,
        active: true,
      },
      skipButton: {
        ...prevState.skipButton,
        active: true,
      },
      selectButton: {
        ...prevState.selectButton,
        chosen: true,
        red: false,
        showModal: false,
        active: true,
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        active: true,
      },
      addonButton: {
        ...prevState.addonButton,
        active: true,
      },
    }));
    // update local variable

    // send request to save to serve
  };
  render() {
    const {
      sundayButton,
      mondayButton,
      skipButton,
      selectButton,
      surpriseButton,
      addonButton,
    } = this.state;

    const orange = {
      width: "95px",
      height: "95px",
      backgroundColor: "#cd790c",
      color: "white",
    };

    const clear = {
      width: "95px",
      height: "95px",
      backgroundColor: "white",
      color: "black",
    };
    const green = {
      width: "95px",
      height: "95px",
      backgroundColor: "#427c42",
      color: "white",
    };
    const red = {
      width: "95px",
      height: "95px",
      backgroundColor: "#d9534f",
      color: "white",
    };

    // defined color for buttons
    var sundayColor, mondayColor, selectColor, addonColor;
    //sunday button

    sundayColor = sundayButton.chosen ? green : clear;

    //Monday button
    mondayColor = mondayButton.chosen ? green : clear;

    //select button

    if (selectButton.chosen && selectButton.red) {
      selectColor = red;
    } else if (selectButton.chosen && !selectButton.red) {
      selectColor = green;
    } else {
      selectColor = clear;
    }
    //addon button
    if (addonButton.chosen && addonButton.red) {
      addonColor = red;
    } else if (addonButton.chosen && !addonButton.red) {
      addonColor = green;
    } else {
      addonColor = clear;
    }

    return (
      <div>
        <ButtonToolbar className="mb-5">
          <div className="radio">
            <Button
              variant="outline-dark"
              disabled={sundayButton.isDisabled}
              onClick={this.clickSunday}
              style={sundayColor}
            >
              Sunday date
            </Button>
            &nbsp;
            <Button
              variant="outline-dark"
              disabled={mondayButton.isDisabled}
              onClick={this.clickMonday}
              style={mondayColor}
            >
              Monday date
            </Button>
            &nbsp;
            <Button
              disabled={skipButton.isDisabled}
              variant="outline-dark"
              style={this.state.skipButton.chosen ? orange : clear}
              onClick={this.clickSkip}
            >
              Skip This Week
            </Button>
          </div>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <Button
            disabled={selectButton.isDisabled}
            variant="outline-dark"
            style={selectColor}
            onClick={this.clickSelect}
          >
            Select Meal
          </Button>
          &nbsp;
          <Button
            disabled={surpriseButton.isDisabled}
            variant="outline-dark"
            onClick={this.clickSurprise}
            style={this.state.surpriseButton.chosen ? green : clear}
          >
            Surprise Me!
          </Button>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <Button
            disabled={addonButton.isDisabled}
            variant="outline-dark"
            style={addonColor}
            onClick={this.clickAddOn}
          >
            Add Local Treats
          </Button>
          {this.state.selectButton.showModal && (
            <Card style={{ width: "92%" }}>
              <Card.Header>
                <Modal.Title style={{ width: "100%" }}>
                  <h4 style={{ float: "left", margin: "0" }} className="font2">
                    Please Select {this.state.maxmeals} Meals:
                  </h4>
                  <div style={{ float: "right" }}>
                    &nbsp;&nbsp;
                    {this.state.maxmeals !== 0 ? (
                      <OverlayTrigger
                        key={"top"}
                        placement={"top"}
                        overlay={
                          <Tooltip id="selectMealSaveButton">
                            <p>
                              Select additional meals to activate this button or
                              click "Surprise Me" to close this box.
                            </p>
                          </Tooltip>
                        }
                      >
                        <span className="d-inline-block">
                          <Button
                            variant="success"
                            disabled={true}
                            style={{ pointerEvents: "none" }}
                          >
                            Save
                          </Button>
                        </span>
                      </OverlayTrigger>
                    ) : (
                      <Button variant="success" onClick={this.saveSelectMeal}>
                        Save
                      </Button>
                    )}
                  </div>
                </Modal.Title>
              </Card.Header>
              <div className="scrollMenu">
                {Object.keys(this.state.sixWeekMenu).map((key) => (
                  <Grid>
                    <Cell col={12}>
                      <h4 style={{ margin: "0" }}>
                        {this.state.sixWeekMenu[key].Category}
                      </h4>
                    </Cell>

                    {this.state.sixWeekMenu[key].Menu.map((meal) => (
                      <Cell col={4}>
                        <EachMeal
                          mealTitle={meal.meal_name}
                          ingridents={"Ingredients: " + meal.meal_desc}
                          detail={
                            "Cal " +
                            meal.meal_calories +
                            ", Prot " +
                            meal.meal_protein +
                            ", Carb " +
                            meal.meal_carbs +
                            ", Sug " +
                            meal.meal_sugar +
                            ", Fib " +
                            meal.meal_fiber +
                            ", Fat " +
                            meal.meal_fat +
                            ", Sat " +
                            meal.meal_sat
                          }
                          imgurl={meal.meal_photo_url}
                          maxmeals={this.state.maxmeals}
                          mealQuantities={
                            this.state.mealQuantities[meal.meal_id]
                          }
                          incrementMaxMeal={this.incrementMealLeft}
                          decrementMaxMeal={this.decrementMealLeft}
                        />
                      </Cell>
                    ))}
                  </Grid>
                ))}
              </div>
            </Card>
          )}
          {this.state.addonButton.showModal && (
            <Card style={{ width: "92%" }}>
              <Card.Header>
                <Modal.Title style={{ width: "100%" }}>
                  <h4 className="font2" style={{ float: "left", margin: "0" }}>
                    Add Local Treats:
                  </h4>
                  <div style={{ float: "right" }}>
                    <h4
                      className="font2"
                      style={{ float: "left", margin: "0" }}
                    >
                      Total Price: ${this.state.total_addon_price}
                    </h4>
                    &nbsp;&nbsp;
                    <Button
                      variant="danger"
                      onClick={() => this.setState(this.closeAddonModal)}
                    >
                      Close
                    </Button>
                    <Button variant="success" onClick={this.saveButtonAddOn}>
                      Agree To Pay
                    </Button>
                  </div>
                </Modal.Title>
              </Card.Header>
              <div className="scrollMenu">
                {Object.keys(this.state.sixWeekMenu).map((key) => (
                  <Grid>
                    <Cell col={12}>
                      <h4 style={{ margin: "0" }}>
                        {this.state.sixWeekMenu[key].Category}
                      </h4>
                    </Cell>

                    {this.state.sixWeekMenu[key].Menu.map((meal) => (
                      <Cell col={4}>
                        <EachAddon
                          mealTitle={meal.meal_name}
                          extra_meal_price={meal.extra_meal_price}
                          ingridents={"Ingredients: " + meal.meal_desc}
                          detail={
                            "Cal " +
                            meal.meal_calories +
                            ", Prot " +
                            meal.meal_protein +
                            ", Carb " +
                            meal.meal_carbs +
                            ", Sug " +
                            meal.meal_sugar +
                            ", Fib " +
                            meal.meal_fiber +
                            ", Fat " +
                            meal.meal_fat +
                            ", Sat " +
                            meal.meal_sat
                          }
                          imgurl={meal.meal_photo_url}
                          incrementMaxMeal={this.incrementMealLeft}
                          decrementMaxMeal={this.decrementMealLeft}
                        />
                      </Cell>
                    ))}
                  </Grid>
                ))}
              </div>
            </Card>
          )}
        </ButtonToolbar>
      </div>
    );
  }
}
