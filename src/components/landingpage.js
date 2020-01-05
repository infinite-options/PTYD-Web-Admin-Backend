import React, { Component } from "react";
import IMG1 from "../img/img1.jpg";
import IMG2 from "../img/img2.jpg";
import IMG3 from "../img/img3.jpg";
import IMG4 from "../img/img4.jpg";
import IMG5 from "../img/img5.jpg";
import IMG6 from "../img/img6.jpg";
import IMG7 from "../img/img7.jpg";
import { Row, Col, Container } from "react-bootstrap";
import { Grid, Cell } from "react-mdl";

class Landing extends Component {
  render() {
    return (
      <div>
        <section class="content-section">
          <h3>
            <div class="container" style={{ color: "white" }}>
              <img
                class="img-fluid"
                style={{ width: "100%", height: "700px" }}
                src={IMG1}
                alt=""
              />
              <div
                class="top-left"
                style={{ size: "300px", lineHeight: "55px" }}
              >
                LOCAL<br></br>ORGANIC<br></br>RESPONSIBLE
              </div>

              <div
                class="bottom-left"
                style={{
                  marginBottom: "200px",
                  fontSize: "21px",
                  textShadow: "2px 2px 4px #FFEFB0",
                  lineHeight: "35px"
                }}
              >
                Farm-to-table, prepared meals <br></br>delivered to your
                doorstep.<br></br>
                <button
                  type="button"
                  class="btn1 btn1-primary"
                  style={{ marginTop: "10px", color: "white" }}
                >
                  Get Started
                </button>
              </div>

              <div class="bottom-left">
                <a>Already a Member? Sign in</a>
              </div>
            </div>
            <div class="container">
              <div class="langding-part2">
                <br></br>
                <center>
                  <h2>SAVE TIME, EAT BETTER.</h2>
                </center>
                <hr class="one" />
                <Container>
                  <Row style={{ fontSize: "25px", color: "#196F3D" }}>
                    <Col>CHOOSE YOUR PLAN</Col>
                    <Col>WEEKLY DELIVERY</Col>
                    <Col>NO COMMITMENT</Col>
                  </Row>
                  <Row
                    style={{
                      fontSize: "15px",
                      color: "black",
                      lineHeight: "25px"
                    }}
                  >
                    <Col>
                      Order 5, 10, or 20 meals each week. Customize your order
                      from 6 new recipes every week.
                    </Col>
                    <Col>
                      We deliver in Austin, Texas to your home or office.
                      Delivery times are Sunday 6pm to 9pm and Monday 9am to
                      1pm.{" "}
                    </Col>
                    <Col>
                      Prep to Your Door is flexible. You can modify, skip, or
                      cancel your plan at any time with no commitment.
                    </Col>
                  </Row>
                </Container>
                <br></br>
                <hr class="one" />
                <center>
                  <button
                    type="button"
                    class="btn1 btn1-primary"
                    style={{
                      marginTop: "10px",
                      color: "white",
                      size: "10px",
                      fontSize: "20px"
                    }}
                  >
                    Get Started
                  </button>
                </center>
              </div>
            </div>

            <div class="container">
              <div class="langding-part2">
                <br></br>
                <br></br>
                <Grid>
                  <Cell col={8}>
                    <Container>
                      <Row style={{ fontSize: "25px" }}>
                        <Col>LOCAL FARMS</Col>
                        <Col>REUSABLE PACKAGING</Col>
                      </Row>
                      <Row
                        style={{
                          fontSize: "13px",
                          color: "black",
                          lineHeight: "20px"
                        }}
                      >
                        <Col>
                          Eat seasonally and locally every week. Our chefs
                          create each menu based on what is growing in Texas.
                        </Col>
                        <Col>
                          Did you know that every piece of plastic ever
                          produced, still exists today? Enjoy a plastic-free
                          experience with your PTYD deliveries.
                        </Col>
                      </Row>
                      <br></br>
                      <br></br>
                      <Row style={{ fontSize: "25px" }}>
                        <Col>ZERO WASTE</Col>
                        <Col>ORGANIC PRODUCE</Col>
                      </Row>

                      <Row
                        style={{
                          fontSize: "13px",
                          color: "black",
                          lineHeight: "20px"
                        }}
                      >
                        <Col>
                          Nearly 40% of all food grown in the United States is
                          thrown away. In our kitchen, all food scraps are
                          composted to make healthy organic soil.
                        </Col>
                        <Col>
                          Not only is organic food better for your health, it's
                          better for our planet. Healthy soil means healthy
                          nutrients and healthy bodies.
                        </Col>
                      </Row>
                    </Container>
                  </Cell>
                  <Cell col={4}>
                    <img
                      class="img-fluid"
                      style={{ width: "80%", height: "100%" }}
                      src={IMG2}
                      alt=""
                    />
                  </Cell>
                  <button
                    type="button"
                    class="btn1 btn1-primary"
                    style={{
                      marginTop: "10px",
                      color: "white",
                      size: "10px",
                      fontSize: "20px"
                    }}
                  >
                    EAT BETTER NOW
                  </button>
                </Grid>
              </div>
            </div>
            <br></br>
            <div class="container" style={{ color: "white" }}>
              <center>
                <img
                  class="img-fluid"
                  style={{ width: "60%", height: "60%" }}
                  src={IMG3}
                  alt=""
                />
                <div
                  class="centered"
                  style={{ size: "300px", lineHeight: "55px" }}
                >
                  LOCAL<br></br>ORGANIC<br></br>RESPONSIBLE
                </div>

                <div
                  class="centered"
                  style={{
                    marginBottom: "200px",
                    fontSize: "21px",
                    textShadow: "2px 2px 4px #FFEFB0",
                    lineHeight: "35px"
                  }}
                >
                  Farm-to-table, prepared meals <br></br>delivered to your
                  doorstep.<br></br>
                </div>

                <div class="centered">Already a Member? Sign in</div>
              </center>
            </div>
            <br></br>
            <div class="container">
              <h3 style={{ color: "#196F3D" }}>FRESH MENU EVERY WEEK</h3>
              <h5>
                Organic. Seasonal. Local. Every week try something new. Your
                taste buds will thank you.{" "}
              </h5>
              <Grid>
                <Cell col={4}>
                  <img
                    class="img-fluid"
                    style={{ width: "80%", height: "60%" }}
                    src={IMG4}
                    alt=""
                  />
                  <h5>RAINBOW SALAD</h5>
                  <Cell col={10}>
                    <p>
                      All the colors for all the nutrients! This salad is
                      perfect for a lunch on the go. With delicious, freshly
                      made cilantro lime hummus, pickled onions, quinoa, and a
                      fresh serving of greens, this salad has all the essential
                      nutrients to keep you firing all day.
                    </p>
                  </Cell>
                </Cell>
                <Cell col={4}>
                  <img
                    class="img-fluid"
                    style={{ width: "80%", height: "60%" }}
                    src={IMG5}
                    alt=""
                  />
                  <h5>BBQ CHICKPEA SALAD</h5>
                  <Cell col={10}>
                    <p>
                      Southern, smoky, spiced chickpeas smothered in the worlds
                      best BBQ Sauce. You'll want to order this when it comes on
                      the menu, trust me.
                    </p>
                  </Cell>
                </Cell>
                <Cell col={4}>
                  <img
                    class="img-fluid"
                    style={{ width: "80%", height: "60%" }}
                    src={IMG6}
                    alt=""
                  />
                  <h5>BLUEBERRY COCONUT OATS</h5>
                  <Cell col={10}>
                    <p>
                      Say hello to your new favorite breakfast. Eat in the car
                      or steal bites between emails. Fresh blueberries, coconut
                      cream, chia seeds and rolled oats. This meal has the
                      antioxidants, healthy fats and fiber to kickstart your
                      day.
                    </p>
                  </Cell>
                </Cell>
              </Grid>
              <br></br>
              <button
                type="button"
                class="btn1 btn1-primary"
                style={{
                  marginTop: "10px",
                  color: "white",
                  size: "10px",
                  fontSize: "20px"
                }}
              >
                BROWSE OUR MENU
              </button>
            </div>
            <br></br>
            <br></br>
            <div class="container">
              <Grid>
                <Cell col={8}>
                  <h3>The Healthiest Fast-Food in Austin</h3>

                  <Container>
                    <Row style={{ fontSize: "20px", color: "#888785" }}>
                      <Col>Time</Col>
                      <Col>Delicious</Col>
                    </Row>
                    <Row
                      style={{
                        fontSize: "13px",
                        color: "black",
                        lineHeight: "20px",
                        color: "#888785"
                      }}
                    >
                      <Col>
                        Save time and enjoy healthy meals made with real whole
                        foods. You don't have to sacrifice health for
                        convenience anymore.
                      </Col>
                      <Col>
                        New season means new ingredients. Eat exciting new
                        dishes every week based on what is in season and growing
                        in Texas farms.
                      </Col>
                    </Row>
                    <br></br>
                    <Row style={{ fontSize: "20px", color: "#888785" }}>
                      <Col>Healthy</Col>
                      <Col>Zero Waste</Col>
                    </Row>

                    <Row
                      style={{
                        fontSize: "13px",
                        color: "black",
                        lineHeight: "20px",
                        color: "#888785"
                      }}
                    >
                      <Col>
                        100% organic, plant-based ingredients. No chemicals,
                        antibiotics, or preservatives. All meals are
                        gluten-free.
                      </Col>
                      <Col>
                        Reusable jars and delivery bags means we save thousands
                        of plastic containers every week. Zero plastic throw
                        away when you order PTYD.
                      </Col>
                    </Row>
                    <br></br>
                    <button
                      type="button"
                      class="btn1 btn1-primary"
                      style={{
                        marginTop: "10px",
                        color: "white",
                        size: "10px",
                        fontSize: "20px"
                      }}
                    >
                      BROWSE OUR MENU
                    </button>
                  </Container>
                </Cell>
                <Cell col={4}>
                  <img
                    class="img-fluid"
                    style={{ width: "80%", height: "100%" }}
                    src={IMG7}
                    alt=""
                  />
                </Cell>
              </Grid>
            </div>
            <br></br>
            <br></br>
            <div class="container">
              <h3>What Prepsters love about us...</h3>
            </div>
          </h3>
        </section>
      </div>
    );
  }
}

export default Landing;
