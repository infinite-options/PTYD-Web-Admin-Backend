import React from "react";
import { Switch, Route } from "react-router-dom";

import LandingPage from "./landingpage";
import SelectMealPlan from "./selectmealplan";
import FiveMealSubscription from "./5-meals-subscription";
import TenMealSubscription from "./10-meals-subscription";
import FifteenMealSubscription from "./15-meals-subscription";
import TwentyMealSubscription from "./20-meals-subscription";

const Main = () => (
  <Switch>
    <Route exact path="/" component={LandingPage} />
    <Route exact path="/selectmealplan" component={SelectMealPlan} />
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
  </Switch>
);

export default Main;
