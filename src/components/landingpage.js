import React, { Component } from "react";
import Profile from "../img/img1.jpg";
import { Row, Col, Container } from "react-bootstrap";

class Landing extends Component {
  render() {
    return (
      <div>
        <section class="content-section">
          <h3>
            <div class="container" style={{ color: "white" }}>
              <img
                class="img-fluid"
                style={{ width: "100%", height: "700px" }}
                src={Profile}
                alt=""
              />
              <div
                class="top-left"
                style={{ size: "300px", lineHeight: "50px" }}
              >
                LOCAL<br></br>ORGANIC<br></br>RESPONSIBLE
              </div>

              <div
                class="bottom-left"
                style={{
                  marginBottom: "200px",
                  fontSize: "20px",
                  textShadow: "2px 2px 4px #000000",
                  lineHeight: "35px"
                }}
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
                <br></br>
                <center>
                  <h2>SAVE TIME, EAT BETTER.</h2>
                </center>
                <hr></hr>
                <Container>
                  <Row style={{ fontSize: "25px", color: "#196F3D" }}>
                    <Col>CHOOSE YOUR PLAN</Col>
                    <Col>WEEKLY DELIVERY</Col>
                    <Col>NO COMMITMENT</Col>
                  </Row>
                  <Row
                    style={{
                      fontSize: "15px",
                      color: "black",
                      lineHeight: "25px"
                    }}
                  >
                    <Col>
                      Order 5, 10, or 20 meals each week. Customize your order
                      from 6 new recipes every week.
                    </Col>
                    <Col>
                      We deliver in Austin, Texas to your home or office.
                      Delivery times are Sunday 6pm to 9pm and Monday 9am to
                      1pm.{" "}
                    </Col>
                    <Col>
                      Prep to Your Door is flexible. You can modify, skip, or
                      cancel your plan at any time with no commitment.
                    </Col>
                  </Row>
                </Container>
                <hr></hr>
              </div>
            </div>
          </h3>
        </section>
      </div>
    );
  }
}

export default Landing;
