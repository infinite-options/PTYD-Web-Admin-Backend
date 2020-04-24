import React, { Component } from "react";
import { Grid, Cell } from "react-mdl";
import IMG8 from "../../img/img8.jpeg";
import MealButton from "./meal-button";
import {
  ButtonToolbar,
  Button,
  Modal,
  Card,
  Form,
  Row,
  Col
} from "react-bootstrap";
import Tooltip from "@material-ui/core/Tooltip";

class MakeChanges extends Component {
  constructor(props) {
    super(props);
    this.state = {
      modalShow: false
    };
  }
  handleChange = event => {
    this.setState({ event });
  };
  handleChange = event => {
    //get new dropdown value
    let x = this.state.datekeys[event.target.value];
    let len = this.state.createMenu[x].length;
    let tempSelectionOfDropMenu = new Array(len).fill(0);
    let initArr = this.state.createMenu[x];
    for (let i = 0; i < len; i++) {
      tempSelectionOfDropMenu[i] = this.state.mealMap[initArr[i]["Meal_Name"]];
    }

    this.setState({
      selection: event.target.value,
      selectionOfDropMenu: tempSelectionOfDropMenu
    });
  };
  MakeChangesAnimation = () => {
    console.log("test1");
    return (
      <ButtonToolbar>
        <button
          type="button"
          class="btn2 btn2-primary font4"
          style={{
            marginTop: "10px",
            paddingLeft: "10px",
            paddingRight: "10px",
            paddingTop: "5px",
            paddingBottom: "5px",
            color: "white",
            fontSize: "12px"
          }}
          onClick={() => {
            this.setState({ modalShow: true });
          }}
        >
          Make Account Changes
        </button>

        {this.state.modalShow ? this.MakeChangesModal() : <div />}
      </ButtonToolbar>
    );
  };
  MakeChangesModal = () => {
    console.log("test2");
    return (
      <Modal
        show={this.state.modalShow}
        onHide={() => this.setState({ modalShow: false })}
        size="lg"
        aria-labelledby="contained-modal-title-vcenter"
        centered
      >
        <Modal.Header closeButton>
          <Modal.Title id="contained-modal-title-vcenter">
            Edit Profile
          </Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <div class="scrollMenu-profile">
            <h5 style={{ marginTop: "0" }}>Subscription Details</h5>
            <Form>
              <Form.Row>
                <Form.Group
                  as={Col}
                  md={6}
                  controlId="formGridCardSubscription"
                >
                  <Form.Label>My Subscription</Form.Label>

                  <Form.Control
                    as="select"
                    name="cc_exp_month"
                    value={this.props.subscription}
                  >
                    {console.log("tyler is here", this.props.paymentplan)}
                    {this.props.paymentplan.map(paymentPlan => (
                      <option>
                        {paymentPlan.meal_plan_desc
                          .concat(":  $")
                          .concat(paymentPlan.meal_plan_price)}
                      </option>
                    ))}
                  </Form.Control>
                </Form.Group>
                {/* <Form.Group as={Col} md={6} controlId="formGridCardPayment">
                  <Form.Label>Payment Plan</Form.Label>
                  <Form.Control
                    as="select"
                    name="cc_exp_month"
                    value={this.props.payment_plan}
                  >
                    <option>Choose...</option>
                    <option>Weekly</option>
                    <option>Bi-Weekly</option>
                    <option>Monthly</option>
                  </Form.Control>
                </Form.Group> */}
              </Form.Row>
              <h5>Credit Card Details</h5>
              <Form.Row>
                <Form.Group as={Col} md={6} controlId="formGridCardNumber">
                  <Form.Label>Credit Card Number</Form.Label>
                  <Form.Control
                    placeholder="Enter Card Number"
                    name="cc_num"
                    value={this.props.cc_num}
                  />
                </Form.Group>
              </Form.Row>

              <Form.Row>
                <Form.Group as={Col} md={4} controlId="formGridCardCvc">
                  <Form.Label>CVC</Form.Label>
                  <Form.Control
                    placeholder="123"
                    name="cc_cvv"
                    value={this.props.cc_cvv}
                  />
                </Form.Group>

                <Form.Group as={Col} md={4} controlId="formGridCardMonth">
                  <Form.Label>Month</Form.Label>
                  <Form.Control as="select" name="cc_exp_month">
                    <option>Choose...</option>
                    <option>01</option>
                    <option>02</option>
                    <option>03</option>
                    <option>04</option>
                    <option>05</option>
                    <option>06</option>
                    <option>07</option>
                    <option>08</option>
                    <option>09</option>
                    <option>10</option>
                    <option>11</option>
                    <option>12</option>
                  </Form.Control>
                </Form.Group>

                <Form.Group as={Col} md={4} controlId="formGridCardYear">
                  <Form.Label>Year</Form.Label>
                  <Form.Control as="select" name="cc_exp_year">
                    <option>Choose...</option>
                    <option>2020</option>
                    <option>2021</option>
                    <option>2022</option>
                    <option>2023</option>
                    <option>2024</option>
                    <option>2025</option>
                    <option>2026</option>
                    <option>2027</option>
                    <option>2028</option>
                    <option>2029</option>
                  </Form.Control>
                </Form.Group>
              </Form.Row>
              <h5>Delivery Details</h5>
              <Form.Group controlId="formGridAddress">
                <Form.Label>Address</Form.Label>
                <Form.Control
                  placeholder="1234 Main St"
                  name="delivery_address"
                  value={this.props.delivery_address}
                />
              </Form.Group>

              <Form.Group
                as={Col}
                md={4}
                Style="margin-left:-15px;"
                controlId="formGridAptNum"
                value={this.props.delivery_address_unit}
              >
                <Form.Label>
                  Apartment/Unit <b>(Optional)</b>
                </Form.Label>
                <Form.Control
                  placeholder="Apartment, studio, or floor"
                  name="delivery_address_unit"
                />
              </Form.Group>

              <Form.Row>
                <Form.Group as={Col} controlId="formGridCity">
                  <Form.Label>City</Form.Label>
                  <Form.Control
                    placeholder="Prep City"
                    name="delivery_city"
                    value={this.props.delivery_city}
                  />
                </Form.Group>

                <Form.Group as={Col} controlId="formGridState">
                  <Form.Label>State</Form.Label>
                  <Form.Control
                    as="select"
                    name="delivery_state"
                    value={this.props.delivery_state}
                  >
                    <option>Choose...</option>
                    <option>TX</option>
                  </Form.Control>
                </Form.Group>

                <Form.Group as={Col} controlId="formGridZip">
                  <Form.Label>Zip</Form.Label>
                  <Form.Control
                    placeholder="12345"
                    name="delivery_zip"
                    value={this.props.delivery_zip}
                  />
                </Form.Group>
              </Form.Row>
              <Form.Group controlId="exampleForm.ControlTextarea1">
                <Form.Label>Instructions</Form.Label>
                <Form.Control
                  as="textarea"
                  rows="1"
                  value={this.props.delivery_instructions}
                />
              </Form.Group>
              <Tooltip
                title="This will permanently delete your subscription"
                placement="right"
              >
                <Button
                  variant="danger"
                  type="submit"
                  style={{ float: "left" }}
                  onClick={() => {
                    alert("You have successfully deleted your subscription");
                    return;
                  }}
                >
                  Delete My Subscription
                </Button>
              </Tooltip>

              <br />
              <br />
            </Form>

            {/* {this.props.subscription} */}
          </div>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="success" type="submit">
            Save Changes
          </Button>
          <Button
            variant="light"
            onClick={() => {
              this.setState({ modalShow: false });
            }}
          >
            Close
          </Button>
        </Modal.Footer>
      </Modal>
    );
  };
  render() {
    // if (this.props.subscription == null) {
    //   return <div />;
    // }
    return this.MakeChangesAnimation();
  }
}

export default MakeChanges;
