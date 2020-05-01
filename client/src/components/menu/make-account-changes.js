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
      modalShow: false,
      changes: {}
    };
    console.log("printing url", this.props.DELETE_URL);
  }
  handleChange = event => {
    const target = event.target;
    const name = target.name;
    console.log("handle change", target.value);
    console.log("name", name);
    this.setState(
      prevState => ({
        changes: {
          ...prevState.changes,
          [name]: target.value
        }
      }),
      () => {
        console.log("after set state", this.state.changes);
      }
    );
  };
  componentDidMount() {
    this.setState({
      changes: this.props
    });
  }
  componentWillReceiveProps(nextProps) {
    if (nextProps !== this.props) {
      // nextProps.myProp has a different value than our current prop
      console.log("new update" + nextProps + " old: " + this.props);
      // let temp = JSON.parse(JSON.stringify(nextProps));
      // temp.subscription = nextProps.subscription
      //   .concat(":  $")
      //   .concat(nextProps.meal_plan_price);

      this.setState({
        changes: nextProps
      });
    }
  }
  // post_subscription = () => {
  //   fetch(`${this.props.PURCHASE_API_URL}/${this.props.purchase_id}`, {
  //     method: "POST",
  //     headers: {
  //       Accept: "application/json",
  //       "Content-Type": "application/json"
  //     },
  //     body: JSON.stringify({
  //       subscription:this.props.subscription,
  //                 paymentplan:this.props.paymentplan,
  //                 payment_plan:this.props.payment_plan,
  //                 cc_num:this.props.cc_num,
  //                 cc_exp_date:this.props.cc_exp_date,
  //                 cc_cvv:this.props.cc_cvv,
  //                 delivery_address:this.props.delivery_address,
  //                 delivery_address_unit:
  //                   this.props.delivery_address_unit,

  //                 delivery_city:this.props.delivery_city,
  //                 delivery_state:this.props.delivery_state,
  //                 delivery_zip:this.props.delivery_zip,
  //                 delivery_instructions:
  //                   this.props.delivery_instructions,

  //                 purchase_id:this.props.purchase_id

  //     })
  //   });
  // };

  async delete_subscription() {
    console.log("its deleting");
    const test = await fetch(this.props.DELETE_URL, {
      method: "PATCH",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        purchase_id: this.props.purchase_id
      })
    });
    console.log(test);
  }
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
                  {this.state.changes.subscription
                    .concat(":  $")
                    .concat(this.state.changes.meal_plan_price)}
                  <Form.Control
                    as="select"
                    name="subscription"
                    value={this.state.changes.subscription}
                    onChange={this.handleChange}
                  >
                    {this.state.changes.paymentplan.map(paymentPlan => (
                      <option>{paymentPlan.meal_plan_desc}</option>
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
                    value={this.state.changes.cc_num}
                    onChange={this.handleChange}
                  />
                </Form.Group>
              </Form.Row>

              <Form.Row>
                <Form.Group as={Col} md={4} controlId="formGridCardCvc">
                  <Form.Label>CVV</Form.Label>
                  <Form.Control
                    placeholder="123"
                    name="cc_cvv"
                    value={this.state.changes.cc_cvv}
                    onChange={this.handleChange}
                  />
                </Form.Group>

                <Form.Group as={Col} md={4} controlId="formGridCardMonth">
                  <Form.Label>Month</Form.Label>
                  {this.state.changes.cc_exp_date}
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
                  value={this.state.changes.delivery_address}
                  onChange={this.handleChange}
                />
              </Form.Group>

              <Form.Group
                as={Col}
                md={4}
                Style="margin-left:-15px;"
                controlId="formGridAptNum"
                value={this.state.changes.delivery_address_unit}
                onChange={this.handleChange}
              >
                <Form.Label>
                  Apartment/Unit <b>(Optional)</b>
                </Form.Label>
                <Form.Control
                  placeholder="Apartment, studio, or floor"
                  name="delivery_address_unit"
                  value={this.state.changes.delivery_address_unit}
                  onChange={this.handleChange}
                />
              </Form.Group>

              <Form.Row>
                <Form.Group as={Col} controlId="formGridCity">
                  <Form.Label>City</Form.Label>
                  <Form.Control
                    placeholder="Prep City"
                    name="delivery_city"
                    value={this.state.changes.delivery_city}
                    onChange={this.handleChange}
                  />
                </Form.Group>

                <Form.Group as={Col} controlId="formGridState">
                  <Form.Label>State</Form.Label>
                  <Form.Control
                    as="select"
                    name="delivery_state"
                    value={this.state.changes.delivery_state}
                    onChange={this.handleChange}
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
                    value={this.state.changes.delivery_zip}
                    onChange={this.handleChange}
                  />
                </Form.Group>
              </Form.Row>
              <Form.Group controlId="exampleForm.ControlTextarea1">
                <Form.Label>Instructions</Form.Label>
                <Form.Control
                  as="textarea"
                  rows="1"
                  value={this.state.changes.delivery_instructions}
                  onChange={this.handleChange}
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
                    this.delete_subscription();
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
    console.log("state changes", this.state.changes);
    return this.MakeChangesAnimation();
  }
}

export default MakeChanges;
