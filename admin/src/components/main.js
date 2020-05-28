import React from "react";
import { Switch } from "react-router-dom";
import Home from "./Homepage/Home";
import UpcomingMeal from "./Homepage/upcomingMeal";
import CustomerProfile from "./Customer-Profile/customer-profile";
import UserMap from "./User-Map/user-map";
import AppliedRoute from "./AppliedRoute";
import EditCreateMeal from "./Edit-Meal/edit-create-meals";
import CreateMenu from "./Create-Menu/create-menu";
import Orders from "./Orders/Orders";

// const DEV_URL =
//   "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/";
const DEV_URL = "http://localhost:2000/api/v2/";

const Main = ({ appProps }) => (
  <Switch>
    <AppliedRoute
      exact
      path="/"
      component={Home}
      appProps={{
        appProps,
        API_URL_MEALSELECT: `${DEV_URL}menu_display`,
        API_URL_INGREDIENTS: `${DEV_URL}displayIngredients`,
        API_URL_CUSTINFO: `${DEV_URL}customerinfo`,
        API_URL_MEALINFO: `${DEV_URL}meal_info`,
      }}
    />
    <AppliedRoute
      exact
      path="/customerProfile"
      component={CustomerProfile}
      appProps={{
        appProps,
        API_URL_CUSTPROF: `${DEV_URL}customerprofile`,
      }}
    />
    <AppliedRoute exact path="/userMap" component={UserMap} />
    <AppliedRoute
      exact
      path="/editCreateMeal"
      component={EditCreateMeal}
      appProps={{
        appProps,
        API_URL_CREATEMEAL: `${DEV_URL}mealcreation`,
        API_URL_TEMP: `${DEV_URL}templateapi`,
      }}
    />
    <AppliedRoute
      exact
      path="/createMenu"
      component={CreateMenu}
      appProps={{
        appProps,
        API_URL_CREATEMENU: `${DEV_URL}create-menu`,
      }}
    />
    <AppliedRoute
      exact
      path="/orders"
      component={Orders}
      appProps={{
        appProps,
        API_URL_Meal_Info1: `${DEV_URL}mealInfo1`,
      }}
    />
  </Switch>
);
export default Main;
