import React, { Component } from "react";
import { Card, CardDeck, Row, Col, Container } from "react-bootstrap";
import { Grid, Cell } from "react-mdl";
import IMG9 from "../../img/img9.webp";
import { Link } from "react-router-dom";

class Selectmealplan extends Component {
  constructor(props) {
    super(props);
    this.state = { mealPlans: [] };
  }

  async componentDidMount() {
    const res = await fetch(this.props.API_URL);
    const api = await res.json();
    const mealPlans = api.result.MealPlans;
    this.setState({ mealPlans });
  }

  render() {
    return (
      <section class="content-section">
        <div class="container font2" style={{ width: "80%" }}>
          <center>
            <h2 class="font1" style={{ color: "#4D4D4D" }}>
              SELECT A MEAL PLAN
            </h2>
            <hr class="two" />
            <h4 class="font1">
              <b>
                LOCAL. ORGANIC. RESPONSIBLE.<br></br>STRAIGHT TO YOUR DOOR
              </b>
            </h4>
            <br></br>
            <CardDeck>
              {this.state.mealPlans.map(mealPlan => (
                <div
                  style={{
                    width: "25%",
                    margin: "0",
                    padding: "0"
                  }}
                >
                  {mealPlan.num_meals === 10 ? (
                    <p class="rcorners font3">MOST POPULAR</p>
                  ) : (
                    <p style={{ height: "32px" }} />
                  )}
                  <Card
                    style={{
                      maxWidth: "20rem",
                      boxShadow: "0px 5px 32px 4px rgba(0,0,0,0.3)"
                    }}
                  >
                    <div
                      class="borderr"
                      style={
                        mealPlan.num_meals === 10
                          ? { height: "110%", color: "green" }
                          : { height: "110%" }
                      }
                    >
                      <Card.Img
                        class="blackM"
                        variant="top"
                        src={mealPlan.photo_URL}
                        style={{ width: "100%" }}
                      />
                      <div
                        class="selectmeal-center"
                        style={{
                          marginBottom: "10%",
                          fontSize: "30px",
                          textShadow: "2px 2px 4px #FFEFB0",
                          lineHeight: "35px",
                          color: "white"
                        }}
                      >
                        {mealPlan.num_meals} MEALS
                      </div>
                      <Card.Body>
                        <Card.Title>
                          <b>{mealPlan.num_meals} MEALS WEEKLY</b>
                        </Card.Title>
                        <Card.Text
                          style={{ fontSize: "15px", color: "#888785" }}
                        >
                          from ${mealPlan.meal_plan_price_per_meal.toFixed(2)}{" "}
                          per meal
                        </Card.Text>
                        <Card.Text style={{ fontSize: "13px" }}>
                          {mealPlan.plan_headline}
                        </Card.Text>
                        <Card.Text>
                          STARTING AT ${mealPlan.meal_plan_price.toFixed(2)}{" "}
                          /week
                        </Card.Text>
                        <Card.Text
                          style={{ fontSize: "13px", color: "#888785" }}
                        >
                          Sales tax of 8.25% will be added
                        </Card.Text>
                        <Link
                          style={{ fontFamily: "Kalam", color: "white" }}
                          to={mealPlan.RouteOnclick}
                        >
                          <button
                            type="button"
                            class="btn2 btn2-primary font4"
                            style={{
                              marginTop: "10px",
                              paddingLeft: "10px",
                              paddingRight: "10px",
                              paddingTop: "5px",
                              paddingBottom: "5px",
                              color: "white",
                              fontSize: "12px"
                            }}
                          >
                            CHOOSE {mealPlan.num_meals} MEALS
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
                      <Card.Footer Style="bottom:0px; ">
                        <large className="text-muted">
                          {mealPlan.plan_footer}
                        </large>
                      </Card.Footer>
                    </div>
                  </Card>
                </div>
              ))}
            </CardDeck>

            <br></br>
            <br></br>
            <hr></hr>
            <br></br>
            <br></br>
            <h3 class="font1" style={{ color: "#196F3D" }}>
              Our Customers Say
            </h3>
            <div class="font2">
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
                        bods, PTYD is also the friendliest most generous team
                        that is always quick to respond.
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
                        I love how the food is as locally sourced as possible
                        and containers are not going to waste. I don't think
                        I've ever had a meal I didn't like!
                        <br />- Courtney
                      </Cell>
                    </Col>
                  </Grid>
                </Row>
                <br></br>
              </Container>
            </div>
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

export default Selectmealplan;
