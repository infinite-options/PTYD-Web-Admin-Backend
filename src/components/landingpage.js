import React, { Component } from "react";
import IMG1 from "../img/img1.jpg";
import IMG2 from "../img/img2.jpeg";
import { Row, Col, Container, Image } from "react-bootstrap";
import { Grid, Cell } from "react-mdl";

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
                src={IMG1}
                alt=""
              />
              <div
                class="top-left"
                style={{ size: "300px", lineHeight: "55px" }}
              >
                LOCAL<br></br>ORGANIC<br></br>RESPONSIBLE
              </div>

              <div
                class="bottom-left"
                style={{
                  marginBottom: "200px",
                  fontSize: "21px",
                  textShadow: "2px 2px 4px #FFEFB0",
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

              <div class="bottom-left">Already a Member? Sign in</div>
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
                <center>
                  <button
                    type="button"
                    class="btn1 btn1-primary"
                    style={{
                      marginTop: "10px",
                      color: "white",
                      size: "10px",
                      fontSize: "20px"
                    }}
                  >
                    Get Started
                  </button>
                </center>
              </div>
            </div>

            <div class="container">
              <div class="langding-part2">
                <br></br>
                <br></br>
                <Grid>
                  <Cell col={8}>
                    <Container>
                      <Row style={{ fontSize: "25px" }}>
                        <Col>LOCAL FARMS</Col>
                        <Col>REUSABLE PACKAGING</Col>
                      </Row>
                      <Row
                        style={{
                          fontSize: "15px",
                          color: "black",
                          lineHeight: "25px"
                        }}
                      >
                        <Col>
                          Eat seasonally and locally every week. Our chefs
                          create each menu based on what is growing in Texas.
                        </Col>
                        <Col>
                          Did you know that every piece of plastic ever
                          produced, still exists today? Enjoy a plastic-free
                          experience with your PTYD deliveries.
                        </Col>
                      </Row>
                      <br></br>
                      <br></br>
                      <Row style={{ fontSize: "25px" }}>
                        <Col>LOCAL FARMS</Col>
                        <Col>REUSABLE PACKAGING</Col>
                      </Row>

                      <Row
                        style={{
                          fontSize: "15px",
                          color: "black",
                          lineHeight: "25px"
                        }}
                      >
                        <Col>
                          Eat seasonally and locally every week. Our chefs
                          create each menu based on what is growing in Texas.
                        </Col>
                        <Col>
                          Did you know that every piece of plastic ever
                          produced, still exists today? Enjoy a plastic-free
                          experience with your PTYD deliveries.
                        </Col>
                      </Row>
                    </Container>
                  </Cell>
                  <Cell col={4}>
                    <img
                      class="img-fluid"
                      style={{ width: "80%", height: "80%" }}
                      src={IMG2}
                      alt=""
                    />
                  </Cell>
                  <button
                    type="button"
                    class="btn1 btn1-primary"
                    style={{
                      marginTop: "10px",
                      color: "white",
                      size: "10px",
                      fontSize: "20px"
                    }}
                  >
                    Get Started
                  </button>
                </Grid>
                <Row>
                  <Col xs={6} md={4}>
                    <Image src="holder.js/171x180" rounded />
                  </Col>
                  <Col xs={6} md={4}>
                    <Image src="holder.js/171x180" roundedCircle />
                  </Col>
                  <Col xs={6} md={4}>
                    <Image src="holder.js/171x180" thumbnail />
                  </Col>
                </Row>
              </div>
            </div>
          </h3>
        </section>
      </div>
    );
  }
}

export default Landing;
