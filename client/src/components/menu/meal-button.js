import React, { Component } from "react";
import { Grid, Cell } from "react-mdl";
import EachMeal from "./each-meal";
import EachAddon from "./each-addon";

import {
  ButtonToolbar,
  Button,
  Modal,
  Card,
  OverlayTrigger,
  Tooltip
} from "react-bootstrap";
import { Link } from "react-router-dom";

export default class MealButton extends Component {
  constructor(props) {
    super(props);

    this.changeButtonSkip = this.changeButtonSkip.bind(this);
    this.changeButtonSurprise = this.changeButtonSurprise.bind(this);
    this.changeButtonM = this.changeButtonM.bind(this);
    this.changeButtonS = this.changeButtonS.bind(this);

    this.state = {
      count: 0,
      buttonS: false,
      buttonM: false,
      buttonSkip: false,
      buttonSelect: false,
      buttonSurprise: true,
      buttonAddOn: false,
      requestModal: false,
      // buttonDisabled: true,
      buttonSelectKeepColor: false,
      buttonAddOnKeepColor: false,
      cancelAddonWithoutSave: false,
      mealQuantities: this.props.mealQuantities,
      addonQuantities: this.props.addonQuantities,
      maxmeals: this.props.maxmeals,
      maxmealsCopy: this.props.maxmeals,
      total_addon_price: Object.values(this.props.addon_price_saved).reduce(
        (a, b) => a + b,
        0
      ),
      addonActivated: false,
      flag: false,
      mondayAvailable: this.props.monday_available,
      dayToDeliver: this.props.deliverDay,
      subscribed: this.props.subscribed,
      //next props
      purchase_id: this.props.purchase_id,
      week_affected: this.props.saturdayDate,
      menu: this.props.menu,
      addons: this.props.addons,
      disableSunMon: this.props.maxmeals > 0 ? true : false
    };
  }
  componentWillReceiveProps(nextProps) {
    if (nextProps !== this.props) {
      if (nextProps.surprise == false) {
        this.setState({
          buttonSurprise: false,
          buttonSelectKeepColor: true
        });
      } else {
        this.setState({
          buttonSurprise: true,
          buttonSelectKeepColor: false
        });
      }

      switch (nextProps.deliverDay) {
        case "SKIP":
          this.setState({
            buttonS: false,
            buttonM: false,
            buttonSkip: true,
            buttonSurprise: false,
            buttonDisabled: true,
            buttonAddOnKeepColor: false
          });
          break;
        case "Monday":
          this.setState({
            buttonS: false,
            buttonM: true,
            buttonSkip: false,
            buttonDisabled: false
          });
          break;
        case "Sunday":
          this.setState({
            buttonS: true,
            buttonM: false,
            buttonSkip: false,
            buttonDisabled: false
          });
      }
    }
    this.setState({
      maxmeals: nextProps.maxmeals,
      maxmealsCopy: nextProps.maxmeals,
      purchase_id: nextProps.purchase_id,
      week_affected: nextProps.saturdayDate,
      menu: nextProps.menu,
      addons: nextProps.addons,
      addonQuantities: nextProps.addonQuantities,
      // buttonAddOnKeepColor: this.props.addonsSelected,
      mealQuantities: nextProps.mealQuantities,
      buttonAddOnKeepColor: nextProps.buttonAddOnKeepColor,
      total_addon_price: Object.values(nextProps.addon_price_saved).reduce(
        (a, b) => a + b,
        0
      )
    });
  }
  async componentDidMount() {
    //  var stateCopy = await Object.assign({}, this.state);
    //  this.setState({
    //    maxmealsOriginal: stateCopy.maxmeals,
    //    mealQuantitiesOriginal: stateCopy.mealQuantities,
    //    addonQuantitiesOriginal: stateCopy.addonQuantities,
    //  });

    if (this.props.surprise == false) {
      this.setState({
        buttonSurprise: false,
        buttonSelectKeepColor: true
      });
    } else {
      this.setState({
        disableSunMon: false
      });
    }

    switch (this.props.deliverDay) {
      case "SKIP":
        this.setState({
          buttonS: false,
          buttonM: false,
          buttonSkip: true,
          buttonSurprise: false,
          buttonDisabled: true,
          buttonAddOnKeepColor: false,
          disableSunMon: false
        });
        break;
      case "Monday":
        this.setState({
          buttonS: false,
          buttonM: true,
          buttonSkip: false,
          buttonDisabled: false
        });
        break;
      case "Sunday":
        this.setState({
          buttonS: true,
          buttonM: false,
          buttonSkip: false,
          buttonDisabled: false
        });
    }
  }

  sendForm = () => {
    /*
    console.log({
      purchase_id: this.state.purchase_id,
      week_affected: this.state.week_affected,
      meal_quantities: this.state.mealQuantities,
      delivery_day: this.state.dayToDeliver,
      default_selected: this.state.buttonSurprise,
      is_addons: false
    });
    */

    fetch(`${this.props.MEAL_SELECT_API_URL}/${this.state.purchase_id}`, {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        purchase_id: this.state.purchase_id,
        week_affected: this.state.week_affected,
        meal_quantities: this.state.mealQuantities,
        delivery_day: this.state.dayToDeliver,
        default_selected: this.state.buttonSurprise,
        is_addons: false
      })
    });
  };

  sendAddonForm = () => {
    console.log("its sending form from addon", this.state.addonQuantities);
    fetch(`${this.props.MEAL_SELECT_API_URL}/${this.state.purchase_id}`, {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        purchase_id: this.state.purchase_id,
        week_affected: this.state.week_affected,
        addon_quantities: this.state.addonQuantities,
        is_addons: true
      })
    }).then(response => {
      if (!response.ok) {
        const error = response.statusText;
        console.log("Error updating");
        return Promise.reject(error);
      } else {
        console.log("You have successfully update addon information!");
      }
      console.log("addon result", response.json());
    });
    console.log(this.state.addonQuantities);
    if (
      Object.values(this.state.addonQuantities).reduce(function(a, b) {
        return a + b;
      }, 0) === 0
    ) {
      console.log("if addon == 1");
      this.setState({ buttonAddOnKeepColor: false });
    } else {
      console.log(
        "if not ",
        Object.values(this.state.addonQuantities).reduce(function(a, b) {
          return a + b;
        }, 0)
      );
      this.setState({ buttonAddOnKeepColor: true });
    }
  };

  closeButtonSelect = () => {
    this.setState({
      buttonSelect: false,
      buttonSelectKeepColor: true,
      flag: false
      //    mealQuantities: this.state.mealQuantitiesOriginal,
      //    maxmeals: this.state.maxmealsOriginal,
    });
  };
  closeButtonAddOn = () => {
    this.setState(
      {
        buttonAddOn: false
        // buttonAddOnKeepColor: false

        //    addonQuantities: this.state.addonQuantitiesOriginal,
      }
      // ,() => {
      //   if (
      //     Object.values(this.state.addonQuantities).reduce(function(a, b) {
      //       return a + b;
      //     }, 0) === 0
      //   ) {
      //     this.setState({buttonAddOnKeepColor: false});
      //   } else {
      //     this.setState({cancelAddonWithoutSave: true});
      //   }
      // }
    );
    this.sendAddonForm();
  };
  saveButtonAddOn = () => {
    this.setState({
      buttonAddOn: false,
      cancelAddonWithoutSave: false
      // buttonAddOnKeepColor: true
    });
    this.sendAddonForm();
  };

  async changeButtonS() {
    await this.setState({
      buttonSurprise: this.state.buttonSkip ? true : this.state.buttonSurprise
    });
    await this.setState({
      buttonS: true,
      buttonM: false,
      buttonSkip: false,
      buttonDisabled: false,
      dayToDeliver: "Sunday"
    });
    this.sendForm();
  }

  async changeButtonM() {
    await this.setState({
      buttonSurprise: this.state.buttonSkip ? true : this.state.buttonSurprise
    });
    await this.setState({
      buttonM: true,
      buttonS: false,
      buttonSkip: false,
      buttonDisabled: false,
      dayToDeliver: "Monday"
    });
    this.sendForm();
  }

  async changeButtonSkip() {
    await this.setState({
      buttonM: false,
      buttonS: false,
      buttonSkip: true,

      buttonSurprise: false,
      buttonSelect: false,
      buttonAddOn: false,
      buttonDisabled: true,
      buttonSelectKeepColor: false,
      buttonAddOnKeepColor: false,
      dayToDeliver: "SKIP",
      disableSunMon: false
    });
    this.sendForm();
  }

  changeButtonSelect = () => {
    this.SelectMealEachMeal();
    this.setState({
      buttonSelect: true,
      buttonSurprise: false,
      buttonAddOn: false,
      buttonSelectKeepColor: true,
      disableSunMon: true
    });
  };
  async changeButtonSurprise() {
    await this.setState({
      buttonSelect: false,
      buttonSurprise: true,
      buttonAddOn: false,
      buttonSelectKeepColor: false,
      disableSunMon: false
    });
    this.sendForm();
  }
  changeButtonAddOn = () => {
    this.setState({
      addonActivated: true,
      buttonAddOn: true,
      buttonAddOnKeepColor: true,
      buttonSelect: false
    });
  };
  specialRequest = () => {
    this.setState({
      requestModal: !this.state.requestModal
    });
  };
  saveButtonActivateAddons = () => {
    this.setState({
      addonActivated: true,
      buttonSelect: false,
      buttonSelectKeepColor: true,
      disableSunMon: false
    });
    this.sendForm();
  };

  render() {
    const orange = {
      width: "95px",
      height: "95px",
      backgroundColor: "#cd790c",
      color: "white"
    };

    const hide = {
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
    if (this.state.total_addon_price == 0) {
      this.state.buttonAddOnKeepColor = false;
    } else {
      this.state.buttonAddOnKeepColor = true;
    }
    return (
      <div>
        <ButtonToolbar className="mb-5">
          <div className="radio">
            <Button
              variant="outline-dark"
              disabled={this.state.disableSunMon}
              onClick={this.changeButtonS}
              style={this.state.buttonS ? green : hide}
            >
              {this.props.day1} {this.props.date1}
            </Button>
            &nbsp;
            <Button
              variant="outline-dark"
              disabled={!this.state.mondayAvailable || this.state.disableSunMon}
              onClick={this.changeButtonM}
              style={this.state.buttonM ? green : hide}
            >
              {this.props.day2} {this.props.date2}
            </Button>
            &nbsp;
            <Button
              disabled={!this.state.subscribed}
              variant="outline-dark"
              style={this.state.buttonSkip ? orange : hide}
              onClick={this.changeButtonSkip}
            >
              Skip This Week
            </Button>
          </div>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          {/* <Link
            to={{
              pathname: "/select-meal"
            }}
          > */}
          <Button
            disabled={this.state.buttonDisabled}
            variant="outline-dark"
            ref={button => (this.button = button)}
            style={
              (this.state.buttonSelect ? green : hide,
              this.state.buttonSelectKeepColor
                ? this.state.disableSunMon
                  ? red
                  : green
                : hide)
            }
            onClick={this.changeButtonSelect}
          >
            Select Meal
          </Button>
          {/* </Link> */}
          &nbsp;
          <Button
            disabled={this.state.buttonDisabled || !this.state.subscribed}
            variant="outline-dark"
            ref={button => (this.button2 = button)}
            onClick={this.changeButtonSurprise}
            style={this.state.buttonSurprise ? green : hide}
          >
            Surprise Me!
          </Button>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          {/* <SpecialRequestAnimation /> */}
          <Button
            disabled={this.state.buttonDisabled}
            variant="outline-dark"
            style={
              (this.state.buttonAddOn ? orange : hide,
              this.state.buttonAddOnKeepColor
                ? this.state.cancelAddonWithoutSave
                  ? red
                  : orange
                : hide)
            }
            onClick={this.changeButtonAddOn}
          >
            Add Local Treats
          </Button>
          <div style={this.state.buttonSelect ? {} : { display: "none" }}>
            {this.SelectMealEachMeal()}
          </div>
          <div style={this.state.buttonAddOn ? {} : { display: "none" }}>
            {this.SelectMealEachMealAddOn()}
          </div>
        </ButtonToolbar>
        {/* <br /> */}
      </div>
    );
  }

  SelectMealEachMeal = () => {
    return (
      <Card style={{ width: "92%" }}>
        <Card.Header>
          <Modal.Title style={{ width: "100%" }}>
            <h4 style={{ float: "left", margin: "0" }} class="font2">
              Please Select {this.state.maxmeals} Meals:
            </h4>
            <div style={{ float: "right" }}>
              {/*<Button
                variant="danger"
                onClick={() => {
                  if (
                    this.state.maxmealsCopy !== this.state.maxmeals &&
                    this.state.flag === false
                  ) {
                    alert(
                      "Are you sure you want to close without saving your changes?"
                    );
                    this.setState({
                      flag: true
                    });
                    return;
                  }
                  this.closeButtonSelect();
                }}
              >
                Close
              </Button> */}
              &nbsp;&nbsp;
              {this.state.subscribed ? (
                this.state.maxmeals !== 0 ? (
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
                  <Button
                    variant="success"
                    onClick={this.saveButtonActivateAddons}
                  >
                    Save
                  </Button>
                )
              ) : (
                <Button variant="success" href="/selectmealplan">
                  Subscribe Now
                </Button>
              )}
            </div>
          </Modal.Title>
        </Card.Header>
        <div class="scrollMenu">
          {Object.keys(this.state.menu).map(key => (
            <Grid>
              <Cell col={12}>
                <h4 style={{ margin: "0" }}>{this.state.menu[key].Category}</h4>
              </Cell>

              {this.state.menu[key].Menu.map(meal => (
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
                    mealQuantities={this.state.mealQuantities[meal.meal_id]}
                    incrementMaxMeal={() => {
                      var stateCopy = Object.assign({}, this.state);
                      stateCopy.mealQuantities[meal.meal_id] -= 1;
                      this.setState(stateCopy);
                      this.setState({ maxmeals: this.state.maxmeals + 1 });
                    }}
                    decrementMaxMeal={() => {
                      var stateCopy = Object.assign({}, this.state);
                      stateCopy.mealQuantities[meal.meal_id] += 1;
                      this.setState(stateCopy);
                      this.setState({ maxmeals: this.state.maxmeals - 1 });
                    }}
                  />
                </Cell>
              ))}
            </Grid>
          ))}
        </div>
        {/* <Card.Body>
          <center>
            &nbsp;&nbsp;
            <Button
              variant="danger"
              onClick={() => {
                if (
                  this.state.maxmealsCopy !== this.state.maxmeals &&
                  this.state.flag === false
                ) {
                  alert("Are you sure you want to close without saving?");

                  this.setState({
                    flag: true
                  });
                  return;
                }
                this.closeButtonSelect();
              }}
            >
              Close
            </Button>
            &nbsp;&nbsp;
            {this.state.subscribed ? (
              this.state.maxmeals === 0 && (
                <Button
                  variant="success"
                  onClick={this.saveButtonActivateAddons}
                >
                  Save changes
                </Button>
              )
            ) : (
              <Button variant="success" href="/selectmealplan">
                Subscribe Now
              </Button>
            )}
          </center>
        </Card.Body> */}
      </Card>
    );
  };
  SelectMealEachMealAddOn = () => {
    let close = true;
    if (this.state.total_addon_price !== 0) {
      close = false;
    } else {
      close = true;
    }
    return (
      <Card style={{ width: "92%" }}>
        <Card.Header>
          <Modal.Title style={{ width: "100%" }}>
            <h4 className="font2" style={{ float: "left", margin: "0" }}>
              Add Local Treats:
            </h4>
            <div style={{ float: "right" }}>
              <h4 className="font2" style={{ float: "left", margin: "0" }}>
                Total Price: ${this.state.total_addon_price}
              </h4>
              {/* {close ? (
                <Button variant="danger" onClick={this.closeButtonAddOn}>
                  Close
                </Button>
              ) : (
                <div />
              )} */}
              &nbsp;&nbsp;
              {close ? (
                <Button variant="danger" onClick={this.closeButtonAddOn}>
                  Close
                </Button>
              ) : !close && this.state.subscribed ? (
                <Button variant="success" onClick={this.saveButtonAddOn}>
                  Agree To Pay
                </Button>
              ) : (
                <Link to="/selectmealplan" className="btn btn-success">
                  Subscribe Now
                </Link>
              )}
            </div>
          </Modal.Title>
        </Card.Header>
        {this.state.addonActivated ? (
          <div>
            {Object.keys(this.state.addons).map(key => (
              <div>
                <Grid>
                  <Cell col={12}>
                    <h4 style={{ margin: "0" }}>
                      {this.state.addons[key].Category}
                    </h4>
                  </Cell>

                  {this.state.addons[key].Menu.map(meal => (
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
                        addonQuantities={
                          this.props.addonQuantities[meal.meal_id]
                        }
                        incrementAddon={() => {
                          var stateCopy = Object.assign({}, this.state);
                          stateCopy.addonQuantities[meal.menu_meal_id] += 1;
                          this.setState(stateCopy);
                        }}
                        decrementAddon={() => {
                          var stateCopy = Object.assign({}, this.state);
                          stateCopy.addonQuantities[meal.menu_meal_id] -= 1;
                          this.setState(stateCopy);
                        }}
                        // incrementAddonPrice={() => {
                        //   var stateCopy2 = Object.assign({}, this.state);
                        //   stateCopy2.new_price =
                        //     this.state.total_addon_price +
                        //     meal.extra_meal_price;
                        //   console.log(
                        //     "increment addon price",
                        //     stateCopy2.new_price,
                        //     this.state.total_addon_price,
                        //     meal.extra_meal_price
                        //   );
                        //   let fixedStateCopy2 = stateCopy2.new_price;
                        //   this.setState({
                        //     total_addon_price: fixedStateCopy2
                        //   });
                        // }}
                        incrementAddonPrice={() => {
                          // var stateCopy2 = Object.assign({}, this.state);
                          let new_meal_price = parseFloat(
                            meal.extra_meal_price
                          );
                          let new_price =
                            this.state.total_addon_price + new_meal_price;
                          let newprice_fixed2 = parseFloat(
                            new_price.toFixed(2)
                          );
                          this.setState({
                            total_addon_price: newprice_fixed2
                          });
                        }}
                        decrementAddonPrice={() => {
                          // var stateCopy2 = Object.assign({}, this.state);
                          let new_meal_price = parseFloat(
                            meal.extra_meal_price
                          );
                          let new_price =
                            this.state.total_addon_price - new_meal_price;
                          let newprice_fixed2 = parseFloat(
                            new_price.toFixed(2)
                          );
                          this.setState({
                            total_addon_price: newprice_fixed2
                          });
                        }}
                      />
                    </Cell>
                  ))}
                </Grid>
              </div>
            ))}
          </div>
        ) : (
          <div>
            {/* {Object.keys(this.props.addons["Addons"]).map(key => ( */}
            <div>
              <Grid>
                <Cell col={12}>
                  <h4 style={{ margin: "0" }}>
                    {this.state.addons["Addons"].Category}
                  </h4>
                </Cell>

                {this.state.addons["Addons"].Menu.map(meal => (
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
                      addonQuantities={this.state.addonQuantities[meal.meal_id]}
                      incrementAddon={() => {
                        var stateCopy = Object.assign({}, this.state);
                        stateCopy.addonQuantities[meal.menu_meal_id] += 1;
                        this.setState(stateCopy);
                      }}
                      decrementAddon={() => {
                        var stateCopy = Object.assign({}, this.state);
                        stateCopy.addonQuantities[meal.menu_meal_id] -= 1;
                        this.setState(stateCopy);
                      }}
                      incrementAddonPrice={() => {
                        // var stateCopy2 = Object.assign({}, this.state);
                        let new_meal_price = parseFloat(meal.extra_meal_price);
                        let new_price =
                          this.state.total_addon_price + new_meal_price;
                        let newprice_fixed2 = parseFloat(new_price.toFixed(2));
                        this.setState({
                          total_addon_price: newprice_fixed2
                        });
                      }}
                      decrementAddonPrice={() => {
                        // var stateCopy2 = Object.assign({}, this.state);
                        let new_meal_price = parseFloat(meal.extra_meal_price);
                        let new_price =
                          this.state.total_addon_price - new_meal_price;
                        let newprice_fixed2 = parseFloat(new_price.toFixed(2));
                        this.setState({
                          total_addon_price: newprice_fixed2
                        });
                      }}
                    />
                  </Cell>
                ))}
              </Grid>
            </div>
            {/* ))} */}
          </div>
        )}
        <Card.Body>
          <center>
            {/* <Button variant='danger' onClick={this.closeButtonAddOn}>
              Close
            </Button> */}
            &nbsp;&nbsp;
            {close ? (
              <Button variant="danger" onClick={this.closeButtonAddOn}>
                Close
              </Button>
            ) : !close && this.state.subscribed ? (
              <Button variant="success" onClick={this.saveButtonAddOn}>
                Agree To Pay
              </Button>
            ) : (
              <Link to="/selectmealplan" className="btn btn-success">
                Subscribe Now
              </Link>
            )}
          </center>
        </Card.Body>
      </Card>
    );
  };
}
