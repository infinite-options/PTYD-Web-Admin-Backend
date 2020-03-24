import React, { Component } from "react";
import { Table, Card, Container, Row, Col } from "react-bootstrap";
// import { MDBTable, MDBTableBody, MDBTableHead } from "mdbreact";
// import { MenuCreation } from "./MenuCreation";
import Jumbotron from "../Jumbotron/Jumbotron-home";
import Typography from "@material-ui/core/Typography";
import Breadcrumbs from "@material-ui/core/Breadcrumbs";
import Link from "@material-ui/core/Link";
import ItemToPurchase from "./ItemToPurchase";

class Home extends Component {
  constructor(props) {
    super(props);
    this.state = {
      upcomingMeals: [],
      mealInfo: [],
      custInfo: []
    };
  }

  async componentDidMount() {
    // upcoming meals
    const res = await fetch(this.props.API_URL_MEALSELECT);
    const api = await res.json();
    const upcomingMeals = api.result;
    // customer info
    const res2 = await fetch(this.props.API_URL_CUSTINFO);
    const api2 = await res2.json();
    const custInfo = api2.result.CustomerInfo.result;
    // meal info
    const res3 = await fetch(this.props.API_URL_MEALINFO);
    const api3 = await res3.json();
    const mealInfo = api3.result.meal_info.result;
    this.setState({ upcomingMeals, custInfo, mealInfo });
    console.log("meals", this.state.upcomingMeals);
  }
  handleClick(event) {
    event.preventDefault();
    console.info("You clicked a breadcrumb.");
  }

  makeTable = () => {
    if (this.state.upcomingMeals == null) {
      return <div></div>;
    }
    let a = [];
    for (var key in this.state.upcomingMeals) {
      a.push(
        <div className="scrollItem">
          {this.upcomingMeals_and_weeklyPurchase(
            this.state.upcomingMeals[key],
            key
          )}
        </div>
      );
    }
    return a;
  };
  render() {
    return (
      <div className="container" style={{ marginTop: "10%" }}>
        {/* <div className="scrollItem">Card</div> */}

        {/* title for the site ----------------------------------------- */}
        <Jumbotron />

        <Breadcrumbs aria-label="breadcrumb">
          <Link color="inherit" onClick={this.handleClick}>
            Admin Site
          </Link>
          <Typography color="textPrimary">Upcoming Meals Order</Typography>
          <Link color="inherit" onClick={this.handleClick}>
            Weekly Purchases
          </Link>
          {/* upcoming meal order ----------------------------------------- */}
        </Breadcrumbs>
        <br />

        <div className="scrollMenu">{this.makeTable()}</div>
        {/* Meal info ----------------------------------------- */}

        <br />
        <Row>
          <Col>
            <Breadcrumbs aria-label="breadcrumb">
              <Link color="inherit" onClick={this.handleClick}>
                Admin Site
              </Link>
              <Typography color="textPrimary">Meal Info</Typography>
            </Breadcrumbs>
            {this.mealInfo_function()}
          </Col>
          <Col>
            <Breadcrumbs aria-label="breadcrumb">
              <Link color="inherit" onClick={this.handleClick}>
                Admin Site
              </Link>
              <Link color="inherit" onClick={this.handleClick}>
                Meal Info
              </Link>
              <Typography color="textPrimary">Graph</Typography>
            </Breadcrumbs>
            {this.mealInfo_graph_function()}
          </Col>
        </Row>
        <br />
        <br />

        {/* Customer info  ----------------------------------------- */}
        <br />
        <Row>
          <Col>
            <Breadcrumbs aria-label="breadcrumb">
              <Link color="inherit" onClick={this.handleClick}>
                Admin Site
              </Link>
              <Typography color="textPrimary">Customer Info</Typography>
            </Breadcrumbs>
            {this.customerInfo_function()}
          </Col>
          <Col>
            <Breadcrumbs aria-label="breadcrumb">
              <Link color="inherit" onClick={this.handleClick}>
                Admin Site
              </Link>
              <Link color="inherit" onClick={this.handleClick}>
                Customer Info
              </Link>
              <Typography color="textPrimary">Graph</Typography>
            </Breadcrumbs>
            {this.customerInfo_graph_function()}
          </Col>
        </Row>
        <br />
        <br />

        {/* profit graph */}
        <br />

        <Breadcrumbs aria-label="breadcrumb">
          <Link color="inherit" onClick={this.handleClick}>
            Admin Site
          </Link>
          <Typography color="textPrimary">Profit Graphs</Typography>
        </Breadcrumbs>
        {this.profit_graph_function()}

        <br />
        <br />

        {/* delivery info*/}
        <br />

        <Breadcrumbs aria-label="breadcrumb">
          <Link color="inherit" onClick={this.handleClick}>
            Admin Site
          </Link>
          <Typography color="textPrimary">Delivery Info</Typography>
        </Breadcrumbs>
        {this.deliveryInfo_function()}

        <br />
        <br />
      </div>
    );
  }
  upcomingMeals_and_weeklyPurchase = (weekArgument, date) => {
    let arr = [];
    for (let i = 0; i < weekArgument.length; i += 3) {
      let first = weekArgument[i];
      let second = weekArgument[i + 1];
      let third = weekArgument[i + 2];

      let a = first.split(":")[1];
      let b = second.split(":")[1];
      let c = third.split(":")[1];

      arr.push(this.single_item(a, b, c));
    }
    return (
      <Container>
        <Row>
          <Col>
            <Card
              style={{
                // width: "100%",
                boxShadow: "0px 5px 10px 4px rgba(0,0,0,0.2)"
              }}
            >
              <Card.Body>
                <Card.Title>The week of: {date}</Card.Title>
                {/* <Card.Subtitle className="mb-2 text-muted">
                  The week of:
                </Card.Subtitle> */}
                <Card.Text>
                  <div className="vertical-menu">
                    <Table
                      responsive
                      striped
                      bordered
                      style={{ textAlign: "center" }}
                    >
                      <thead style={{ overflow: "scroll" }}>
                        <tr>
                          <th>Menu</th>
                          <th>Meal</th>
                          <th>Quantity Ordered</th>
                        </tr>
                      </thead>
                      <tbody
                        style={{
                          height: "300px",
                          overflowY: "scroll"
                        }}
                      >
                        {arr}
                        {/* {this.state.mealInfo.map(meal => (
                      <tr>
                        <td>{meal.meal_desc}</td>
                        <td>{meal.post_count}</td>
                        <td>{meal.Number_sold_per_posting}</td>
                        <td>{meal.total_sold}</td>
                      </tr>
                    ))} */}
                      </tbody>
                    </Table>
                  </div>
                </Card.Text>
              </Card.Body>
            </Card>
          </Col>
          {/* ))} */}
        </Row>

        <br />
        <br />

        {/* weekly purchase ----------------------------------------- */}
        {/* <Breadcrumbs aria-label="breadcrumb">
                  <Link color="inherit" onClick={this.handleClick}>
                    Admin Site
                  </Link>
                  <Typography color="textPrimary">Weekly Purchases</Typography>
                </Breadcrumbs>
                <br /> */}
        <Row>
          <Col>
            <Card
              style={{
                // width: "100%",
                boxShadow: "0px 5px 10px 4px rgba(0,0,0,0.2)"
              }}
            >
              <Card.Body>
                <Card.Title>Week 1</Card.Title>
                <Card.Subtitle className="mb-2 text-muted">
                  The week of:{date}
                </Card.Subtitle>
                <ItemToPurchase />
              </Card.Body>
            </Card>
          </Col>
        </Row>
      </Container>
    );
  };
  single_item = (category, description, quantity) => {
    return (
      <tr>
        <td>{category}</td>
        <td>{description}</td>
        <td>{quantity}</td>
      </tr>
    );
  };
  mealInfo_function = () => {
    return (
      <Row>
        <Col>
          <Card
            style={{
              width: "100%",
              boxShadow: "0px 5px 10px 4px rgba(0,0,0,0.2)"
            }}
          >
            <Card.Body>
              <div className="vertical-menu">
                <Table striped bordered hover>
                  <thead style={{ overflow: "scroll" }}>
                    <tr>
                      <th>Meal Name</th>
                      <th>Number of Time Posted</th>
                      <th>Number Sold per Posting</th>
                      <th>Total Number Sold</th>
                    </tr>
                  </thead>

                  <tbody
                    className="vertical-menu"
                    style={{
                      height: "300px",
                      overflow: "scroll"
                    }}
                  >
                    {this.state.mealInfo.map(meal => (
                      <tr>
                        <td>{meal.meal_desc}</td>
                        <td>{meal.post_count}</td>
                        <td>{meal.Number_sold_per_posting}</td>
                        <td>{meal.total_sold}</td>
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
  mealInfo_graph_function = () => {
    return (
      <Card
        style={{
          width: "100%",
          boxShadow: "0px 5px 10px 4px rgba(0,0,0,0.2)"
        }}
      >
        <Card.Body>
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
        </Card.Body>
      </Card>
    );
  };
  customerInfo_function = () => {
    return (
      <Row>
        <Col>
          <Card
            style={{
              width: "100%",
              boxShadow: "0px 5px 10px 4px rgba(0,0,0,0.2)"
            }}
          >
            <Card.Body>
              <div className="vertical-menu">
                <Table striped bordered hover>
                  <thead style={{ overflow: "scroll" }}>
                    <tr>
                      <th>Name</th>
                      <th>Current Subscription Plan</th>
                      <th>Number of weeks remaining </th>
                    </tr>
                  </thead>

                  <tbody
                    className="vertical-menu"
                    style={{
                      height: "300px",
                      overflow: "scroll"
                    }}
                  >
                    {this.state.custInfo.map(eachMeal => (
                      <tr>
                        <td>{eachMeal.Full_name}</td>
                        <td>{eachMeal.Current_subscription}</td>
                        <td>{eachMeal.weeks_left}</td>
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
  customerInfo_graph_function = () => {
    return (
      <Card
        style={{
          width: "100%",
          boxShadow: "0px 5px 10px 4px rgba(0,0,0,0.2)"
        }}
      >
        <Card.Body>
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
        </Card.Body>
      </Card>
    );
  };
  profit_graph_function = () => {
    return (
      <Card
        style={{
          width: "100%",
          boxShadow: "0px 5px 10px 4px rgba(0,0,0,0.2)"
        }}
      >
        <Card.Body>
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
        </Card.Body>
      </Card>
    );
  };
  deliveryInfo_function = () => {
    return (
      <Card
        style={{
          width: "50%",
          boxShadow: "0px 5px 10px 4px rgba(0,0,0,0.2)"
        }}
      >
        <Card.Body>
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
        </Card.Body>
      </Card>
    );
  };
}
export default Home;
