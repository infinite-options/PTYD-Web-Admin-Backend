import React, { Component } from "react";
import GIFTCARD from "../img/giftcard.png";

class Giftcards extends Component {
  render() {
    return (
      <center>
        <h2 class="font1" style={{ lineHeight: "10px" }}>
          GIFT CARDS
        </h2>
        <h4 class="font1">ONE WEEK of 5 MEALS</h4>
        <hr class="two" />
        <h5 class="font1">
          LOCAL. ORGANIC. RESPONSIBLE.<br></br>STRAIGHT TO YOUR DOOR
        </h5>
        <div class="container" style={{ color: "white" }}>
          <img
            class="img-fluid"
            style={{ width: "70%", height: "70%" }}
            src={GIFTCARD}
            alt=""
          />

          <div
            class="top-left"
            style={{
              fontSize: "21px",
              textShadow: "2px 2px 4px #FFEFB0",
              // lineHeight: "30px",
              paddingLeft: "160px"
            }}
          >
            <button
              type="button"
              class="btn1 btn1-primary font2"
              style={{ marginTop: "-40px", color: "white" }}
            >
              Shop Now
            </button>
          </div>
          <br/><br/>
        </div>
      </center>
    );
  }
}

export default Giftcards;
