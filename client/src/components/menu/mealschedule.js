import React, { Component, Fragment } from "react";

import { Grid, Cell } from "react-mdl";
import { Button, Row } from "react-bootstrap";
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
      currentPurchase: null, // get from purchases_id
      menu: {}, // menu for 6 week
      userID: this.props.appProps.user_uid, // user ID
      firstname: this.searchCookie4Name("loginStatus"),
      showHideMakeChange: false,
      error: null,
    };
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
    axios
      .get(
        this.props.match.params.startdate
          ? this.props.API_URL + "/" + this.props.match.params.startdate
          : this.props.API_URL
      )
      .then((res) => {
        const data = res.data;
        console.log("Data: ", data);
      })
      .catch((err) => {
        this.setState({ error: err });
        // do something to prompt the error to the user
      });
  };

  ChangeAccountInfo = () => {
    this.state.showHideMakeChange
      ? this.setState({ showHideMakeChange: false })
      : this.setState({ showHideMakeChange: true });
  };

  ChangeCurrentPurchase(purchase) {
    // this function use for update current purchase which is selected from children
    // need a helper function to get the purchase by using purchaseID
    this.setState({ currentPurchase: purchase });
  }
  render() {
    return (
      <div className="container font2">
        <Grid>
          <Cell col={4}>
            <h4>Hi! {this.state.firstname}</h4>
            <Row className="mb-1">
              <Selector
                purchases={this.state.purchases}
                ChangeCurrentPurchase={this.ChangeCurrentPurchase}
              />
            </Row>

            <Row className="mb-1">
              <Button onClick={this.ChangeAccountInfo}>
                Change Accont Info
              </Button>
            </Row>
            {this.state.showHideMakeChange && (
              <MakeChange ChangeAccountInfo={this.ChangeAccountInfo} />
            )}

            <AccountInfo />
          </Cell>{" "}
          <Cell col={8}>
            {/* run a loop to create 6 week's buttons */}
            <MealButtons />
          </Cell>
        </Grid>
      </div>
    );
  }
}
