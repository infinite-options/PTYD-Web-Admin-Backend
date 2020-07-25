import React, { Component } from "react";
import { Carousel } from "react-bootstrap";
import { Grid, Cell } from "react-mdl";
import FINDUS1 from "../img/findus1.png";
import FINDUS2 from "../img/findus2.png";
import FINDUS3 from "../img/findus3.png";
import FINDUS4 from "../img/findus4.png";

class Findus extends Component {
  render() {
    return (
      <section class="content-section">
        <div class="container font2">
          <br/>
          <Grid>
            <Cell col={4}>
              {" "}
              <img
                class="img-fluid"
                style={{
                  width: "80%",
                  height: "60%",
                  stroke: "black",
                  strokeWidth: "5",
                  fillOpacity: "0.1",
                  strokeOpacity: "0.9",
                  boxShadow: "0px 5px 32px 4px rgba(0,0,0,0.3)",
                  maxWidth: "20rem"
                }}
                src={FINDUS1}
                alt=""
              />
              <Cell col={10}>
                <p>
                  Rabbit Food Grocery
                  <br /> 2425 Exposition Blvd Ste A<br /> Austin, TX 78703
                </p>
              </Cell>
            </Cell>

            <Cell col={4}>
              <img
                class="img-fluid"
                style={{
                  width: "80%",
                  height: "60%",
                  stroke: "black",
                  strokeWidth: "5",
                  fillOpacity: "0.1",
                  strokeOpacity: "0.9",
                  boxShadow: "0px 5px 32px 4px rgba(0,0,0,0.3)",
                  maxWidth: "20rem"
                }}
                src={FINDUS2}
                alt=""
              />
              <Cell col={10}>
                <p>
                  Thom's Market Riverside
                  <br />
                  160 E Riverside Dr
                  <br />
                  Austin, TX 78704
                </p>
              </Cell>
            </Cell>
            <Cell col={4}>
              <img
                class="img-fluid"
                style={{
                  width: "80%",
                  height: "60%",
                  stroke: "black",
                  strokeWidth: "5",
                  fillOpacity: "0.1",
                  strokeOpacity: "0.9",
                  boxShadow: "0px 5px 32px 4px rgba(0,0,0,0.3)",
                  maxWidth: "20rem"
                }}
                src={FINDUS3}
                alt=""
              />
              <Cell col={10}>
                <p>
                  Thom's Market Barton Springs
                  <br />
                  1418 Barton Springs Rd
                  <br />
                  Austin, TX 78704
                </p>
              </Cell>
            </Cell>
          </Grid>
          {/* <CardDeck style={{ marginLeft: "90px" }}>
            <Card
              style={{
                maxWidth: "20rem",
                boxShadow: "0px 5px 32px 4px rgba(0,0,0,0.3)"
              }}
            >
              {" "}
              <span class="border border-dark" style={{}}>
                <Card.Img variant="top" src={IMG1} />
              </span>
            </Card>

            <Card
              height="450"
              style={{
                stroke: "black",
                strokeWidth: "5",
                fillOpacity: "0.1",
                strokeOpacity: "0.9",
                boxShadow: "0px 5px 32px 4px rgba(0,0,0,0.3)",
                maxWidth: "20rem"
              }}
            >
              <span class="border border-dark" style={{}}>
                <Card.Img variant="top" src={IMG1} />
              </span>
            </Card>
            <Card
              height="450"
              style={{
                stroke: "black",
                strokeWidth: "5",
                fillOpacity: "0.1",
                strokeOpacity: "0.9",
                boxShadow: "0px 5px 32px 4px rgba(0,0,0,0.3)",
                maxWidth: "20rem"
              }}
            >
              <span class="border border-dark" style={{}}>
                <Card.Img variant="top" src={IMG1} />
              </span>
            </Card>
          </CardDeck>
          <Grid>
            <Cell col={3} style={{ marginLeft: "100px" }}>
              <p>
                Rabbit Food Grocery
                <br /> 2425 Exposition Blvd Ste A<br /> Austin, TX 78703
              </p>
            </Cell>
            <Cell col={3} style={{ marginLeft: "50px" }}>
              <p>
                Thom's Market Riverside
                <br />
                160 E Riverside Dr
                <br />
                Austin, TX 78704
              </p>
            </Cell>
            <Cell col={3} style={{ marginLeft: "50px" }}>
              <p>
                Thom's Market Barton Springs
                <br />
                1418 Barton Springs Rd
                <br />
                Austin, TX 78704
              </p>
            </Cell>
          </Grid> */}
          <br />
          <Carousel>
            <Carousel.Item style={{ height: "500px" }}>
              <img className="d-block w-100" src={FINDUS4} alt="First slide" />
              <Carousel.Caption>
                {/* <h3>Upcoming Events!</h3>
                <h1>NOVEMBER 20</h1>
                <p>
                  JOIN US FOR YOGA
                  <br /> @ BFree Yoga​
                  <br />
                  7-8pm
                </p> */}
              </Carousel.Caption>
            </Carousel.Item>
            <Carousel.Item style={{ height: "500px" }}>
              <img className="d-block w-100" src={FINDUS4} alt="Third slide" />

              <Carousel.Caption>
                <h3>Upcoming Events!</h3>
                <h1>NOVEMBER 20</h1>
                <p>
                  JOIN US FOR YOGA
                  <br /> @ BFree Yoga​
                  <br />
                  7-8pm
                </p>
              </Carousel.Caption>
            </Carousel.Item>
            <Carousel.Item style={{ height: "500px" }}>
              <img className="d-block w-100" src={FINDUS4} alt="Third slide" />

              <Carousel.Caption>
                <h3>Upcoming Events!</h3>
                <h1>NOVEMBER 20</h1>
                <p>
                  JOIN US FOR YOGA
                  <br /> @ BFree Yoga​
                  <br />
                  7-8pm
                </p>
              </Carousel.Caption>
            </Carousel.Item>
          </Carousel>
          <br />
        </div>
      </section>
    );
  }
}

export default Findus;
