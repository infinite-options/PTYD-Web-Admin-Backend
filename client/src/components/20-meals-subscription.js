import React, { Component } from "react";
import { Card, CardDeck, Row, Col, Container } from "react-bootstrap";
import { Grid, Cell } from "react-mdl";
import IMG1 from "../img/img1.jpg";
import { Link } from "react-router-dom";

class TwentyMealSubscription extends Component {
  render() {
    return (
      <section class="content-section">
        <div class="container">
          <center>
            <h1>15 MEALS PAYMENT OPTIONS</h1>
            <hr class="two" />
            <h4>
              LOCAL. ORGANIC. RESPONSIBLE.<br></br>STRAIGHT TO YOUR DOOR
            </h4>
            <br></br>
            <hr class="three" />
            <a href="/5-meals-subscription">5 MEALS</a>
            <a href="/10-meals-subscription">10 MEALS </a>
            <a href="/15-meals-subscription">15 MEALS </a>
            <hr class="three" />
            <br></br>
            <CardDeck>
              <Card>
                <Card.Img variant="top" src={IMG1} />
                <Card.Body>
                  <Card.Title>
                    <b>WEEK-TO-WEEK</b>
                  </Card.Title>
                  <Card.Text style={{ fontSize: "15px", color: "#888785" }}>
                    $10.50 per meal
                  </Card.Text>
                  <br></br>
                  <Card.Title>$209⁹⁹ /week</Card.Title>
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
                        padding: "5px",
                        color: "white",
                        fontSize: "15px"
                      }}
                    >
                      CHECKOUT
                    </button>
                  </Link>
                </Card.Body>
              </Card>
              <Card>
                <Card.Img variant="top" src={IMG1} />
                <Card.Body>
                  <Card.Title>
                    <b>2 WEEK PRE-PAY</b>
                  </Card.Title>
                  <Card.Text style={{ fontSize: "15px", color: "#888785" }}>
                    $9.38 per meal
                  </Card.Text>
                  <br></br>
                  <Card.Title>$187⁵⁰ /week</Card.Title>
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
                        padding: "5px",
                        color: "white",
                        fontSize: "15px"
                      }}
                    >
                      CHECKOUT
                    </button>
                  </Link>
                </Card.Body>
              </Card>
              <Card>
                <Card.Img variant="top" src={IMG1} />
                <Card.Body>
                  <Card.Title>
                    <b>4 WEEK PRE-PAY</b>
                  </Card.Title>
                  <Card.Text style={{ fontSize: "15px", color: "#888785" }}>
                    $8.95 per meal
                  </Card.Text>
                  <br></br>
                  <Card.Title>$178⁹⁹ /week</Card.Title>
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
                        padding: "5px",
                        color: "white",
                        fontSize: "15px"
                      }}
                    >
                      CHECKOUT
                    </button>
                  </Link>
                </Card.Body>
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

export default TwentyMealSubscription;
