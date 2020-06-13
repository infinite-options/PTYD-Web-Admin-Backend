import React, {Component, Fragment} from "react";

import ChangePassword from "../ChangePassword";
import {
  Form,
  Modal,
  Button,
  Tooltip,
  Col,
  OverlayTrigger
} from "react-bootstrap";
import moment from "moment";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogContentText from "@material-ui/core/DialogContentText";
import DialogTitle from "@material-ui/core/DialogTitle";

export default class MakeChange extends Component {
  constructor(props) {
    super(props);
    this.state = {
      show: true,
      currentPurchase: this.props.currentPurchase,
      mealPlans: this.props.mealPlans,

      paymentPlans: [], // use for reconstruct mealPlans
      showPasswordChange: false,
      showDeleteModal: false,
      //some variables need for submit forms
      updateMealPlanID: this.props.currentPurchase.meal_plan_id, //use for saving temporary value when updating

      creditCard: {
        number: this.props.currentPurchase.cc_num,
        CVV: this.props.currentPurchase.cc_cvv,
        monthExpire:
          moment(this.props.currentPurchase.cc_exp_date)._d.getMonth() + 1, // 0 for January
        yearExpire: moment(
          this.props.currentPurchase.cc_exp_date
        )._d.getFullYear()
      },
      deliveryAddress: {
        address: this.props.currentPurchase.delivery_address,
        apt:
          this.props.currentPurchase.delivery_unit !== undefined
            ? this.props.currentPurchase.delivery_unit
            : "",
        city: this.props.currentPurchase.delivery_city,
        state: this.props.currentPurchase.delivery_state,
        zipcode: this.props.currentPurchase.delivery_zip,
        instruction: this.props.currentPurchase.delivery_instructions
      }
    };
  }
  componentDidMount = () => {
    //re-construct meal plans array
    if (this.state.mealPlans !== null && this.state.mealPlans !== undefined) {
      let fiveMealPaymentPlans = this.state.mealPlans.FiveMealPaymentPlans
        .result;
      let tenMealPaymentPlans = this.state.mealPlans.TenMealPaymentPlans.result;
      let fifteenMealPaymentPlans = this.state.mealPlans.FifteenMealPaymentPlans
        .result;
      let twentyMealPaymentPlans = this.state.mealPlans.TwentyMealPaymentPlans
        .result;

      let temp_array = [];
      for (let plan of fiveMealPaymentPlans) {
        temp_array.push(plan);
      }
      for (let plan of tenMealPaymentPlans) {
        temp_array.push(plan);
      }
      for (let plan of fifteenMealPaymentPlans) {
        temp_array.push(plan);
      }
      for (let plan of twentyMealPaymentPlans) {
        temp_array.push(plan);
      }
      console.log("temp_array: ", temp_array);
      this.setState({paymentPlans: temp_array});
    }
  };
  componentDidUpdate = prevProps => {
    //watching parent changes to update currentPurchase
    // updatingn meal planns
    if (prevProps.mealPlans !== this.props.mealPlans) {
      this.setState({mealPlans: this.props.mealPlans});
    }
    //update the currentPurchase and its associated infomation
    if (
      prevProps.currentPurchase.purchase_id !==
      this.props.currentPurchase.purchase_id
    ) {
      this.setState({
        currentPurchase: this.props.currentPurchase,
        creditCard: {
          number: this.props.currentPurchase.cc_num,
          CVV: this.props.currentPurchase.cc_cvv,
          monthExpire:
            moment(this.props.currentPurchase.cc_exp_date)._d.getMonth() + 1, // 0 for January
          yearExpire: moment(
            this.props.currentPurchase.cc_exp_date
          )._d.getFullYear()
        },
        deliveryAddress: {
          address: this.props.currentPurchase.delivery_address,
          apt: this.props.currentPurchase.delivery_unit,
          city: this.props.currentPurchase.delivery_city,
          state: this.props.currentPurchase.delivery_state,
          zipcode: this.props.currentPurchase.delivery_zip,
          instruction: this.props.currentPurchase.delivery_instructions
        }
      });
    }
  };

  ShowHideChangePasswordModal = () => {
    this.state.showPasswordChange
      ? this.setState({showPasswordChange: false})
      : this.setState({showPasswordChange: true});
  };

  ShowHideDeleteModal = () => {
    this.state.showDeleteModal
      ? this.setState({showDeleteModal: false})
      : this.setState({showDeleteModal: true});
  };

  DeleteCurrentPurchase = () => {
    fetch(this.props.DELETE_URL, {
      method: "PATCH",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        purchase_id: this.state.currentPurchase.purchase_id
      })
    })
      .then(() => {
        //success => reload the current page
        this.props.history.push("/mealschedule");
        window.location.reload(false);
      })
      .catch(err => {
        console.log(err);
      });
  };

  UpdateChangingSubcription = () => {
    // update changing subcription
    fetch(this.props.UPDATE_URL, {
      method: "PATCH",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        meal_plan_id: this.state.updateMealPlanID,
        purchase_id: this.state.currentPurchase.purchase_id,
        delivery_address: this.state.deliveryAddress.address,
        delivery_address_unit: this.state.deliveryAddress.apt,
        delivery_city: this.state.deliveryAddress.city,
        delivery_state: this.state.deliveryAddress.state,
        delivery_zip: this.state.deliveryAddress.zipcode,
        delivery_instructions: this.state.deliveryAddress.instruction
      })
    })
      .then(() => {
        //update changing payment for subcription
        let creditCard = this.state.creditCard;
        let date = moment(
          `${creditCard.yearExpire}-${creditCard.monthExpire}-01`
        );
        console.log("date created is: ", date);
        fetch(this.props.UPDATE_URL_PAYMENT, {
          method: "PATCH",
          headers: {
            Accept: "application/json",
            "Content-Type": "application/json"
          },
          body: JSON.stringify({
            purchase_id: this.state.currentPurchase.purchase_id,
            cc_num: this.state.creditCard.number,
            cc_cvv: this.state.creditCard.CVV,
            cc_exp_date: date.format("YYYY-MM-DD")
          })
        });
      })
      .then(() => {})
      .catch(err => console.log(err));
  };
  render() {
    return (
      <Fragment>
        {this.state.show &&
          !this.state.showPasswordChange &&
          !this.state.showDeleteModal && (
            <Modal
              show={this.state.show}
              onHide={this.props.ChangeAccountInfo}
              size='lg'
              aria-labelledby='contained-modal-title-vcenter'
              centered
            >
              <Modal.Header>
                <div className='d-flex'>
                  <Modal.Title
                    id='contained-modal-title-vcenter'
                    className='has-text-info'
                  >
                    Edit Profile
                  </Modal.Title>
                  {this.props.searchCookie4LoggedInBy === "direct" && (
                    <Button
                      className='ml-2'
                      onClick={this.ShowHideChangePasswordModal}
                    >
                      Change Password
                    </Button>
                  )}
                </div>
              </Modal.Header>
              <Modal.Body>
                <div className='scrollMenu-profile'>
                  <h5 style={{marginTop: "0"}}>Subscription Details</h5>
                  <Form>
                    <Form.Row>
                      <Form.Group
                        as={Col}
                        md={6}
                        controlId='formGridCardSubscription'
                      >
                        <Form.Label>Current Subscription</Form.Label>

                        <Form.Control
                          name='currentSubcription'
                          defaultValue={
                            this.state.currentPurchase.meal_plan_desc
                          }
                          readOnly
                        />
                      </Form.Group>
                      <Form.Group
                        as={Col}
                        md={6}
                        controlId='formGridCardPayment'
                      >
                        <Form.Label>Change Subscription</Form.Label>
                        <Form.Control
                          as='select'
                          name='subscription'
                          onChange={e => {
                            e.persist();
                            this.setState({updateMealPlanID: e.target.value});
                          }}
                        >
                          <option>Choose...</option>
                          {/* drop down meal plans to change goes here */}
                          {this.state.paymentPlans.map((plan, key) => (
                            <option key={key} value={plan.meal_plan_id}>
                              {plan.meal_plan_desc} --- ${plan.meal_plan_price}
                            </option>
                          ))}
                        </Form.Control>
                      </Form.Group>
                    </Form.Row>
                    <h5>Credit Card Details</h5>
                    <Form.Row>
                      <Form.Group
                        as={Col}
                        md={6}
                        controlId='formGridCardNumber'
                      >
                        <Form.Label>Credit Card Number</Form.Label>
                        <Form.Control
                          placeholder='Enter Card Number'
                          name='cc_num'
                          value={this.state.creditCard.number}
                          onChange={e => {
                            e.persist();
                            this.setState(prevState => ({
                              creditCard: {
                                ...prevState.creditCard,
                                number: e.target.value
                              }
                            }));
                          }}
                        />
                      </Form.Group>
                    </Form.Row>

                    <Form.Row>
                      <Form.Group as={Col} md={4} controlId='formGridCardCvc'>
                        <Form.Label>CVV</Form.Label>
                        <Form.Control
                          placeholder='123'
                          name='cc_cvv'
                          value={this.state.creditCard.CVV}
                          onChange={e => {
                            e.persist();
                            this.setState(prevState => ({
                              creditCard: {
                                ...prevState.creditCard,
                                CVV: e.target.value
                              }
                            }));
                          }}
                        />
                      </Form.Group>

                      <Form.Group as={Col} md={4} controlId='formGridCardMonth'>
                        <Form.Label>Month</Form.Label>

                        <Form.Control
                          as='select'
                          name='cc_exp_month'
                          onChange={e => {
                            console.log("event: ", e.target);
                            e.persist();
                            this.setState(prevState => ({
                              creditCard: {
                                ...prevState.creditCard,
                                monthExpire: e.target.value
                              }
                            }));
                          }}
                          value={this.state.creditCard.monthExpire}
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
                    </Form.Row>
                    <Form.Row>
                      <Form.Group as={Col} md={4} controlId='formGridCardYear'>
                        <Form.Label>Year</Form.Label>
                        <Form.Control
                          as='select'
                          name='cc_exp_year'
                          value={this.state.creditCard.yearExpire}
                          onChange={e => {
                            e.persist();
                            this.setState(prevState => ({
                              creditCard: {
                                ...prevState.creditCard,
                                yearExpire: e.target.value
                              }
                            }));
                          }}
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
                    <Form.Group controlId='formGridAddress'>
                      <Form.Label>Address</Form.Label>
                      <Form.Control
                        placeholder='1234 Main St'
                        name='delivery_address'
                        value={this.state.deliveryAddress.address}
                        onChange={e => {
                          e.persist();
                          this.setState(prevState => ({
                            deliveryAddress: {
                              ...prevState.deliveryAddress,
                              address: e.target.value
                            }
                          }));
                        }}
                      />
                    </Form.Group>

                    <Form.Group
                      as={Col}
                      md={4}
                      style={{marginLeft: "-15px"}}
                      controlId='formGridAptNum'
                    >
                      <Form.Label>
                        Apartment/Unit <b>(Optional)</b>
                      </Form.Label>
                      <Form.Control
                        placeholder='Apartment, studio, or floor'
                        name='delivery_address_unit'
                        value={this.state.deliveryAddress.apt}
                        onChange={e => {
                          e.persist();
                          this.setState(prevState => ({
                            deliveryAddress: {
                              ...prevState.deliveryAddress,
                              apt: e.target.value
                            }
                          }));
                        }}
                      />
                    </Form.Group>

                    <Form.Row>
                      <Form.Group as={Col} controlId='formGridCity'>
                        <Form.Label>City</Form.Label>
                        <Form.Control
                          placeholder='Prep City'
                          name='delivery_city'
                          value={this.state.deliveryAddress.city}
                          onChange={e => {
                            e.persist();
                            this.setState(prevState => ({
                              deliveryAddress: {
                                ...prevState.deliveryAddress,
                                city: e.target.value
                              }
                            }));
                          }}
                        />
                      </Form.Group>
                      <Form.Group as={Col} controlId='formGridState'>
                        <Form.Label>State</Form.Label>
                        <Form.Control
                          as='select'
                          name='delivery_state'
                          onChange={e => {
                            e.persist();
                            this.setState(prevState => ({
                              deliveryAddress: {
                                ...prevState.deliveryAddress,
                                state: e.target.value
                              }
                            }));
                          }}
                          value={this.state.deliveryAddress.state}
                        >
                          <option>Choose...</option>
                          <option>TX</option>
                        </Form.Control>
                      </Form.Group>
                      <Form.Group as={Col} controlId='formGridZip'>
                        <Form.Label>Zip</Form.Label>
                        <Form.Control
                          placeholder='12345'
                          name='delivery_zip'
                          value={this.state.deliveryAddress.zipcode}
                          onChange={e => {
                            e.persist();
                            this.setState(prevState => ({
                              deliveryAddress: {
                                ...prevState.deliveryAddress,
                                zipcode: e.target.value
                              }
                            }));
                          }}
                        />
                      </Form.Group>
                    </Form.Row>
                    <Form.Group controlId='exampleForm.ControlTextarea1'>
                      <Form.Label>Instructions</Form.Label>
                      <Form.Control
                        placeholder='Instruction notes'
                        name='delivery_instructions'
                        value={this.state.deliveryAddress.instruction}
                        onChange={e => {
                          e.persist();
                          this.setState({instruction: e.target.value});
                        }}
                      />
                    </Form.Group>
                  </Form>
                </div>
              </Modal.Body>
              <Modal.Footer>
                <OverlayTrigger
                  key={"top"}
                  placement={"top"}
                  overlay={
                    <Tooltip id='deleteSubcription'>
                      <p>This will permanently delete your subscription</p>
                    </Tooltip>
                  }
                >
                  <Button
                    variant='danger'
                    type='submit'
                    style={{float: "left"}}
                    onClick={this.ShowHideDeleteModal}
                  >
                    Delete My Subscription
                  </Button>
                </OverlayTrigger>{" "}
                {/* {this.state.modalShowDelete ? this.DeleteModal() : <div />} */}
                <Button
                  variant='success'
                  type='submit'
                  onClick={this.UpdateChangingSubcription}
                >
                  Save Changes
                </Button>
                <Button variant='light' onClick={this.props.ChangeAccountInfo}>
                  Close
                </Button>
              </Modal.Footer>
            </Modal>
          )}
        {this.state.showPasswordChange && (
          <ChangePassword
            ShowHideChangePasswordModal={this.ShowHideChangePasswordModal}
          />
        )}
        {this.state.showDeleteModal && (
          <div>
            <Dialog
              open={this.state.showDeleteModal}
              aria-labelledby='alert-dialog-title'
              aria-describedby='alert-dialog-description'
            >
              <DialogTitle id='alert-dialog-title'>{"Warning"}</DialogTitle>
              <DialogContent>
                <DialogContentText id='alert-dialog-description'>
                  Are you sure you want to delete your subscription?
                </DialogContentText>
              </DialogContent>
              <DialogActions>
                <Button onClick={this.ShowHideDeleteModal} color='primary'>
                  No,Keep
                </Button>
                <Button
                  onClick={this.DeleteCurrentPurchase}
                  variant='danger'
                  autoFocus
                >
                  Yes,Delete
                </Button>
              </DialogActions>
            </Dialog>
          </div>
        )}
      </Fragment>
    );
  }
}
