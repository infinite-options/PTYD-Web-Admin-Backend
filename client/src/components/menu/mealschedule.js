import React, {Component} from "react";

import {Grid, Cell} from "react-mdl";
import {Button, Row} from "react-bootstrap";
import Cookies from "js-cookie";
import axios from "axios";

import AccountInfo from "./AccountInfo";
import MakeChange from "./MakeChange";
import MealButtons from "./MealButton";
import Selector from "./Selector";

export default class MealSchedule extends Component {
  constructor(props) {
    super(props);
    this.state = {
      purchases: [], // use for loading all purchases that user have, key for this object is purchases_id
      currentPurchase: {}, // get from purchases_id
      menu: {}, // menu for 6 week,
      mealPlans: {}, // we're gonna need this for changing meal plan in change account info
      userID: this.props.appProps.user_uid, // user ID
      firstname: this.searchCookie4Name("loginStatus"),
      showHideMakeChange: false,

      //handle addonCharge for AccountInfo component
      addonCharge: 0,

      //tax rate and shipping fee
      tax_rate: 0,
      shipping: 0,

      //handle error
      error: null
    };
    this.ChangeCurrentPurchase = this.ChangeCurrentPurchase.bind(this);
  }

  getCookieAttrHelper(cname, type) {
    const values = Cookies.get(cname);
    if (values === "" || values === undefined) {
      return null;
    } else {
      for (let val of values.split(",")) {
        let [n, v] = val.split(":");
        if (n === type) {
          return v;
        }
      }
      return null;
    }
  }
  /* these functions are using for getting information from cookies.
    Parameter for these functions is the name of the cookies's variable
    which we want to get info. For our app, using "loginStatus" for the
    parameter to get first name, userID ...from cookies.
  */
  searchCookie4LoggedInBy(cname) {
    return this.getCookieAttrHelper(cname, "loggedInBy");
  }
  searchCookie4Name(cname) {
    return this.getCookieAttrHelper(cname, "first_name");
  }
  searchCookie4UserID(cname) {
    return this.getCookieAttrHelper(cname, "user_uid");
  }

  componentDidMount = () => {
    // loading everything we need and keep it local
    // get purchases for server
    // using url = this.props.API_URL if there is no "startdate" variable in the request
    // using url = this
    // "startdate" variable is used for expand weeks (during testing)
    // example: this.props.match.params.startdate ? this.props.API_URL + "/" + this.props.match.params.startdate : this.props.API_URL

    //setting menu for 6 weeks
    axios
      .get(
        this.props.match.params.startdate
          ? this.props.API_URL + "/" + this.props.match.params.startdate
          : this.props.API_URL
      )
      .then(res => {
        if (res.data !== undefined && res.data.result !== undefined) {
          this.setState({menu: res.data.result});
        }
      })
      .catch(err => {
        this.setState({error: err.response});
        // do something to prompt the error to the user
      });

    // getting all purchases which user have
    axios
      .get(`${this.props.PURCHASE_API_URL}/${this.state.userID}`, {
        params: {startdate: this.props.match.params.startdate}
      })
      .then(res => {
        if (res.data !== undefined && res.data.result !== undefined) {
          if (res.data.result.length > 0) {
            this.setState({purchases: res.data.result});
            //set currentPurchase for the first purchase in purchases array
            // this is done in componentDidMount to load currentPurchase for the
            // frist time the page is loaded
            this.setState({
              currentPurchase: res.data.result[0]
            });
          } else {
            this.setState({error: "There are no subscribed purchases."});
          }
        }
      })
      .catch(err => {
        if (typeof err === "string") {
          this.setState({error: err});
          console.log(err);
        } else {
          if (err.response !== undefined && err.response.data !== undefined)
            this.setState({error: err.response.data.message});
          console.log(err.response);
        }
      });
    // calling Plans_url to get all meal plans
    axios
      .get(`${this.props.PLANS_URL}`)
      .then(res => {
        let data = res.data;
        if (data !== undefined && data.result !== undefined) {
          this.setState({mealPlans: data.result});
        }
      })
      .catch(err => {
        console.log("error happened when calling plans_url: ", err);
      });
    // calling TaxRateAPI
    let today = new Date();
    let mm =
      today.getMonth() + 1 >= 10
        ? today.getMonth() + 1
        : "0" + (today.getMonth() + 1);
    let dd = today.getDate() >= 10 ? today.getDate() : "0" + today.getDate();
    let yyyy = today.getFullYear();
    axios
      .get(`${this.props.TAX_RATE_URL}`, {
        params: {affected_date: `${yyyy}-${mm}-${dd}`}
      })
      .then(res => {
        if (res.data.result !== undefined) {
          let rate = parseFloat(
            (parseFloat(res.data.result.tax_rate) / 100).toFixed(2)
          );
          this.setState({tax_rate: rate, shipping: 15}); // should get shipping from databse too.
        }
      });
  };

  ChangeAccountInfo = () => {
    this.state.showHideMakeChange
      ? this.setState({showHideMakeChange: false})
      : this.setState({showHideMakeChange: true});
  };

  ChangeCurrentPurchase = purchase => {
    // this function use for update current purchase which is selected from children
    // need a helper function to get the purchase by using purchaseID
    this.setState({currentPurchase: purchase});
    this.setState({addonCharge: purchase.total_charge});
  };
  ChangeCurrentAddonCharge = total => {
    this.setState({addonCharge: total});
    // console.log("changeCurrentAddon Charge in mealschedule is called");
  };

  SetError = err => {
    this.setState({error: err});
  };

  render() {
    /*because menu is an object so we have to convert it to array before we run the loop
     to create 6 weeks buttons. */
    let sixWeekMenu = Object.entries(this.state.menu);

    return (
      <div className='container font2'>
        <Grid>
          <Cell col={4}>
            <div className='box'>
              <h4 style={{marginTop: "0"}}>Hi, {this.state.firstname}!</h4>
              <Row className='mb-1'>
                <Selector
                  purchases={this.state.purchases}
                  ChangeCurrentPurchase={this.ChangeCurrentPurchase}
                />
              </Row>

              <Row className='mb-1'>
                <Button
                  onClick={this.ChangeAccountInfo}
                  size='lg'
                  block
                  disabled={!this.state.currentPurchase.purchase_id}
                >
                  Change Account Info
                </Button>
              </Row>


              <div className='visibility-hidden-mobile'>
              {this.state.showHideMakeChange && (
                <MakeChange
                  searchCookie4LoggedInBy={this.searchCookie4LoggedInBy(
                    "loginStatus"
                  )}
                  ChangeAccountInfo={this.ChangeAccountInfo}
                  currentPurchase={this.state.currentPurchase}
                  purchases={this.state.purchases}
                  mealPlans={this.state.mealPlans}
                  history={this.props.history}
                  DEV_URL={this.props.DEV_URL}
                  DELETE_URL={this.props.DELETE_URL}
                  CHANGE_SUBCRIPTION_URL={this.props.CHANGE_SUBCRIPTION_URL}
                  UPDATE_ADDRESS_URL={this.props.UPDATE_ADDRESS_URL}
                  UPDATE_PAYMENT_URL={this.props.UPDATE_PAYMENT_URL}
                  REFUND_URL={this.props.REFUND_URL}
                  user_uid={this.state.userID}
                  tax_rate={this.state.tax_rate}
                  shipping={this.state.shipping}
                />
              )}

              <AccountInfo
                currentPurchase={this.state.currentPurchase}
                addonCharge={this.state.addonCharge}
              />
              </div>
            </div>
          </Cell>
          
          <Cell col={8}>
            {/* run a loop to create 6 week's buttons */}
            {this.state.error === null ? (
              <div className='container container_space'>
                {sixWeekMenu.map(element => (
                  <MealButtons
                    key={element[0]}
                    week={element[0]}
                    maxMeals={this.state.currentPurchase.MaximumMeals}
                    weekMenu={element[1]}
                    currentPurchase={this.state.currentPurchase}
                    ChangeCurrentAddonCharge={this.ChangeCurrentAddonCharge}
                    MEAL_SELECT_API_URL={this.props.MEAL_SELECT_API_URL} // using for update meal selected
                    SetError={this.SetError}
                  />
                ))}
              </div>
            ) : (
              <div className='container'>
                {typeof this.state.error === "string" ? (
                  <div>
                    <h3 className='box has-text-danger'>{this.state.error}</h3>
                    <a
                      className='button is-info is-large'
                      href='/selectmealplan'
                    >
                      Subscribe Now
                    </a>
                  </div>
                ) : (
                  <div className='has-text-danger'>
                    {" "}
                    Oops... Something went wrong !!!
                  </div>
                )}
              </div>
            )}
          </Cell>
          
          {/* mobile: display subscription details at page end */}
          <div className='box no-display-desktop'>
            {this.state.showHideMakeChange && (
              <MakeChange
                searchCookie4LoggedInBy={this.searchCookie4LoggedInBy(
                  "loginStatus"
                )}
                ChangeAccountInfo={this.ChangeAccountInfo}
                currentPurchase={this.state.currentPurchase}
                purchases={this.state.purchases}
                mealPlans={this.state.mealPlans}
                history={this.props.history}
                DEV_URL={this.props.DEV_URL}
                DELETE_URL={this.props.DELETE_URL}
                CHANGE_SUBCRIPTION_URL={this.props.CHANGE_SUBCRIPTION_URL}
                UPDATE_ADDRESS_URL={this.props.UPDATE_ADDRESS_URL}
                UPDATE_PAYMENT_URL={this.props.UPDATE_PAYMENT_URL}
                REFUND_URL={this.props.REFUND_URL}
                user_uid={this.state.userID}
                tax_rate={this.state.tax_rate}
                shipping={this.state.shipping}
              />
            )}

            <AccountInfo
              currentPurchase={this.state.currentPurchase}
              addonCharge={this.state.addonCharge}
            />
          </div>

        </Grid>
      </div>
    );
  }
}
