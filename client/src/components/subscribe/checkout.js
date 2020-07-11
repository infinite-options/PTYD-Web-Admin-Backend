import React, {Component, Fragment} from "react";

import {Button, Form, Row, Col, Container} from "react-bootstrap";
import TruckIcon from "../../img/prepTruckIcon.png";

import crypto from "crypto";
import Cookies from "js-cookie";
import axios from "axios";

class Checkout extends Component {
  constructor(props) {
    super(props);
    this.state = {
      user_uid: this.searchCookie4UserID("loginStatus"),
      password_salt: null,
      purchase: {
        delivery_phone: "",
        delivery_first_name: "",
        delivery_last_name: "",
        delivery_instructions: "",
        delivery_email: "",
        delivery_address: "",
        delivery_address_unit: "",
        delivery_city: "",
        delivery_state: "",
        delivery_zip: "",
        cc_num: "",
        cc_cvv: "",
        cc_exp_month: "",
        cc_exp_year: "",
        billing_zip: ""
      },
      disabled: true,
      gift: "FALSE",
      password: "",
      salt: null,
      coupon: "",
      loading: false,
      send_error: null,
      coupon_error: null,
      original_charge: {
        shipping: 15,
        meal_price: 0,
        tax: 0,
        total_charge: 0
      },
      will_charge: {
        shipping: 15,
        meal_price: 0,
        tax: 0,
        total_charge: 0
      },
      item: {
        name: "",
        total: 0
      },
      discount: {percent: 0, amount: 0, shipping: 0},
      tax_rate: 0.0825,
      coupon_disable: false
    };

    this.sendForm = this.sendForm.bind(this);
    this.checkout = this.checkout.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.handleMonthChange = this.handleMonthChange.bind(this);
    this.handleYearChange = this.handleYearChange.bind(this);
    this.handleGiftChange = this.handleGiftChange.bind(this);
    this.handlePwChange = this.handlePwChange.bind(this);
    this.validateForm = this.validateForm.bind(this);
  }

  getCookieAttrHelper(cname, type) {
    const values = Cookies.get(cname);
    if (values === "" || values === undefined) {
      return null;
    } else {
      for (let val of values.split(",")) {
        let [n, v] = val.split(":");
        if (n === type) {
          return v;
        }
      }
      return null;
    }
  }

  searchCookie4Login(cname) {
    // pass cookie name to look for user's first name
    return this.getCookieAttrHelper(cname, "first_name");
  }

  searchCookie4UserID(cname) {
    //// pass cookie name to look for user's id
    return this.getCookieAttrHelper(cname, "user_uid");
  }
  searchCookie4loginMethod(cname) {
    //// pass cookie name to look for user's id
    return this.getCookieAttrHelper(cname, "loggedInBy");
  }

  searchCookie4SessionID(cname) {
    return this.getCookieAttrHelper(cname, "session_id");
  }
  async componentDidMount() {
    if (this.props.location.item !== undefined) {
      const login_session = {
        login_id: this.searchCookie4Login("loginStatus"),
        session_id: this.searchCookie4SessionID("loginStatus")
      };
      //calculate original charge
      let mealPrice = parseFloat(this.props.location.item.total);
      let shipping = this.state.original_charge.shipping;
      let tax = parseFloat((mealPrice * this.state.tax_rate).toFixed(2));

      let total_charge = parseFloat((mealPrice + shipping + tax).toFixed(2));
      console.log("tax: ", typeof tax);
      this.setState(prevState => ({
        item: {
          ...prevState.item,
          name: this.props.location.item.name,
          total: this.props.location.item.total
        },
        original_charge: {
          ...prevState.original_charge,
          meal_price: mealPrice,
          tax: tax,
          total_charge: total_charge
        },
        will_charge: {
          ...prevState.will_charge,
          meal_price: mealPrice,
          total_charge: total_charge,
          tax: tax
        }
      }));
      if (this.state.user_uid) {
        if (this.searchCookie4loginMethod("loginStatus") !== "social") {
          const res = await fetch(
            `${this.props.SESSION_URL}/${this.state.user_uid}/${login_session.session_id}`
          );
          const api = await res.json();
          if (api.result.length === 0) {
            //could not verify login session
            this.props.history.push("/invalidsession");
            return;
          }
          //  Social Media accounts will have null salts
          //  Disable password field if salt is null
          this.setState({
            password_salt: api.result[0].password_salt
          });
        }
        const pur = await fetch(
          `${this.props.PURCHASE_API_URL}/${this.state.user_uid}`
        );
        const purApi = await pur.json();
        if (purApi.result.length !== 0) {
          console.log(purApi);
          let len = purApi.result.length;
          this.setState({purchase: purApi.result[len - 1]});
          console.log("purchase: ", this.state.purchase);
          //parse purchase cc exp date into month and year
          const parsedValues = purApi.result[len - 1].cc_exp_date.split("-");
          this.setState(prevState => ({
            purchase: {
              ...prevState.purchase,
              cc_exp_month: parsedValues[1],
              cc_exp_year: parsedValues[0]
            }
          }));

          // let len = purApi.result.length;
          // this.setState({purchase: purApi.result[len - 1]});
          // if (this.state.purchase.cc_num !== undefined) {
          //   let temp = this.state.purchase.cc_num;
          //   this.setState({
          //     cc_num:
          //       "XXXXXXXXXXXX" + temp.substring(temp.length - 4, temp.length)
          //   });
          // }
        } else {
          const acc = await fetch(
            `${this.props.SINGLE_ACC_API_URL}/${this.state.user_uid}`
          );
          const accApi = await acc.json();
          if (accApi.result.length !== 0) {
            this.setState({
              purchase: {
                delivery_first_name: accApi.result[0].first_name,
                delivery_last_name: accApi.result[0].last_name,
                delivery_email: accApi.result[0].user_email,
                delivery_phone: accApi.result[0].phone_number
              }
            });
          }
        }
      }
    } else {
      this.setState({send_error: "No meal plan selected"});
    }
  }

  async sendForm() {
    // console.log(this.state.purchase);
    let coupon = "";
    let total_discount = parseFloat(
      (
        this.state.original_charge.total_charge -
        this.state.will_charge.total_charge
      ).toFixed(2)
    );
    if (this.state.coupon_disable) {
      coupon = this.state.coupon;
    }
    this.setState({loading: true});
    let data_send = {
      ...this.state.purchase,
      salt: this.state.salt,
      is_gift: this.state.gift,
      user_uid: this.state.user_uid,
      item: this.props.location.item.name,
      item_price: this.props.location.item.total,
      coupon_id: coupon,
      shipping: this.state.original_charge.shipping,
      total_charge: this.state.original_charge.total_charge,
      total_discount: total_discount,
      tax_rate: this.state.tax_rate
    };
    axios
      .post(this.props.CHECKOUT_URL, data_send)
      .then(res => {
        this.setState({loading: false});
        console.log("res: ", res);
        this.props.history.push("/checkoutsuccess");
      })
      .catch(err => {
        if (
          err.response.data !== undefined &&
          err.response.data.message !== undefined
        ) {
          this.setState({send_error: err.response.data.message});
        } else {
          this.setState({send_error: "Request failed."});
        }
        this.props.history.push("/checkout");
      });
  }
  async checkout(event) {
    event.preventDefault();
    this.state.salt = await crypto
      .createHash("sha512")
      .update(this.state.password + this.state.password_salt)
      .digest("hex");
    this.sendForm();
  }

  validateForm() {
    var fields = [
      "delivery_first_name",
      "delivery_last_name",
      "delivery_instructions",
      "delivery_email",
      "delivery_address",
      "delivery_city",
      "delivery_state",
      "delivery_zip",

      // "delivery_region",

      "delivery_phone",
      "cc_num",
      "cc_cvv",
      "cc_exp_month",
      "cc_exp_year",
      "billing_zip"
    ];

    //  Check if fields are null/empty
    for (var field of fields) {
      if (!this.state.purchase[field]) {
        return true;
      }
    }

    //  Check if fields have correct length
    //  Disable submit if phone number isn't 10 digits
    if (
      this.state.purchase.delivery_phone.length !== 10 ||
      !/^\d+$/.test(this.state.purchase.delivery_phone)
    ) {
      return true;
    }
    //  Disable submit if cc_num isn't 16 characters
    if (this.state.purchase.cc_num.length !== 16) {
      return true;
    }
    //  Disable submit if cc_cvv isn't 3 characters
    if (this.state.purchase.cc_cvv.length !== 3) {
      return true;
    }

    //  Data check zipcodes
    var zipcode_fields = ["delivery_zip", "billing_zip"];

    for (var zipfield of zipcode_fields) {
      if (
        this.state.purchase[zipfield].length !== 5 &&
        this.state.purchase[zipfield].length !== 10
      ) {
        return true;
      }

      //  Disable submit if zipcode is 5 characters but contains nondigits
      if (
        this.state.purchase[zipfield].length === 5 &&
        !/^\d+$/.test(this.state.purchase[zipfield])
      ) {
        return true;
      }

      //  Disable submit if zipcode is 10 characters but contains nondigits in first 5 characters or last 4 characters or if 6th character is not a hyphen
      if (
        this.state.purchase[zipfield].length === 10 &&
        (!/^\d+$/.test(this.state.purchase[zipfield].substring(0, 5)) ||
          !/^\d+$/.test(this.state.purchase[zipfield].substring(6, 10)) ||
          this.state.purchase[zipfield][5] !== "-")
      ) {
        return true;
      }
    }

    if (
      this.searchCookie4loginMethod("loginStatus") !== "social" &&
      !this.state.password
    )
      return true;

    return false;
  }

  handleChange(event) {
    const target = event.target;
    const name = target.name;
    this.setState(prevState => ({
      purchase: {
        ...prevState.purchase,
        [name]: target.value
      }
    }));
  }

  handleMonthChange(event) {
    const target = event.target;
    let date =
      this.state.purchase.cc_exp_year + "-" + event.target.value + "-01";
    this.setState(prevState => ({
      purchase: {
        ...prevState.purchase,
        cc_exp_date: date,
        cc_exp_month: target.value
      }
    }));
  }
  handleYearChange(event) {
    const target = event.target;
    let date = target.value + "-" + this.state.purchase.cc_exp_month + "-01";
    this.setState(prevState => ({
      purchase: {
        ...prevState.purchase,
        cc_exp_date: date,
        cc_exp_year: target.value
      }
    }));
  }

  handlePwChange(event) {
    this.setState({
      password: event.target.value
    });
  }

  handleGiftChange(event) {
    if (event.target.checked === true) {
      this.setState({
        gift: "TRUE"
      });
    } else {
      this.setState({
        gift: "FALSE"
      });
    }
  }

  applyCoupon = event => {
    event.preventDefault();
    console.log("this.state.coupon: ", this.state.coupon);
    // send a form to the API
    if (this.state.coupon !== null) {
      axios
        .get(`${this.props.DEV_URL}v2/coupon`, {
          params: {
            coupon_id: this.state.coupon,
            email: this.state.purchase.delivery_email
          }
        })
        .then(res => {
          console.log("coupon api response: ", res);
          if (res.data.result !== undefined) {
            //update price which and state to send to checkout api
            let new_shipping = parseFloat(
              (
                this.state.will_charge.shipping -
                parseFloat(res.data.result.discount_shipping)
              ).toFixed(2)
            );
            let new_mealPrice = parseFloat(
              (
                this.state.will_charge.meal_price -
                parseFloat(res.data.result.discount_amount)
              ).toFixed(2)
            );
            let new_tax = parseFloat(
              ((new_shipping + new_mealPrice) * this.state.tax_rate).toFixed(2)
            );
            let new_total = parseFloat(
              (
                (new_shipping + new_mealPrice + new_tax) *
                (1 - parseFloat(res.data.result.discount_percent))
              ).toFixed(2)
            );
            this.setState(prevState => ({
              will_charge: {
                ...prevState.will_charge,
                shipping: new_shipping,
                meal_price: new_mealPrice,
                tax: new_tax,
                total_charge: new_total
              },
              discount: {
                ...prevState.discount,
                percent: res.data.result.discount_percent,
                amount: res.data.result.discount_amount,
                shipping: res.data.result.discount_shipping
              },
              coupon_disable: true
            }));
          }
        })
        .catch(err => {
          console.log("Error happened: ", err.response);
          if (err.response.data !== undefined)
            this.setState({coupon_error: err.response.data.message});
        });
    }
  };
  cancelCoupon = event => {
    event.preventDefault();
    this.setState({
      coupon: "",
      coupon_disable: false,
      will_charge: this.state.original_charge,
      discount: {}
    });
  };
  render() {
    return (
      <Fragment>
        {!this.state.send_error ? (
          <Fragment>
            {this.state.loading && (
              <div className='d-flex justify-content-center'>
                <div className='loading'>
                  <div className='spinner-border' role='status'>
                    <span className='sr-only'>Loading...</span>
                  </div>
                </div>
              </div>
            )}
            <Container>
              <Row className={this.state.loading ? "half-opacity" : ""}>
                <Col md={4}>
                  <div className='justify-content-md-center'>
                    <img
                      src={TruckIcon}
                      style={{height: "75%", width: "75%"}}
                      alt='Delivery Truck Icon'
                    />
                  </div>
                  <h3>Account Holder Information</h3>
                  <p>First Name: {this.state.purchase.delivery_first_name}</p>
                  <p>Last Name: {this.state.purchase.delivery_last_name}</p>
                  <p>Email: {this.state.purchase.delivery_email}</p>
                  <hr />
                  <h3>Order Summary</h3>
                  <div id='cart'>
                    <p>{this.state.item.name}</p>
                  </div>

                  <hr />
                  <p>
                    Estimated Shipping - ${this.state.original_charge.shipping}
                  </p>
                  <p>Estimated Tax - ${this.state.original_charge.tax}</p>
                  {this.state.coupon_disable && (
                    <Fragment>
                      <hr />
                      {this.state.discount.percent !== 0 && (
                        <p>
                          Discount percentage:{" "}
                          {this.state.discount.percent > 1
                            ? this.state.discount.percent
                            : parseFloat(
                                (this.state.discount.percent * 100).toFixed(2)
                              )}
                          %
                        </p>
                      )}
                      {this.state.discount.mount !== 0 && (
                        <p>Discount amount: ${this.state.discount.amount}</p>
                      )}
                      {this.state.discount.shipping !== 0 && (
                        <p>
                          Discount shipping: ${this.state.discount.shipping}
                        </p>
                      )}
                      <p>
                        Total discount: $
                        {parseFloat(
                          (
                            this.state.original_charge.total_charge -
                            this.state.will_charge.total_charge
                          ).toFixed(2)
                        )}
                      </p>
                    </Fragment>
                  )}
                  <hr />
                  <h3>Total: ${this.state.will_charge.total_charge}</h3>
                  <Form>
                    <Form.Row>
                      {this.state.coupon_error !== null && (
                        <p className='text-danger'>{this.state.coupon_error}</p>
                      )}
                      <Form.Group
                        as={Col}
                        md={8}
                        controlId='formGridCouponCode'
                      >
                        <Form.Label>Coupon/Gift Code</Form.Label>

                        <Form.Control
                          placeholder='Secret Passcode'
                          value={this.state.coupon}
                          type='text'
                          onChange={event =>
                            this.setState({
                              coupon: event.target.value,
                              coupon_error: null
                            })
                          }
                          disabled={this.state.coupon_disable ? true : false}
                        />
                      </Form.Group>
                      {!this.state.coupon_disable ? (
                        <Button
                          variant='success'
                          size='sm'
                          style={{height: "30px", marginTop: "30px"}}
                          type='submit'
                          onClick={this.applyCoupon}
                        >
                          Apply
                        </Button>
                      ) : (
                        <Button
                          variant='success'
                          size='sm'
                          style={{height: "30px", marginTop: "30px"}}
                          type='submit'
                          onClick={this.cancelCoupon}
                        >
                          Cancel
                        </Button>
                      )}
                    </Form.Row>
                  </Form>
                </Col>
                <Col style={{marginTop: "-50px"}}>
                  <h5>Delivery Address</h5>
                  <Form>
                    <Form.Row>
                      <Form.Group as={Col} controlId='formGridFirstName'>
                        <Form.Label>
                          First Name
                          <span className='required-red'>
                            {" "}
                            <b>*</b>
                          </span>
                        </Form.Label>
                        <Form.Control
                          placeholder='Enter First Name'
                          value={this.state.purchase.delivery_first_name || ""}
                          name='delivery_first_name'
                          onChange={this.handleChange}
                        />
                        {!this.state.purchase.delivery_first_name ? (
                          <span className='required-red'>
                            First Name field is required
                          </span>
                        ) : (
                          ""
                        )}
                      </Form.Group>

                      <Form.Group as={Col} controlId='formGridLastName'>
                        <Form.Label>
                          Last Name
                          <span className='required-red'>
                            {" "}
                            <b>*</b>
                          </span>
                        </Form.Label>
                        <Form.Control
                          placeholder='Enter Last Name'
                          value={this.state.purchase.delivery_last_name || ""}
                          name='delivery_last_name'
                          onChange={this.handleChange}
                        />
                        {!this.state.purchase.delivery_last_name ? (
                          <span className='required-red'>
                            Last Name field is required
                          </span>
                        ) : (
                          ""
                        )}
                      </Form.Group>
                    </Form.Row>

                    <Form.Group controlId='formGridNotes'>
                      <Form.Label>
                        Delivery Notes
                        <span className='required-red'>
                          {" "}
                          <b>*</b>
                        </span>
                      </Form.Label>
                      <Form.Control
                        placeholder='Enter Notes or N/A (e.g. Gate Code, Special Instructions)'
                        value={this.state.purchase.delivery_instructions || ""}
                        name='delivery_instructions'
                        onChange={this.handleChange}
                      />
                      {!this.state.purchase.delivery_instructions ? (
                        <span className='required-red'>
                          Delivery Notes field is required
                        </span>
                      ) : (
                        ""
                      )}
                    </Form.Group>

                    <Form.Row>
                      <Form.Group as={Col} controlId='formGridEmailAddress'>
                        <Form.Label>
                          Email
                          <span className='required-red'>
                            {" "}
                            <b>*</b>
                          </span>
                        </Form.Label>
                        <Form.Control
                          type='email'
                          placeholder='Enter Email'
                          value={this.state.purchase.delivery_email || ""}
                          name='delivery_email'
                          onChange={this.handleChange}
                        />
                        {!this.state.purchase.delivery_email ? (
                          <span className='required-red'>
                            Valid email is required
                          </span>
                        ) : (
                          ""
                        )}
                      </Form.Group>

                      <Form.Group as={Col} controlId='formGridPhoneNumber'>
                        <Form.Label>
                          Phone Number
                          <span className='required-red'>
                            {" "}
                            <b>*</b>
                          </span>
                        </Form.Label>
                        <Form.Control
                          placeholder='1234567890'
                          value={this.state.purchase.delivery_phone || ""}
                          name='delivery_phone'
                          onChange={this.handleChange}
                        />
                        {this.state.purchase.delivery_phone.length !== 10 ? (
                          <span className='required-red'>
                            Phone Number must be 10 digits
                          </span>
                        ) : (
                          ""
                        )}
                      </Form.Group>
                    </Form.Row>
                    <Form.Row>
                      <Form.Group as={Col} controlId='formGridAddress'>
                        <Form.Label>
                          Address
                          <span className='required-red'>
                            {" "}
                            <b>*</b>
                          </span>
                        </Form.Label>
                        <Form.Control
                          placeholder='1234 Main St'
                          value={this.state.purchase.delivery_address || ""}
                          name='delivery_address'
                          onChange={this.handleChange}
                        />
                        {!this.state.purchase.delivery_address ? (
                          <span className='required-red'>
                            Delivery Address is required
                          </span>
                        ) : (
                          ""
                        )}
                      </Form.Group>

                      <Form.Group as={Col} controlId='formGridAptNum'>
                        <Form.Label>Apartment/Unit (if applicable)</Form.Label>
                        <Form.Control
                          placeholder='Apartment, studio, or floor'
                          value={
                            this.state.purchase.delivery_address_unit || ""
                          }
                          name='delivery_address_unit'
                          onChange={this.handleChange}
                        />
                      </Form.Group>
                    </Form.Row>

                    <Form.Row>
                      <Form.Group as={Col} controlId='formGridCity'>
                        <Form.Label>
                          City
                          <span className='required-red'>
                            {" "}
                            <b>*</b>
                          </span>
                        </Form.Label>
                        <Form.Control
                          placeholder='Prep City'
                          value={this.state.purchase.delivery_city || ""}
                          name='delivery_city'
                          onChange={this.handleChange}
                        />
                        {!this.state.purchase.delivery_city ? (
                          <span className='required-red'>City is required</span>
                        ) : (
                          ""
                        )}
                      </Form.Group>

                      <Form.Group as={Col} controlId='formGridState'>
                        <Form.Label>
                          State
                          <span className='required-red'>
                            {" "}
                            <b>*</b>
                          </span>
                        </Form.Label>
                        <Form.Control
                          as='select'
                          value={this.state.purchase.delivery_state || ""}
                          name='delivery_state'
                          onChange={this.handleChange}
                        >
                          <option>Choose...</option>
                          <option>TX</option>
                        </Form.Control>
                        {this.state.purchase.delivery_state !== "TX" ? (
                          <span className='required-red'>
                            State is required
                          </span>
                        ) : (
                          ""
                        )}
                      </Form.Group>

                      <Form.Group as={Col} controlId='formGridZip'>
                        <Form.Label>
                          Zip
                          <span className='required-red'>
                            {" "}
                            <b>*</b>
                          </span>
                        </Form.Label>
                        <Form.Control
                          placeholder='12345'
                          value={this.state.purchase.delivery_zip || ""}
                          name='delivery_zip'
                          onChange={this.handleChange}
                        />
                        {/(^\d{5}$)|(^\d{5}-\d{4}$)/.test(
                          this.state.purchase.delivery_zip
                        ) ? (
                          ""
                        ) : (
                          <span className='required-red'>Invalid Zip Code</span>
                        )}
                      </Form.Group>
                    </Form.Row>
                    <Form.Group id='formGridCheckbox'>
                      <Form.Check
                        id='isGift'
                        type='checkbox'
                        label='This is a Gift'
                        value={this.state.gift}
                        onChange={this.handleGiftChange}
                      />
                    </Form.Group>

                    <h5>Billing Information</h5>

                    <Form.Row>
                      <Form.Group
                        as={Col}
                        md={6}
                        controlId='formGridCardNumber'
                      >
                        <Form.Label>
                          Credit Card Number
                          <span className='required-red'>
                            {" "}
                            <b>*</b>
                          </span>
                        </Form.Label>
                        <Form.Control
                          placeholder='Enter Card Number'
                          value={this.state.purchase.cc_num || ""}
                          name='cc_num'
                          onChange={this.handleChange}
                        />
                        {/^.{16}$/.test(this.state.purchase.cc_num) ? (
                          ""
                        ) : (
                          <span className='required-red'>
                            Invalid Credit Card Number
                          </span>
                        )}
                      </Form.Group>

                      <Form.Group as={Col} md={3} controlId='formGridCardCvc'>
                        <Form.Label>
                          CVC/CVV
                          <span className='required-red'>
                            {" "}
                            <b>*</b>
                          </span>
                        </Form.Label>
                        <Form.Control
                          placeholder='123'
                          value={this.state.purchase.cc_cvv || ""}
                          name='cc_cvv'
                          onChange={this.handleChange}
                        />
                        {/^[0-9]{3,4}$/.test(this.state.purchase.cc_cvv) ? (
                          ""
                        ) : (
                          <span className='required-red'>Invalid CVC/CVV</span>
                        )}
                      </Form.Group>
                    </Form.Row>

                    <Form.Row>
                      <Form.Group as={Col} md={4} controlId='formGridCardMonth'>
                        <Form.Label>
                          Month
                          <span className='required-red'>
                            {" "}
                            <b>*</b>
                          </span>
                        </Form.Label>
                        <Form.Control
                          as='select'
                          value={this.state.purchase.cc_exp_month || ""}
                          name='cc_exp_month'
                          onChange={this.handleMonthChange}
                        >
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
                        {isNaN(this.state.purchase.cc_exp_month) ? (
                          <span className='required-red'>
                            Expiration month is required
                          </span>
                        ) : (
                          ""
                        )}
                      </Form.Group>

                      <Form.Group as={Col} md={4} controlId='formGridCardYear'>
                        <Form.Label>
                          Year
                          <span className='required-red'>
                            {" "}
                            <b>*</b>
                          </span>
                        </Form.Label>
                        <Form.Control
                          as='select'
                          value={this.state.purchase.cc_exp_year || ""}
                          name='cc_exp_year'
                          onChange={this.handleYearChange}
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
                        {isNaN(this.state.purchase.cc_exp_year) ? (
                          <span className='required-red'>
                            Expiration year is required
                          </span>
                        ) : (
                          ""
                        )}
                      </Form.Group>

                      <Form.Group
                        as={Col}
                        md={4}
                        controlId='formGridBillingZip'
                      >
                        <Form.Label>
                          Billing Zip Code
                          <span className='required-red'>
                            {" "}
                            <b>*</b>
                          </span>
                        </Form.Label>
                        <Form.Control
                          placeholder='12345'
                          value={this.state.purchase.billing_zip || ""}
                          name='billing_zip'
                          onChange={this.handleChange}
                        />
                        {/(^\d{5}$)|(^\d{5}-\d{4}$)/.test(
                          this.state.purchase.billing_zip
                        ) ? (
                          ""
                        ) : (
                          <span className='required-red'>
                            Invalid Billing Zip Code
                          </span>
                        )}
                      </Form.Group>
                    </Form.Row>

                    <Form.Row></Form.Row>

                    <Form.Row>
                      <Form.Group as={Col} md={3} controlId='formGridPassword'>
                        <Form.Label>Password</Form.Label>
                        <Form.Control
                          type='password'
                          placeholder={
                            !this.state.password_salt
                              ? "Social Media Account"
                              : "Enter Password"
                          }
                          value={this.state.password}
                          name='password'
                          onChange={this.handlePwChange}
                          disabled={!this.state.password_salt ? true : false}
                        />
                        {this.searchCookie4loginMethod("loginStatus") !==
                          "social" && this.state.password === "" ? (
                          <span className='required-red'>
                            Password is required
                          </span>
                        ) : (
                          ""
                        )}
                      </Form.Group>
                    </Form.Row>

                    <Button
                      onClick={this.checkout}
                      variant='success'
                      type='submit'
                      disabled={this.validateForm()}
                    >
                      Checkout
                    </Button>
                  </Form>
                </Col>
              </Row>
              &nbsp;
            </Container>
          </Fragment>
        ) : (
          <div className='container text-center'>
            <h1>Cart Lost: Select Another Plan</h1>
            <h4>{this.state.send_error}</h4>
            <a href='/selectmealplan'>
              <img src={TruckIcon} alt='Truck Icon' />
              <p>Select a Meal Plan</p>
            </a>
          </div>
        )}
      </Fragment>
    );
  }
}

export default Checkout;
