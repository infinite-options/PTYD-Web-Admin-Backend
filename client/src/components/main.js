import React, {useState} from "react";
import {Switch} from "react-router-dom";
import {CookiesProvider} from "react-cookie";
import AppliedRoute from "./AppliedRoute";

import LandingPage from "./landingpage";
import SelectMealPlan from "./subscribe/selectmealplan";
import SelectPaymentPlan from "./subscribe/selectpaymentplan";
import WeeklyMenu from "./menu/weeklymenu";
import Checkout from "./subscribe/checkout";
import CheckoutSuccess from "./subscribe/checkout-success";
import UnknownSession from "./subscribe/unknown-session";
import FindUs from "./findus";
import GiftCards from "./giftcards";
import HowItWorks from "./about/howitworks";
import OurStory from "./about/ourstory";
import FaQ from "./about/faq";
import JobS from "./about/jobs";
import Get100 from "./get100";
import MealSchedule from "./menu/mealschedule";
import Cookies from "js-cookie";

import NotFound from "./NotFound";
import SignUp from "./signup";
import SocialSignUp from "./socialsignup";
import SignupWaiting from "./SignupWaiting";
import Login from "./login";
import Logout from "./logout";
// import {SIGUNUSED} from "constants";

//  Live API from AWS S3 Bucket
// const DEV_URL =
//   "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/";

//  Localhost API that can be run from /backend/api directory
const DEV_URL = "http://localhost:2000/api/";

export default function Main({appProps}) {
  const [objectIndex, setObjectIndex] = useState(0);
  return (
    <Switch>
      <AppliedRoute
        exact
        path='/'
        component={LandingPage}
        appProps={{appProps, cookie: document.cookie}}
      />
      <AppliedRoute
        exact
        path='/selectmealplan'
        component={SelectMealPlan}
        appProps={{
          appProps,
          API_URL: `${DEV_URL}v2/plans`
        }}
      />
      <AppliedRoute
        exact
        path='/menuthisweek'
        component={WeeklyMenu}
        appProps={{
          appProps,
          API_URL: `${DEV_URL}v2/meals`,
          header_label: "MENU THIS WEEK",
          header_link_label: "NEXT WEEK",
          header_link_url: "/menunextweek",
          objectIndex: "MenuForWeek1"
        }}
      />
      <AppliedRoute
        exact
        path='/menunextweek'
        component={WeeklyMenu}
        appProps={{
          appProps,
          API_URL: `${DEV_URL}v2/meals`,
          header_label: "COMING NEXT WEEK",
          header_link_label: "THIS WEEK",
          header_link_url: "/menuthisweek",
          objectIndex: "MenuForWeek2"
        }}
      />
      <AppliedRoute
        exact
        path='/checkout'
        component={appProps.isAuthenticated ? Checkout : Login}
        appProps={{
          appProps,
          SESSION_URL: `${DEV_URL}v2/sessionverification`,
          PURCHASE_API_URL: `${DEV_URL}v2/accountpurchases`,
          CHECKOUT_URL: `${DEV_URL}v2/checkout`,
          SINGLE_ACC_API_URL: `${DEV_URL}v2/account`,
          redirect_after_login: "/checkout",
          user_uid: appProps.user_uid
        }}
      />

      <AppliedRoute exact path='/ourstory' component={OurStory} />
      <AppliedRoute exact path='/faq' component={FaQ} />
      <AppliedRoute exact path='/jobs' component={JobS} />
      <AppliedRoute exact path='/get100' component={Get100} />
      <AppliedRoute
        exact
        path='/mealschedule'
        component={appProps.isAuthenticated ? MealSchedule : Login}
        appProps={{
          appProps,
          ACC_URL: `${DEV_URL}v2/account`,
          API_URL: `${DEV_URL}v2/meals`,
          PURCHASE_API_URL: `${DEV_URL}v2/accountpurchases`,
          MEAL_SELECT_API_URL: `${DEV_URL}v2/mealselection`,
          PLANS_URL: `${DEV_URL}v2/plans`,
          DELETE_URL: `${DEV_URL}v2/cancel-subscription-now`,
          UPDATE_URL: `${DEV_URL}v2/update-subscription`
        }}
      />

      {/* startdate parameter for turning back / forward time */}
      {/* remove this parameter when putting app to production */}
      <AppliedRoute
        exact
        path='/mealschedule/:startdate'
        component={appProps.isAuthenticated ? MealSchedule : Login}
        appProps={{
          appProps,
          ACC_URL: `${DEV_URL}v2/account`,
          API_URL: `${DEV_URL}v2/meals`,
          PURCHASE_API_URL: `${DEV_URL}v2/accountpurchases`,
          MEAL_SELECT_API_URL: `${DEV_URL}v2/mealselection`,
          PLANS_URL: `${DEV_URL}v2/plans`,
          DELETE_URL: `${DEV_URL}v2/cancel-subscription-now`,
          UPDATE_URL: `${DEV_URL}v2/update-subscription`
        }}
      />

      <AppliedRoute
        exact
        path='/5-meals-subscription'
        component={SelectPaymentPlan}
        appProps={{
          appProps,
          API_URL: `${DEV_URL}v2/plans`,
          objectIndex: "FiveMealPaymentPlans",
          meals: 5
        }}
      />
      <AppliedRoute
        exact
        path='/10-meals-subscription'
        component={SelectPaymentPlan}
        appProps={{
          appProps,
          API_URL: `${DEV_URL}v2/plans`,
          objectIndex: "TenMealPaymentPlans",
          meals: 10
        }}
      />
      <AppliedRoute
        exact
        path='/15-meals-subscription'
        component={SelectPaymentPlan}
        appProps={{
          appProps,
          API_URL: `${DEV_URL}v2/plans`,
          objectIndex: "FifteenMealPaymentPlans",
          meals: 15
        }}
      />
      <AppliedRoute
        exact
        path='/20-meals-subscription'
        component={SelectPaymentPlan}
        appProps={{
          appProps,
          API_URL: `${DEV_URL}v2/plans`,
          objectIndex: "TwentyMealPaymentPlans",
          meals: 20
        }}
      />
      <AppliedRoute
        exact
        path='/findus'
        component={FindUs}
        appProps={appProps}
      />
      <AppliedRoute
        exact
        path='/giftcards'
        component={GiftCards}
        appProps={appProps}
      />
      <AppliedRoute
        exact
        path='/howitworks'
        component={HowItWorks}
        appProps={appProps}
      />
      <AppliedRoute
        exact
        path='/signup'
        component={SignUp}
        appProps={{
          appProps,
          API_URL: `${DEV_URL}v2/signup`
        }}
      />
      <AppliedRoute
        exact
        path='/socialsignup'
        component={SocialSignUp}
        appProps={{
          appProps,
          API_URL: `${DEV_URL}v2/socialSignup`
        }}
      />
      <AppliedRoute
        exact
        path='/signupwaiting'
        component={SignupWaiting}
        appProps={appProps}
      />
      <AppliedRoute
        exact
        path='/login/:email?/:password?'
        component={appProps.isAuthenticated ? LandingPage : Login}
        appProps={{
          appProps,
          API_URL: `${DEV_URL}v2/accountsalt`,
          SINGLE_ACC_API_URL: `${DEV_URL}v2/account`,
          SOCIAL_API_URL: `${DEV_URL}v2/social`
        }}
      />

      <AppliedRoute
        exact
        path='/invalidsession'
        component={UnknownSession}
        appProps={appProps}
      />
      <AppliedRoute
        exact
        path='/checkoutsuccess'
        component={CheckoutSuccess}
        appProps={appProps}
      />
      <AppliedRoute
        exact
        path='/logout'
        component={Logout}
        appProps={appProps}
      />
      <AppliedRoute component={NotFound} />
    </Switch>
  );
}
