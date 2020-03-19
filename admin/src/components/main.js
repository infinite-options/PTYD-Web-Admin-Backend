import React from "react";
import { Switch, Route } from "react-router-dom";
import Home from "./Home";
import About from "./About";
import Contact from "./Contact";
import NoMatch from "./NoMatch";
import Jumbotron from "./Jumbotron";
import UpcomingMeals from "./UpcomingMeals";
import AppliedRoute from "./AppliedRoute";
// const DEV_URL =
//   "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v1/";
const API_URL = "http://localhost:2000/api/v1/";
const APIADMIN_URL = "http://localhost:2001/api/v1/";
const APIV2_URL = "http://localhost:2002/api/v2/";

const Main = ({ appProps }) => (
  <Switch>
    <AppliedRoute
      exact
      path="/"
      component={Home}
      appProps={{
        appProps,
        API_URL: `${APIADMIN_URL}admindb`,
        API_URL_MEALINFO: `${APIV2_URL}customerinfo`
      }}
    />
    <AppliedRoute
      exact
      path="/UpcomingMeals"
      component={UpcomingMeals}
      appProps={{
        appProps,
        API_URL: `${APIADMIN_URL}admindb`
      }}
    />
    <AppliedRoute exact path="/about" component={About} />
    <AppliedRoute exact path="/contact" component={Contact} />
    <AppliedRoute component={NoMatch} />
  </Switch>
);
export default Main;
