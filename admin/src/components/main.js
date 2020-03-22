import React from "react";
import { Switch } from "react-router-dom";
import Home from "./Homepage/Home";
import CustomerProfile from "./Customer-Profile/customer-profile";
import UserMap from "./User-Map/user-map";
import AppliedRoute from "./AppliedRoute";

// const DEV_URL =
//   "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v1/";
const APIV2_URL = "http://localhost:2001/api/v2/";

const Main = ({ appProps }) => (
  <Switch>
    <AppliedRoute
      exact
      path="/"
      component={Home}
      appProps={{
        appProps,
        API_URL_MEALSELECT: `${APIV2_URL}admindb`,
        API_URL_CUSTINFO: `${APIV2_URL}customerinfo`,
        API_URL_MEALINFO: `${APIV2_URL}meal_info`
      }}
    />
    <AppliedRoute
      exact
      path="/customerProfile"
      component={CustomerProfile}
      appProps={{
        appProps,
        API_URL_CUSTPROF: `${APIV2_URL}customerprofile`
      }}
    />
    <AppliedRoute exact path="/userMap" component={UserMap} />
  </Switch>
);
export default Main;
