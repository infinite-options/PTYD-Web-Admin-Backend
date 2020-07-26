import React from "react";
import ReactDOM from "react-dom";
import { Component } from "react";
import tableau from "tableau-api";
import ReactGA from "react-ga";
//import auth from "./auth.ts"; // Sample authentication provider

const trackingId = "UA-173345310-1"; // Replace with your Google Analytics tracking ID
ReactGA.initialize(trackingId);
ReactGA.event({
  category: "Sign Up",
  action: "User pressed the big blue sign up button",
});

ReactGA.pageview(window.location.pathname + window.location.search);

class googleAnalytics extends Component {
  //const gaUrl ="https://analytics.google.com/analytics/web/provision/?authuser=0&utm_source&utm_medium&utm_term&utm_content&utm_campaign#/provision";

  render() {
    return (
      <div
        style={{ height: "80%", width: "100%" }}
        ref={(div) => {
          this.vizContainer = div;
        }}
      ></div>
    );
  }
}
//const rootElement = document.getElementById("root");
//ReactDOM.render(<MapGraph />, rootElement);
export default googleAnalytics;
