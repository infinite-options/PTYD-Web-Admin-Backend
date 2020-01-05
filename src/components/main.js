import React from "react";
import { Switch, Route } from "react-router-dom";

import LandingPage from "./landingpage";
import SelectMealPlan from "./selectmealplan";
import PaymentOptions from "./paymentoptions";
import MenuThisWeek from "./menuthisweek";
import Checkout from "./checkout";

const Main = () => (
  <Switch>
    <Route exact path="/" component={LandingPage} />
    <Route exact path="/selectmealplan" component={SelectMealPlan} />
    <Route exact path="/paymentoptions" component={PaymentOptions} />
    <Route exact path="/menuthisweek" component={MenuThisWeek} />
    <Route exact path="/checkout" component={Checkout} />
  </Switch>
);

export default Main;
