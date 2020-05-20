import React, { Component } from "react";
import { Card, CardDeck, Row, Col, Container } from "react-bootstrap";
import { Grid, Cell } from "react-mdl";
import IMG9 from "../../img/img9.webp";
import { Link } from "react-router-dom";

class SelectPaymentPlan extends Component {
  constructor(props) {
    super(props);
    this.state = { meals: null, obj: null, paymentPlans: [], otherPlans: [] };
  }

  async componentDidMount() {
    this.setState({ obj: this.props.objectIndex });
    this.setState({ meals: this.props.meals });
    const res = await fetch(this.props.API_URL);
    const api = await res.json();
    const plans = api.result[this.state.obj].result;
    //  const plans = plansData.Plans;
    this.setState({ paymentPlans: plans });
    //  const otherPlans = plansData.OtherPaymentPlans;
    //  this.setState( {otherPlans: otherPlans} );
  }

  render() {
    return (
      <section class="content-section" style={{ marginTop: "-70px" }}>
        <div class="container font2">
          <center>
            <h2 class="font1">{this.state.meals} MEALS PAYMENT OPTIONS</h2>
            <hr class="two" />
            <article className="bottom_header">
              <h4 className="font-weight-normal font1">
                LOCAL. ORGANIC. RESPONSIBLE.
              </h4>
              <h4 className="font-weight-normal font1">
                STRAIGHT TO YOUR DOOR
              </h4>
            </article>
            <hr class="three" />
            <a href="/5-meals-subscription" style={{ color: "black" }}>
              5 MEALS
            </a>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <a href="/10-meals-subscription" style={{ color: "black" }}>
              10 MEALS{" "}
            </a>{" "}
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <a href="/15-meals-subscription" style={{ color: "black" }}>
              15 MEALS{" "}
            </a>{" "}
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <a href="/20-meals-subscription" style={{ color: "black" }}>
              20 MEALS{" "}
            </a>
            <hr class="three" />
            <div class="justify-content-center">
              <CardDeck className="d-flex justify-content-center">
                {this.state.paymentPlans.map(paymentPlan => (
                  <Card.Body className="borderr border_card_subcribe paymentCard ">
                    <Card.Header className="p-0 position-relative background_black">
                      <Card.Img
                        className="blackM background_black"
                        variant="top"
                        src={paymentPlan.photo_URL}
                        // style={{
                        //   "border-top-left-radius": "0px",
                        //   "border-top-right-radius": "0px"
                        // }}
                      />
                      <div class="d-flex card-img-overlay">
                        <span className="px-0 align-self-center mx-auto mealoption-center ">
                          {paymentPlan.num_meals}
                        </span>
                      </div>
                    </Card.Header>
                    <Card.Body>
                      <Card.Title>
                        <b>{paymentPlan.payment_frequency.toUpperCase()}</b>
                      </Card.Title>
                      <Card.Text style={{ fontSize: "15px", color: "#888785" }}>
                        ${paymentPlan.meal_plan_price_per_meal.toFixed(2)} per
                        meal
                      </Card.Text>
                      <Card.Title>
                        ${paymentPlan.meal_weekly_price.toFixed(2)} /week
                      </Card.Title>
                      <Card.Text style={{ fontSize: "13px", color: "#888785" }}>
                        Sales tax of 8.25% will be added
                      </Card.Text>
                      <Link
                        style={{ fontFamily: "Kalam", color: "white" }}
                        to={{
                          pathname: "/checkout",
                          item: {
                            name: `${
                              paymentPlan.meal_plan_desc
                            } Subscription - $${paymentPlan.meal_plan_price.toFixed(
                              2
                            )} /week`,
                            total: paymentPlan.meal_plan_price.toFixed(2)
                          }
                        }}
                      >
                        <button
                          type="button"
                          class="btn2 btn2-primary font4"
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
                  </Card.Body>
                ))}
              </CardDeck>
            </div>
            <hr className="mt-5" />
            <h3 class="font1 feedback_marginTop" style={{ color: "#196F3D" }}>
              Our Customers Say
            </h3>
            <Container>
              <Row style={{ fontSize: "20px" }}>
                <Col>
                  <div className="shadow w-75">
                    <div className="mb-2">
                      <span class="fa fa-star checked" />
                      <span class="fa fa-star checked" />
                      <span class="fa fa-star checked" />
                      <span class="fa fa-star checked" />
                      <span class="fa fa-star checked" />
                    </div>
                    <p>Convenience and goodness</p>
                  </div>
                </Col>
                <Col>
                  <div className="shadow w-75">
                    <div className="mb-2">
                      <span class="fa fa-star checked" />
                      <span class="fa fa-star checked" />
                      <span class="fa fa-star checked" />
                      <span class="fa fa-star checked" />
                      <span class="fa fa-star checked" />
                    </div>
                    <p>PTYD feels like family!</p>
                  </div>
                </Col>
                <Col>
                  <div className="shadow w-75">
                    <div className="mb-2">
                      <span class="fa fa-star checked" />
                      <span class="fa fa-star checked" />
                      <span class="fa fa-star checked" />
                      <span class="fa fa-star checked" />
                      <span class="fa fa-star checked" />
                    </div>
                    <p>They make life SO easy!</p>
                  </div>
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
                      <p>
                        Besides the convenience and goodness going inside our
                        bods, PTYD is also the friendliest most generous team
                        that is always quick to respond.
                      </p>
                      <p>- Austin</p>
                    </Cell>
                  </Col>
                  <Col>
                    <Cell col={10}>
                      <p>
                        Whether I split a soup between our two kids, feed my
                        husband after his workout, or snack on a salad while the
                        kids nap, it's an outstanding addition to our fridge!
                      </p>
                      <p>- Christy</p>
                    </Cell>
                  </Col>
                  <Col>
                    <Cell col={10}>
                      <p>
                        I love how the food is as locally sourced as possible
                        and containers are not going to waste. I don't think
                        I've ever had a meal I didn't like!
                      </p>
                      <p>- Courtney</p>
                    </Cell>
                  </Col>
                </Grid>
              </Row>
            </Container>
          </center>
        </div>
      </section>
    );
  }
}

export default SelectPaymentPlan;
