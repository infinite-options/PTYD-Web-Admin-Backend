import React, { Component } from "react";
import Profile from "../img/img1.jpg";

class Landing extends Component {
  render() {
    return (
      <div>
        <section class="content-section">
          <h3>
            <div class="container" style={{ color: "white" }}>
              <img
                class="img-fluid"
                style={{ width: "100%", height: "100%" }}
                src={Profile}
                alt=""
              />
              <div class="top-left" style={{ size: "300px" }}>
                LOCAL<br></br>ORGANIC<br></br>RESPONSIBLE
              </div>

              <div
                class="bottom-left"
                style={{ marginBottom: "200px", fontSize: "20px" }}
              >
                Farm-to-table, prepared meals <br></br>delivered to your
                doorstep.<br></br>
                <button
                  type="button"
                  class="btn1 btn1-primary"
                  style={{ marginTop: "10px", color: "white" }}
                >
                  Get Started
                </button>
              </div>

              <div class="bottom-left">Already a Mmeber? Sign in</div>
            </div>
            <div class="container">
              <div class="langding-part2">
                <center>
                  <h2>SAVE TIME, EAT BETTER.</h2>
                </center>
              </div>
            </div>
          </h3>
        </section>
      </div>
    );
  }
}

export default Landing;
