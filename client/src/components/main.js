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
import OurStory from "./ourstory";
import FaQ from "./faq";
import JobS from "./jobs";
import Get100 from "./get100";

const Main = () => (
  <Switch>
    <Route exact path="/" component={LandingPage} />
    <Route exact path="/selectmealplan" component={SelectMealPlan} />
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
    <Route exact path="/ourstory" component={OurStory} />
    <Route exact path="/faq" component={FaQ} />
    <Route exact path="/jobs" component={JobS} />
    <Route exact path="/get100" component={Get100} />
  </Switch>
);

export default Main;
