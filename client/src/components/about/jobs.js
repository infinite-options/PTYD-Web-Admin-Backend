import React, { Component } from "react";
import { Card, CardDeck } from "react-bootstrap";

class Jobs extends Component {
  render() {
    return (
      <section class="content-section">
        <div class="container font2">
          <center>
            <CardDeck style={{ margin:"40px 0" }}>
              <Card
                style={{
                  boxShadow: "0px 5px 32px 4px rgba(0,0,0,0.3)"
                }}
              >
                {" "}
                <Card.Body>
                  <br />
                  <br />
                  <br />
                  <Card.Title style={{ fontSize: "20px" }}>
                    <b>Why PTYD?</b>
                    <hr class="two" />
                  </Card.Title>
                  <Card.Text style={{ fontSize: "15px" }}>
                    <br />
                    Our priority:
                    <br />
                    <br />
                    People, Profit, Purpose.
                    <br />
                    <br />
                    Employee Benefits: <br />
                    - Affordable Insurance
                    <br />
                    - Health, Vision, Dental
                    <br />
                    <br />
                    ​ Growth Opportunities ​<br />
                    <br />
                    Top Quality Meals ​<br />
                    <br />
                    We take care of our team.
                  </Card.Text>{" "}
                  <br />
                  <br />
                  <br />
                </Card.Body>
              </Card>
              <Card
                style={{
                  boxShadow: "0px 5px 32px 4px rgba(0,0,0,0.3)"
                }}
              >
                {" "}
                <Card.Body>
                  <br />
                  <br />
                  <br />
                  <Card.Title style={{ fontSize: "20px" }}>
                    <b>Hiring</b>
                    <hr class="two" />
                  </Card.Title>
                  <Card.Text style={{ fontSize: "15px" }}>
                    <br />
                    <br />
                    <br />
                    Delivery Drivers
                    <br />
                    <br />
                    Sous Chef
                    <br />
                    <br />
                    ​Prep Cook​
                    <br />
                    <br />
                    Sales Associate​
                    <br />
                    <br />
                    Events
                  </Card.Text>{" "}
                  <br />
                  <br />
                  <br />
                </Card.Body>
              </Card>{" "}
              <Card
                style={{
                  boxShadow: "0px 5px 32px 4px rgba(0,0,0,0.3)"
                }}
              >
                {" "}
                <Card.Body>
                  <br />
                  <br />
                  <br />
                  <Card.Title style={{ fontSize: "20px" }}>
                    <b>Apply</b>
                    <hr class="two" />
                  </Card.Title>
                  <Card.Text style={{ fontSize: "15px" }}>
                    <br />
                    Send your resume to:
                    <br />
                    <br />
                    frazier@preptoyourdoor.com
                    <br />
                    <br />
                    Include:
                    <br />
                    <br />
                    <br />
                    ​ A bit about yourself ​<br />
                    <br />
                    Updated resume ​<br />
                    <br />
                    Position of interest
                  </Card.Text>{" "}
                  <br />
                  <br />
                  <br />
                </Card.Body>
              </Card>
            </CardDeck>

          </center>
        </div>
      </section>
    );
  }
}

export default Jobs;
