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
      "https://public.tableau.com/shared/J59P4NNHF?:display_count=y&:origin=viz_share_link";
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
