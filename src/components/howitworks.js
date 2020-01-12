import React, { Component } from "react";
import IMG3 from "../img/img3.jpg";
import { Link } from "react-router-dom";
class Howitworks extends Component {
  render() {
    return (
      <div>
        <img
          class="img-fluid"
          style={{ width: "100%", height: "50%" }}
          src={IMG3}
          alt=""
        />
        <div
          class="container top-center"
          style={{
            fontSize: "35px",
            textShadow: "2px 2px 4px #FFEFB0",
            lineHeight: "50px",
            color: "white",
            marginTop: "30px"
          }}
        >
          Farm-to-table, prepared meals <br></br>delivered to your doorstep.
        </div>
      </div>
    );
  }
}

export default Howitworks;
