import React, { Component } from "react";
import { Card, CardDeck, Row, Col, Container } from "react-bootstrap";
import IMG1 from "../img/img1.jpg";
import { Link } from "react-router-dom";

let DEV_URL = 'https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev';

class Selectmealplan extends Component {
  constructor(props) {
    super(props);
    this.state = { mealPlans: [] };
  }

  // Call API from AWS S3
  async componentDidMount() {
    const res = await fetch(`${DEV_URL}/api/v1/plans`);
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
                <Card>
                  <Card.Img variant="top" src={IMG1} />
                  <Card.Body>
                    <Card.Title>
                      <b>{mealPlan.MealsPerWeek} MEALS WEEKLY</b>
                    </Card.Title>
                    <Card.Text style={{ fontSize: "15px", color: "#888785" }}>
                      from $10.75 per meal
                    </Card.Text>
                    <Card.Text style={{ fontSize: "13px" }}>
                      {mealPlan.PlanSummary}
                    </Card.Text>
                    <Card.Title>STARTING AT ${mealPlan.LowestPrice} /week</Card.Title>
                    <Card.Text style={{ fontSize: "13px", color: "#888785" }}>
                      Sales tax of 8.25% will be added
                    </Card.Text>
                    <Link
                      style={{ fontFamily: "Kalam", color: "white" }}
                      to={mealPlan.RouteTo}
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
                        CHOOSE {mealPlan.MealsPerWeek} MEALS
                      </button>
                    </Link>
                  </Card.Body>
                  <Card.Footer>
                    <large className="text-muted">{mealPlan.PlanFooter}</large>
                  </Card.Footer>
                </Card>)}
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
            </Container>
          </center>
        </div>
      </section>
    );
  }
}

export default Selectmealplan;
