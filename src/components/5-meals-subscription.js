import React, { Component } from "react";
import { Card, CardDeck, Row, Col, Container } from "react-bootstrap";
import { CardTitle, CardText, CardActions, Button } from "react-mdl";
import IMG1 from "../img/img1.jpg";
import IMG9 from "../img/img9.webp";
import { Link } from "react-router-dom";

class FiveMealSubscription extends Component {
  render() {
    return (
      <section class="content-section">
        <div class="container">
          <center>
            <h1>5 MEALS PAYMENT OPTIONS</h1>
            <hr class="two" />
            <h4>
              LOCAL. ORGANIC. RESPONSIBLE.<br></br>STRAIGHT TO YOUR DOOR
            </h4>
            <br></br>
            <hr class="three" />
            <a href="/10-meals-subscription">10 MEALS</a>
            <a href="/15-meals-subscription">15 MEALS </a>
            <a href="/20-meals-subscription">20 MEALS </a>
            <hr class="three" />
            <br></br>

            <CardDeck style={{ marginLeft: "250px" }}>
              <Card
                style={{
                  maxWidth: "20rem",
                  boxShadow: "0px 5px 32px 4px rgba(0,0,0,0.3)"
                }}
              >
                {" "}
                <span class="border border-dark" style={{}}>
                  <Card.Img class="black" variant="top" src={IMG1} />
                  <div
                    class="top-center"
                    style={{
                      marginBottom: "200px",
                      fontSize: "100px",
                      textShadow: "2px 2px 4px #FFEFB0",
                      lineHeight: "35px",
                      color: "white"
                    }}
                  >
                    5
                  </div>
                  <Card.Body>
                    <Card.Title>
                      <b>WEEK-TO-WEEK</b>
                    </Card.Title>
                    <Card.Text style={{ fontSize: "15px", color: "#888785" }}>
                      $11.99 per meal
                    </Card.Text>
                    <br></br>
                    <Card.Title>$59⁹⁹ /week</Card.Title>
                    <Card.Text style={{ fontSize: "13px", color: "#888785" }}>
                      Sales tax of 8.25% will be added
                    </Card.Text>
                    <Link
                      style={{ fontFamily: "Kalam", color: "white" }}
                      to="/checkout"
                    >
                      <button
                        type="button"
                        class="btn1 btn1-primary"
                        style={{
                          marginTop: "10px",
                          paddingLeft: "30px",
                          paddingRight: "30px",
                          paddingTop: "5px",
                          paddingBottom: "5px",
                          color: "white",
                          fontSize: "15px"
                        }}
                      >
                        CHECKOUT
                      </button>
                    </Link>
                    <img
                      class="img-fluid"
                      src={IMG9}
                      alt=""
                      style={{
                        width: "90%"
                      }}
                    />
                  </Card.Body>
                </span>
              </Card>

              <Card
                height="450"
                style={{
                  stroke: "black",
                  strokeWidth: "5",
                  fillOpacity: "0.1",
                  strokeOpacity: "0.9",
                  boxShadow: "0px 5px 32px 4px rgba(0,0,0,0.3)",
                  maxWidth: "20rem"
                }}
              >
                <span class="border border-dark" style={{}}>
                  <Card.Img class="black" variant="top" src={IMG1} />
                  <div
                    class="top-center"
                    style={{
                      marginBottom: "200px",
                      fontSize: "100px",
                      textShadow: "2px 2px 4px #FFEFB0",
                      lineHeight: "35px",
                      color: "white"
                    }}
                  >
                    5
                  </div>
                  <Card.Body>
                    <Card.Title>
                      <b>4 WEEK PRE-PAY</b>
                    </Card.Title>
                    <Card.Text style={{ fontSize: "15px", color: "#888785" }}>
                      $10.75 per meal
                    </Card.Text>
                    <br></br>
                    <Card.Title>$53⁷⁵ /week</Card.Title>
                    <Card.Text style={{ fontSize: "13px", color: "#888785" }}>
                      Sales tax of 8.25% will be added
                    </Card.Text>
                    <Link
                      style={{ fontFamily: "Kalam", color: "white" }}
                      to="/checkout"
                    >
                      <button
                        type="button"
                        class="btn1 btn1-primary"
                        style={{
                          marginTop: "10px",
                          paddingLeft: "30px",
                          paddingRight: "30px",
                          paddingTop: "5px",
                          paddingBottom: "5px",
                          color: "white",
                          fontSize: "15px"
                        }}
                      >
                        CHECKOUT
                      </button>
                    </Link>
                    <img
                      src={IMG9}
                      alt=""
                      style={{
                        width: "90%"
                      }}
                    />
                  </Card.Body>
                </span>
              </Card>
            </CardDeck>
            <br></br>
            <br></br>
            <hr></hr>
            <br></br>
            <br></br>
            <h3 style={{ color: "#196F3D" }}>Our Customers Say</h3>
            <br></br>
            <Container>
              <Row style={{ fontSize: "15px", color: "#196F3D" }}>
                <Col>CHOOSE YOUR PLAN</Col>
                <Col>WEEKLY DELIVERY</Col>
                <Col>NO COMMITMENT</Col>
              </Row>
              <br></br>
              <Row style={{ fontSize: "15px", color: "#196F3D" }}>
                <Col>
                  <hr class="one" />
                </Col>
                <Col>
                  <hr class="one" />
                </Col>
                <Col>
                  <hr class="one" />
                </Col>
              </Row>
              <Row
                style={{
                  fontSize: "15px",
                  color: "black",
                  lineHeight: "25px"
                }}
              >
                <Col>
                  Order 5, 10, or 20 meals each week. Customize your order from
                  6 new recipes every week.
                </Col>
                <Col>
                  We deliver in Austin, Texas to your home or office. Delivery
                  times are Sunday 6pm to 9pm and Monday 9am to 1pm.{" "}
                </Col>
                <Col>
                  Prep to Your Door is flexible. You can modify, skip, or cancel
                  your plan at any time with no commitment.
                </Col>
              </Row>
              <br></br>
            </Container>
          </center>
        </div>
      </section>
    );
  }
}

export default FiveMealSubscription;
