import React from "react";
import { Switch, Route } from "react-router-dom";
import Home from "./Home";
import About from "./About";
import Contact from "./Contact";
import NoMatch from "./NoMatch";
import Jumbotron from "./Jumbotron";
import UpcomingMeals from "./UpcomingMeals";

const Main = () => (
  <Switch>
    <Route exact path="/" component={Home} />
    <Route exact path="/UpcomingMeals" component={UpcomingMeals} />
    <Route exact path="/about" component={About} />
    <Route exact path="/contact" component={Contact} />
    <Route component={NoMatch} />
  </Switch>
);
export default Main;
