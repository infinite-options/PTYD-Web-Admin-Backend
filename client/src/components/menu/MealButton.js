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

      currentMealSelected: {}, //this will be fetched from api this.props.MEAL_SELECT_API_URL}/${purchaseId}
      currentAddonSelected: {},
      //some variable to control button
      sundayButton: {
        chosen: false,
        isDisabled: false
      },
      mondayButton: {
        chosen: false,
        isDisabled: false
      },
      skipButton: {
        chosen: false,
        isDisabled: false
      },
      selectButton: {
        chosen: false,
        red: false,
        showModal: false,
        isDisabled: false
      },
      surpriseButton: {
        chosen: false,
        isDisabled: false
      },
      addonButton: {
        chosen: false,
        red: false,
        showModal: false,
        isDisabled: false
      }
    };
  }

  //helper function to get the current selected meal and addon for only current week
  getCurrentSelected = () => {
    //call the server to get new meal selected
    console.log("getCurrentSelected is called");

    let new_purchaseID = this.props.currentPurchase.purchase_id;
    console.log("new_purchasesID: ", new_purchaseID);
    axios
      .get(`${this.props.MEAL_SELECT_API_URL}/${new_purchaseID}`)
      .then(res => {
        let data;
        if (res.data.result !== undefined) {
          data = res.data.result;
          console.log("data: ", data);
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
                //calculate the total add on price for each week
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
                total = 0;
              }
            }
          }
        }
      })
      .then(() => {
        console.log("then inside the getcurrentSelected is called");
        if (Object.keys(this.state.currentMealSelected).length === 0) {
          // this.setState(prevState => ({
          //   sundayButton: {...prevState.sundayButton, chosen: true},
          //   surpriseButton: {...prevState.surpriseButton, chosen: true}
          // }));
          this.setSunday();
          this.setSurprise();
        } else if (this.state.currentMealSelected.delivery_day === "Sunday") {
          this.setSunday();
        } else if (this.state.currentMealSelected.delivery_day === "Monday") {
          this.setState(prevState => ({
            mondayButton: {...prevState.mondayButton, chosen: true}
          }));
        } else if (this.state.currentMealSelected.delivery_day === "SKIP") {
          // this.setState(prevState => ({
          //   skipButton: {...prevState.skipButton, chosen: true},
          //   selectButton: {chosen: false, isDisabled: true},
          //   surpriseButton: {chosen: false, isDisabled: true},
          //   addonButton: {chosen: false, isDisabled: true}
          // }));
          this.setSkip();
        }
        if (
          this.state.currentMealSelected.meal_selection === "SURPRISE" ||
          Object.keys(this.state.currentMealSelected.meal_selection).length ===
            0
        ) {
          this.setState(prevState => ({
            surpriseButton: {...prevState.surpriseButton, chosen: true}
          }));
        } else if (
          this.state.currentMealSelected.meal_selection.length > 0 &&
          this.state.currentMealSelected.meal_selection !== "SKIP"
        ) {
          this.setState(prevState => ({
            selectButton: {...prevState.selectButton, chosen: true}
          }));
        }

        if (Object.keys(this.state.currentAddonSelected).length > 0) {
          this.setState(prevState => ({
            addonButton: {...prevState.addonButton, chosen: true}
          }));
        } else {
          this.setState(prevState => ({
            addonButton: {...prevState.addonButton, chosen: false}
          }));
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
      this.getCurrentSelected();
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
        chosen:
          Object.keys(this.state.currentMealSelected).length !== 0
            ? true
            : false,
        isDisabled: false
      },
      surpriseButton: {
        chosen:
          Object.keys(this.state.currentMealSelected).length !== 0 &&
          Object.keys(this.state.currentMealSelected.meals_selected).length !==
            0
            ? true
            : false,
        isDisabled: false
      },
      addonButton: {
        ...prevState.addonButton,
        isDisabled: false
      },
      currentMealSelected: {
        ...prevState.currentMealSelected,
        delivery_day: "Sunday"
      }
    }));
  };
  clickSunday = async () => {
    await this.setSunday();
    this.saveSelectMealAPI();
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
        chosen:
          Object.keys(this.state.currentMealSelected).length !== 0 &&
          Object.keys(this.state.currentMealSelected.meals_selected).length !==
            0
            ? true
            : false,
        isDisabled: false
      },
      surpriseButton: {
        chosen:
          Object.keys(this.state.currentMealSelected).length === 0
            ? true
            : false,
        isDisabled: false
      },
      addonButton: {
        ...prevState.addonButton,
        isDisabled: false
      },
      currentMealSelected: {
        ...prevState.currentMealSelected,
        delivery_day: "Monday"
      }
    }));
  };
  clickMonday = async () => {
    await this.setMonday();
    this.saveSelectMealAPI();
  };
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
        isDisabled: false
      },
      skipButton: {
        ...prevState.skipButton,
        chosen: true,
        isDisabled: false
      },
      selectButton: {
        chosen: false,
        red: false,
        showModal: false,
        isDisabled: true
      },
      surpriseButton: {
        chosen: false,
        isDisabled: true
      },
      addonButton: {
        chosen: false,
        red: false,
        showModal: false,
        isDisabled: true
      },
      currentMealSelected: {
        ...prevState.currentMealSelected,
        delivery_day: "SKIP"
      }
    }));
  };
  clickSkip = async () => {
    await this.setSkip();
    // send a form to database to write a
    this.saveSelectMealAPI();
  };
  clickSelect = () => {
    this.setState(prevState => ({
      sundayButton: {
        ...prevState.sundayButton,
        // chosen: false,
        isDisabled: true
      },
      mondayButton: {
        ...prevState.mondayButton,
        // chosen: false,
        isDisabled: true
      },
      skipButton: {
        ...prevState.skipButton,
        isDisabled: false
      },
      selectButton: {
        chosen: true,
        red: true,
        showModal: true,
        isDisabled: false
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        chosen: false,
        isDisabled: false
      },
      addonButton: {
        ...prevState.addonButton,
        isDisabled: true
      }
    }));
  };

  setSurprise = () => {
    this.setState(prevState => ({
      sundayButton: {
        ...prevState.sundayButton,
        isDisabled: false
      },
      mondayButton: {
        ...prevState.mondayButton,
        isDisabled: false
      },
      skipButton: {
        ...prevState.skipButton,
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
      },
      currentMealSelected: {
        ...prevState.currentMealSelected,
        meal_selection: "SURPRISE"
      }
    }));
  };
  clickSurprise = () => {
    this.setSurprise();
    //send a request to database
    this.saveSelectMealAPI();
  };
  /* Addon button is clicked. All others button will inactive. until Agree to Pay is clicked */
  clickAddOn = () => {
    this.setState(prevState => ({
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
        isDisabled: false
      },
      selectButton: {
        ...prevState.selectButton,
        isDisabled: true
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        isDisabled: true
      },
      addonButton: {
        ...prevState.addonButton,
        chosen: true,
        red: true,
        showModal: true,
        isDisabled: false
      }
    }));
  };

  closeAddonModal = () => {
    this.setState(prevState => ({
      sundayButton: {
        ...prevState.sundayButton,
        isDisabled: false
      },
      mondayButton: {
        ...prevState.mondayButton,
        isDisabled: false
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
        chosen: false,
        red: false,
        showModal: false,
        isDisabled: false
      }
    }));
  };

  incrementMaxMeal = () => {
    // this.setState({ mealLeft: this.state.mealLeft + 1 });
  };

  decrementMaxMeal = () => {
    // this.setState({ mealLeft: this.state.mealLeft - 1 });
  };

  saveSelectMeal = () => {
    // set state for all button
    this.setState(prevState => ({
      sundayButton: {
        ...prevState.sundayButton,
        isDisabled: false
      },
      mondayButton: {
        ...prevState.mondayButton,
        isDisabled: false
      },
      skipButton: {
        ...prevState.skipButton,
        isDisabled: false
      },
      selectButton: {
        ...prevState.selectButton,
        chosen: true,
        red: false,
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

    // send request to save to serve
    this.saveSelectMealAPI();
  };
  saveButtonAddOn = () => {
    this.setState(prevState => ({
      sundayButton: {
        ...prevState.sundayButton,
        isDisabled: false
      },
      mondayButton: {
        ...prevState.mondayButton,
        isDisabled: false
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
        chosen: this.state.totalAddonPrice ? true : false,
        red: false,
        showModal: false,
        isDisabled: false
      }
    }));
    //check if we change the addon of the current week

    if (
      this.state.currentPurchase.week_affected ===
      this.state.weekMenu.SaturdayDate
    ) {
      //update currentPurchase
      this.setState(prevState => ({
        currentPurchase: {
          ...prevState.currentPurchase,
          total_charge: this.state.totalAddonPrice
        }
      }));
      //update parent
      console.log("calling changeCurrentCharge from MealButton");
      this.props.ChangeCurrentAddonCharge(this.state.totalAddonPrice);
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
    console.log("delivery day: ", delivery_day);
    console.log("meal selected: ", meals_selected);
    fetch(
      `${this.props.MEAL_SELECT_API_URL}/${this.state.currentPurchase.purchase_id}`,
      {
        method: "POST",
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json"
        },
        body: JSON.stringify({
          purchase_id:
            purchase_id !== undefined
              ? purchase_id
              : this.state.currentPurchase.purchase_id,
          week_affected:
            week_affected !== undefined
              ? week_affected
              : this.state.weekMenu.SaturdayDate,
          meal_quantities: meals_selected === undefined ? null : meals_selected,
          delivery_day: delivery_day,
          default_selected: this.state.surpriseButton.isDisabled,
          is_addons: false
        })
      }
    );
  };
  saveAddonAPI = () => {
    const {
      purchase_id,
      week_affected,

      meal_selection,
      meals_selected
    } = this.state.currentAddonSelected;
    fetch(`${this.props.MEAL_SELECT_API_URL}/${purchase_id}`, {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        purchase_id: purchase_id,
        week_affected: week_affected,
        addon_quantities: meals_selected,
        default_selected: this.state.surpriseButton.isDisabled,
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
          week_affected: this.state.weekMenu.SaturdayDate, // need to know which week is affected.
          purchase_id: this.state.currentPurchase.purchase_id,
          delivery_day: this.state.sundayButton.chosen
            ? this.state.weekMenu.sundayDate
            : this.state.weekMenu.mondayDate,
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
          week_affected: this.state.weekMenu.SaturdayDate, // need to know which week is affected.
          purchase_id: this.state.currentPurchase.purchase_id,
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
    if (this.state.totalAddonPrice > 0 && newTotal >= 0) {
      this.setState({
        totalAddonPrice: parseFloat(newTotal)
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
    const red = {
      width: "95px",
      height: "95px",
      backgroundColor: "#d9534f",
      color: "white"
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
              onClick={this.clickSunday}
              style={sundayColor}
            >
              Sunday
              <div>{weekMenu.Sunday}</div>
            </Button>
            &nbsp;
            <Button
              variant='outline-dark'
              disabled={mondayButton.isDisabled}
              onClick={this.clickMonday}
              style={mondayColor}
            >
              Monday
              <div>{weekMenu.Monday}</div>
            </Button>
            &nbsp;
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
            onClick={this.clickSelect}
          >
            Select Meal
          </Button>
          &nbsp;
          <Button
            disabled={surpriseButton.isDisabled}
            variant='outline-dark'
            onClick={this.clickSurprise}
            style={this.state.surpriseButton.chosen ? green : clear}
          >
            Surprise Me!
          </Button>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <Button
            disabled={addonButton.isDisabled}
            variant='outline-dark'
            style={addonColor}
            onClick={this.clickAddOn}
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
              clickSurprise={this.clickSurprise}
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
