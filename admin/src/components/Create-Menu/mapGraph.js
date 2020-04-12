import React from "react";
import ReactDOM from "react-dom";
import { Component } from "react";
import tableau from "tableau-api";

class MapGraph extends Component {
  d;
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
      <div
        ref={div => {
          this.vizContainer = div;
        }}
      ></div>
    );
  }
}
const rootElement = document.getElementById("root");
ReactDOM.render(<MapGraph />, rootElement);
export default MapGraph;
