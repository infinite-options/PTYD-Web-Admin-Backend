import React, { Component } from "react";
import { Table, Card, Container, Row, Col } from "react-bootstrap";
// import { MDBTable, MDBTableBody, MDBTableHead } from "mdbreact";

import Typography from "@material-ui/core/Typography";
import Breadcrumbs from "@material-ui/core/Breadcrumbs";
import Link from "@material-ui/core/Link";
import Avatar from "@material-ui/core/Avatar";
//import EditSettings from "./EditSettings";
import Button from "@material-ui/core/Button";
import TextField from "@material-ui/core/TextField";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogContentText from "@material-ui/core/DialogContentText";
import DialogTitle from "@material-ui/core/DialogTitle";
import axios from "axios";

import MenuItem from "@material-ui/core/MenuItem";
import FormControl from "@material-ui/core/FormControl";
import Select from "@material-ui/core/Select";

class OIDisplay extends Component {
  constructor(props) {
    super(props);
    this.state = {
      orders: [],
      ingredients: [],
      mealPlans: [],
      coupons: [],
      taxrate: [],
      open: false,
      selIndex: 0,
      copen: false,
      ncopen: false,
      selCIndex: 0,
      topen: false,
      selTIndex: 0,
      newCoupon: {
        coupon_id: "None",
        active: "FALSE",
        discount_percent: 0,
        discount_amount: 0,
        discount_shipping: 0,
        expire_date: "2020-07-25",
        limits: 0,
        notes: "None",
        num_used: 0,
        recurring: "FLASE",
        email: "None",
      },
      mapDateToOrders: new Map(),
      mapDateToIngr: new Map(),
      dateOrders: [],
      selOrderDate: 0,
    };
  }

  async componentDidMount() {
    const res1 = await fetch(this.props.ORDERS_API_URL);
    const api1 = await res1.json();
    const orders = api1.result.result;

    const res2 = await fetch(this.props.INGREDIENTS_API_URL);
    const api2 = await res2.json();
    const ingredients = api2.result.result;

    let mapDateToOrders = new Map();
    let mapDateToIngr = new Map();
    let dateOrders = [];

    for (let idx = 0; idx < orders.length; idx++) {
      if (!dateOrders.includes(orders[idx].menu_date))
        dateOrders.push(orders[idx].menu_date);
    }

    //console.log(dateOrders);

    for (let i = 0; i < dateOrders.length; i++) {
      for (let j = 0; j < orders.length; j++) {
        if (orders[j].menu_date == dateOrders[i]) {
          if (mapDateToOrders.has(dateOrders[i])) {
            let tempArray = mapDateToOrders.get(dateOrders[i]);
            tempArray.push(orders[j]);
            mapDateToOrders.set(dateOrders[i], tempArray);
          } else {
            let tempArray = [];
            tempArray.push(orders[j]);
            mapDateToOrders.set(dateOrders[i], tempArray);
          }
        }
      }
    }

    for (let i = 0; i < dateOrders.length; i++) {
      for (let j = 0; j < ingredients.length; j++) {
        if (ingredients[j].week_affected == dateOrders[i]) {
          if (mapDateToIngr.has(dateOrders[i])) {
            let tempArray = mapDateToIngr.get(dateOrders[i]);
            tempArray.push(ingredients[j]);
            mapDateToIngr.set(dateOrders[i], tempArray);
          } else {
            let tempArray = [];
            tempArray.push(ingredients[j]);
            mapDateToIngr.set(dateOrders[i], tempArray);
          }
        }
      }
    }

    this.setState({
      orders: orders,
      ingredients: ingredients,
      mapDateToIngr: mapDateToIngr,
      mapDateToOrders: mapDateToOrders,
      dateOrders: dateOrders,
    });
  }

  orderDateDropdown = () => {
    let tempMeal = [];
    for (let i = 0; i < this.state.dateOrders.length; i++) {
      tempMeal.push(<MenuItem value={i}>{this.state.dateOrders[i]}</MenuItem>);
    }
    return (
      <FormControl>
        <Select
          labelId="demo-simple-select-label"
          id="demo-simple-select"
          value={this.state.selOrderDate}
          onChange={this.handleOrderDateChange}
        >
          {tempMeal}
        </Select>
      </FormControl>
    );
  };

  handleOrderDateChange = (event) => {
    console.log(event.target.value);
    this.setState({ selOrderDate: event.target.value });
  };

  handleIngrDateChange = (event) => {
    console.log(event.target.value);
    this.setState({ selIngrDate: event.target.value });
  };

  addDefaultSrc = (ev) => {
    ev.target.src =
      "https://prep-to-your-door-s3.s3-us-west-1.amazonaws.com/dev_imgs/select5meals.jpg";
  };

  handleMealDesc = (e) => {
    let newMealPlans = this.state.mealPlans;
    newMealPlans[this.state.selIndex].meal_plan_desc = e.target.value;
    this.setState({ mealPlans: newMealPlans });
  };

  handleMealHeadline = (e) => {
    let newMealPlans = this.state.mealPlans;
    newMealPlans[this.state.selIndex].plan_headline = e.target.value;
    this.setState({ mealPlans: newMealPlans });
  };

  handlePaymentFrequency = (e) => {
    let newMealPlans = this.state.mealPlans;
    newMealPlans[this.state.selIndex].payment_frequency = e.target.value;
    this.setState({ mealPlans: newMealPlans });
  };

  handlePlanFooter = (e) => {
    let newMealPlans = this.state.mealPlans;
    newMealPlans[this.state.selIndex].plan_footer = e.target.value;
    this.setState({ mealPlans: newMealPlans });
  };

  handlePhotoUrl = (e) => {
    let newMealPlans = this.state.mealPlans;
    newMealPlans[this.state.selIndex].photo_URL = e.target.value;
    this.setState({ mealPlans: newMealPlans });
  };

  handleNumOfMeals = (e) => {
    let newMealPlans = this.state.mealPlans;
    newMealPlans[this.state.selIndex].num_meals = e.target.value;
    this.setState({ mealPlans: newMealPlans });
  };

  handlePlanWeeklyPrice = (e) => {
    let newMealPlans = this.state.mealPlans;
    newMealPlans[this.state.selIndex].meal_weekly_price = e.target.value;
    this.setState({ mealPlans: newMealPlans });
  };

  handlePlanPrice = (e) => {
    let newMealPlans = this.state.mealPlans;
    newMealPlans[this.state.selIndex].meal_plan_price = e.target.value;
    this.setState({ mealPlans: newMealPlans });
  };

  handleShippingOfMeal = (e) => {
    let newMealPlans = this.state.mealPlans;
    newMealPlans[this.state.selIndex].meal_shipping = e.target.value;
    this.setState({ mealPlans: newMealPlans });
  };

  handleMealTax = (e) => {
    let newMealPlans = this.state.mealPlans;
    newMealPlans[this.state.selIndex].meal_tax = e.target.value;
    this.setState({ mealPlans: newMealPlans });
  };

  handleCouponId = (e) => {
    let newCoupons = this.state.coupons;
    newCoupons[this.state.selCIndex].coupon_id = e.target.value;
    this.setState({ coupons: newCoupons });
  };

  handleCouponActive = (e) => {
    let newCoupons = this.state.coupons;
    newCoupons[this.state.selCIndex].active = e.target.value;
    this.setState({ coupons: newCoupons });
  };

  handleCouponDiscountPercent = (e) => {
    let newCoupons = this.state.coupons;
    newCoupons[this.state.selCIndex].discount_percent = e.target.value;
    this.setState({ coupons: newCoupons });
  };

  handleCouponDiscountAmount = (e) => {
    let newCoupons = this.state.coupons;
    newCoupons[this.state.selCIndex].discount_amount = e.target.value;
    this.setState({ coupons: newCoupons });
  };

  handleCouponDiscountShipping = (e) => {
    let newCoupons = this.state.coupons;
    newCoupons[this.state.selCIndex].discount_shipping = e.target.value;
    this.setState({ coupons: newCoupons });
  };

  handleCouponExpiryDate = (e) => {
    let newCoupons = this.state.coupons;
    newCoupons[this.state.selCIndex].expire_date = e.target.value;
    this.setState({ coupons: newCoupons });
  };

  handleCouponLimits = (e) => {
    let newCoupons = this.state.coupons;
    newCoupons[this.state.selCIndex].limits = e.target.value;
    this.setState({ coupons: newCoupons });
  };

  handleCouponNotes = (e) => {
    let newCoupons = this.state.coupons;
    newCoupons[this.state.selCIndex].notes = e.target.value;
    this.setState({ coupons: newCoupons });
  };

  handleCouponNumUsed = (e) => {
    let newCoupons = this.state.coupons;
    newCoupons[this.state.selCIndex].num_used = e.target.value;
    this.setState({ coupons: newCoupons });
  };

  handleCouponRecurring = (e) => {
    let newCoupons = this.state.coupons;
    newCoupons[this.state.selCIndex].recurring = e.target.value;
    this.setState({ coupons: newCoupons });
  };

  handleCouponEmail = (e) => {
    let newCoupons = this.state.coupons;
    newCoupons[this.state.selCIndex].email = e.target.value;
    this.setState({ coupons: newCoupons });
  };

  handleSaturdayDate = (e) => {
    let newTaxRate = this.state.taxrate;
    newTaxRate[this.state.selTIndex].Saturday = e.target.value;
    this.setState({ taxrate: newTaxRate });
  };

  handleTaxRate = (e) => {
    let newTaxRate = this.state.taxrate;
    newTaxRate[this.state.selTIndex].Tax_Rate = e.target.value;
    this.setState({ taxrate: newTaxRate });
  };

  render() {
    console.log(this.props.API_URL_MEALPLANS);
    console.log(this.state.mealPlans);
    console.log(this.state.taxrate);
    let plan_desc_temp = "NONE";
    let plan_headline_temp = "NONE";
    let plan_payment_frequency_temp = "NONE";
    let plan_photo_url_temp = "NONE";
    let plan_footer_temp = "NONE";
    let plan_num_meals_temp = 0;
    let plan_meal_weekly_price_temp = 0;
    let plan_price_temp = 0;
    let plan_shipping_temp = 0;
    let plan_meal_tax_temp = 0;

    let coupon_id_t = "NONE";
    let coupon_active_t = "NONE";
    let coupon_discount_percent_t = 0;
    let coupon_discount_amount_t = 0;
    let coupon_discount_shipping_t = 0;
    let coupon_expire_date_t = "NONE";
    let coupon_limits_t = 0;
    let coupon_notes_t = "NONE";
    let coupon_num_used_t = 0;
    let coupon_recurring_t = "NONE";
    let coupon_email_t = "NONE";

    let tax_rate_saturday_t = "NONE";
    let tax_rate_rate_t = 0;

    if (this.state.mealPlans.length > 0) {
      plan_desc_temp = this.state.mealPlans[this.state.selIndex].meal_plan_desc;
      plan_headline_temp = this.state.mealPlans[this.state.selIndex]
        .plan_headline;
      plan_payment_frequency_temp = this.state.mealPlans[this.state.selIndex]
        .payment_frequency;
      plan_footer_temp = this.state.mealPlans[this.state.selIndex].plan_footer;
      plan_photo_url_temp = this.state.mealPlans[this.state.selIndex].photo_URL;
      plan_num_meals_temp = this.state.mealPlans[this.state.selIndex].num_meals;
      plan_meal_weekly_price_temp = this.state.mealPlans[this.state.selIndex]
        .meal_weekly_price;
      plan_price_temp = this.state.mealPlans[this.state.selIndex]
        .meal_plan_price;
      plan_shipping_temp = this.state.mealPlans[this.state.selIndex]
        .meal_shipping;
      plan_meal_tax_temp = this.state.mealPlans[this.state.selIndex].meal_tax;
    }

    if (this.state.coupons.length > 0) {
      coupon_id_t = this.state.coupons[this.state.selCIndex].coupon_id;
      coupon_active_t = this.state.coupons[this.state.selCIndex].active;
      coupon_discount_percent_t = this.state.coupons[this.state.selCIndex]
        .discount_percent;
      coupon_discount_amount_t = this.state.coupons[this.state.selCIndex]
        .discount_amount;
      coupon_discount_shipping_t = this.state.coupons[this.state.selCIndex]
        .discount_shipping;
      coupon_expire_date_t = this.state.coupons[this.state.selCIndex]
        .expire_date;
      coupon_limits_t = this.state.coupons[this.state.selCIndex].limits;
      coupon_notes_t = this.state.coupons[this.state.selCIndex].notes;
      coupon_num_used_t = this.state.coupons[this.state.selCIndex].num_used;
      coupon_recurring_t = this.state.coupons[this.state.selCIndex].recurring;
      coupon_email_t = this.state.coupons[this.state.selCIndex].email;
    }

    if (this.state.taxrate.length > 0) {
      tax_rate_saturday_t = this.state.taxrate[this.state.selTIndex].Saturday;
      tax_rate_rate_t = this.state.taxrate[this.state.selTIndex].Tax_Rate;
    }

    return (
      // <div className="container" style={{ marginTop: "10%" }}>
      <div style={{ margin: "1%" }}>
        {/* meal plans*/}
        <br />

        <Breadcrumbs aria-label="breadcrumb">
          <Link color="inherit" onClick={this.handleClick}>
            Admin Site
          </Link>
          <Typography color="textPrimary">Orders</Typography>
        </Breadcrumbs>
        {this.orderDateDropdown()}
        {this.orders_function()}

        <br />
        <br />
        {/* coupons*/}
        <br />

        <Breadcrumbs aria-label="breadcrumb">
          <Link color="inherit" onClick={this.handleClick}>
            Admin Site
          </Link>
          <Typography color="textPrimary">Ingredients</Typography>
        </Breadcrumbs>
        {this.ingredients_function()}
        <br />
        <br />

        <Dialog
          open={this.state.open}
          onClose={this.handleClose}
          aria-labelledby="form-dialog-title"
        >
          <DialogTitle id="form-dialog-title">
            Edit Meal Plans Table Here
          </DialogTitle>
          <DialogContent>
            <DialogContentText>
              To Edit the Meal Plans table : Change all these fields accordingly
              and press "Save" else Press "Cancel" if you don't want to edit
              anything.
            </DialogContentText>
            <TextField
              autoFocus
              margin="dense"
              id="xyz"
              label="Plan"
              type="text"
              value={plan_desc_temp}
              onChange={this.handleMealDesc}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name"
              label="Plan Description"
              type="text"
              value={plan_headline_temp}
              onChange={this.handleMealHeadline}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name2"
              label="Payment Frequency"
              type="text"
              value={plan_payment_frequency_temp}
              onChange={this.handlePaymentFrequency}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name3"
              label="In Short"
              type="text"
              value={plan_footer_temp}
              onChange={this.handlePlanFooter}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name4"
              label="Pic URL"
              type="url"
              value={plan_photo_url_temp}
              onChange={this.handlePhotoUrl}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name5"
              label="Num of Meals"
              type="number"
              value={plan_num_meals_temp}
              onChange={this.handleNumOfMeals}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name6"
              label="Weekly Price"
              type="number"
              value={plan_meal_weekly_price_temp}
              onChange={this.handlePlanWeeklyPrice}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name7"
              label="Plan Price"
              type="number"
              value={plan_price_temp}
              onChange={this.handlePlanPrice}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name8"
              label="Meal Shipping"
              type="number"
              value={plan_shipping_temp}
              onChange={this.handleShippingOfMeal}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name9"
              label="Meal Tax"
              type="number"
              value={plan_meal_tax_temp}
              onChange={this.handleMealTax}
              fullWidth
            />
          </DialogContent>
          <DialogActions>
            <Button onClick={this.handleCloseCancel} color="primary">
              Cancel
            </Button>
            <Button onClick={this.handleCloseSave} color="primary">
              Save
            </Button>
          </DialogActions>
        </Dialog>

        <Dialog
          open={this.state.copen}
          onClose={this.chandleClose}
          aria-labelledby="form-dialog-title"
        >
          <DialogTitle id="form-dialog-title">Edit Coupons Here</DialogTitle>
          <DialogContent>
            <DialogContentText>
              To Edit the Coupons : Change all these fields accordingly and
              press "Save" else Press "Cancel" if you don't want to edit
              anything.
            </DialogContentText>
            <TextField
              autoFocus
              margin="dense"
              id="name10"
              label="Coupon ID"
              type="text"
              value={coupon_id_t}
              onChange={this.handleCouponId}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name11"
              label="Activation Status"
              type="text"
              value={coupon_active_t}
              onChange={this.handleCouponActive}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name12"
              label="Discount %"
              type="text"
              value={coupon_discount_percent_t}
              onChange={this.handleCouponDiscountPercent}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name13"
              label="Discount Amount"
              type="number"
              value={coupon_discount_amount_t}
              onChange={this.handleCouponDiscountAmount}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name14"
              label="Discount Shipping"
              type="number"
              value={coupon_discount_shipping_t}
              onChange={this.handleCouponDiscountShipping}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name15"
              label="Expiry Date"
              type="date"
              value={coupon_expire_date_t}
              onChange={this.handleCouponExpiryDate}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name16"
              label="Limits"
              type="number"
              value={coupon_limits_t}
              onChange={this.handleCouponLimits}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name17"
              label="Notes"
              type="text"
              value={coupon_notes_t}
              onChange={this.handleCouponNotes}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name18"
              label="Num Used"
              type="number"
              value={coupon_num_used_t}
              onChange={this.handleCouponNumUsed}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name19"
              label="Recurring"
              type="text"
              value={coupon_recurring_t}
              onChange={this.handleCouponRecurring}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name20"
              label="Email"
              type="email"
              value={coupon_email_t}
              onChange={this.handleCouponEmail}
              fullWidth
            />
          </DialogContent>
          <DialogActions>
            <Button onClick={this.chandleCloseCancel} color="primary">
              Cancel
            </Button>
            <Button onClick={this.chandleCloseSave} color="primary">
              Save
            </Button>
          </DialogActions>
        </Dialog>

        <Dialog
          open={this.state.ncopen}
          onClose={this.nchandleClose}
          aria-labelledby="form-dialog-title"
        >
          <DialogTitle id="form-dialog-title">Add New Coupon Here</DialogTitle>
          <DialogContent>
            <DialogContentText>
              To Add the Coupon : Change all these fields accordingly and press
              "Save" else Press "Cancel" if you want to discard.
            </DialogContentText>
            <TextField
              autoFocus
              margin="dense"
              id="name10"
              label="Coupon ID"
              type="text"
              value={this.state.newCoupon.coupon_id}
              onChange={(e) => {
                let newCoupon = this.state.newCoupon;
                newCoupon.coupon_id = e.target.value;
                this.setState({ newCoupon: newCoupon });
              }}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name11"
              label="Activation Status"
              type="text"
              value={this.state.newCoupon.active}
              onChange={(e) => {
                let newCoupon = this.state.newCoupon;
                newCoupon.active = e.target.value;
                this.setState({ newCoupon: newCoupon });
              }}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name12"
              label="Discount %"
              type="text"
              value={this.state.newCoupon.discount_percent}
              onChange={(e) => {
                let newCoupon = this.state.newCoupon;
                newCoupon.discount_percent = e.target.value;
                this.setState({ newCoupon: newCoupon });
              }}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name13"
              label="Discount Amount"
              type="number"
              value={this.state.newCoupon.discount_amount}
              onChange={(e) => {
                let newCoupon = this.state.newCoupon;
                newCoupon.discount_amount = e.target.value;
                this.setState({ newCoupon: newCoupon });
              }}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name14"
              label="Discount Shipping"
              type="number"
              value={this.state.newCoupon.discount_shipping}
              onChange={(e) => {
                let newCoupon = this.state.newCoupon;
                newCoupon.discount_shipping = e.target.value;
                this.setState({ newCoupon: newCoupon });
              }}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name15"
              label="Expiry Date"
              type="date"
              value={this.state.newCoupon.expire_date}
              onChange={(e) => {
                let newCoupon = this.state.newCoupon;
                newCoupon.expire_date = e.target.value;
                this.setState({ newCoupon: newCoupon });
              }}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name16"
              label="Limits"
              type="number"
              value={this.state.newCoupon.limits}
              onChange={(e) => {
                let newCoupon = this.state.newCoupon;
                newCoupon.limits = e.target.value;
                this.setState({ newCoupon: newCoupon });
              }}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name17"
              label="Notes"
              type="text"
              value={this.state.newCoupon.notes}
              onChange={(e) => {
                let newCoupon = this.state.newCoupon;
                newCoupon.notes = e.target.value;
                this.setState({ newCoupon: newCoupon });
              }}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name18"
              label="Num Used"
              type="number"
              value={this.state.newCoupon.num_used}
              onChange={(e) => {
                let newCoupon = this.state.newCoupon;
                newCoupon.num_used = e.target.value;
                this.setState({ newCoupon: newCoupon });
              }}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name19"
              label="Recurring"
              type="text"
              value={this.state.newCoupon.recurring}
              onChange={(e) => {
                let newCoupon = this.state.newCoupon;
                newCoupon.recurring = e.target.value;
                this.setState({ newCoupon: newCoupon });
              }}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name20"
              label="Email"
              type="email"
              value={this.state.newCoupon.email}
              onChange={(e) => {
                let newCoupon = this.state.newCoupon;
                newCoupon.email = e.target.value;
                this.setState({ newCoupon: newCoupon });
              }}
              fullWidth
            />
          </DialogContent>
          <DialogActions>
            <Button onClick={this.nchandleCloseCancel} color="primary">
              Cancel
            </Button>
            <Button onClick={this.nchandleCloseSave} color="primary">
              Save
            </Button>
          </DialogActions>
        </Dialog>

        <Dialog
          open={this.state.topen}
          onClose={this.thandleClose}
          aria-labelledby="form-dialog-title"
        >
          <DialogTitle id="form-dialog-title">Edit Tax Rate Here</DialogTitle>
          <DialogContent>
            <DialogContentText>
              To Edit the Tax Rate : Change all these fields accordingly and
              press "Save" else Press "Cancel" if you don't want to edit
              anything.
            </DialogContentText>
            <TextField
              autoFocus
              margin="dense"
              id="name21"
              label="Saturday Date"
              type="date"
              value={tax_rate_saturday_t}
              onChange={this.handleSaturdayDate}
              fullWidth
            />
            <TextField
              autoFocus
              margin="dense"
              id="name22"
              label="Tax Rate"
              type="number"
              value={tax_rate_rate_t}
              onChange={this.handleTaxRate}
              fullWidth
            />
          </DialogContent>
          <DialogActions>
            <Button onClick={this.thandleCloseCancel} color="primary">
              Cancel
            </Button>
            <Button onClick={this.thandleCloseSave} color="primary">
              Save
            </Button>
          </DialogActions>
        </Dialog>
      </div>
    );
  }

  handleClickOpen = (meal, index) => {
    this.setState({ selIndex: index }, () => {
      this.setState({
        open: true,
      });
    });
  };

  handleClose = (e) => {
    this.setState({
      open: false,
    });
  };

  handleCloseSave = (e) => {
    e.preventDefault();
    if (this.state.mealPlans.length > 0) {
      var mealData = {
        meal_plan_id: this.state.mealPlans[this.state.selIndex].meal_plan_id,
        meal_plan_desc: this.state.mealPlans[this.state.selIndex]
          .meal_plan_desc,
        plan_headline: this.state.mealPlans[this.state.selIndex].plan_headline,
        payment_frequency: this.state.mealPlans[this.state.selIndex]
          .payment_frequency,
        plan_footer: this.state.mealPlans[this.state.selIndex].plan_footer,
        photo_URL: this.state.mealPlans[this.state.selIndex].photo_URL,
        num_meals: this.state.mealPlans[this.state.selIndex].num_meals,
        meal_weekly_price: this.state.mealPlans[this.state.selIndex]
          .meal_weekly_price,
        meal_plan_price: this.state.mealPlans[this.state.selIndex]
          .meal_plan_price,
        meal_shipping: this.state.mealPlans[this.state.selIndex].meal_shipping,
        meal_tax: this.state.mealPlans[this.state.selIndex].meal_tax,
      };

      console.log(mealData);
      axios
        .patch(this.props.API_URL_MEALPLANS, mealData)
        .then((res) => {
          if (res.status === 200) {
            // if success
            // if (res.data !== undefined && res.data !== null) {// if success
            //   // this should not be here. this will allows login without add username and password in database
            //   document.cookie = `logigit nStatus: Hello ${res.data.first_name}! , user_uid: ${res.data.user_uid}  , `;
            // }

            // props.history.push("/selectmealplan"); //this should be disable and waiting until email has been confirmed

            // window.location.reload(false);
            //props.history.push("/signupwaiting");
            //setLoading(false);
            console.log("API PATCH MEAL PLANS WORKED");
            this.setState({ open: false }, () => {
              window.location.reload(true);
            });
          }
        })
        .catch((err) => {
          if (err.response !== undefined) {
            //setErro(err.response.data.result);
            //window.location.reload(false);
            console.log("API PATCH MEAL PLANS Failed");
          } else if (typeof err === "string") {
            //setErro(err);
            console.log(err);
          }
          //setLoading(false);
        });
    }
  };

  handleCloseCancel = (e) => {
    this.setState({ open: false }, () => {
      window.location.reload(true);
    });
  };

  //COUPONS
  chandleClickOpen = (meal, index) => {
    this.setState({ selCIndex: index }, () => {
      this.setState({
        copen: true,
      });
    });
  };

  chandleClose = (e) => {
    this.setState({
      copen: false,
    });
  };

  chandleCloseSave = (e) => {
    e.preventDefault();
    if (this.state.coupons.length > 0) {
      var couponData = {
        coupon_id: this.state.coupons[this.state.selCIndex].coupon_id,
        active: this.state.coupons[this.state.selCIndex].active,
        discount_percent: this.state.coupons[this.state.selCIndex]
          .discount_percent,
        discount_amount: this.state.coupons[this.state.selCIndex]
          .discount_amount,
        discount_shipping: this.state.coupons[this.state.selCIndex]
          .discount_shipping,
        expire_date: this.state.coupons[this.state.selCIndex].expire_date,
        limits: this.state.coupons[this.state.selCIndex].limits,
        notes: this.state.coupons[this.state.selCIndex].notes,
        num_used: this.state.coupons[this.state.selCIndex].num_used,
        recurring: this.state.coupons[this.state.selCIndex].recurring,
        email: this.state.coupons[this.state.selCIndex].email,
      };

      console.log(couponData);
      axios
        .patch(this.props.API_URL_COUPONS, couponData)
        .then((res) => {
          if (res.status === 200) {
            // if success
            // if (res.data !== undefined && res.data !== null) {// if success
            //   // this should not be here. this will allows login without add username and password in database
            //   document.cookie = `logigit nStatus: Hello ${res.data.first_name}! , user_uid: ${res.data.user_uid}  , `;
            // }

            // props.history.push("/selectmealplan"); //this should be disable and waiting until email has been confirmed

            // window.location.reload(false);
            //props.history.push("/signupwaiting");
            //setLoading(false);
            console.log("API PATCH COUPONS WORKED");
            this.setState({ copen: false }, () => {
              window.location.reload(true);
            });
          }
        })
        .catch((err) => {
          if (err.response !== undefined) {
            //setErro(err.response.data.result);
            //window.location.reload(false);
            console.log("API PATCH COUPONS Failed");
          } else if (typeof err === "string") {
            //setErro(err);
            console.log(err);
          }
          //setLoading(false);
        });
    }
  };

  chandleCloseCancel = (e) => {
    this.setState({ copen: false }, () => {
      window.location.reload(true);
    });
  };

  //COUPONS

  thandleClickOpen = (meal, index) => {
    this.setState({ selTIndex: index }, () => {
      this.setState({
        topen: true,
      });
    });
  };

  thandleClose = (e) => {
    this.setState({
      topen: false,
    });
  };

  thandleCloseSave = (e) => {
    e.preventDefault();
    if (this.state.taxrate.length > 0) {
      var taxData = {
        Saturday: this.state.taxrate[this.state.selTIndex].Saturday,
        Tax_Rate: this.state.taxrate[this.state.selTIndex].Tax_Rate,
      };

      console.log(taxData);
      axios
        .patch(this.props.API_URL_TAXRATE, taxData)
        .then((res) => {
          if (res.status === 200) {
            // if success
            // if (res.data !== undefined && res.data !== null) {// if success
            //   // this should not be here. this will allows login without add username and password in database
            //   document.cookie = `logigit nStatus: Hello ${res.data.first_name}! , user_uid: ${res.data.user_uid}  , `;
            // }

            // props.history.push("/selectmealplan"); //this should be disable and waiting until email has been confirmed

            // window.location.reload(false);
            //props.history.push("/signupwaiting");
            //setLoading(false);
            console.log("API PATCH TAXRATE WORKED");
            this.setState({ topen: false }, () => {
              window.location.reload(true);
            });
          }
        })
        .catch((err) => {
          if (err.response !== undefined) {
            //setErro(err.response.data.result);
            //window.location.reload(false);
            console.log("API PATCH TAXRATE Failed");
          } else if (typeof err === "string") {
            //setErro(err);
            console.log(err);
          }
          //setLoading(false);
        });
    }
  };

  thandleCloseCancel = (e) => {
    this.setState({ topen: false }, () => {
      window.location.reload(true);
    });
  };

  mealPlans_function = () => {
    return (
      <Row>
        <Col>
          <Card
            style={{
              width: "100%",
              boxShadow: "0px 5px 10px 4px rgba(0,0,0,0.2)",
              height: "auto",
            }}
          >
            <Card.Body>
              <div className="vertical-menu">
                <Table striped bordered hover>
                  <thead style={{ overflow: "scroll" }}>
                    <tr>
                      <th>Plan</th>
                      <th>Plan Description</th>
                      <th>Payment Frequency</th>
                      <th>In Short</th>
                      <th>Pic</th>
                      <th>Num of Meals</th>
                      <th>Weekly Price</th>
                      <th>Plan Price</th>
                      <th>Meal Shipping</th>
                      <th>Meal Tax</th>
                    </tr>
                  </thead>

                  <tbody
                    className="vertical-menu"
                    style={{
                      height: "300px",
                      overflow: "scroll",
                    }}
                  >
                    {this.state.mealPlans.map((meal, index) => (
                      <tr>
                        <td>{meal.meal_plan_desc}</td>
                        <td>{meal.plan_headline}</td>
                        <td>{meal.payment_frequency}</td>
                        <td>{meal.plan_footer}</td>
                        <td>
                          <img
                            src={meal.photo_URL}
                            onError={this.addDefaultSrc}
                            className="img-responsive"
                            style={{
                              height: "100px",
                              width: "100px",
                            }}
                          />
                        </td>
                        <td>{meal.num_meals}</td>
                        <td>{meal.meal_weekly_price}</td>
                        <td>{meal.meal_plan_price}</td>
                        <td>{meal.meal_shipping}</td>
                        <td>{meal.meal_tax}</td>
                        <td>
                          {" "}
                          <Button
                            variant="outlined"
                            color="primary"
                            onClick={(e) => {
                              this.handleClickOpen(meal, index);
                            }}
                          >
                            Edit
                          </Button>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </Table>
              </div>
            </Card.Body>
          </Card>
        </Col>
      </Row>
    );
  };

  coupons_function = () => {
    return (
      <Row>
        <Col>
          <Card
            style={{
              width: "100%",
              boxShadow: "0px 5px 10px 4px rgba(0,0,0,0.2)",
              height: "auto",
            }}
          >
            <Card.Body>
              <div className="vertical-menu">
                <Table striped bordered hover>
                  <thead style={{ overflow: "scroll" }}>
                    <tr>
                      <th>Coupon ID</th>
                      <th>Active</th>
                      <th>Discount %</th>
                      <th>Discount Amount</th>
                      <th>Discount Shipping</th>
                      <th>Expiry Date</th>
                      <th>Limits</th>
                      <th>Notes</th>
                      <th>Num Used</th>
                      <th>Recurring</th>
                      <th>Email</th>
                    </tr>
                  </thead>

                  <tbody
                    className="vertical-menu"
                    style={{
                      height: "200px",
                      overflow: "scroll",
                    }}
                  >
                    {this.state.coupons.map((meal, index) => (
                      <tr>
                        <td>{meal.coupon_id}</td>
                        <td>{meal.active}</td>
                        <td>{meal.discount_percent}</td>
                        <td>{meal.discount_amount}</td>
                        <td>{meal.discount_shipping}</td>
                        <td>{meal.expire_date}</td>
                        <td>{meal.limits}</td>
                        <td>{meal.notes}</td>
                        <td>{meal.num_used}</td>
                        <td>{meal.recurring}</td>
                        <td>{meal.email}</td>
                        <td>
                          {" "}
                          <Button
                            variant="outlined"
                            color="primary"
                            onClick={(e) => {
                              this.chandleClickOpen(meal, index);
                            }}
                          >
                            Edit
                          </Button>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </Table>
              </div>
            </Card.Body>
          </Card>
        </Col>
      </Row>
    );
  };

  taxRate_function = () => {
    return (
      <Row>
        <Col>
          <Card
            style={{
              width: "45%",
              boxShadow: "0px 5px 10px 4px rgba(0,0,0,0.2)",
            }}
          >
            <Card.Body>
              <div className="vertical-menu">
                <Table striped bordered hover>
                  <thead style={{ overflow: "scroll" }}>
                    <tr>
                      <th>Saturday Date</th>
                      <th>Tax Rate</th>
                    </tr>
                  </thead>

                  <tbody
                    className="vertical-menu"
                    style={{
                      height: "300px",
                      overflow: "scroll",
                    }}
                  >
                    {this.state.taxrate.map((meal, index) => (
                      <tr>
                        <td>{meal.Saturday}</td>
                        <td>{meal.Tax_Rate}</td>
                        <td>
                          {" "}
                          <Button
                            variant="outlined"
                            color="primary"
                            onClick={(e) => {
                              this.thandleClickOpen(meal, index);
                            }}
                          >
                            Edit
                          </Button>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </Table>
              </div>
            </Card.Body>
          </Card>
        </Col>
      </Row>
    );
  };

  //NEW COUPONS
  nchandleClickOpen = (e) => {
    this.setState({
      ncopen: true,
    });
  };

  nchandleClose = (e) => {
    this.setState({
      ncopen: false,
    });
  };

  nchandleCloseSave = (e) => {
    e.preventDefault();

    var couponData = {
      coupon_id: this.state.newCoupon.coupon_id,
      active: this.state.newCoupon.active,
      discount_percent: this.state.newCoupon.discount_percent,
      discount_amount: this.state.newCoupon.discount_amount,
      discount_shipping: this.state.newCoupon.discount_shipping,
      expire_date: this.state.newCoupon.expire_date,
      limits: this.state.newCoupon.limits,
      notes: this.state.newCoupon.notes,
      num_used: this.state.newCoupon.num_used,
      recurring: this.state.newCoupon.recurring,
      email: this.state.newCoupon.email,
    };

    console.log(couponData);
    axios
      .post(this.props.API_URL_COUPONS, couponData)
      .then((res) => {
        if (res.status === 200) {
          // if success
          // if (res.data !== undefined && res.data !== null) {// if success
          //   // this should not be here. this will allows login without add username and password in database
          //   document.cookie = `logigit nStatus: Hello ${res.data.first_name}! , user_uid: ${res.data.user_uid}  , `;
          // }

          // props.history.push("/selectmealplan"); //this should be disable and waiting until email has been confirmed

          // window.location.reload(false);
          //props.history.push("/signupwaiting");
          //setLoading(false);
          console.log("API POST COUPONS WORKED");
          this.setState({ ncopen: false }, () => {
            window.location.reload(true);
          });
        }
      })
      .catch((err) => {
        if (err.response !== undefined) {
          //setErro(err.response.data.result);
          //window.location.reload(false);
          console.log("API POST COUPONS Failed");
        } else if (typeof err === "string") {
          //setErro(err);
          console.log(err);
        }
        //setLoading(false);
      });
  };

  nchandleCloseCancel = (e) => {
    this.setState({ ncopen: false }, () => {
      window.location.reload(true);
    });
  };

  orders_function = () => {
    var currDateOrders = this.state.mapDateToOrders.get(
      this.state.dateOrders[this.state.selOrderDate]
    );
    if (currDateOrders) {
      return (
        <Row>
          <Col>
            <Card
              style={{
                width: "100%",
                boxShadow: "0px 5px 10px 4px rgba(0,0,0,0.2)",
                height: "auto",
              }}
            >
              <Card.Body>
                <div className="vertical-menu">
                  <Table striped bordered hover>
                    <thead style={{ overflow: "scroll" }}>
                      <tr>
                        <th>Menu Date</th>
                        <th>Menu Category</th>
                        <th>Meal Category</th>
                        <th>Menu Type</th>
                        <th>Meal Category</th>
                        <th>Meal ID</th>
                        <th>Meal Name</th>
                        <th>Default Meal</th>
                        <th>Extra Meal Price</th>
                        <th>Total</th>
                      </tr>
                    </thead>

                    <tbody
                      className="vertical-menu"
                      style={{
                        height: "300px",
                        overflow: "scroll",
                      }}
                    >
                      {currDateOrders.map((meal, index) => (
                        <tr>
                          <td>{meal.menu_date}</td>
                          <td>{meal.menu_category}</td>
                          <td>{meal.meal_category}</td>
                          <td>{meal.menu_type}</td>
                          <td>{meal.meal_cat}</td>
                          <td>{meal.meal_id}</td>
                          <td>{meal.meal_name}</td>
                          <td>{meal.default_meal}</td>
                          <td>{meal.extra_meal_price}</td>
                          <td>{meal.total}</td>
                        </tr>
                      ))}
                    </tbody>
                  </Table>
                </div>
              </Card.Body>
            </Card>
          </Col>
        </Row>
      );
    } else {
      return (
        <Row>
          <Col>
            <Card
              style={{
                width: "100%",
                boxShadow: "0px 5px 10px 4px rgba(0,0,0,0.2)",
                height: "auto",
              }}
            >
              <Card.Body>
                <div className="vertical-menu">
                  <Table striped bordered hover>
                    <thead style={{ overflow: "scroll" }}>
                      <tr>
                        <th>Menu Date</th>
                        <th>Menu Category</th>
                        <th>Meal Category</th>
                        <th>Menu Type</th>
                        <th>Meal Category</th>
                        <th>Meal ID</th>
                        <th>Meal Name</th>
                        <th>Default Meal</th>
                        <th>Extra Meal Price</th>
                        <th>Total</th>
                      </tr>
                    </thead>

                    <tbody
                      className="vertical-menu"
                      style={{
                        height: "300px",
                        overflow: "scroll",
                      }}
                    ></tbody>
                  </Table>
                </div>
              </Card.Body>
            </Card>
          </Col>
        </Row>
      );
    }
  };

  ingredients_function = () => {
    var currdateIngrs = this.state.mapDateToIngr.get(
      this.state.dateOrders[this.state.selOrderDate]
    );
    if (currdateIngrs) {
      return (
        <Row>
          <Col>
            <Card
              style={{
                width: "100%",
                boxShadow: "0px 5px 10px 4px rgba(0,0,0,0.2)",
                height: "auto",
              }}
            >
              <Card.Body>
                <div className="vertical-menu">
                  <Table striped bordered hover>
                    <thead style={{ overflow: "scroll" }}>
                      <tr>
                        <th>Week Affected</th>
                        <th>Total Needed</th>
                        <th>Recipe Unit</th>
                        <th>Ingredient Description</th>
                        <th>Package Size</th>
                        <th>Package Measure</th>
                        <th>Coversion Ratio1</th>
                        <th>Coversion Ratio2</th>
                        <th>Need Quantity</th>
                        <th>Inverntory Quantity</th>
                        <th>Buy Quantity</th>
                      </tr>
                    </thead>

                    <tbody
                      className="vertical-menu"
                      style={{
                        height: "300px",
                        overflow: "scroll",
                      }}
                    >
                      {currdateIngrs.map((meal, index) => (
                        <tr>
                          <td>{meal.week_affected}</td>
                          <td>{meal.total_needed}</td>
                          <td>{meal.recipe_unit}</td>
                          <td>{meal.ingredient_desc}</td>
                          <td>{meal.package_size}</td>
                          <td>{meal.package_measure}</td>
                          <td>{meal.ratio1}</td>
                          <td>{meal.ratio2}</td>
                          <td>{meal.need_qty}</td>
                          <td>{meal.inventory_qty}</td>
                          <td>{meal.buy_qty}</td>
                        </tr>
                      ))}
                    </tbody>
                  </Table>
                </div>
              </Card.Body>
            </Card>
          </Col>
        </Row>
      );
    } else {
      return (
        <Row>
          <Col>
            <Card
              style={{
                width: "100%",
                boxShadow: "0px 5px 10px 4px rgba(0,0,0,0.2)",
                height: "auto",
              }}
            >
              <Card.Body>
                <div className="vertical-menu">
                  <Table striped bordered hover>
                    <thead style={{ overflow: "scroll" }}>
                      <tr>
                        <th>Week Affected</th>
                        <th>Total Needed</th>
                        <th>Recipe Unit</th>
                        <th>Ingredient Description</th>
                        <th>Package Size</th>
                        <th>Package Measure</th>
                        <th>Coversion Ratio1</th>
                        <th>Coversion Ratio2</th>
                        <th>Need Quantity</th>
                        <th>Inverntory Quantity</th>
                        <th>Buy Quantity</th>
                      </tr>
                    </thead>

                    <tbody
                      className="vertical-menu"
                      style={{
                        height: "300px",
                        overflow: "scroll",
                      }}
                    ></tbody>
                  </Table>
                </div>
              </Card.Body>
            </Card>
          </Col>
        </Row>
      );
    }
  };
}
export default OIDisplay;
