import React from "react";
import ReactDOM from "react-dom";
import { Component } from "react";
import tableau from "tableau-api";

class MapGraph extends Component {
  componentDidMount() {
    this.initViz();
  }

  initViz() {
    const vizUrl =
      "https://public.tableau.com/views/PTYD_meals_15873204059420/Final?:retry=yes&:display_count=y&:origin=viz_share_link";
    const vizContainer = this.vizContainer;
    let viz = new window.tableau.Viz(vizContainer, vizUrl);
  }

  render() {
    return (
      <div
        style={{ height: "80%", width: "100%" }}
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
