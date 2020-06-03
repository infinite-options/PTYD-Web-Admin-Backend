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
import axios from "axios";

import EachMeal from "./EachMeal";
import EachAddon from "./EachAddon";

export default class MealButton extends Component {
  constructor(props) {
    super(props);
    this.state = {
      currentPurchase: this.props.currentPurchase,
      maxMeals: this.props.maxMeals,
      weekMenu: this.props.weekMenu, // get from meal schedule. this is 6 week menu
      totalAddonPrice: 0,
      currentMealSelected: {}, //this will be fetched from api this.props.MEAL_SELECT_API_URL}/${purchaseId}
      currentAddonSelected: {},
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
      }
    };
  }

  //helper function to get the current selected meal and addon for only current week
  getCurrentSelected = () => {
    //call the server to get new meal selected
    let new_purchaseID = this.props.currentPurchase.purchase_id;
    axios
      .get(`${this.props.MEAL_SELECT_API_URL}/${new_purchaseID}`)
      .then(res => {
        let data;
        if (res.data.result !== undefined) {
          data = res.data.result;
          if (data.Meals.length > 0) {
            for (let meal of data.Meals) {
              if (meal.week_affected === this.props.weekMenu.SaturdayDate) {
                this.setState({currentMealSelected: meal});
              }
            }
          }
          if (data.Addons.length > 0) {
            for (let addon of data.Addons) {
              if (addon.week_affected === this.props.weekMenu.SaturdayDate) {
                this.setState({currentAddonSelected: addon});
              }
            }
          }
        }
      })
      .catch(err => {
        this.props.SetError(err);
      });
  };

  //ComponentDidMount
  componentDidMount = () => {
    this.getCurrentSelected();
  };

  /*update menu every time account info component changes the its meal selection */
  componentDidUpdate = prevProps => {
    if (prevProps.weekMenu !== this.props.weekMenu) {
      this.setState({
        weekMenu: this.props.weekMenu,
        maxMeals: this.props.maxMeals
      });
      this.getCurrentSelected();
    }
    if (prevProps.currentPurchase !== this.props.currentPurchase) {
      //get meals and addon out of the result object
      this.getCurrentSelected();
      //setState here because we need the page re-render after everything is set.
      this.setState({
        currentPurchase: this.props.currentPurchase,
        maxMeals: this.props.maxMeals
      });
    }
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
    this.setState({mealLeft: this.state.maxMeals + 1});
  };

  decrementMaxMeal = () => {
    this.setState({mealLeft: this.state.maxMeals - 1});
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

  incrementMealLeft = () => {
    console.log("incrementMealLeft is called.");
  };

  decrementMealLeft = () => {
    console.log("decrementMealleft is called");
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

    //helper function to get meal left
    const getMealLeft = (meals, target) => {
      let mealLeft = meals;
      console.log("target: ", target.meals_selected);
      let mealSelected = target.meals_selected;
      if (mealSelected !== undefined && mealSelected !== null) {
        mealSelected = Object.values(mealSelected);
        if (mealSelected.length > 0) {
          mealLeft -= mealSelected.reduce((a, b) => a + b);
        }
        return mealLeft;
      }
    };

    let mealLeft = getMealLeft(
      this.state.maxMeals,
      this.state.currentMealSelected
    );
    console.log("Meal Left: ", mealLeft);
    console.log("meal selected: ", this.state.currentMealSelected);
    //lazy to type
    let weekMenu = this.state.weekMenu;
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
              Sunday {weekMenu.Sunday}
            </Button>
            &nbsp;
            <Button
              variant='outline-dark'
              disabled={!this.state.mondayButton.active}
              onClick={this.clickMonday}
              style={mondayColor}
            >
              Monday {weekMenu.Moday}
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
          {/*This part is for two modal. Select Meal Modal and Add Local Treats Modal */}
          {this.state.selectButton.showModal && (
            <Card style={{width: "92%"}}>
              <Card.Header>
                <Modal.Title style={{width: "100%"}}>
                  <h4 style={{float: "left", margin: "0"}} className='font2'>
                    Please Select {mealLeft} Meals:
                  </h4>
                  <div style={{float: "right"}}>
                    &nbsp;&nbsp;
                    {this.state.mealLeft !== 0 ? (
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
              <div className='scrollMenu'>
                {Object.values(this.state.weekMenu.Meals).map(meal => (
                  <Grid key={meal.Category}>
                    <Cell col={12}>
                      <h4 style={{margin: "0"}}>{meal.Category}</h4>
                    </Cell>

                    {meal.Menu.map(description => (
                      <Cell col={4} key={description.meal_id}>
                        <EachMeal
                          description={description}
                          incrementMealLeft={this.incrementMealLeft}
                          decrementMealLeft={this.decrementMealLeft}
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
              <div className='scrollMenu'>
                {Object.values(this.state.weekMenu.Addons).map(addon => (
                  <Grid key={addon.Category}>
                    <Cell col={12}>
                      <h4 style={{margin: "0"}}>{addon.Category}</h4>
                    </Cell>

                    {addon.Menu.map(description => (
                      <Cell col={4} key={description.meal_id}>
                        <EachAddon
                          description={description}
                          incrementMealLeft={this.incrementMealLeft}
                          decrementMealLeft={this.decrementMealLeft}
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
