import React, { Component } from "react";
import { Card, CardDeck, Row, Col, Container } from "react-bootstrap";
import { Grid, Cell } from "react-mdl";
import { Link } from "react-router-dom";

class Selectmealplan extends Component {
  constructor(props) {
    super(props);
    this.state = { mealPlans: [] };
  }

  async componentDidMount() {
    const res = await fetch(`${this.props.API_URL}`);
    const api = await res.json();
    const mealPlans = api.result.MealPlans;
    this.setState( {mealPlans} );
  }
  
  render() {
    return (
      <section class="content-section">
        <div class="container">
          <center>
            <h1>SELECT A MEAL PLAN</h1>
            <hr class="two" />
            <h4>
              LOCAL. ORGANIC. RESPONSIBLE.<br></br>STRAIGHT TO YOUR DOOR
            </h4>
            <br></br>
            <CardDeck>

              {this.state.mealPlans.map(mealPlan =>
                <Card
                  style={{
                    maxWidth: "20rem",
                    boxShadow: "0px 5px 32px 4px rgba(0,0,0,0.3)"
                  }}
                > 
                  <div class="border border-dark" Style="height:100%">
                    <Card.Img class="blackM" variant="top" src={mealPlan.Img} />
                    <div
                      class="top-center"
                      style={{
                        marginBottom: "200px",
                        fontSize: "30px",
                        textShadow: "2px 2px 4px #FFEFB0",
                        lineHeight: "35px",
                        color: "white"
                      }}
                    >
                      {mealPlan.MealsPerWeek} MEALS
                    </div>
                    <Card.Body>
                      <Card.Title>
                        <b>{mealPlan.MealsPerWeek} MEALS WEEKLY</b>
                      </Card.Title>
                      <Card.Text style={{ fontSize: "15px", color: "#888785" }}>
                        from ${mealPlan.PricePerMeal.toFixed(2)} per meal
                      </Card.Text>
                      <Card.Text style={{ fontSize: "13px" }}>
                        {mealPlan.PlanSummary}
                      </Card.Text>
                      <Card.Title>STARTING AT ${mealPlan.LowestPrice.toFixed(2)} /week</Card.Title>
                      <Card.Text style={{ fontSize: "13px", color: "#888785" }}>
                        Sales tax of 8.25% will be added
                      </Card.Text>
                      <Link
                        style={{ fontFamily: "Kalam", color: "white" }}
                        to={mealPlan.RouteOnclick}
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
                          CHOOSE {mealPlan.MealsPerWeek} MEALS
                        </button>
                      </Link>
                    </Card.Body>
                    <Card.Footer Style="bottom:0px; ">
                      <large className="text-muted">{mealPlan.PlanFooter}</large>
                    </Card.Footer>
                  </div>
                </Card>)}

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

export default Selectmealplan;
