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
const DEV_URL = "http://localhost:2020/api/v1/";

const Main = ({ appProps }) => (
  <Switch>
    <AppliedRoute exact path="/" component={Home} />
    <AppliedRoute
      exact
      path="/UpcomingMeals"
      component={UpcomingMeals}
      appProps={{
        appProps,
        API_URL: `${DEV_URL}MealCustomerLifeReport`
      }}
    />
    <AppliedRoute exact path="/about" component={About} />
    <AppliedRoute exact path="/contact" component={Contact} />
    <AppliedRoute component={NoMatch} />
  </Switch>
);
export default Main;
