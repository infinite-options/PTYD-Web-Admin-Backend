import React from "react";
import { Switch, Route } from "react-router-dom";

import LandingPage from "./landingpage";
import SelectMealPlan from "./selectmealplan";
import MenuThisWeek from "./menuthisweek";
import MenuNextWeek from "./menunextweek";
import Checkout from "./checkout";
import FiveMealSubscription from "./5-meals-subscription";
import TenMealSubscription from "./10-meals-subscription";
import FifteenMealSubscription from "./15-meals-subscription";
import TwentyMealSubscription from "./20-meals-subscription";
import FindUs from "./findus";
import GiftCards from "./giftcards";
import HowItWorks from "./howitworks";

//  Live API from AWS S3 Bucket
const DEV_URL = 'https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v1/';

//  Localhost API that can be run from /backend/api directory
//const DEV_URL = 'http://localhost:2000/api/v1/';

const Main = () => (
  <Switch>
    <Route exact path="/" component={LandingPage} />
    <Route exact path="/selectmealplan" render={(props) => <SelectMealPlan {...props} API_URL={`${DEV_URL}plans`} />} />
    <Route exact path="/menuthisweek" component={MenuThisWeek} />
    <Route exact path="/menunextweek" component={MenuNextWeek} />
    <Route exact path="/checkout" component={Checkout} />

    <Route
      exact
      path="/5-meals-subscription"
      component={FiveMealSubscription}
    />
    <Route
      exact
      path="/10-meals-subscription"
      component={TenMealSubscription}
    />
    <Route
      exact
      path="/15-meals-subscription"
      component={FifteenMealSubscription}
    />
    <Route
      exact
      path="/20-meals-subscription"
      component={TwentyMealSubscription}
    />
    <Route exact path="/findus" component={FindUs} />
    <Route exact path="/giftcards" component={GiftCards} />
    <Route exact path="/howitworks" component={HowItWorks} />
  </Switch>
);

export default Main;
