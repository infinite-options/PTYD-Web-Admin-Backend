import React, {Component} from "react";
import {Card, CardDeck, Row, Col, Container} from "react-bootstrap";
import {Grid, Cell} from "react-mdl";
import IMG9 from "../../img/creditCard.png";
import {Link} from "react-router-dom";
import {timingSafeEqual} from "crypto";

class Selectmealplan extends Component {
  constructor(props) {
    super(props);
    this.state = {
      mealPlans: []
    };
  }
  async componentDidMount() {
    const res = await fetch(this.props.API_URL);
    const api = await res.json();
    const mealPlans = api.result.MealPlans.result;
    this.setState({mealPlans});
  }
  render() {
    return (
      <section className='content-section font2'>
        <div className='container'>
          <center>
            <h2 className='font1' style={{color: "#4D4D4D"}}>
              SELECT A MEAL PLAN
            </h2>
            <hr className='two' />
            <article className='bottom_header'>
              <p>LOCAL. ORGANIC. RESPONSIBLE.</p>
              <p>STRAIGHT TO YOUR DOOR</p>
            </article>
            <CardDeck>
              {this.state.mealPlans.map((mealPlan, key) => (
                <Card key={key} className='p-0 border-0 w-auto shadow-none'>
                  {mealPlan.num_meals === 10 ? (
                    <div className='rcorners d-flex rcorner_color'>
                      <h5 className='align-self-center mx-auto'>
                        MOST POPULAR
                      </h5>
                    </div>
                  ) : (
                    <div className='rcorners d-flex'>
                      <p className='align-self-center mx-auto'></p>
                    </div>
                  )}

                  <Card.Body
                    className={
                      "borderr border_card_subcribe" +
                      (mealPlan.num_meals === 10 ? " card_color" : "")
                    }
                  >
                    <Card.Header className='p-0 position-relative background_black'>
                      <Card.Img
                        className='blackM background_black '
                        variant='top'
                        src={mealPlan.photo_URL}
                      />
                      <Card.ImgOverlay className='d-flex'>
                        <span className='px-0 align-self-center mx-auto selectmeal-center'>
                          {mealPlan.num_meals} MEALS
                        </span>
                      </Card.ImgOverlay>
                    </Card.Header>
                    <Card.Body>
                      <Card.Title>
                        <b>{mealPlan.num_meals} MEALS WEEKLY</b>
                      </Card.Title>
                      <Card.Text style={{fontSize: "15px", color: "#888785"}}>
                        from ${mealPlan.meal_plan_price_per_meal.toFixed(2)} per
                        meal
                      </Card.Text>
                      <Card.Text style={{fontSize: "13px"}}>
                        {mealPlan.plan_headline}
                      </Card.Text>
                      <Card.Text>
                        STARTING AT ${mealPlan.meal_weekly_price.toFixed(2)}{" "}
                        /week
                      </Card.Text>
                      <Card.Text style={{fontSize: "13px", color: "#888785"}}>
                        Sales tax of 8.25% will be added
                      </Card.Text>
                      <Link
                        style={{fontFamily: "Kalam", color: "white"}}
                        to={mealPlan.RouteOnclick}
                      >
                        <button
                          type='button'
                          className='btn2 btn2-primary font2'
                          style={{
                            marginTop: "10px",
                            paddingLeft: "10px",
                            paddingRight: "10px",
                            paddingTop: "5px",
                            paddingBottom: "5px",
                            color: "white",
                            fontSize: "12px",
                            fontWeight: "bold"
                          }}
                        >
                          CHOOSE {mealPlan.num_meals} MEALS
                        </button>
                      </Link>
                      <img
                        className='img-fluid'
                        src={IMG9}
                        alt=''
                        style={{
                          width: "90%"
                        }}
                      />
                    </Card.Body>

                    <Card.Footer className='text-muted justify-content-center'>
                      {mealPlan.plan_footer}
                    </Card.Footer>
                    {/* </div> */}
                  </Card.Body>
                </Card>
              ))}
            </CardDeck>
            <hr className='feedback_marginTop' />
            <h3 className='font1 mt-5 mb-5' style={{color: "#196F3D"}}>
              Our Customers Say
            </h3>
            <div>
              <Container>
                <Row>
                  <Col>
                    <div className='shadow w-75 pt-3 pb-1'>
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
                    <div className='shadow w-75 pt-3 pb-1'>
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
                    <div className='shadow w-75 pt-3 pb-1'>
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
                          husband after his workout, or snack on a salad while
                          the kids nap, it's an outstanding addition to our
                          fridge!
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
            </div>
          </center>
          <div className='feedback_marginTop'>&nbsp;</div>
        </div>
      </section>
    );
  }
}

export default Selectmealplan;
