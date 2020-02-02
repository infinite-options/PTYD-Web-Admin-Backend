import React, { Component } from "react";
import get100 from "../img/get100.png";

class Get100 extends Component {
  render() {
    return (
      <section class="content-section">
        <div class="container">
          <center>
            <img
              class="img-fluid"
              style={{ width: "100%", height: "100%" }}
              src={get100}
              alt=""
            />
          </center>
        </div>
      </section>
    );
  }
}

export default Get100;
