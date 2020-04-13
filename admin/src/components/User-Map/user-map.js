import React, { Component } from "react";

import Typography from "@material-ui/core/Typography";
import Breadcrumbs from "@material-ui/core/Breadcrumbs";
import Link from "@material-ui/core/Link";

import ReactDOM from "react-dom";
import tableau from "tableau-api";

class UserMap extends Component {
  componentDidMount() {
    this.initViz();
  }
  initViz() {
    const vizUrl =
      "https://us-west-2b.online.tableau.com/t/swati2805/authoring/address_data_map/Sheet1/Dashboard%201#3";
    const vizContainer = this.vizContainer;
    let viz = new window.tableau.Viz(vizContainer, vizUrl);
  }
  render() {
    return (
      <div style={{ margin: "1%" }}>
        <Breadcrumbs aria-label="breadcrumb">
          <Link color="inherit" onClick={this.handleClick}>
            Admin Site
          </Link>
          <Typography color="textPrimary">Upcoming Meals Order</Typography>
          <Link color="inherit" onClick={this.handleClick}>
            User Map
          </Link>
        </Breadcrumbs>
        <div
          ref={div => {
            this.vizContainer = div;
          }}
        ></div>
      </div>
    );
  }
}
const rootElement = document.getElementById("root");
ReactDOM.render(<UserMap />, rootElement);

export default UserMap;
