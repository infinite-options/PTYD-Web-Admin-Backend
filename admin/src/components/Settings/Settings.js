import React, { Component } from "react";
import { Table, Card, Container, Row, Col } from "react-bootstrap";
// import { MDBTable, MDBTableBody, MDBTableHead } from "mdbreact";

import Typography from "@material-ui/core/Typography";
import Breadcrumbs from "@material-ui/core/Breadcrumbs";
import Link from "@material-ui/core/Link";

class Settings extends Component {
  constructor(props) {
    super(props);
    this.state = {
      mealPlans: [],
      coupons: [],
      taxrate: [],
    };
  }

  async componentDidMount() {
    const res1 = await fetch(this.props.API_URL_MEALPLANS);
    const api1 = await res1.json();
    const mealPlans = api1.result.result;

    const res2 = await fetch(this.props.API_URL_COUPONS);
    const api2 = await res2.json();
    const coupons = api2.result.result;

    const res4 = await fetch(this.props.API_URL_TAXRATE);
    const api4 = await res4.json();
    const taxrate = api4.result.result;

    this.setState({
      mealPlans: mealPlans,
      coupons: coupons,
      taxrate: taxrate,
    });
  }

  render() {
    console.log(this.props.API_URL_MEALPLANS);
    console.log(this.state.mealPlans);
    console.log(this.state.taxrate);
    return (
      // <div className="container" style={{ marginTop: "10%" }}>
      <div style={{ margin: "1%" }}>
        {/* meal plans*/}
        <br />

        <Breadcrumbs aria-label="breadcrumb">
          <Link color="inherit" onClick={this.handleClick}>
            Admin Site
          </Link>
          <Typography color="textPrimary">Meal Plans</Typography>
        </Breadcrumbs>
        {this.mealPlans_function()}

        <br />
        <br />
        {/* coupons*/}
        <br />

        <Breadcrumbs aria-label="breadcrumb">
          <Link color="inherit" onClick={this.handleClick}>
            Admin Site
          </Link>
          <Typography color="textPrimary">Coupons</Typography>
        </Breadcrumbs>
        {this.coupons_function()}

        <br />
        <br />
        {/* tax*/}
        <br />

        <Breadcrumbs aria-label="breadcrumb">
          <Link color="inherit" onClick={this.handleClick}>
            Admin Site
          </Link>
          <Typography color="textPrimary">Tax Rate</Typography>
        </Breadcrumbs>
        {this.taxRate_function()}

        <br />
        <br />
      </div>
    );
  }

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
                      <th>Pic URL</th>
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
                    {this.state.mealPlans.map((meal) => (
                      <tr>
                        <td>{meal.meal_plan_desc}</td>
                        <td>{meal.plan_headline}</td>
                        <td>{meal.payment_frequency}</td>
                        <td>{meal.plan_footer}</td>
                        <td>{meal.photo_URL}</td>
                        <td>{meal.num_meals}</td>
                        <td>{meal.meal_weekly_price}</td>
                        <td>{meal.meal_plan_price}</td>
                        <td>{meal.meal_shipping}</td>
                        <td>{meal.meal_tax}</td>
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
                      <th>ID</th>
                      <th>Activation Status</th>
                      <th>Discount Percent</th>
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
                    {this.state.coupons.map((meal) => (
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
              width: "25%",
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
                    {this.state.taxrate.map((meal) => (
                      <tr>
                        <td>{meal.Saturday}</td>
                        <td>{meal["Tax Rate"]}</td>
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
}
export default Settings;
