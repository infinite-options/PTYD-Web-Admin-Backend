import React from "react";
import { Switch, Route } from "react-router-dom";

import LandingPage from "./landingpage";
import SelectMealPlan from "./selectmealplan";
import PaymentOptions from "./paymentoptions";

const Main = () => (
  <Switch>
    <Route exact path="/" component={LandingPage} />
    <Route exact path="/selectmealplan" component={SelectMealPlan} />
    <Route exact path="/paymentoptions" component={PaymentOptions} />
  </Switch>
);

export default Main;
