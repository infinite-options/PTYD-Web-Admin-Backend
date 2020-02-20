import React, { Component } from "react";
import { Grid, Cell, Center } from "react-mdl";
import IMG8 from "../img/img8.jpeg";
import HEATHER from "../img/heather.png";
import FAIEZ from "../img/faiez.png";
import MICHAEL from "../img/Michael.png";
import KAYLA from "../img/Kayla.png";
import MAURICE from "../img/Maurice.png";
import ANNA from "../img/Anna.png";
import THOMAS from "../img/Thomas.png";
import JUSTIN from "../img/Justin.png";
import COMPANY from "../img/company.png";

class Ourstory extends Component {
  render() {
    return (
      <div>
        <div class="container font2" style={{ color: "white" }}>
          <Grid>
            <Cell
              col={5}
              style={{ fontSize: "15px", color: "#888785", lineHeight: "55px" }}
            >
              <h3 class="font1" style={{ color: "#196F3D" }}>
                Our Story
              </h3>
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

              {/* <video width="500" controls>
                <source src="mov_bbb.mp4" type="video/mp4" />
                <source src="mov_bbb.ogg" type="video/ogg" />
                Your browser does not support HTML5 video.
              </video> */}
              <iframe
                width="560"
                height="315"
                src="https://www.youtube.com/embed/3bKhzWKc1Xw"
                frameborder="0"
                allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen
              ></iframe>
              <br />
              <br />
              <Cell col={10}>
                <center>
                  {/* <p
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
                  </p> */}
                </center>
              </Cell>
            </Cell>
          </Grid>
        </div>{" "}
        <div class="container" style={{ color: "#196F3D" }}>
          <br />
          <br />
          <center>
            <hr class="one-half" />
            <h3 class="font1"> Our Team</h3>
            <h5 class="font1">
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
                    src={HEATHER}
                    alt="Avatar"
                  ></img>
                  <br />
                  <h6 class="font2">
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
                    src={FAIEZ}
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
                    src={MICHAEL}
                    alt="Avatar"
                  ></img>
                  <br />
                  <h6 class="font2">
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
                    src={KAYLA}
                    alt="Avatar"
                  ></img>
                  <br />
                  <h6 class="font2">
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
                    src={MAURICE}
                    alt="Avatar"
                  ></img>
                  <h6 class="font2">
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
                    src={ANNA}
                    alt="Avatar"
                  ></img>
                  <br />
                  <h6 class="font2">
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
                    src={THOMAS}
                    alt="Avatar"
                  ></img>
                  <br />
                  <h6 class="font2">
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
                    src={JUSTIN}
                    alt="Avatar"
                  ></img>
                  <br />
                  <h6 class="font2">
                    Justin
                    <br />
                    Digital Marketing
                  </h6>
                </Cell>
              </Grid>
              <div style={{ color: "#196F3D" }}>
                <h5 class="font1">
                  <b>Interested in working with us?</b>
                </h5>
                <h5 class="font1">
                  Tell us about yourself! We hire people, not positions.
                </h5>
              </div>
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
                Apply Today
              </button>
              <br />
              <br />
            </div>
            <hr class="one" />
            <br />
            <br />
            <h5 class="font1">A special thanks to these “team members” too!</h5>
            <br />
            <img
              class="img-fluid"
              style={{ width: "60%", height: "30%" }}
              src={COMPANY}
              alt=""
            />
          </center>
        </div>
      </div>
    );
  }
}

export default Ourstory;
