import React from "react";
import { Switch, Route } from "react-router-dom";

import LandingPage from "./landingpage";
import SelectMealPlan from "./selectmealplan";
import SelectPaymentPlan from "./selectpaymentplan";
import MenuThisWeek from "./menuthisweek";
import MenuNextWeek from "./menunextweek";
import Checkout from "./checkout";
import FindUs from "./findus";
import GiftCards from "./giftcards";
import HowItWorks from "./howitworks";

//  Live API from AWS S3 Bucket
//const DEV_URL = 'https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v1/';

//  Localhost API that can be run from /backend/api directory
const DEV_URL = 'http://localhost:2000/api/v1/';

const Main = () => (
  <Switch>
    <Route exact path="/" component={LandingPage} />
    <Route exact path="/selectmealplan" render={(props) => <SelectMealPlan {...props} API_URL={`${DEV_URL}plans`} />} />
    <Route exact path="/menuthisweek" render={(props) => <MenuThisWeek {...props} API_URL={`${DEV_URL}meals`} />} />
    <Route exact path="/menunextweek" component={MenuNextWeek} />
    <Route exact path="/checkout" component={Checkout} />
    <Route
      exact
      path="/5-meals-subscription"
      render={(props) => <SelectPaymentPlan {...props} API_URL={`${DEV_URL}plans`} objectIndex={5} />}
    />
    <Route
      exact
      path="/10-meals-subscription"
      render={(props) => <SelectPaymentPlan {...props} API_URL={`${DEV_URL}plans`} objectIndex={10} />}
    />
    <Route
      exact
      path="/15-meals-subscription"
      render={(props) => <SelectPaymentPlan {...props} API_URL={`${DEV_URL}plans`} objectIndex={15} />}
    />
    <Route
      exact
      path="/20-meals-subscription"
      render={(props) => <SelectPaymentPlan {...props} API_URL={`${DEV_URL}plans`} objectIndex={20} />}
    />
    <Route exact path="/findus" component={FindUs} />
    <Route exact path="/giftcards" component={GiftCards} />
    <Route exact path="/howitworks" component={HowItWorks} />
  </Switch>
);

export default Main;
