import React, {Component} from "react";
import {Card, CardDeck, Row, Col, Container} from "react-bootstrap";
import {Grid, Cell} from "react-mdl";
import IMG9 from "../../img/img9.webp";
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
    alert("mounting selecmealplan");
    console.log(this.props.API_URL);
    const res = await fetch(this.props.API_URL);
    const api = await res.json();
    const mealPlans = api.result.MealPlans.result;
    this.setState({mealPlans});
  }
  render() {
    return (
      <section className='content-section'>
        <div className='container font2' style={{width: "80%"}}>
          <center>
            <h2 className='font1' style={{color: "#4D4D4D"}}>
              SELECT A MEAL PLAN
            </h2>
            <hr className='two' />
            <article className='font1 bottom_header'>
              <h4 className='font-weight-normal'>
                LOCAL. ORGANIC. RESPONSIBLE.
              </h4>
              <h4 className='font-weight-normal'>STRAIGHT TO YOUR DOOR</h4>
            </article>
            <CardDeck>
              {this.state.mealPlans.map(mealPlan => (
                <Card className='p-0 border-0 shadow-none w-auto'>
                  {mealPlan.num_meals === 10 ? (
                    <div className='rcorners font3 d-flex rcorner_color'>
                      <h6 className='align-self-center border-0 mx-auto'>
                        MOST POPULAR
                      </h6>
                    </div>
                  ) : (
                    <div className='rcorners font3 d-flex'>
                      <h6 className='align-self-center mx-auto'></h6>
                    </div>
                  )}

                  <Card.Body
                    className={
                      "borderr border_card_subcribe" +
                      (mealPlan.num_meals === 10 ? " card_color" : "")
                    }
                  >
                    <Card.Header className='p-0 position-relative'>
                      <Card.Img
                        className='blackM'
                        variant='top'
                        src={mealPlan.photo_URL}
                        style={{
                          "border-top-left-radius": "0px",
                          "border-top-right-radius": "0px"
                        }}
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
                        STARTING AT ${mealPlan.meal_plan_price.toFixed(2)} /week
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
                          class='btn2 btn2-primary font4'
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
                        class='img-fluid'
                        src={IMG9}
                        alt=''
                        style={{
                          width: "90%"
                        }}
                      />
                    </Card.Body>
                    {/* </div> */}
                  </Card.Body>
                  <Card.Footer Style='bottom:0px; '>
                    <large className='text-muted'>{mealPlan.plan_footer}</large>
                  </Card.Footer>
                </Card>
              ))}
            </CardDeck>
            <h3 class='font1 feedback_marginTop' style={{color: "#196F3D"}}>
              Our Customers Say
            </h3>
            <div class='font2'>
              <Container>
                <Row style={{fontSize: "20px"}}>
                  <Col>
                    <span class='fa fa-star checked' />
                    <span class='fa fa-star checked' />
                    <span class='fa fa-star checked' />
                    <span class='fa fa-star checked' />
                    <span class='fa fa-star checked' />
                  </Col>
                  <Col>
                    <span class='fa fa-star checked' />
                    <span class='fa fa-star checked' />
                    <span class='fa fa-star checked' />
                    <span class='fa fa-star checked' />
                    <span class='fa fa-star checked' />
                  </Col>
                  <Col>
                    <span class='fa fa-star checked' />
                    <span class='fa fa-star checked' />
                    <span class='fa fa-star checked' />
                    <span class='fa fa-star checked' />
                    <span class='fa fa-star checked' />
                  </Col>
                </Row>
                <Row style={{fontSize: "15px"}}>
                  <Col>Convenience and goodness</Col>
                  <Col>PTYD feels like family!</Col>
                  <Col>They make life SO easy!</Col>
                </Row>
                <Row style={{fontSize: "15px", color: "#196F3D"}}>
                  <Col>
                    <hr class='one' />
                  </Col>
                  <Col>
                    <hr class='one' />
                  </Col>
                  <Col>
                    <hr class='one' />
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
        </div>
      </section>
    );
  }
}

export default Selectmealplan;
