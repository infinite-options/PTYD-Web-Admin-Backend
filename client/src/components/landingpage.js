import React, {Component} from "react";
import IMG1 from "../img/img1.jpg";
import IMG2 from "../img/img2.jpg";
import IMG4 from "../img/img4.jpg";
import IMG5 from "../img/img5.jpg";
import IMG6 from "../img/img6.jpg";
import HUMAN1 from "../img/human1.png";
import HUMAN2 from "../img/human2.png";
import HUMAN3 from "../img/human3.png";
// import COMPANY from "../img/company.png";
import LOGOBOULDIN from "../img/logo-bouldinfoodforest.jpg";
import LOGOFOX7 from "../img/logo-fox7austin.jpg";
import LOGOCREDO from "../img/logo-credo.jpg";
import LOGOCURCUMA from "../img/logo-curcuma.jpg";
import LOGOFRONKS from "../img/logo-fronks.png";
import LOGOJBG from "../img/logo-jbg.png";
import LOGOYELLOWBIRD from "../img/logo-yellowbird.png";
import LOGOSIETE from "../img/logo-siete.png";
import {Row, Col, Container, Card, CardDeck} from "react-bootstrap";
import {Grid, Cell} from "react-mdl";

class Landing extends Component {
  constructor(props) {
    super();
    this.state = {
      isLoggedIn: props.appProps.isAuthenticated
    };
  }
  render() {
    return (
      <section className='content-section'>
        <div className='container' style={{color: "white"}}>
          <img
            className='img-fluid'
            style={{width: "100%", height: "700px"}}
            src={IMG1}
            alt=''
          />
          <div className='top-left font1'>
            <p className='home_title'>LOCAL</p>
            <p className='home_title'>ORGANIC</p>
            <p className='home_title'>RESPONSIBLE</p>
          </div>
          <div className='bottom-left font2 home_subtitle' style={{}}>
            <p>Plant-based, ready to eat meals</p>
            <p>delivered to your doorstep.</p>
            <a className='btn1 btn1-primary start_button' href='/signup'>
              Get Started
            </a>
          </div>

          <div className='bottom-left font2'>
            {/* {this.state.isLoggedIn === false && ( */}
            <a href='/login'>Already a Member? Sign in</a>
            {/* )} */}
          </div>
        </div>
        <div className='container'>
          <div className='container font2 feedback_marginTop'>
            <center>
              <h3 className='font3'>
                THE ONLY ZERO WASTE MEAL DELIVERY SERVICE
              </h3>
            </center>

            <Container className='shadow-lg bg-white p-2 mb-2'>
              <Row
                style={{
                  fontSize: "28px",
                  color: "#196F3D",
                  paddingTop: "0",
                  marginLeft: "5%"
                }}
              >
                <Col>
                  <h4 className='text-wrap'>CHOOSE YOUR MEALS</h4>
                </Col>
                <Col>
                  <h4 className='text-wrap'>WEEKLY DELIVERY</h4>
                </Col>
                <Col>
                  <h4 className='text-wrap'>RETURN YOUR JARS</h4>
                </Col>
              </Row>
              <Row
                style={{
                  fontSize: "15px",
                  color: "#4D4D4D",
                  lineHeight: "25px",
                  marginLeft: "5%"
                }}
              >
                <Col>
                  <Cell col={11}>
                    Every Monday, we'll release a new menu. Order 5 to 20 meals
                    for delivery.
                  </Cell>
                </Col>
                <Col>
                  <Cell col={10}>
                    Seamless non-contact delivery in Austin & Houston.
                  </Cell>
                </Col>
                <Col>
                  <Cell col={10}>
                    Don't throw anything away! We will pick up your old bag and
                    reusable mason jars with your next delivery.
                  </Cell>
                </Col>
              </Row>
            </Container>

            <center>
              <button
                type='button'
                className='btn1 btn1-primary font4'
                style={{
                  marginTop: "10px",
                  color: "white",
                  size: "10px",
                  fontSize: "17px"
                }}
              >
                Get Started
              </button>
            </center>
          </div>
        </div>

        <div className='container container_space d-flex justify-content-center'>
          <div className='font2'>
            <Grid className='mt-5'>
              <Cell col={8}>
                <Container>
                  <Row style={{fontSize: "28px"}}>
                    <Col>LOCAL FARMS</Col>
                    <Col>REUSABLE PACKAGING</Col>
                  </Row>
                  <Row
                    style={{
                      fontSize: "13px",
                      color: "#4D4D4D",
                      lineHeight: "20px"
                    }}
                  >
                    <Col>
                      <Cell col={10}>
                        Our organic produce comes directly from small Texas
                        farms to the PTYD kitchen. No middle men or long transit
                        times. We provide the most nutrient rich ingredients
                        straight to your door.
                      </Cell>
                    </Col>
                    <Col>
                      <Cell col={11}>
                        Did you know that every piece of plastic ever produced,
                        still exists today? Enjoy a plastic-free experience with
                        your PTYD deliveries.
                      </Cell>
                    </Col>
                  </Row>
                  <Row style={{fontSize: "28px"}} className='mt-5'>
                    <Col>ZERO WASTE</Col>
                    <Col>ORGANIC PRODUCE</Col>
                  </Row>
                  <Row
                    style={{
                      fontSize: "13px",
                      color: "#4D4D4D",
                      lineHeight: "20px"
                    }}
                  >
                    <Col>
                      <Cell col={10}>
                        Nearly 40% of all food grown in the United States is
                        thrown away. In our kitchen, all food scraps are
                        composted to make healthy organic soil.{" "}
                      </Cell>
                    </Col>
                    <Col>
                      <Cell col={11}>
                        Once upon a time, all food was organic. Healthy soil
                        means healthy nutrients and healthy bodies. We source
                        100% organic ingredients, so there's no pesticides,
                        herbicides or sprays in your food, ever.
                      </Cell>
                    </Col>
                  </Row>
                </Container>
              </Cell>
              <Cell col={4}>
                <img
                  className='img-fluid'
                  style={{width: "80%", height: "100%"}}
                  src={IMG2}
                  alt=''
                />
              </Cell>
              <button
                type='button'
                className='btn1 btn1-primary font4'
                style={{
                  marginTop: "10px",
                  color: "white",
                  size: "10px",
                  fontSize: "17px"
                }}
              >
                EAT BETTER NOW
              </button>
            </Grid>
          </div>
        </div>
        <div
          className='container background container_space'
          style={{
            backgroundSize: "100% 100%"
          }}
        >
          <center className='d-flex justify-content-center'>
            <div
              className='p-5'
              style={{
                color: "white",
                backgroundColor: "#467844",
                width: "700px",
                height: "700px"
              }}
            >
              <h2 className='font1'>DELIVERED WEEKLY</h2>
              <h3 className='font1'>STRAIGHT TO YOUR DOOR</h3>
              <hr className='three' />
              <h5 className='font1'>&bull; READY-TO-EAT PLANT BASED MEALS</h5>
              <h5 className='font1'>
                &bull; 100% GLUTEN, MEAT, AND DAIRY FREE
              </h5>
              <h5 className='font1'>&bull; REAL WHOLE FOOD INGREDIENTS</h5>
              <h5 className='font1'>&bull; NO PRESERVATIVES, EVER</h5>
              <hr className='three' />
              <h6 className='mt-5'>
                <i>Pause anytime, no commitment.</i>
              </h6>
              <h5 className='font1'>PLANS STARTING AT</h5>
              <h4 className='font3'>$59 / WEEK</h4>
            </div>
          </center>
        </div>
        <div className='container container_space'>
          <h3 className='font2' style={{color: "#196F3D"}}>
            FRESH MENU EVERY WEEK
          </h3>
          <h5 className='font1'>
            Organic. Seasonal. Local. Every week try something new. Your taste
            buds will thank you.{" "}
          </h5>
          <Grid>
            <Cell col={4}>
              <img
                className='img-fluid'
                style={{width: "80%", height: "60%"}}
                src={IMG4}
                alt=''
              />
              <h4 className='font2'>RAINBOW SALAD</h4>
              <Cell col={10}>
                <p className='font2'>
                  All the colors for all the nutrients! This salad is perfect
                  for a lunch on the go. With delicious, freshly made cilantro
                  lime hummus, pickled onions, quinoa, and a fresh serving of
                  greens, this salad has all the essential nutrients to keep you
                  firing all day.
                </p>
              </Cell>
            </Cell>
            <Cell col={4}>
              <img
                className='img-fluid'
                style={{width: "80%", height: "60%"}}
                src={IMG5}
                alt=''
              />
              <h4 className='font2'>BBQ CHICKPEA SALAD</h4>
              <Cell col={10}>
                <p className='font2'>
                  Southern, smoky, spiced chickpeas smothered in the worlds best
                  BBQ Sauce. You'll want to order this when it comes on the
                  menu, trust me.
                </p>
              </Cell>
            </Cell>
            <Cell col={4}>
              <img
                className='img-fluid'
                style={{width: "80%", height: "60%"}}
                src={IMG6}
                alt=''
              />
              <h4 className='font2'>BLUEBERRY COCONUT OATS</h4>
              <Cell col={10}>
                <p className='font2'>
                  Say hello to your new favorite breakfast. Eat in the car or
                  steal bites between emails. Fresh blueberries, coconut cream,
                  chia seeds and rolled oats. This meal has the antioxidants,
                  healthy fats and fiber to kickstart your day.
                </p>
              </Cell>
            </Cell>
          </Grid>
          <button
            type='button'
            className='btn1 btn1-primary font4'
            style={{
              marginTop: "10px",
              color: "white",
              size: "10px",
              fontSize: "17px"
            }}
          >
            BROWSE OUR MENU
          </button>
        </div>
        <div className='container font2 container_space'>
          <h3 className='font2'>What Our Community is Saying...</h3>
          <CardDeck className='mb-5'>
            <Card className='p-3'>
              <Card.Body>
                <Card.Title>
                  Healthy, delicious, and delivered to your door at an
                  affordable price. Hard to beat. As a bonus, the jars are
                  eco-friendly. I can't wait to see PTYD expand.
                </Card.Title>
              </Card.Body>
              <Card.Footer className='d-flex justify-content-center'>
                <Cell col={3}>
                  <img
                    style={{
                      borderRadius: "50%",
                      width: "60px",
                      height: "60px",
                      marginTop: "10px"
                    }}
                    src={HUMAN1}
                    alt='Avatar'
                  ></img>
                </Cell>
                <Cell col={7}>
                  <h5 className='font2'>Veronica</h5>
                  <p>UX Designer</p>
                </Cell>
              </Card.Footer>
            </Card>
            <Card className='p-3'>
              <Card.Body>
                <Card.Title>
                  Best meal prep service we've ever used. The food is fresh,
                  organic, dairy and meat free. When you love food as much as my
                  husband and I do, you appreciate having consistent meals
                  throughout the week that are the definition of clean.
                </Card.Title>
              </Card.Body>
              <Card.Footer className='d-flex justify-content-center'>
                <Cell col={3}>
                  <img
                    style={{
                      borderRadius: "50%",
                      width: "60px",
                      height: "60px",
                      marginTop: "10px"
                    }}
                    src={HUMAN2}
                    alt='Avatar'
                  ></img>
                </Cell>
                <Cell col={7}>
                  <h5>Luke</h5>
                  <p>Tech</p>
                </Cell>
              </Card.Footer>
            </Card>
            <Card className='p-3'>
              <Card.Body>
                <Card.Title>
                  These meals are delicious, healthy, and make life SO easy and
                  enjoyable! The team is great with customer service if I ever
                  have any questions. I don't think I've ever had a meal I
                  didn't like!
                </Card.Title>
              </Card.Body>
              <Card.Footer className='d-flex justify-content-center'>
                <Cell col={3}>
                  <img
                    style={{
                      borderRadius: "50%",
                      width: "60px",
                      height: "60px",
                      marginTop: "10px"
                    }}
                    src={HUMAN3}
                    alt='Avatar'
                  ></img>
                </Cell>
                <Cell col={7}>
                  <h5 className='font2'>Courtney</h5>
                  <p>Fitness Designer</p>
                </Cell>
              </Card.Footer>
            </Card>
          </CardDeck>
          <button
            type='button'
            className='btn1 btn1-primary font4'
            style={{
              marginTop: "10px",
              color: "white",
              size: "10px",
              fontSize: "17px"
            }}
          >
            TRY US TODAY
          </button>
          <Grid>
            <center>
              <Cell col={8}>
                <h3 className='font2' style={{lineHeight: "50px"}}>
                  "PTYD is so good and we love it so much, it feels like part of
                  our family! It's so thrilling to fill our fridge every week
                  with tasty surprises!"
                </h3>
              </Cell>

              <div className='container_space'>
                <Grid className='sponsors'>
                  <Cell col={3} align='middle'>
                    <img src={LOGOJBG} alt='jbg' />
                  </Cell>
                  <Cell col={3} align='middle'>
                    <img src={LOGOFOX7} alt='fox7austin' />
                  </Cell>
                  <Cell col={3} align='middle'>
                    <img src={LOGOCURCUMA} alt='curcuma' />
                  </Cell>
                  <Cell col={3} align='middle'>
                    <img src={LOGOYELLOWBIRD} alt='yellowbird' />
                  </Cell>
                  <Cell col={3} align='middle'>
                    <img src={LOGOFRONKS} alt='fronks' />
                  </Cell>
                  <Cell col={3} align='middle'>
                    <img src={LOGOBOULDIN} alt='bouldin' />
                  </Cell>
                  <Cell col={3} align='middle'>
                    <img src={LOGOCREDO} alt='credo' />
                  </Cell>
                  <Cell col={3} align='middle'>
                    <img src={LOGOSIETE} alt='siete' />
                  </Cell>
                </Grid>
              </div>
            </center>
          </Grid>
        </div>
      </section>
    );
  }
}
export default Landing;
