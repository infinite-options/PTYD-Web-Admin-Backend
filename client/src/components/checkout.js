import React, { Component } from "react";
import { Button, Card, CardDeck, Form, Row, Col, Container } from "react-bootstrap";
import TruckIcon from "../img/prepTruckIcon.png";

class Checkout extends Component {
  render() {

    return (
      <Container>
        <Row>
          <Col md={4}>
            <div class="justify-content-md-center">
              <img src={TruckIcon}
                style={{ height: "75%", width: "75%"}}
                alt="Delivery Truck Icon"
              />
            </div>
            <h3>Order Summary</h3>
            <div id="cart">
              <p>{this.props.location.item.name}</p>
            </div>
            <hr/>
            <p>Estimated Shipping - $15.00</p>
            <p>Estimated Tax - ${(this.props.location.item.total * 0.075).toFixed(2)}</p>
            <hr/>
            <h3>Total - ${((this.props.location.item.total * 1.075) + 15.00).toFixed(2)}</h3>
            <Form>
              <Form.Row>
                <Form.Group as={Col} md={8} controlId="formGridCouponCode">
                  <Form.Label>Coupon/Gift Code</Form.Label>
                  <Form.Control placeholder="Secret Passcode"/>
                </Form.Group>

                <Button variant="success" size="sm" Style="height:30px; margin-top:30px;" type="submit">
                  Checkout
                </Button>
              </Form.Row>
            </Form>
          </Col>
          <Col Style="margin-top:-50px;">
            <h5>Delivery Address</h5>
            <Form>
              <Form.Row>
                <Form.Group as={Col} controlId="formGridFirstName">
                  <Form.Label>First Name</Form.Label>
                  <Form.Control type="email" placeholder="Enter First Name" />
                </Form.Group>

                <Form.Group as={Col} controlId="formGridLastName">
                  <Form.Label>Last Name</Form.Label>
                  <Form.Control type="password" placeholder="Enter Last Name" />
                </Form.Group>
              </Form.Row>

              <Form.Group controlId="formGridNotes">
                <Form.Label>Delivery Notes</Form.Label>
                <Form.Control placeholder="Enter Notes or N/A" />
              </Form.Group>

              <Form.Row>
                <Form.Group as={Col} controlId="formGridEmail">
                  <Form.Label>Email</Form.Label>
                  <Form.Control type="email" placeholder="Enter Email" />
                </Form.Group>

                <Form.Group as={Col} controlId="formGridPassword">
                  <Form.Label>Password</Form.Label>
                  <Form.Control type="password" placeholder="Enter Password" />
                </Form.Group>
              </Form.Row>

              <Form.Group controlId="formGridAddress">
                <Form.Label>Address</Form.Label>
                <Form.Control placeholder="1234 Main St" />
              </Form.Group>

              <Form.Group as={Col} md={4} Style="margin-left:-15px;" controlId="formGridAptNum">
                <Form.Label>Apartment/Unit <b>(Optional)</b></Form.Label>
                <Form.Control placeholder="Apartment, studio, or floor" />
              </Form.Group>

              <Form.Row>
                <Form.Group as={Col} controlId="formGridCity">
                  <Form.Label>City</Form.Label>
                  <Form.Control placeholder="Prep City"/>
                </Form.Group>

                <Form.Group as={Col} controlId="formGridState">
                  <Form.Label>State</Form.Label>
                  <Form.Control as="select">
                    <option>Choose...</option>
                    <option>Texas</option>
                  </Form.Control>
                </Form.Group>

                <Form.Group as={Col} controlId="formGridZip">
                  <Form.Label>Zip</Form.Label>
                  <Form.Control placeholder="12345"/>
                </Form.Group>
              </Form.Row>

              <Form.Group as={Col} md={6} Style="margin-left:-15px;" controlId="formGridCountry">
                <Form.Label>Country</Form.Label>
                <Form.Control as="select">
                  <option>Choose...</option>
                  <option>United States</option>
                </Form.Control>
              </Form.Group>

              <Form.Group controlId="formGridPhoneNumber">
                <Form.Control placeholder="Phone Number" />
              </Form.Group>

              <Form.Group id="formGridCheckbox">
                <Form.Check type="checkbox" label="This is a Gift" />
              </Form.Group>

              <h5>Billing Information</h5>

              <Form.Row>
                <Form.Group as={Col} md={6} controlId="formGridCardNumber">
                  <Form.Label>Credit Card Number</Form.Label>
                  <Form.Control placeholder="Enter Card Number"/>
                </Form.Group>

              </Form.Row>

              <Form.Row>
                <Form.Group as={Col} md={3} controlId="formGridCardCvc">
                  <Form.Label>CVC</Form.Label>
                  <Form.Control placeholder="123"/>
                </Form.Group>

                <Form.Group as={Col} md={3} controlId="formGridCardMonth">
                  <Form.Label>Month</Form.Label>
                  <Form.Control as="select">
                    <option>Choose...</option>
                    <option>01 - Jan</option>
                  </Form.Control>
                </Form.Group>

                <Form.Group as={Col} md={3} controlId="formGridCardYear">
                  <Form.Label>Year</Form.Label>
                  <Form.Control as="select">
                    <option>Choose...</option>
                    <option>2020</option>
                  </Form.Control>
                </Form.Group>
              </Form.Row>

              <Form.Row>
                <Form.Group as={Col} md={4} controlId="formGridBillingZip">
                  <Form.Label>Postal Code</Form.Label>
                  <Form.Control placeholder="12345"/>
                </Form.Group>

                <Form.Group as={Col} controlId="formGridBillingCountry">
                  <Form.Label>Country</Form.Label>
                  <Form.Control as="select">
                    <option>Choose...</option>
                    <option>United States</option>
                  </Form.Control>
                </Form.Group>
              </Form.Row>


              <Button variant="success" type="submit">
                Checkout
              </Button>

            </Form>
            
          </Col>
        </Row>
      </Container>
    );
  }
}

export default Checkout;
