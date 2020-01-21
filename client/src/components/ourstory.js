import React, { Component } from "react";
import { Grid, Cell, Center } from "react-mdl";
import IMG8 from "../img/img8.jpeg";

class Ourstory extends Component {
  render() {
    return (
      <div>
        <div class="container" style={{ color: "white" }}>
          <Grid>
            <Cell
              col={5}
              style={{ fontSize: "15px", color: "#888785", lineHeight: "55px" }}
            >
              <h3 style={{ color: "#196F3D" }}>Our Story</h3>
              <p>
                Our co-founders, Heather and Faiez, met while studying at
                Harvard University. Paired on a group project together, they
                instantly clicked. They studied all day, talked into the night,
                and white boarded countless ideas to change the world.
              </p>
              <p>
                Fast forward 6 months, Prep to Your Door was born. A simple
                elegant solution to a practical problem. Now, as partners in
                life and business, they've focused their energies to create a
                healthier food environment in their home state of Texas.
              </p>
              <p>
                Save people time, serve them healthy food, support local food
                systems, and build a business that respects the environment.
              </p>
              <p>
                ​ We are here to serve mind-blowingly delicious food that is
                good for you, and good for our planet. Send us a message if you
                believe in our mission, we would love to hear from you.
              </p>
            </Cell>
            <Cell col={1}></Cell>
            <Cell
              col={6}
              style={{ fontSize: "15px", color: "#888785", lineHeight: "55px" }}
            >
              <br />
              <br />

              <video width="500" controls>
                <source src="mov_bbb.mp4" type="video/mp4" />
                <source src="mov_bbb.ogg" type="video/ogg" />
                Your browser does not support HTML5 video.
              </video>
              <br />
              <br />
              <Cell col={10}>
                <center>
                  <p
                    style={{
                      fontSize: "10px",
                      color: "#888785",
                      lineHeight: "15px"
                    }}
                  >
                    If you would like to contact either co-founder, you can
                    reach them via their social media channels, or email at{" "}
                    <a>faiez@preptoyourdoor.com</a> or{" "}
                    <a>heather@preptoyourdoor.com.</a>
                  </p>
                </center>
              </Cell>
            </Cell>
          </Grid>
          <br />
          <br />
        </div>{" "}
        <div class="container" style={{ color: "#196F3D" }}>
          <br />
          <br />
          <center>
            <hr class="one" />
            <h3>Our Team</h3>
            <h5>
              People. Purpose. Positivity. We are here to be of service to our
              community.{" "}
            </h5>{" "}
            <div style={{ color: "#888785" }}>
              <Grid>
                <Cell col={4}></Cell>
                <Cell col={2}>
                  <img
                    style={{
                      borderRadius: "50%",
                      width: "150px",
                      height: "150px",
                      marginTop: "10px"
                    }}
                    src={IMG8}
                    alt="Avatar"
                  ></img>
                  <br />
                  <h6>
                    Heather
                    <br />
                    Co-Founder/CEO
                  </h6>
                </Cell>
                <Cell col={2}>
                  <img
                    style={{
                      borderRadius: "50%",
                      width: "150px",
                      height: "150px",
                      marginTop: "10px"
                    }}
                    src={IMG8}
                    alt="Avatar"
                  ></img>
                  <h6>
                    Faiez
                    <br />
                    Co-Founder/CEO
                  </h6>
                </Cell>
                <Cell col={4}></Cell>
                <hr clas="four" />
                {/* second section */}
                <Cell col={2}>
                  <img
                    style={{
                      borderRadius: "50%",
                      width: "100px",
                      height: "100px",
                      marginTop: "10px"
                    }}
                    src={IMG8}
                    alt="Avatar"
                  ></img>
                  <br />
                  <h6>
                    Michael
                    <br />
                    VP of Operations
                  </h6>
                </Cell>
                <Cell col={2}>
                  <img
                    style={{
                      borderRadius: "50%",
                      width: "100px",
                      height: "100px",
                      marginTop: "10px"
                    }}
                    src={IMG8}
                    alt="Avatar"
                  ></img>
                  <br />
                  <h6>
                    Kayla
                    <br />
                    Customer Service
                  </h6>
                </Cell>
                <Cell col={2}>
                  <img
                    style={{
                      borderRadius: "50%",
                      width: "100px",
                      height: "100px",
                      marginTop: "10px"
                    }}
                    src={IMG8}
                    alt="Avatar"
                  ></img>
                  <h6>
                    Maurice
                    <br />
                    Head Chef
                  </h6>
                </Cell>
                <Cell col={2}>
                  <img
                    style={{
                      borderRadius: "50%",
                      width: "100px",
                      height: "100px",
                      marginTop: "10px"
                    }}
                    src={IMG8}
                    alt="Avatar"
                  ></img>
                  <br />
                  <h6>
                    Anna
                    <br />
                    Logistics Manager
                  </h6>
                </Cell>
                <Cell col={2}>
                  <img
                    style={{
                      borderRadius: "50%",
                      width: "100px",
                      height: "100px",
                      marginTop: "10px"
                    }}
                    src={IMG8}
                    alt="Avatar"
                  ></img>
                  <br />
                  <h6>
                    Thomas
                    <br />
                    Content Creator
                  </h6>
                </Cell>
                <Cell col={2}>
                  <img
                    style={{
                      borderRadius: "50%",
                      width: "100px",
                      height: "100px",
                      marginTop: "10px"
                    }}
                    src={IMG8}
                    alt="Avatar"
                  ></img>
                  <br />
                  <h6>
                    Justin
                    <br />
                    Digital Marketing
                  </h6>
                </Cell>
              </Grid>
              <div style={{ color: "#196F3D" }}>
                <h5>Interested in working with us?</h5>
                <h5>Tell us about yourself! We hire people, not positions.</h5>
              </div>
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
                CHOOSE MEALS
              </button>
              <br />
              <br />
            </div>
            <hr class="one" />
            <br />
            <br />
            <h5>A special thanks to these “team members” too!</h5>
            <br />
          </center>
        </div>
      </div>
    );
  }
}

export default Ourstory;
