import React, { Component } from "react";
import IMG3 from "../img/img3.jpg";
import TEMP from "../img/temp.jpg";
import { Link } from "react-router-dom";
import { Row, Col } from "react-bootstrap";
import { Grid, Cell } from "react-mdl";

class Howitworks extends Component {
  render() {
    return (
      <div class="container" style={{ color: "white" }}>
        <img
          class="img-fluid"
          style={{ width: "100%", height: "400px" }}
          src={IMG3}
          alt=""
        />
        <div
          class="container top-center"
          style={{
            fontSize: "35px",
            textShadow: "2px 2px 4px #FFEFB0",
            lineHeight: "50px",
            color: "white"
          }}
        >
          Save time. Eat healthy.<br></br>Fresh meals to your door every week.
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <Row style={{ fontSize: "20px", color: "#888785" }}>
          <Col>
            <b>Build your subscription</b>
          </Col>
          <Col>
            <b>Delivered to your door</b>
          </Col>
          <Col>
            <b>Change Anytime</b>
          </Col>
        </Row>
        <br />
        <Row style={{ fontSize: "15px", color: "#888785" }}>
          <Col>
            Order 5, 10, or 20 meals each week. Customize your order from 6 new
            recipes every week.
          </Col>
          <Col>
            We deliver in Austin, Texas to your home or office. Delivery times
            are Sunday 6pm-9pm, and Monday 9am-1pm.
          </Col>
          <Col>
            Prep to Your Door is flexible. You can modify, skip, or cancel your
            plan at any time with no commitment.
          </Col>
        </Row>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <Grid>
          <Cell
            col={7}
            style={{ fontSize: "15px", color: "#888785", lineHeight: "55px" }}
          >
            <Cell col={7}>
              <br />

              <p>
                Prep to Your Door is here to serve you. Every week, our team
                creates a delicious new menu packed with the highest quality
                ingredients, from local Texas farms. All meals are 100% organic,
                gluten-free, and plant-based.
              </p>
            </Cell>
          </Cell>
          <Cell col={5}>
            <img
              class="img-fluid"
              style={{ width: "100%", height: "100%" }}
              src={TEMP}
              alt=""
            />
          </Cell>
        </Grid>
        <br />
        <br />
        <br />
        <br />
        <Grid>
          <Cell col={5}>
            <img
              class="img-fluid"
              style={{ width: "100%", height: "100%" }}
              src={TEMP}
              alt=""
            />
          </Cell>
          <Cell col={7} style={{ color: "#888785", lineHeight: "55px" }}>
            <h5>Customize Your Plan</h5>
            <p>
              Choose which meals you need and how often you need them. Meals
              start at just $11.99.
            </p>
          </Cell>
        </Grid>
      </div>
    );
  }
}

export default Howitworks;
