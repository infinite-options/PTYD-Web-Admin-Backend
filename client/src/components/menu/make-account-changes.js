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
      changes: props,
      init: 0,
      month: 1
      // new_changed_subscription: changes.subscription
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
    this.setState(
      {
        changes: this.props
        // month: parseInt(
        //   String(this.props.cc_exp_date.split("-")).substring(5, 7)
        // )
      },
      () => {
        console.log("month", this.state.changes);
      }
    );
  }

  componentWillReceiveProps(nextProps) {
    if (nextProps !== this.props) {
      // nextProps.myProp has a different value than our current prop
      console.log("new update" + nextProps + " old: " + this.props);
      let temp = JSON.parse(JSON.stringify(nextProps));
      temp.subscription = nextProps.subscription
        .concat(":  $")
        .concat(nextProps.meal_plan_price);

      this.setState(
        {
          changes: temp,
          month: parseInt(
            String(nextProps.cc_exp_date.split("-")).substring(5, 7)
          )
        },
        () => {
          console.log("nextprops", this.state.month);
        }
      );
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

  async update_subscription() {
    console.log(
      "its updating",
      this.state.changes.meal_plan_id,
      this.props.purchase_id,
      this.state.changes.delivery_address,
      this.state.changes.delivery_address_unit,
      this.state.changes.delivery_city,
      this.state.changes.delivery_state,
      this.state.changes.delivery_zip,
      this.state.changes.delivery_instructions
    );
    // its updating 800-000007 300-000005 1234 Main St null San Jose TX 95129 GFGDG
    // '{"meal_plan_id":"700-000006","purchase_id":"300-000013","delivery_address":"121","delivery_address_unit":"121","delivery_city":"3243","delivery_state":"Texas","delivery_zip":"95130","delivery_instructions":"N/A"}'
    fetch(this.props.UPDATE_URL, {
      method: "PATCH",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        meal_plan_id: this.state.changes.meal_plan_id,
        purchase_id: this.props.purchase_id,
        // cc_num: this.state.changes.cc_num,
        // cc_cvv: this.state.changes.cc_cvv,
        // cc_exp_date: this.state.changes.cc_exp_date,
        delivery_address: this.state.changes.delivery_address,
        deliver_address_unit: this.state.changes.delivery_address_unit,
        delivery_city: this.state.changes.delivery_city,
        delivery_state: this.state.changes.delivery_state,
        delivery_zip: this.state.changes.delivery_zip,
        delivery_instructions: this.state.changes.delivery_instructions
      })
    });
    console.log("DONE UPDATE");
  }

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
                  <Form.Label>Current Subscription</Form.Label>

                  <Form.Control
                    type="text"
                    value={this.state.changes.subscription}
                  />
                </Form.Group>
                <Form.Group as={Col} md={6} controlId="formGridCardPayment">
                  <Form.Label>Change Subscription</Form.Label>
                  <Form.Control
                    as="select"
                    name="subscription"
                    // value={this.state.changes.subscription}
                    onChange={this.handleChange}
                  >
                    <option>Choose...</option>
                    {this.state.changes.paymentplan.map(paymentPlan => (
                      <option>
                        {paymentPlan.meal_plan_desc
                          .concat(":  $")
                          .concat(paymentPlan.meal_plan_price)}
                      </option>
                    ))}
                  </Form.Control>
                </Form.Group>
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

                  <Form.Control
                    as="select"
                    name="cc_exp_month"
                    onChange={event => {
                      this.setState({ month: event.target.value });
                    }}
                    value={this.state.month}
                  >
                    <option>{1}</option>
                    <option>{2}</option>
                    <option>{3}</option>
                    <option>{4}</option>
                    <option>{5}</option>
                    <option>{6}</option>
                    <option>{7}</option>
                    <option>{8}</option>
                    <option>{9}</option>
                    <option>{10}</option>
                    <option>{11}</option>
                    <option>{12}</option>
                  </Form.Control>
                </Form.Group>

                <Form.Group as={Col} md={4} controlId="formGridCardYear">
                  <Form.Label>Year</Form.Label>
                  <Form.Control
                    as="select"
                    name="cc_exp_year"
                    onChange={this.handleChange}
                    // value={this.state.changes.cc_exp_date.substr(0, 4)}
                  >
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
                    alert("Are you sure you want to delete your subscription?");
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
          <Button
            variant="success"
            type="submit"
            onClick={() => {
              this.update_subscription();
            }}
          >
            Save Changes
          </Button>
          <Button
            variant="light"
            onClick={() => {
              this.setState({ modalShow: false, changes: this.props });
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
    // if (this.state.changes.subscription !== null && this.state.init != 0) {
    //   let temp = this.state.changes;
    //   temp.subscription = temp.subscription
    //     .concat(":  $")
    //     .concat(this.state.changes.meal_plan_price);

    //   this.setState({
    //     init: 1,
    //     changes: temp
    //   });
    // }
    console.log("state changes", this.state.changes.paymentplan);
    return this.MakeChangesAnimation();
  }
}

export default MakeChanges;
