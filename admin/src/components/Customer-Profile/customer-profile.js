import React, { Component } from "react";

import Jumbotron from "../Jumbotron/Jumbotron-customer";
import Typography from "@material-ui/core/Typography";
import Breadcrumbs from "@material-ui/core/Breadcrumbs";
import Link from "@material-ui/core/Link";

class CustomerProfile extends Component {
  render() {
    return (
      <div className="container" style={{ marginTop: "10%" }}>
        {/* <div className="scrollItem">Card</div> */}

        {/* title for the site ----------------------------------------- */}
        <Jumbotron />

        <Breadcrumbs aria-label="breadcrumb">
          <Link color="inherit" onClick={this.handleClick}>
            Admin Site
          </Link>
          <Typography color="textPrimary">Upcoming Meals Order</Typography>
          <Link color="inherit" onClick={this.handleClick}>
            Weekly Purchases
          </Link>
        </Breadcrumbs>
      </div>
    );
  }
}
export default CustomerProfile;
