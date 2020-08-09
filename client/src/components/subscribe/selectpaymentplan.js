import React, {Component} from "react";
import {Card, CardDeck, Row, Col, Container} from "react-bootstrap";
import {Grid, Cell} from "react-mdl";
import IMG9 from "../../img/creditCard.png";
import axios from "axios";
// import {Link} from "react-router-dom";

class SelectPaymentPlan extends Component {
  constructor(props) {
    super(props);
    this.state = {meals: null, obj: null, paymentPlans: [], otherPlans: []};
  }

  async componentDidMount() {
    this.setState({obj: this.props.objectIndex});
    this.setState({meals: this.props.meals});
    const res = await fetch(this.props.API_URL);
    const api = await res.json();
    console.log(api);
    const plans = api.result[this.state.obj].result;
    //  const plans = plansData.Plans;
    this.setState({paymentPlans: plans});
    //calling tax_rate api
    let today = new Date();
    let mm =
      today.getMonth() + 1 >= 10
        ? today.getMonth() + 1
        : "0" + (today.getMonth() + 1);
    let dd = today.getDate() >= 10 ? today.getDate() : "0" + today.getDate();
    let yyyy = today.getFullYear();
    axios
      .get(`${this.props.TAX_RATE_URL}`, {
        params: {affected_date: `${yyyy}-${mm}-${dd}`}
      })
      .then(res => {
        if (res.data.result !== undefined) {
          let rate = parseFloat(
            (parseFloat(res.data.result.tax_rate) / 100).toFixed(2)
          );
          this.setState({tax_rate: rate, shipping: 15}); // should get shipping from databse too.
        }
      });
  }

  render() {
    return (
      <section className='content-section'>
        <div className='container font2'>
          <center>
            <h2 className='font1'>{this.state.meals} MEALS PAYMENT OPTIONS</h2>
            <hr className='two' />
            <article className='bottom_header'>
              <p>LOCAL. ORGANIC. RESPONSIBLE.</p>
              <p>STRAIGHT TO YOUR DOOR</p>
            </article>
            <hr className='three' />
            <div className='number-of-meals-margin'>
              <a className='number-of-meals' href='/5-meals-subscription'>
                5 MEALS
              </a>
              &nbsp; &nbsp; &nbsp; &nbsp; 
              {/* &nbsp; &nbsp; */}
              <a className='number-of-meals' href='/10-meals-subscription'>
                10 MEALS{" "}
              </a>{" "}
              &nbsp; &nbsp; &nbsp; &nbsp; 
              {/* &nbsp; &nbsp; */}
              <a className='number-of-meals' href='/15-meals-subscription'>
                15 MEALS{" "}
              </a>{" "}
              &nbsp; &nbsp; &nbsp; &nbsp; 
              {/* &nbsp; &nbsp; */}
              <a className='number-of-meals' href='/20-meals-subscription'>
                20 MEALS{" "}
              </a>
            </div>
            <hr className='three' />
            {/* <div className='justify-content-center'> */}
              <CardDeck 
              // className='d-flex justify-content-center'
              >
                {this.state.paymentPlans.map(paymentPlan => (
                  <Card.Body
                    key={paymentPlan.meal_plan_id}
                    className='borderr border_card_subcribe paymentCard '
                  >
                    <Card.Header className='p-0 position-relative background_black'>
                      <Card.Img
                        className='blackM background_black'
                        variant='top'
                        src={paymentPlan.photo_URL}
                      />
                      <div className='d-flex card-img-overlay'>
                        <span className='px-0 align-self-center mx-auto mealoption-center '>
                          {paymentPlan.num_meals}
                        </span>
                      </div>
                    </Card.Header>
                    <Card.Body>
                      <Card.Title>
                        <b>{paymentPlan.payment_frequency.toUpperCase()}</b>
                      </Card.Title>
                      <Card.Text style={{fontSize: "15px", color: "#888785"}}>
                        ${paymentPlan.meal_plan_price_per_meal.toFixed(2)} per
                        meal
                      </Card.Text>
                      <Card.Title>
                        ${paymentPlan.meal_weekly_price.toFixed(2)} /week
                      </Card.Title>
                      <Card.Text style={{fontSize: "13px", color: "#888785"}}>
                        Sales tax of {(this.state.tax_rate * 100).toFixed(2)}%
                        will be added
                      </Card.Text>

                      <button
                        type='button'
                        className='btn2 btn2-primary font2'
                        style={{
                          marginTop: "10px",
                          paddingLeft: "30px",
                          paddingRight: "30px",
                          paddingTop: "5px",
                          paddingBottom: "5px",
                          color: "white",
                          fontSize: "15px"
                        }}
                        onClick={() => {
                          this.props.history.push({
                            pathname: "/checkout",
                            state: {
                              item: {
                                name: `${
                                  paymentPlan.meal_plan_desc
                                } Subscription - $${paymentPlan.meal_plan_price.toFixed(
                                  2
                                )}`,
                                total: paymentPlan.meal_plan_price.toFixed(2)
                              },
                              tax_rate: this.state.tax_rate,
                              shipping: this.state.shipping
                            }
                          });
                        }}
                      >
                        CHECKOUT
                      </button>
                      <img
                        className='img-fluid'
                        src={IMG9}
                        alt=''
                        style={{
                          width: "90%"
                        }}
                      />
                    </Card.Body>
                  </Card.Body>
                ))}
              </CardDeck>
            {/* </div> */}
            <hr className='mt-5' />
            <h3 className='font1 feedback_marginTop' style={{color: "#196F3D"}}>
              Our Customers Say
            </h3>
            <Container style={{fontSize: "20px"}}>
              <Row>
                <Col>
                  <div className='shadow w-75'>
                    <div className='mb-2'>
                      <span className='fa fa-star checked' />
                      <span className='fa fa-star checked' />
                      <span className='fa fa-star checked' />
                      <span className='fa fa-star checked' />
                      <span className='fa fa-star checked' />
                    </div>
                    <p>Convenience and goodness</p>
                  </div>
                </Col>
                <Col>
                  <div className='shadow w-75'>
                    <div className='mb-2'>
                      <span className='fa fa-star checked' />
                      <span className='fa fa-star checked' />
                      <span className='fa fa-star checked' />
                      <span className='fa fa-star checked' />
                      <span className='fa fa-star checked' />
                    </div>
                    <p>PTYD feels like family!</p>
                  </div>
                </Col>
                <Col>
                  <div className='shadow w-75'>
                    <div className='mb-2'>
                      <span className='fa fa-star checked' />
                      <span className='fa fa-star checked' />
                      <span className='fa fa-star checked' />
                      <span className='fa fa-star checked' />
                      <span className='fa fa-star checked' />
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
          <div className='feedback_marginTop'>&nbsp;</div>
        </div>
      </section>
    );
  }
}

export default SelectPaymentPlan;
