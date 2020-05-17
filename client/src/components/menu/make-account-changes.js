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
import moment from "moment";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogContentText from "@material-ui/core/DialogContentText";
import DialogTitle from "@material-ui/core/DialogTitle";

class MakeChanges extends Component {
  constructor(props) {
    super(props);
    this.state = {
      modalShow: false,
      modalShowDelete: false,
      changes: props,
      init: 0,
      date: moment(this.props.cc_exp_date),
      dict: {},
      open: false
      // new_changed_subscription: changes.subscription
    };
  }
  handleClickOpen = () => {
    this.setState({ open: true });
  };
  handleClose = () => {
    this.setState({ open: false });
  };
  handleChange = event => {
    const target = event.target;
    const name = target.name;
    this.setState(
      prevState => ({
        changes: {
          ...prevState.changes,
          [name]: target.value
        }
      }),
      () => {}
    );
  };
  componentDidMount() {
    this.setState(
      {
        changes: this.props
      },
      () => {
        var dict = {};
        this.state.changes.paymentplan.map(paymentPlan => {
          let key = paymentPlan.meal_plan_desc
            .concat(": $")
            .concat(paymentPlan.meal_plan_price);
          dict[key] = paymentPlan.meal_plan_id;
        });
        this.setState({ dict: dict });
      }
    );
  }

  componentWillReceiveProps(nextProps) {
    if (nextProps !== this.props) {
      // nextProps.myProp has a different value than our current prop
      let temp = JSON.parse(JSON.stringify(nextProps));
      temp.subscription = nextProps.subscription
        .concat(": $")
        .concat(nextProps.meal_plan_price);

      var dict = {};
      temp.paymentplan.map(paymentPlan => {
        let key = paymentPlan.meal_plan_desc
          .concat(": $")
          .concat(paymentPlan.meal_plan_price);
        dict[key] = paymentPlan.meal_plan_id;
      });

      this.setState(
        {
          changes: temp,
          // month: parseInt(
          //   String(nextProps.cc_exp_date.split("-")).substring(5, 7)
          // )
          date: moment(nextProps.cc_exp_date),
          dict: dict
        },
        () => {}
      );
    }
  }

  async update_subscription() {
    // its updating 800-000007 300-000005 1234 Main St null San Jose TX 95129 GFGDG
    // '{"meal_plan_id":"700-000006","purchase_id":"300-000013","delivery_address":"121","delivery_address_unit":"121","delivery_city":"3243","delivery_state":"Texas","delivery_zip":"95130","delivery_instructions":"N/A"}'
    var temp = this.state.dict[this.state.changes.subscription];
    if (temp == null) {
      temp = this.props.meal_plan_id;
    }
    fetch(this.props.UPDATE_URL, {
      method: "PATCH",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        meal_plan_id: temp,
        purchase_id: this.props.purchase_id,
        cc_num: this.state.changes.cc_num,
        cc_cvv: this.state.changes.cc_cvv,
        cc_exp_date: this.state.date.format("YYYY-MM-DD"),
        delivery_address: this.state.changes.delivery_address,
        delivery_address_unit: this.state.changes.delivery_address_unit,
        delivery_city: this.state.changes.delivery_city,
        delivery_state: this.state.changes.delivery_state,
        delivery_zip: this.state.changes.delivery_zip,
        delivery_instructions: this.state.changes.delivery_instructions
      })
    }).then(response => {
      if (!response.ok) {
        const error = response.statusText;
        alert("Error updating");
        return Promise.reject(error);
      } else {
        alert("You have successfully updated your account information!");
        window.location.reload();
      }

      response.json();
    });
  }
  delete = () => {
    return <div>{this.delete_subscription()}</div>;
  };
  async delete_subscription() {
    console.log(this.props.purchase_id);
    if (this.props.purchase_id == null) {
      console.log("Purchase id is null");
      return;
    }
    const test = await fetch(this.props.DELETE_URL, {
      method: "PATCH",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        purchase_id: this.props.purchase_id
      })
    }).then(response => {
      if (!response.ok) {
        const error = response.statusText;
        alert("Error deleting");
        return Promise.reject(error);
      } else {
        alert("You have successfully deleted your subscription!");
      }

      response.json();
    });
  }
  MakeChangesAnimation = () => {
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
                      // this.setState({ month: event.target.value });
                      this.setState({
                        date: this.state.date.month(event.target.value - 1)
                      });
                    }}
                    value={this.state.date.month() + 1}
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
                    onChange={event => {
                      this.setState({
                        date: this.state.date.year(event.target.value)
                      });
                    }}
                    // value={this.state.changes.cc_exp_date.substr(0, 4)}
                    value={this.state.date.year()}
                  >
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
                  placeholder="Instruction notes"
                  name="delivery_instructions"
                  value={this.state.changes.delivery_instructions}
                  onChange={this.handleChange}
                />
              </Form.Group>

              <br />
              <br />
            </Form>
            {this.DeleteModal()}
            {/* {this.props.subscription} */}
          </div>
        </Modal.Body>
        <Modal.Footer>
          <Tooltip
            title="This will permanently delete your subscription"
            placement="left"
          >
            <Button
              variant="danger"
              type="submit"
              style={{ float: "left" }}
              onClick={this.handleClickOpen}
            >
              Delete My Subscription
            </Button>
          </Tooltip>
          {/* {this.state.modalShowDelete ? this.DeleteModal() : <div />} */}
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
  DeleteModal = () => {
    console.log("must be here");
    return (
      <div>
        <Dialog
          open={this.state.open}
          onClose={this.handleClose}
          aria-labelledby="alert-dialog-title"
          aria-describedby="alert-dialog-description"
        >
          <DialogTitle id="alert-dialog-title">{"Warning"}</DialogTitle>
          <DialogContent>
            <DialogContentText id="alert-dialog-description">
              Are you sure you want to delete your subscription?
            </DialogContentText>
          </DialogContent>
          <DialogActions>
            <Button onClick={this.handleClose} color="primary">
              No,Keep
            </Button>
            <Button onClick={this.delete} variant="danger" autoFocus>
              Yes,Delete
            </Button>
          </DialogActions>
        </Dialog>
      </div>
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
    return this.MakeChangesAnimation();
  }
}

export default MakeChanges;
