import React, {Component} from "react";
import {
  Button,
  ButtonToolbar,
  Tooltip,
  Card,
  Modal,
  OverlayTrigger
} from "react-bootstrap";
import {Grid, Cell} from "react-mdl";

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
        active: true
      },
      mondayButton: {
        chosen: false,
        active: true
      },
      skipButton: {
        chosen: false,
        active: true
      },
      selectButton: {
        chosen: false,
        red: false,
        showModal: false,
        active: true
      },
      surpriseButton: {
        chosen: false,
        active: true
      },
      addonButton: {
        chosen: false,
        red: false,
        showModal: false,
        active: true
      },

      // Local variable
      mealLeft: 0
    };
  }
  componentDidMount = prevProps => {
    // watching on changing of purchase_id from parent to load the newest currentPurchase
  };

  clickSunday = () => {
    this.setState(prevState => ({
      sundayButton: {
        ...prevState.sundayButton,
        chosen: true,
        active: true
      },
      mondayButton: {
        ...prevState.mondayButton,
        chosen: false,
        active: true
      },
      skipButton: {
        ...prevState.skipButton,
        chosen: false,
        active: true
      },
      selectButton: {
        ...prevState.selectButton,
        active: true
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        active: true
      },
      addonButton: {
        ...prevState.addonButton,
        active: true
      }
    }));
  };

  clickMonday = () => {
    this.setState(prevState => ({
      sundayButton: {
        ...prevState.sundayButton,
        chosen: false,
        active: true
      },
      mondayButton: {
        ...prevState.mondayButton,
        chosen: true,
        active: true
      },
      skipButton: {
        ...prevState.skipButton,
        chosen: false,
        active: true
      },
      selectButton: {
        ...prevState.selectButton,
        active: true
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        active: true
      },
      addonButton: {
        ...prevState.addonButton,
        active: true
      }
    }));
  };

  clickSkip = () => {
    this.setState(prevState => ({
      sundayButton: {
        ...prevState.sundayButton,
        active: true
      },
      mondayButton: {
        ...prevState.mondayButton,
        active: true
      },
      skipButton: {
        ...prevState.skipButton,
        chosen: true,
        active: true
      },
      selectButton: {
        ...prevState.selectButton,
        active: false,
        showModal: false
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        active: false
      },
      addonButton: {
        ...prevState.addonButton,
        showModal: false,
        active: false
      }
    }));
    // send a form to database to write a
  };
  clickSelect = () => {
    this.setState(prevState => ({
      sundayButton: {
        ...prevState.sundayButton,
        active: false
      },
      mondayButton: {
        ...prevState.mondayButton,
        active: false
      },
      skipButton: {
        ...prevState.skipButton,
        active: true
      },
      selectButton: {
        ...prevState.selectButton,
        chosen: true,
        red: true,
        showModal: true,
        active: true
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        chosen: false,
        active: true
      },
      addonButton: {
        ...prevState.addonButton,
        active: false
      }
    }));
  };
  clickSurprise = () => {
    this.setState(prevState => ({
      sundayButton: {
        ...prevState.sundayButton,
        active: true
      },
      mondayButton: {
        ...prevState.mondayButton,
        active: true
      },
      skipButton: {
        ...prevState.skipButton,
        active: true
      },
      selectButton: {
        ...prevState.selectButton,
        chosen: false,
        active: true
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        chosen: true,
        active: true
      },
      addonButton: {
        ...prevState.addonButton,
        active: true
      }
    }));
    //send a request to database
  };
  /* Addon button is clicked. All others button will inactive. until Agree to Pay is clicked */
  clickAddOn = () => {
    this.setState(prevState => ({
      sundayButton: {
        ...prevState.sundayButton,
        active: false
      },
      mondayButton: {
        ...prevState.mondayButton,
        active: false
      },
      skipButton: {
        ...prevState.skipButton,
        active: true
      },
      selectButton: {
        ...prevState.selectButton,
        active: false
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        active: false
      },
      addonButton: {
        ...prevState.addonButton,
        chosen: true,
        red: true,
        showModal: true,
        active: true
      }
    }));
  };

  incrementMaxMeal = () => {
    this.setState({mealLeft: this.state.mealLeft + 1});
  };

  decrementMaxMeal = () => {
    this.setState({mealLeft: this.state.mealLeft - 1});
  };

  saveSelectMeal = () => {
    // set state for all button
    this.setState(prevState => ({
      sundayButton: {
        ...prevState.sundayButton,
        active: true
      },
      mondayButton: {
        ...prevState.mondayButton,
        active: true
      },
      skipButton: {
        ...prevState.skipButton,
        active: true
      },
      selectButton: {
        ...prevState.selectButton,
        chosen: true,
        red: false,
        showModal: false,
        active: true
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        active: true
      },
      addonButton: {
        ...prevState.addonButton,
        active: true
      }
    }));
    // update local variable

    // send request to save to serve
  };
  render() {
    const orange = {
      width: "95px",
      height: "95px",
      backgroundColor: "#cd790c",
      color: "white"
    };

    const clear = {
      width: "95px",
      height: "95px",
      backgroundColor: "white",
      color: "black"
    };
    const green = {
      width: "95px",
      height: "95px",
      backgroundColor: "#427c42",
      color: "white"
    };
    const red = {
      width: "95px",
      height: "95px",
      backgroundColor: "#d9534f",
      color: "white"
    };

    // defined color for buttons
    var sundayColor, mondayColor, selectColor, addonColor;
    //sunday button

    sundayColor =
      this.state.sundayButton.chosen && !this.state.skipButton.chosen
        ? green
        : clear;

    //Monday button
    mondayColor =
      this.state.mondayButton.chosen && !this.state.skipButton.chosen
        ? green
        : clear;

    //select button

    if (this.state.selectButton.chosen && this.state.selectButton.red) {
      selectColor = red;
    } else if (this.state.selectButton.chosen && !this.state.selectButton.red) {
      selectColor = green;
    } else {
      selectColor = clear;
    }
    //addon button
    if (this.state.addonButton.chosen && this.state.addonButton.red) {
      addonColor = red;
    } else if (this.state.addonButton.chosen && !this.state.addonButton.red) {
      addonColor = green;
    } else {
      addonColor = clear;
    }

    return (
      <div>
        <ButtonToolbar className='mb-5'>
          <div className='radio'>
            <Button
              variant='outline-dark'
              disabled={!this.state.sundayButton.active}
              onClick={this.clickSunday}
              style={sundayColor}
            >
              Sunday date
            </Button>
            &nbsp;
            <Button
              variant='outline-dark'
              disabled={!this.state.mondayButton.active}
              onClick={this.clickMonday}
              style={mondayColor}
            >
              Monday date
            </Button>
            &nbsp;
            <Button
              disabled={!this.state.skipButton.active}
              variant='outline-dark'
              style={this.state.skipButton.chosen ? orange : clear}
              onClick={this.clickSkip}
            >
              Skip This Week
            </Button>
          </div>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <Button
            disabled={!this.state.selectButton.active}
            variant='outline-dark'
            style={selectColor}
            onClick={this.clickSelect}
          >
            Select Meal
          </Button>
          &nbsp;
          <Button
            disabled={!this.state.surpriseButton.active}
            variant='outline-dark'
            onClick={this.clickSurprise}
            style={this.state.surpriseButton.chosen ? green : clear}
          >
            Surprise Me!
          </Button>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <Button
            disabled={!this.state.addonButton.active}
            variant='outline-dark'
            style={addonColor}
            onClick={this.clickAddOn}
          >
            Add Local Treats
          </Button>
          {this.state.selectButton.showModal && (
            <Card style={{width: "92%"}}>
              <Card.Header>
                <Modal.Title style={{width: "100%"}}>
                  <h4 style={{float: "left", margin: "0"}} class='font2'>
                    Please Select {this.state.maxmeals} Meals:
                  </h4>
                  <div style={{float: "right"}}>
                    &nbsp;&nbsp;
                    {this.state.maxmeals !== 0 ? (
                      <OverlayTrigger
                        key={"top"}
                        placement={"top"}
                        overlay={
                          <Tooltip id='selectMealSaveButton'>
                            <p>
                              Select additional meals to activate this button or
                              click "Surprise Me" to close this box.
                            </p>
                          </Tooltip>
                        }
                      >
                        <span className='d-inline-block'>
                          <Button
                            variant='success'
                            disabled={true}
                            style={{pointerEvents: "none"}}
                          >
                            Save
                          </Button>
                        </span>
                      </OverlayTrigger>
                    ) : (
                      <Button variant='success' onClick={this.saveSelectMeal}>
                        Save
                      </Button>
                    )}
                  </div>
                </Modal.Title>
              </Card.Header>
              <div class='scrollMenu'>
                {Object.keys(this.state.sixWeekMenu).map(key => (
                  <Grid>
                    <Cell col={12}>
                      <h4 style={{margin: "0"}}>
                        {this.state.sixWeekMenu[key].Category}
                      </h4>
                    </Cell>

                    {this.state.sixWeekMenu[key].Menu.map(meal => (
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
            <Card style={{width: "92%"}}>
              <Card.Header>
                <Modal.Title style={{width: "100%"}}>
                  <h4 className='font2' style={{float: "left", margin: "0"}}>
                    Add Local Treats:
                  </h4>
                  <div style={{float: "right"}}>
                    <h4 className='font2' style={{float: "left", margin: "0"}}>
                      Total Price: ${this.state.total_addon_price}
                    </h4>
                    &nbsp;&nbsp;
                    <Button variant='danger' onClick={this.closeButtonAddOn}>
                      Close
                    </Button>
                    <Button variant='success' onClick={this.saveButtonAddOn}>
                      Agree To Pay
                    </Button>
                  </div>
                </Modal.Title>
              </Card.Header>
              <div class='scrollMenu'>
                {Object.keys(this.state.sixWeekMenu).map(key => (
                  <Grid>
                    <Cell col={12}>
                      <h4 style={{margin: "0"}}>
                        {this.state.sixWeekMenu[key].Category}
                      </h4>
                    </Cell>

                    {this.state.sixWeekMenu[key].Menu.map(meal => (
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
