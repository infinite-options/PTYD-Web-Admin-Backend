import React, { Component } from "react";
import { Card, CardDeck, Carousel } from "react-bootstrap";
import { Grid, Cell } from "react-mdl";
import IMG1 from "../img/img1.jpg";
import IMG3 from "../img/img3.jpg";
import { Link } from "react-router-dom";
class Giftcards extends Component {
  render() {
    return (
      <center>
        <h2 style={{ lineHeight: "10px" }}>GIFT CARDS</h2>
        <h4>ONE WEEK of 5 MEALS</h4>
        <hr class="two" />
        <h5>
          LOCAL. ORGANIC. RESPONSIBLE.<br></br>STRAIGHT TO YOUR DOOR
        </h5>
        <div class="container" style={{ color: "white" }}>
          <img
            class="img-fluid"
            style={{ width: "70%", height: "70%" }}
            src={IMG1}
            alt=""
          />

          <div
            class="top-left"
            style={{
              fontSize: "21px",
              textShadow: "2px 2px 4px #FFEFB0",
              lineHeight: "35px",
              paddingLeft: "200px"
            }}
          >
            <button
              type="button"
              class="btn1 btn1-primary"
              style={{ marginTop: "10px", color: "white" }}
            >
              Get Started
            </button>
          </div>
        </div>
      </center>
    );
  }
}

export default Giftcards;
