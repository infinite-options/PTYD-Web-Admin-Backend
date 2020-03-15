import React from "react";
import { Switch, Route } from "react-router-dom";
import Home from "./Home";
import About from "./About";
import Contact from "./Contact";
import NoMatch from "./NoMatch";
import Jumbotron from "./Jumbotron";
import UpcomingMeals from "./UpcomingMeals";

const DEV_URL = 'https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/';

const Main = ({ appProps }) => (
  <Switch>
    <Route exact path="/" component={Home} />
    <Route exact path="/UpcomingMeals" 
      component={UpcomingMeals} appProps={{
      appProps,
      API_URL: `${DEV_URL}templateapi`
        }}/>
    <Route exact path="/about" component={About} />
    <Route exact path="/contact" component={Contact} />
    <Route component={NoMatch} />
  </Switch>
);
export default Main;
