import React from "react";
import { Switch } from "react-router-dom";

import AppliedRoute from "./AppliedRoute";

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
import MealSchedule from "./mealschedule";

import NotFound from "./NotFound";
import SignUp from "./signup";
import Login from "./login";
import Logout from "./logout";

export default function Main({ appProps }) {
  return (
    <Switch>
      <AppliedRoute
        exact
        path="/"
        component={LandingPage}
        appProps={appProps}
      />
      <AppliedRoute
        exact
        path="/selectmealplan"
        component={SelectMealPlan}
        appProps={appProps}
      />
      <AppliedRoute
        exact
        path="/menuthisweek"
        component={MenuThisWeek}
        appProps={appProps}
      />
      <AppliedRoute
        exact
        path="/menunextweek"
        component={MenuNextWeek}
        appProps={appProps}
      />
      <AppliedRoute
        exact
        path="/checkout"
        component={Checkout}
        appProps={appProps}
      />

      <AppliedRoute exact path="/ourstory" component={OurStory} />
      <AppliedRoute exact path="/faq" component={FaQ} />
      <AppliedRoute exact path="/jobs" component={JobS} />
      <AppliedRoute exact path="/get100" component={Get100} />
      <AppliedRoute exact path="/mealschedule" component={MealSchedule} />

      <AppliedRoute
        exact
        path="/5-meals-subscription"
        component={FiveMealSubscription}
        appProps={appProps}
      />
      <AppliedRoute
        exact
        path="/10-meals-subscription"
        component={TenMealSubscription}
        appProps={appProps}
      />
      <AppliedRoute
        exact
        path="/15-meals-subscription"
        component={FifteenMealSubscription}
        appProps={appProps}
      />
      <AppliedRoute
        exact
        path="/20-meals-subscription"
        component={TwentyMealSubscription}
        appProps={appProps}
      />
      <AppliedRoute
        exact
        path="/findus"
        component={FindUs}
        appProps={appProps}
      />
      <AppliedRoute
        exact
        path="/giftcards"
        component={GiftCards}
        appProps={appProps}
      />
      <AppliedRoute
        exact
        path="/howitworks"
        component={HowItWorks}
        appProps={appProps}
      />
      <AppliedRoute
        exact
        path="/signup"
        component={SignUp}
        appProps={appProps}
      />
      <AppliedRoute exact path="/login" component={Login} appProps={appProps} />
      <AppliedRoute
        exact
        path="/logout"
        component={Logout}
        appProps={appProps}
      />
      <AppliedRoute component={NotFound} />
    </Switch>
  );
}
