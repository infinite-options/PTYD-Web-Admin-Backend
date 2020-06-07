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

export default class MakeChange extends Component {
  constructor(props) {
    super(props);
    this.state = {
      show: true,
      currentPurchase: {},
      UserInfo: {},
      mealPlans: [],
      showPasswordChange: false,
      //some variables need for submit forms
      subcriptionUpdate: null, // get from current Purchase
      creditCard: {
        number: null,
        CVV: null,
        monthExpire: null,
        yearExpire: null
      },
      deliveryAddress: {
        address: null,
        apt: null,
        city: null,
        state: null,
        zipcode: null
      }
    };
  }

  componentDidMount = () => {
    //loading some needed info
  };

  componentDidUpdate = prevProps => {
    //watching parent changes to update currentPurchase
  };

  ShowHideChangePasswordModal = () => {
    this.state.showPasswordChange
      ? this.setState({showPasswordChange: false})
      : this.setState({showPasswordChange: true});
  };

  render() {
    return (
      <Fragment>
        {this.state.show && !this.state.showPasswordChange && (
          <Modal
            show={this.state.show}
            onHide={this.props.ChangeAccountInfo}
            size='lg'
            aria-labelledby='contained-modal-title-vcenter'
            centered
          >
            <Modal.Header>
              <div className='d-flex'>
                <Modal.Title id='contained-modal-title-vcenter'>
                  Edit Profile
                </Modal.Title>
                {/* {this.props.loggedInBy === "direct" && ( */}
                <Button
                  className='ml-2'
                  onClick={this.ShowHideChangePasswordModal}
                >
                  Change Password
                </Button>
              </div>
              {/* )} */}
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
                        type='text'
                        defaultValue={"current subscription"}
                      />
                    </Form.Group>
                    <Form.Group as={Col} md={6} controlId='formGridCardPayment'>
                      <Form.Label>Change Subscription</Form.Label>
                      <Form.Control
                        as='select'
                        name='subscription'
                        onChange={e => {
                          this.setState({subcriptionUpdate: e.target.value});
                        }}
                      >
                        <option>Choose...</option>
                        {/* drop down meal plans to change goes here */}
                      </Form.Control>
                    </Form.Group>
                  </Form.Row>
                  <h5>Credit Card Details</h5>
                  <Form.Row>
                    <Form.Group as={Col} md={6} controlId='formGridCardNumber'>
                      <Form.Label>Credit Card Number</Form.Label>
                      <Form.Control
                        placeholder='Enter Card Number'
                        name='cc_num'
                        value={"Card Number"}
                        onChange={e => {
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
                        value={"CVV number"}
                        onChange={e => e => {
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
                        onChange={e => e => {
                          this.setState(prevState => ({
                            creditCard: {
                              ...prevState.creditCard,
                              monthExpire: e.target.value
                            }
                          }));
                        }}
                        value={"Month expires"}
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
                        onChange={e => e => {
                          this.setState(prevState => ({
                            creditCard: {
                              ...prevState.creditCard,
                              yearExpire: e.target.value
                            }
                          }));
                        }}
                        value={"year expire"}
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
                      value={"delivery address"}
                      onChange={e => {
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
                      value={"delivery address unit"}
                      onChange={e => {
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
                        value={"city"}
                        onChange={e => {
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
                          this.setState(prevState => ({
                            deliveryAddress: {
                              ...prevState.deliveryAddress,
                              state: e.target.value
                            }
                          }));
                        }}
                        value={"state"}
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
                        value={"Zip code"}
                        onChange={e => {
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
                      value={"Intructions"}
                      onChange={e => {
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
                  onClick={this.handleClickOpen}
                >
                  Delete My Subscription
                </Button>
              </OverlayTrigger>{" "}
              {/* {this.state.modalShowDelete ? this.DeleteModal() : <div />} */}
              <Button
                variant='success'
                type='submit'
                onClick={this.updateSubcription}
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
      </Fragment>
    );
  }
}
