import React, { Component } from "react";
import IMG3 from "../img/img3.jpg";
import IMG7 from "../img/img7.jpg";
import IMG8 from "../img/img8.jpeg";
import HOW1 from "../img/how1.png";
import HOW2 from "../img/how2.png";
import HOW3 from "../img/how3.png";
import HOW4 from "../img/how4.png";
import TEMP from "../img/temp.jpg";
import HUMAN1 from "../img/human1.png";
import HUMAN2 from "../img/human2.png";
import HUMAN3 from "../img/human3.png";
import { Row, Col, Card, CardColumns } from "react-bootstrap";
import { Grid, Cell } from "react-mdl";

class Howitworks extends Component {
  render() {
    return (
      <div>
        <img
          class="img-fluid"
          style={{ width: "100%", height: "400px" }}
          src={HOW1}
          alt=""
        />
        {/* <div
          class="container top-center"
          style={{
            fontSize: "35px",
            textShadow: "2px 2px 4px #FFEFB0",
            lineHeight: "50px",
            color: "white"
          }}
        >
          Save time. Eat healthy.<br></br>Fresh meals to your door every week.
        </div> */}
        <br />
        <br />
        <br />
        <br />
        <br />
        <div class="container font2" style={{ color: "white" }}>
          <Row style={{ fontSize: "20px", color: "#888785" }}>
            <Col>
              <b>Build your subscription</b>
            </Col>
            <Col>
              <b>Delivered to your door</b>
            </Col>
            <Col>
              <b>Change Anytime</b>
            </Col>
          </Row>
          <br />
          <Row style={{ fontSize: "15px", color: "#888785" }}>
            <Col>
              Order 5, 10, or 20 meals each week. Customize your order from 6
              new recipes every week.
            </Col>
            <Col>
              We deliver in Austin, Texas to your home or office. Delivery times
              are Sunday 6pm-9pm, and Monday 9am-1pm.
            </Col>
            <Col>
              Prep to Your Door is flexible. You can modify, skip, or cancel
              your plan at any time with no commitment.
            </Col>
          </Row>
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
          <Grid>
            <Cell
              col={7}
              style={{ fontSize: "15px", color: "#888785", lineHeight: "55px" }}
            >
              <Cell col={7}>
                <br />

                <p>
                  Prep to Your Door is here to serve you. Every week, our team
                  creates a delicious new menu packed with the highest quality
                  ingredients, from local Texas farms. All meals are 100%
                  organic, gluten-free, and plant-based.
                </p>
              </Cell>
            </Cell>
            <Cell col={5}>
              <img
                class="img-fluid"
                style={{ width: "100%", height: "100%" }}
                src={HOW2}
                alt=""
              />
            </Cell>
          </Grid>
          <br />
          <br />
          <br />
          <br />
          <Grid>
            <Cell col={5}>
              <img
                class="img-fluid"
                style={{ width: "100%", height: "100%" }}
                src={HOW3}
                alt=""
              />
            </Cell>
            <Cell col={7} style={{ color: "black", lineHeight: "55px" }}>
              <h4 class="font2" style={{ color: "#4D4D4D" }}>
                Customize Your Plan
              </h4>
              <p>
                Choose which meals you need and how often you need them. Meals
                start at just $11.99.
              </p>
              <hr class="three" />
              <Row style={{ color: "black", lineHeight: "55px" }}>
                <Col>
                  <b>Which meals do you offer?</b>
                </Col>
                <Col>
                  <b>How does the plan work?</b>
                </Col>
              </Row>
              <Row style={{ color: "black", lineHeight: "55px" }}>
                <Col>
                  <p style={{ color: "#888785", lineHeight: "20px" }}>
                    Each week we make 2 soups, 2 salads, 1 breakfast, and 1
                    specialty meal. Some will stick around for the season and a
                    few will change every week.
                  </p>
                </Col>
                <Col>
                  <p style={{ color: "#888785", lineHeight: "20px" }}>
                    We believe that health is a lifestyle, and for that reason,
                    our plans are subscriptions. If you place an order this
                    week, your first delivery will arrive next week. Your
                    subscription can be changed, paused or cancelled at any time
                    - you are never locked in.
                  </p>
                </Col>
              </Row>
              <Row style={{ color: "black", lineHeight: "55px" }}>
                <Col>
                  <b>Can I pick which meals I receive?</b>
                </Col>
                <Col>
                  <b>How much does it cost?</b>
                </Col>
              </Row>
              <Row style={{ color: "black", lineHeight: "55px" }}>
                <Col>
                  <p style={{ color: "#888785", lineHeight: "20px" }}>
                    Yes. You are able to choose your meals with our
                    customization feature. Once you've selected your base plan
                    (for example: 10 meals weekly), you can to select your
                    favorite meals of the week.
                  </p>
                </Col>
                <Col>
                  <p style={{ color: "#888785", lineHeight: "20px" }}>
                    The more meals you purchase, the less each meal costs. Start
                    the ordering process here.
                  </p>
                </Col>
              </Row>
            </Cell>
          </Grid>
          <br />
          <br />
          <br />
          <Grid>
            <Cell
              col={7}
              style={{ fontSize: "15px", color: "#888785", lineHeight: "55px" }}
            >
              <Cell col={11}>
                <h4 class="font2" style={{ color: "black" }}>
                  Delivery
                </h4>
                <h6 class="font2">
                  Our delivery experience is seamless. Fresh ready-to-eat food
                  will arrive on your doorstep each week.
                </h6>
                <hr class="three" />
                <h5 class="font2" style={{ color: "black", lineHeight: "5px" }}>
                  Where We Deliver
                </h5>
                <h6 class="font2">
                  Right now we are only delivering to Greater Austin, TX
                </h6>
                <h5 class="font2" style={{ color: "black", lineHeight: "5px" }}>
                  What time?
                </h5>
                <h6 class="font2">
                  Current delivery times are Sunday between 6-9pm and Monday
                  9am-1pm.{" "}
                </h6>
                <h5 class="font2" style={{ color: "black", lineHeight: "5px" }}>
                  What if I'm not home?
                </h5>
                <h6 class="font2">
                  No worries. Our bags are insulated and keep food fresh for
                  several hours. We will send you text updates before, during,
                  and upon delivery.
                </h6>
                <h5 class="font2" style={{ color: "black", lineHeight: "5px" }}>
                  Do you deliver in my area?
                </h5>
                <h6 class="font2">
                  Round Rock, Georgetown, Pflugerville, San Marcos, the more of
                  you who show interest the quicker we can service y'all. Send
                  us a message!
                </h6>
              </Cell>
            </Cell>
            <Cell col={5}>
              <img
                class="img-fluid"
                style={{ width: "100%", height: "100%" }}
                src={HOW4}
                alt=""
              />
            </Cell>
          </Grid>
          <br />
          <br />
          <div class="container font2">
            <h3 class="font2">What Prepsters love about us...</h3>
            <CardColumns>
              <Card className="p-3">
                <p>
                  Healthy, delicious, and delivered to your door at an
                  affordable price. Hard to beat. As a bonus, the jars are
                  eco-friendly. I can't wait to see PTYD expand.
                </p>
                <br />
                <br />
                <Grid>
                  <Cell col={3}>
                    <img
                      style={{
                        borderRadius: "50%",
                        width: "60px",
                        height: "60px",
                        marginTop: "10px"
                      }}
                      src={HUMAN1}
                      alt="Avatar"
                    ></img>
                  </Cell>
                  <Cell col={7}>
                    <h5 class="font2">Veronica</h5>
                    <p>UX Designer</p>
                  </Cell>
                </Grid>
              </Card>
              <Card className="p-3">
                <p>
                  Best meal prep service we've ever used. The food is fresh,
                  organic, dairy and meat free. When you love food as much as my
                  husband and I do, you appreciate having consistent meals
                  throughout the week that are the definition of clean.
                </p>
                <br />
                <Grid>
                  <Cell col={3}>
                    <img
                      style={{
                        borderRadius: "50%",
                        width: "60px",
                        height: "60px",
                        marginTop: "10px"
                      }}
                      src={HUMAN2}
                      alt="Avatar"
                    ></img>
                  </Cell>
                  <Cell col={7}>
                    <h5>Luke</h5>
                    <p>Tech</p>
                  </Cell>
                </Grid>
              </Card>
              <Card className="p-3">
                <p>
                  These meals are delicious, healthy, and make life SO easy and
                  enjoyable! The team is great with customer service if I ever
                  have any questions. I don't think I've ever had a meal I
                  didn't like!
                </p>
                <br />
                <br />
                <Grid>
                  <Cell col={3}>
                    <img
                      style={{
                        borderRadius: "50%",
                        width: "60px",
                        height: "60px",
                        marginTop: "10px"
                      }}
                      src={HUMAN3}
                      alt="Avatar"
                    ></img>
                  </Cell>
                  <Cell col={7}>
                    <h5 class="font2">Courtney</h5>
                    <p>Fitness Designer</p>
                  </Cell>
                </Grid>
              </Card>
            </CardColumns>
            <br />
            <button
              type="button"
              class="btn1 btn1-primary font4"
              style={{
                marginTop: "10px",
                paddingTop: "10px",
                paddingBottom: "10px",
                color: "white",
                size: "10px",
                fontSize: "17px"
              }}
            >
              TRY US TODAY
            </button>
            <br />
            <Grid>
              <center>
                <Cell col={8}>
                  <h3 class="font2" style={{ lineHeight: "50px" }}>
                    "PTYD is so good and we love it so much, it feels like part
                    of our family! It's so thrilling to fill our fridge every
                    week with tasty surprises!"
                  </h3>
                  <br />
                </Cell>{" "}
                <div style={{ backgroundColor: "black" }}>
                  <br />
                  <br />
                  <br />
                  <br />
                  <br />
                </div>
                <br />
              </center>
            </Grid>
            <br />
          </div>
        </div>
      </div>
    );
  }
}

export default Howitworks;
