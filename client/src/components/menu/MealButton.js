import React, {Component} from "react";
import {Button, ButtonToolbar} from "react-bootstrap";
import axios from "axios";

import SelectMealModal from "./SelectMealModal";
import AddonModal from "./AddonModal";

export default class MealButton extends Component {
  constructor(props) {
    super(props);
    this.state = {
      currentPurchase: this.props.currentPurchase,
      maxMeals: this.props.maxMeals,
      weekMenu: this.props.weekMenu, // get from meal schedule. this is 6 week menu
      totalAddonPrice: 0,


      // disableAccountChanges = false,



      currentMealSelected: {}, //this will be fetched from api this.props.MEAL_SELECT_API_URL}/${purchaseId}
      currentAddonSelected: {},
      //some variable to control button
      sundayButton: {
        chosen: false,
        isDisabled: false
      },
      mondayButton: {
        chosen: false,
        isDisabled: !this.props.currentPurchase.monday_available
      },
      skipButton: {
        chosen: false,
        isDisabled: false
      },
      selectButton: {
        chosen: false,
        showModal: false,
        isDisabled: false
      },
      surpriseButton: {
        chosen: false,
        isDisabled: false
      },
      addonButton: {
        chosen: false,
        showModal: false,
        isDisabled: false
      }
    };
  }

  //reset function for all buttons
  resetButtons = () => {
    this.setState(prevState => ({
      sundayButton: {
        ...prevState.sundayButton,
        chosen: false,
        isDisabled: false
      },
      mondayButton: {
        ...prevState.mondayButton,
        chosen: false,
        isDisabled: !this.props.currentPurchase.monday_available
      },
      skipButton: {
        ...prevState.skipButton,
        chosen: false,
        isDisabled: false
      },
      selectButton: {
        ...prevState.selectButton,
        chosen: false,
        showModal: false,
        isDisabled: false
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        chosen: false,
        isDisabled: false
      },
      addonButton: {
        ...prevState.addonButton,
        chosen: false,
        showModal: false,
        isDisabled: false
      }
    }));
  };

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
          // console.log("data when calling getSelected function: ", data);
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
                //calculate the total add on price for first week
                let priceList = this.props.weekMenu.AddonPrice;
                let total = 0;
                for (let key of Object.keys(addon.meals_selected)) {
                  if (priceList[key] !== undefined) {
                    total +=
                      parseFloat(priceList[key]) *
                      parseFloat(addon.meals_selected[key]);
                  }
                }
                this.setState({totalAddonPrice: total.toFixed(2)});
                if (
                  this.props.week === "MenuForWeek1" &&
                  this.state.currentMealSelected.delivery_day !== "SKIP"
                )
                  this.props.ChangeCurrentAddonCharge(total);
                total = 0;
              }
            }
          }
        }
      })
      .then(() => {
        if (Object.keys(this.state.currentMealSelected).length === 0) {
          // this.setState(prevState => ({
          //   sundayButton: {...prevState.sundayButton, chosen: true},
          //   surpriseButton: {...prevState.surpriseButton, chosen: true}
          // }));
          this.clickDay("sunday", true);
          this.clickSurprise(true);
        } else if (this.state.currentMealSelected.delivery_day === "Sunday") {
          this.setSunday();
        } else if (this.state.currentMealSelected.delivery_day === "Monday") {
          this.setMonday();
        } else if (this.state.currentMealSelected.delivery_day === "SKIP") {
          this.setSkip();
        }
        if (this.state.currentMealSelected.meal_selection === "SURPRISE") {
          this.setSurprise();
        } else if (
          this.state.currentMealSelected.meal_selection !== undefined &&
          this.state.currentMealSelected.meal_selection.length > 0 &&
          this.state.currentMealSelected.delivery_day !== "SKIP"
        ) {
          this.setSelect();
        }
        let mealSelection = this.state.currentAddonSelected.meal_selection;
        if (
          mealSelection !== undefined &&
          mealSelection.length > 0 &&
          this.state.currentMealSelected.delivery_day !== "SKIP"
        ) {
          this.setAddon();
        } else {
          this.setState(prevState => ({
            addonButton: {...prevState.addonButton, chosen: false}
          }));
        }
      })
      .catch(err => {
        if (typeof err === "string") this.props.SetError(err);
        else this.props.SetError(err.response);
        console.log(err);
      });
  };

  //ComponentDidMount
  componentDidMount = () => {
    this.getCurrentSelected();
  };

  /*update menu every time account info component changes the its meal selection */
  componentDidUpdate = async prevProps => {
    if (prevProps.weekMenu !== this.props.weekMenu) {
      this.setState({
        weekMenu: this.props.weekMenu,
        priceList: this.getAddonPrice(this.props.weekMenu),
        maxMeals: this.props.maxMeals
      });
      this.getCurrentSelected();
    }
    if (
      prevProps.currentPurchase.purchase_id !==
      this.props.currentPurchase.purchase_id
    ) {
      //setState here because we need the page re-render after everything is set.
      await this.setState({
        totalAddonPrice: 0,
        currentAddonSelected: {},
        currentMealSelected: {},
        currentPurchase: this.props.currentPurchase,
        maxMeals: this.props.maxMeals
      });
      //get meals and addon out of the result object
      await this.resetButtons();
      await this.getCurrentSelected();
    }
  };
  setSunday = () => {
    this.setState(prevState => ({
      sundayButton: {
        ...prevState.sundayButton,
        chosen: true
      },
      mondayButton: {
        ...prevState.mondayButton,
        chosen: false
      },
      skipButton: {
        ...prevState.skipButton,
        chosen: false,
        isDisabled: false
      },
      selectButton: {
        ...prevState.selectButton,
        isDisabled: false
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        isDisabled: false
      },
      addonButton: {
        ...prevState.addonButton,
        isDisabled: false
      }
    }));
  };
  setMonday = () => {
    this.setState(prevState => ({
      sundayButton: {
        ...prevState.sundayButton,
        chosen: false
      },
      mondayButton: {
        ...prevState.mondayButton,
        chosen: true
      },
      skipButton: {
        ...prevState.skipButton,
        chosen: false,
        isDisabled: false
      },
      selectButton: {
        ...prevState.selectButton,
        isDisabled: false
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        isDisabled: false
      },
      addonButton: {
        ...prevState.addonButton,
        isDisabled: false
      }
    }));
  };
  clickDay = async (day, first) => {
    // set properties for other button
    if (day === "sunday") {
      await this.setSunday();
    } else {
      await this.setMonday();
    }
    // update the delivery day for currentMealSelected
    await this.setState(prevState => ({
      currentMealSelected: {
        ...prevState.currentMealSelected,
        delivery_day: day === "sunday" ? "Sunday" : "Monday",
        meal_selection:
          prevState.currentMealSelected.meal_selection === "SKIP"
            ? "SURPRISE"
            : prevState.currentMealSelected.meal_selection
      }
    }));
    //Check for "Select" or "Surprise" button
    // which ones is gonna be shown up
    let mealSelection = this.state.currentMealSelected.meal_selection;
    let mealSelected = this.state.currentMealSelected.meals_selected;
    if (mealSelection === "SURPRISE") this.setSurprise();
    else if (
      mealSelected !== undefined &&
      Object.values(mealSelected).reduce((a, b) => a + b) ===
        this.state.maxMeals
    )
      this.setSelect();
    // check for "Add Local Treats"
    // Should it be shown up or not
    let addonSelected = this.state.currentAddonSelected.meal_selected;
    if (addonSelected !== undefined && Object.keys(addonSelected).length > 0) {
      this.setAddon();
    }
    // update the delivery day for database
    if (!first) {
      //first time running, everything just keep local, not writtinng into database
      this.saveSelectMealAPI();
    }
  };

  // clickMonday = async () => {
  //   await this.setMonday();
  //   this.saveSelectMealAPI();
  // };

  setSkip = () => {
    this.setState(prevState => ({
      sundayButton: {
        ...prevState.sundayButton,
        chosen: false,
        isDisabled: false
      },
      mondayButton: {
        ...prevState.mondayButton,
        chosen: false,
        isDisabled: !this.props.currentPurchase.monday_available
      },
      skipButton: {
        ...prevState.skipButton,
        chosen: true,
        isDisabled: false
      },
      selectButton: {
        chosen: false,
        showModal: false,
        isDisabled: true
      },
      surpriseButton: {
        chosen: false,
        isDisabled: true
      },
      addonButton: {
        chosen: false,
        showModal: false,
        isDisabled: true
      }
    }));
  };
  clickSkip = async () => {
    // Disable all other buttons except Sunday and Monday buttons
    await this.setSkip();
    // Set delivery day and meals selection to SKIP and delete all addon
    await this.setState(prevState => ({
      currentMealSelected: {
        ...prevState.currentMealSelected,
        delivery_day: "SKIP",
        meal_selection: "SKIP"
      },
      currentAddonSelected: {}, //creat a new Object. leave all elements for garbage collection
      totalAddonPrice: 0
    }));
    //update total addon charge for accountInFo
    if (this.props.week === "MenuForWeek1") {
      this.props.ChangeCurrentAddonCharge(0);
    }
    // send a form to database to write a
    this.saveSelectMealAPI();
    // erase all addon and write a new line into addon_selected table
    // send a blank line for addon to the database;
    this.saveAddonAPI();
  };
  setSelect = () => {
    this.setState(prevState => ({
      sundayButton: {
        ...prevState.sundayButton,
        // chosen: false,
        isDisabled: false
      },
      mondayButton: {
        ...prevState.mondayButton,
        // chosen: false,
        isDisabled: !this.props.currentPurchase.monday_available
      },
      skipButton: {
        ...prevState.skipButton,
        chosen: false,
        isDisabled: false
      },
      selectButton: {
        ...prevState.selectButton,
        chosen: true,
        isDisabled: false
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        chosen: false,
        isDisabled: false
      },
      addonButton: {
        ...prevState.addonButton,
        isDisabled: false
      }
    }));
  };
  clickSelect = async () => {
    await this.setSelect();
    this.setState(prevState => ({
      selectButton: {
        ...prevState.selectButton,
        showModal: true
      }
    }));
    this.props.handleDisableAccountChanges();
  };

  setSurprise = () => {
    this.setState(prevState => ({
      sundayButton: {
        ...prevState.sundayButton,
        isDisabled: false
      },
      mondayButton: {
        ...prevState.mondayButton,
        isDisabled: !this.props.currentPurchase.monday_available
      },
      skipButton: {
        ...prevState.skipButton,
        chosen: false,
        isDisabled: false
      },
      selectButton: {
        ...prevState.selectButton,
        showModal: false,
        chosen: false,
        isDisabled: false
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        chosen: true,
        isDisabled: false
      },
      addonButton: {
        ...prevState.addonButton,
        isDisabled: false
      }
    }));
  };
  clickSurprise = async first => {
    //set properties for all other buttons
    await this.setSurprise();
    // update state for currentMealSelected
    await this.setState(prevState => ({
      currentMealSelected: {
        ...prevState.currentMealSelected,
        meal_selection: "SURPRISE"
      }
    }));
    //send a request to database
    if (!first) {
      this.saveSelectMealAPI();
    }
  };
  /* Addon button is clicked. All others button will inactive. until Agree to Pay is clicked */
  setAddon = () => {
    this.setState(prevState => ({
      sundayButton: {
        ...prevState.sundayButton,
        isDisabled: false
      },
      mondayButton: {
        ...prevState.mondayButton,
        isDisabled: !this.props.currentPurchase.monday_available
      },
      skipButton: {
        ...prevState.skipButton,
        isDisabled: false
      },
      selectButton: {
        ...prevState.selectButton,
        isDisabled: false
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        isDisabled: false
      },
      addonButton: {
        ...prevState.addonButton,
        chosen: true,
        isDisabled: false
      }
    }));
  };

  clickAddon = () => {
    this.setAddon();
    console.log("addon shows up");
    this.setState(prevState => ({
      addonButton: {
        ...prevState.addonButton,
        showModal: true
      },
      sundayButton: {
        ...prevState.sundayButton,
        isDisabled: true
      },
      mondayButton: {
        ...prevState.mondayButton,
        isDisabled: true
      },
      skipButton: {
        ...prevState.skipButton,
        isDisabled: true
      },
      selectButton: {
        ...prevState.selectButton,
        isDisabled: true
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        isDisabled: true
      }
    }));
  };

  //helper function to create a new string for meal selection
  concatMealSelection = mealSelected => {
    let newValue = ""; // create a new value for meal_selection
    if (mealSelected !== undefined) {
      for (let key of Object.keys(mealSelected)) {
        let loop_times = parseInt(mealSelected[key]);
        for (let i = 0; i < loop_times; i++) {
          if (newValue === "") {
            newValue = newValue + key;
          } else {
            newValue = newValue + ";" + key;
          }
        }
      }
    }
    return newValue;
  };

  saveSelectMeal = async () => {
    // set state for all button
    await this.setState(prevState => ({
      sundayButton: {
        ...prevState.sundayButton,
        isDisabled: false
      },
      mondayButton: {
        ...prevState.mondayButton,
        isDisabled: !this.props.currentPurchase.monday_available
      },
      skipButton: {
        ...prevState.skipButton,
        isDisabled: false
      },
      selectButton: {
        ...prevState.selectButton,
        chosen: true,
        showModal: false,
        isDisabled: false
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        isDisabled: false
      },
      addonButton: {
        ...prevState.addonButton,
        isDisabled: false
      }
    }));
    // update local variable
    let mealSelected = this.state.currentMealSelected.meals_selected;
    console.log(mealSelected);
    let mealSelection = this.concatMealSelection(mealSelected);
    console.log(mealSelected);
    await this.setState(prevState => ({
      currentMealSelected: {
        ...prevState.currentMealSelected,
        meal_selection: mealSelection
      }
    }));

    // send request to save to serve
    this.saveSelectMealAPI();
  };
  saveButtonAddOn = async () => {
    await this.setState(prevState => ({
      sundayButton: {
        ...prevState.sundayButton,
        isDisabled: false
      },
      mondayButton: {
        ...prevState.mondayButton,
        isDisabled: !this.props.currentPurchase.monday_available
      },
      skipButton: {
        ...prevState.skipButton,
        isDisabled: false
      },
      selectButton: {
        ...prevState.selectButton,

        isDisabled: false
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        isDisabled: false
      },
      addonButton: {
        ...prevState.addonButton,
        chosen: parseInt(this.state.totalAddonPrice) !== 0 ? true : false,
        showModal: false,
        isDisabled: false
      }
    }));
    //check if we change the addon of the current week

    if (this.props.week === "MenuForWeek1") {
      //this is a first week
      //update currentPurchase
      await this.setState(prevState => ({
        currentPurchase: {
          ...prevState.currentPurchase,
          total_charge: parseFloat(this.state.totalAddonPrice)
        }
      }));
      //update parent
      console.log("calling changeCurrentCharge from MealButton");
      let totalAddonPrice = parseFloat(this.state.totalAddonPrice).toFixed(2);
      this.props.ChangeCurrentAddonCharge(totalAddonPrice);
    }

    //Update local variable;
    let mealSelected = this.state.currentAddonSelected.meals_selected;
    let mealSelection = this.concatMealSelection(mealSelected);
    console.log("mealSelection inside saveBUtton Addon: ", mealSelection);
    if (mealSelection !== "") {
      console.log("voila");
      await this.setState(prevState => ({
        currentAddonSelected: {
          ...prevState.currentAddonSelected,
          meal_selection: mealSelection
        }
      }));
    } else {
      await delete this.state.currentAddonSelected.meal_selection;
    }

    //update database
    this.saveAddonAPI();
  };
  saveSelectMealAPI = () => {
    const {
      purchase_id,
      week_affected,
      delivery_day,
      meal_selection,
      meals_selected
    } = this.state.currentMealSelected;

    // set parameters for sending form
    console.log("delivery-day: ", delivery_day);
    console.log("meal_selection: ", meal_selection);
    console.log("meal_selected: ", meals_selected);
    let defaultSelected = meal_selection === "SURPRISE" ? true : false;
    console.log("defaultSelected: ", defaultSelected);
    let purchaseID =
      purchase_id !== undefined
        ? purchase_id
        : this.state.currentPurchase.purchase_id;
    let weekAffected =
      week_affected !== undefined
        ? week_affected
        : this.state.weekMenu.SaturdayDate;
    let mealQuantities = meals_selected === undefined ? null : meals_selected;
    let deliveryDay = delivery_day === undefined ? "Sunday" : delivery_day;
    //sending request to the server

    fetch(`${this.props.MEAL_SELECT_API_URL}/${purchaseID}`, {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        purchase_id: purchaseID,
        week_affected: weekAffected,
        meal_quantities: mealQuantities,
        delivery_day: deliveryDay,
        default_selected: defaultSelected,
        is_addons: false // distinguished between save Select and save Add Local Treats. can pass this as parameter if we don't want duplicated code.
      })
    });
  };
  saveAddonAPI = () => {
    const {
      purchase_id,
      week_affected,
      meals_selected
    } = this.state.currentAddonSelected;

    let purchaseID =
      purchase_id !== undefined
        ? purchase_id
        : this.state.currentPurchase.purchase_id;
    let weekAffected =
      week_affected !== undefined
        ? week_affected
        : this.state.weekMenu.SaturdayDate;
    let addonQuantities = meals_selected === undefined ? null : meals_selected;
    console.log("add selected: ", addonQuantities);
    fetch(`${this.props.MEAL_SELECT_API_URL}/${purchaseID}`, {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        purchase_id: purchaseID,
        week_affected: weekAffected,
        addon_quantities: addonQuantities,
        is_addons: true
      })
    });
  };
  incrementMealLeft = id => {
    if (
      this.state.currentMealSelected.meals_selected !== undefined &&
      id in this.state.currentMealSelected.meals_selected
    ) {
      this.setState(prevState => ({
        currentMealSelected: {
          ...prevState.currentMealSelected,
          meals_selected: {
            ...prevState.currentMealSelected.meals_selected,
            [id]: prevState.currentMealSelected.meals_selected[id] + 1
          }
        }
      }));
    } else {
      this.setState(prevState => ({
        currentMealSelected: {
          ...prevState.currentMealSelected,
          meals_selected: {
            ...prevState.currentMealSelected.meals_selected,
            [id]: 1
          }
        }
      }));
    }
  };

  incrementAddon = id => {
    if (
      this.state.currentAddonSelected.meals_selected !== undefined &&
      id in this.state.currentAddonSelected.meals_selected
    ) {
      this.setState(prevState => ({
        currentAddonSelected: {
          ...prevState.currentAddonSelected,
          meals_selected: {
            ...prevState.currentAddonSelected.meals_selected,
            [id]: prevState.currentAddonSelected.meals_selected[id] + 1
          }
        }
      }));
    } else {
      this.setState(prevState => ({
        currentAddonSelected: {
          ...prevState.currentAddonSelected,
          meals_selected: {
            ...prevState.currentAddonSelected.meals_selected,
            [id]: 1
          }
        }
      }));
    }
  };

  decrementMealLeft = id => {
    if (id in this.state.currentMealSelected.meals_selected) {
      if (this.state.currentMealSelected.meals_selected[id] >= 1) {
        this.setState(prevState => ({
          currentMealSelected: {
            ...prevState.currentMealSelected,
            meals_selected: {
              ...prevState.currentMealSelected.meals_selected,
              [id]: prevState.currentMealSelected.meals_selected[id] - 1
            }
          }
        }));
      } else {
        alert("Cannot get negative meals");
      }
    } else {
      alert("Cannot get negative meals");
    }
  };

  decrementAddon = id => {
    if (
      this.state.currentAddonSelected.meals_selected !== undefined &&
      id in this.state.currentAddonSelected.meals_selected
    ) {
      if (this.state.currentAddonSelected.meals_selected[id] >= 1) {
        this.setState(prevState => ({
          currentAddonSelected: {
            ...prevState.currentAddonSelected,
            meals_selected: {
              ...prevState.currentAddonSelected.meals_selected,
              [id]: prevState.currentAddonSelected.meals_selected[id] - 1
            }
          }
        }));
      } else {
        alert("Cannot get negative addons");
      }
    } else {
      alert("Cannot get negative addons");
    }
    console.log("decrementMealleft is called");
  };

  decrementAddonPrice = price => {
    let newTotal = (
      parseFloat(this.state.totalAddonPrice) - parseFloat(price)
    ).toFixed(2);
    let totalAddonPrice = parseFloat(this.state.totalAddonPrice).toFixed(2);
    if (totalAddonPrice > 0 && newTotal >= 0) {
      this.setState({
        totalAddonPrice: newTotal
      });
    }
  };
  incrementAddonPrice = price => {
    let newTotal = (
      parseFloat(this.state.totalAddonPrice) + parseFloat(price)
    ).toFixed(2);
    this.setState({
      totalAddonPrice: newTotal
    });
  };
  render() {
    const {
      sundayButton,
      mondayButton,
      skipButton,
      selectButton,
      surpriseButton,
      addonButton
    } = this.state;

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
    // const red = {
    //   width: "95px",
    //   height: "95px",
    //   backgroundColor: "#d9534f",
    //   color: "white"
    // };

    // defined color for buttons
    var sundayColor, mondayColor, selectColor, addonColor;
    //sunday button

    sundayColor = sundayButton.chosen ? green : clear;

    //Monday button
    mondayColor = mondayButton.chosen ? green : clear;

    //select button

    if (selectButton.chosen) {
      selectColor = green;
    } else {
      selectColor = clear;
    }
    //addon button
    if (addonButton.chosen) {
      addonColor = orange;
    } else {
      addonColor = clear;
    }

    //helper function to get meal left
    const getMealLeft = (meals, target) => {
      let mealLeft = meals;

      let mealSelected = target.meals_selected;
      if (mealSelected !== undefined && mealSelected !== null) {
        mealSelected = Object.values(mealSelected);
        if (mealSelected.length > 0) {
          mealLeft -= mealSelected.reduce((a, b) => a + b);
        }
      }
      return mealLeft;
    };

    let mealLeft = getMealLeft(
      this.state.maxMeals,
      this.state.currentMealSelected
    );

    //lazy to type
    let weekMenu = this.state.weekMenu;
    return (
      <div>
        <ButtonToolbar className='mb-5'>
          <div className='radio' style={{position: "relative"}}>
            <Button
              variant='outline-dark'
              disabled={sundayButton.isDisabled}
              onClick={() => {
                this.clickDay("sunday", false);
              }}
              style={sundayColor}
            >
              Sunday
              <div>{weekMenu.Sunday}</div>
            </Button>
            {!this.state.mondayButton.isDisabled && (
              <Button
                variant='outline-dark'
                // disabled={mondayButton.isDisabled}
                onClick={() => {
                  this.clickDay("monday", false);
                }}
                style={mondayColor}
              >
                Monday
                <div>{weekMenu.Monday}</div>
              </Button>
            )}
            <Button
              disabled={skipButton.isDisabled}
              variant='outline-dark'
              style={this.state.skipButton.chosen ? orange : clear}
              onClick={this.clickSkip}
            >
              Skip This Week
            </Button>
          </div>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <Button
            disabled={selectButton.isDisabled}
            variant='outline-dark'
            style={selectColor}
            onClick={this.clickSelect 
              // && () => this.props.handleDisableAcctChanges
            }
          >
            Select Meal
          </Button>
          <Button
            disabled={surpriseButton.isDisabled}
            variant='outline-dark'
            onClick={() => {
              this.clickSurprise(false);
            }}
            style={this.state.surpriseButton.chosen ? green : clear}
          >
            Surprise Me!
          </Button>
          <Button
            disabled={addonButton.isDisabled}
            variant='outline-dark'
            style={addonColor}
            onClick={this.clickAddon}
          >
            Add Local Treats
          </Button>
          {/*This part is for two modal. Select Meal Modal and Add Local Treats Modal */}
          {this.state.selectButton.showModal && (
            <SelectMealModal
              mealLeft={mealLeft}
              Meals={this.state.weekMenu.Meals}
              incrementMealLeft={this.incrementMealLeft}
              decrementMealLeft={this.decrementMealLeft}
              incrementMaxMeal={this.incrementMaxMeal}
              decrementMaxMeal={this.decrementMaxMeal}
              clickSkip={this.clickSkip}
              clickSurprise={() => {
                this.clickSurprise(false);
              }}
              currentMealSelected={this.state.currentMealSelected}
              saveSelectMeal={this.saveSelectMeal}
            />
          )}
          {this.state.addonButton.showModal && (
            <AddonModal
              totalAddonPrice={this.state.totalAddonPrice}
              closeAddonModal={this.closeAddonModal}
              saveButtonAddOn={this.saveButtonAddOn}
              Addons={this.state.weekMenu.Addons}
              incrementAddon={this.incrementAddon}
              decrementAddon={this.decrementAddon}
              incrementMealLeft={this.incrementMealLeft}
              decrementMealLeft={this.decrementMealLeft}
              currentAddonSelected={this.state.currentAddonSelected}
              incrementAddonPrice={this.incrementAddonPrice}
              decrementAddonPrice={this.decrementAddonPrice}
            />
          )}
        </ButtonToolbar>
      </div>
    );
  }
}
