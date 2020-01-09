import React, { Component } from "react";
import { Card, CardDeck, Row, Col, Container } from "react-bootstrap";
import { Grid, Cell } from "react-mdl";
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
            <a href="/10-meals-subscription" style={{ color: "black" }}>
              10 MEALS
            </a>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <a href="/15-meals-subscription" style={{ color: "black" }}>
              15 MEALS{" "}
            </a>{" "}
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <a href="/20-meals-subscription" style={{ color: "black" }}>
              20 MEALS{" "}
            </a>
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
                        class="btn2 btn2-primary"
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
                        class="btn2 btn2-primary"
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
            <Container>
              <Row style={{ fontSize: "20px" }}>
                <Col>
                  <span class="fa fa-star checked" />
                  <span class="fa fa-star checked" />
                  <span class="fa fa-star checked" />
                  <span class="fa fa-star checked" />
                  <span class="fa fa-star checked" />
                </Col>
                <Col>
                  <span class="fa fa-star checked" />
                  <span class="fa fa-star checked" />
                  <span class="fa fa-star checked" />
                  <span class="fa fa-star checked" />
                  <span class="fa fa-star checked" />
                </Col>
                <Col>
                  <span class="fa fa-star checked" />
                  <span class="fa fa-star checked" />
                  <span class="fa fa-star checked" />
                  <span class="fa fa-star checked" />
                  <span class="fa fa-star checked" />
                </Col>
              </Row>
              <Row style={{ fontSize: "15px" }}>
                <Col>Convenience and goodness</Col>
                <Col>PTYD feels like family!</Col>
                <Col>They make life SO easy!</Col>
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
                <Grid>
                  <Col>
                    <Cell col={10}>
                      Besides the convenience and goodness going inside our
                      bods, PTYD is also the friendliest most generous team that
                      is always quick to respond.
                      <br />- Austin
                    </Cell>
                  </Col>
                  <Col>
                    <Cell col={10}>
                      Whether I split a soup between our two kids, feed my
                      husband after his workout, or snack on a salad while the
                      kids nap, it's an outstanding addition to our fridge!
                      <br />- Christy
                    </Cell>
                  </Col>
                  <Col>
                    <Cell col={10}>
                      I love how the food is as locally sourced as possible and
                      containers are not going to waste. I don't think I've ever
                      had a meal I didn't like!
                      <br />- Courtney
                    </Cell>
                  </Col>
                </Grid>
              </Row>
              <br></br>
            </Container>
            <br />
            <br />
            <div style={{ backgroundColor: "black" }}>
              <br />
              <br />
              <br />
              <br />
              <br />
            </div>
            <br />
          </center>
        </div>
      </section>
    );
  }
}

export default FiveMealSubscription;
