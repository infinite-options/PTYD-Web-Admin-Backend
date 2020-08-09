import React from "react";
import { Switch } from "react-router-dom";
import Home from "./Homepage/Home";
import UpcomingMeal from "./Homepage/upcomingMeal";
import CustomerProfile from "./Customer-Profile/customer-profile";
import UserMap from "./User-Map/user-map";
import AppliedRoute from "./AppliedRoute";
import EditCreateMeal from "./Edit-Meal/edit-create-meals";
import CreateNewMeal from "./Edit-Meal/create-new-meals";
import CreateMenu from "./Create-Menu/create-menu";
import Orders from "./Orders/Orders";
import Ingredients from "./Orders/Ingredients";
import CustomersOld from "./CustomersOld/Customers";
import Customers from "./Customers/Customers";
import EditMeals from "./Edit-Meal/edit-meals";
import Settings from "./Settings/Settings";
import googleAnalytics from "./Homepage/googleAnalytics";
import OIDisplay from "./Orders/Orders_I_No_Date";
// const DEV_URL = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/";
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
      path="/settings"
      component={Settings}
      appProps={{
        appProps,
        API_URL_MEALPLANS: `${DEV_URL}MealPlansAPI`,
        API_URL_COUPONS: `${DEV_URL}CouponsAPI`,
        API_URL_TAXRATE: `${DEV_URL}saturdays`,
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
      path="/editMeal"
      component={EditCreateMeal}
      appProps={{
        appProps,
        API_URL_CREATEMEAL: `${DEV_URL}mealcreation`,
        API_URL_TEMP: `${DEV_URL}templateapi`,
        API_URL_SAVERECIPE: `${DEV_URL}Edit_Recipe`,
        API_URL_ADDINGREDIENT: `${DEV_URL}Add_New_Ingredient`,
        API_URL_GETUNITS: `${DEV_URL}GetUnits`,
        API_URL_ADDUNIT: `${DEV_URL}Add_New_Measure_Unit`,
        API_URL_SAVEUNITCONVERSION: `${DEV_URL}Add_Unit_Conversion`,
      }}
    />
    <AppliedRoute
      exact
      path="/createMeal"
      component={CreateNewMeal}
      appProps={{
        appProps,
        API_URL_CREATEMEAL: `${DEV_URL}mealcreation`,
        API_URL_TEMP: `${DEV_URL}templateapi`,
        API_URL_SAVERECIPE: `${DEV_URL}Edit_Recipe`,
        API_URL_ADDINGREDIENT: `${DEV_URL}Add_New_Ingredient`,
        API_URL_GETUNITS: `${DEV_URL}GetUnits`,
        API_URL_ADDMEAL: `${DEV_URL}Add_Meal`,
      }}
    />
    <AppliedRoute
      exact
      path="/editMealDesc"
      component={EditMeals}
      appProps={{
        appProps,
        API_URL_CREATEMEAL: `${DEV_URL}mealcreation`,
        API_URL_TEMP: `${DEV_URL}templateapi`,
        API_URL_SAVERECIPE: `${DEV_URL}Edit_Recipe`,
        API_URL_ADDINGREDIENT: `${DEV_URL}Add_New_Ingredient`,
        API_URL_GETUNITS: `${DEV_URL}GetUnits`,
        API_URL_ADDMEAL: `${DEV_URL}Add_Meal`,
        API_URL_EDITMEAL: `${DEV_URL}Edit_Meal`,
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
        API_URL: `${DEV_URL}`,
        DISPLAY_SAT_API_URL: `${DEV_URL}saturdays`,
      }}
    />
    <AppliedRoute
      exact
      path="/ingredients"
      component={Ingredients}
      appProps={{
        API_URL: `${DEV_URL}`,
        DISPLAY_SAT_API_URL: `${DEV_URL}saturdays`,
      }}
    />
    {/* <AppliedRoute
      exact
      path="/customers"
      component={CustomersOld}
      appProps={{
        API_URL: `${DEV_URL}`,
        PURCHASE_API_URL: `${DEV_URL}accountpurchases`,
        ALLPAYMENTS_API_URL: `${DEV_URL}All_Payments`,
        LATESTACTIVITY_API_URL: `${DEV_URL}Latest_activity`,
      }}
    /> */}
    <AppliedRoute
      exact
      path="/customers"
      component={Customers}
      appProps={{
        API_URL: `${DEV_URL}`,
        ACCOUNTLIST_API_URL: `${DEV_URL}AccountList`,
        LATESTACTIVITY_API_URL: `${DEV_URL}Latest_activity`,
        DELIVERY_API_URL: `${DEV_URL}DeliveryInfo`,
        PURCHASE_MEAL_API_URL: `${DEV_URL}PurchaseIdMeals`,
        ALLPAYMENTS_API_URL: `${DEV_URL}All_Payments`,
        NOTE_API_URL: `${DEV_URL}SavePurchaseNote`,
      }}
    />
    <AppliedRoute
      exact
      path="/googleAnalytics"
      component={googleAnalytics}
      appProps={{
        API_URL: `${DEV_URL}`,
        PURCHASE_API_URL: `${DEV_URL}accountpurchases`,
      }}
    />
    <AppliedRoute
      exact
      path="/oidisplay"
      component={OIDisplay}
      appProps={{
        API_URL: `${DEV_URL}`,
        INGREDIENTS_API_URL: `${DEV_URL}All_Ingredients_No_Date`,
        ORDERS_API_URL: `${DEV_URL}All_Meals_No_Date`,
      }}
    />
  </Switch>
);
export default Main;
