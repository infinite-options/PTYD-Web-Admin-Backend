import React, { Component } from "react";
import { Table, Card, Container, Row, Col } from "react-bootstrap";
// import { MDBTable, MDBTableBody, MDBTableHead } from "mdbreact";
// import { MenuCreation } from "./MenuCreation";
import UpcomingMeal from "./upcomingMeal";
import Typography from "@material-ui/core/Typography";
import Breadcrumbs from "@material-ui/core/Breadcrumbs";
import Link from "@material-ui/core/Link";
import ItemToPurchase from "./ItemToPurchase";
import Graph from "./mapGraph";

class Home extends Component {
  constructor(props) {
    super(props);
    this.state = {
      mealInfo: [],
      custInfo: [],
    };
  }

  async componentDidMount() {
    // customer info
    // const res2 = await fetch(this.props.API_URL_CUSTINFO);
    // const api2 = await res2.json();
    // const custInfo = api2.result.CustomerInfo.result;
    // meal info
    const res3 = await fetch(this.props.API_URL_MEALINFO);
    const api3 = await res3.json();
    const mealInfo = api3.result.meal_info.result;
    this.setState({ mealInfo });
  }
  render() {
    return (
      // <div className="container" style={{ marginTop: "10%" }}>
      <div style={{ margin: "1%" }}>
        HELLO! THIS IS PREP TO YOUR DOOR ADMIN
      </div>
      /*
      <div style={{ margin: "1%" }}>
        <Graph />
      </div>
      */
    );
  }

  mealInfo_function = () => {
    return (
      <Row>
        <Col>
          <Card
            style={{
              width: "100%",
              boxShadow: "0px 5px 10px 4px rgba(0,0,0,0.2)",
            }}
          >
            <Card.Body>
              <div className="vertical-menu">
                <Table striped bordered hover>
                  <thead style={{ overflow: "scroll" }}>
                    <tr>
                      <th>Meal Name</th>
                      <th>Number of Times Posted</th>
                      <th>Number Sold per Posting</th>
                      <th>Total Number Sold</th>
                    </tr>
                  </thead>

                  <tbody
                    className="vertical-menu"
                    style={{
                      height: "300px",
                      overflow: "scroll",
                    }}
                  >
                    {/* {this.state.mealInfo.map(meal => (
                      <tr>
                        <td>{meal.meal_name}</td>
                        <td>{meal.post_count}</td>
                        <td>{meal.Number_sold_per_posting}</td>
                        <td>{meal.total_sold}</td>
                      </tr>
                    ))} */}
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
          boxShadow: "0px 5px 10px 4px rgba(0,0,0,0.2)",
        }}
      >
        <Card.Body></Card.Body>
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
              boxShadow: "0px 5px 10px 4px rgba(0,0,0,0.2)",
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
                      overflow: "scroll",
                    }}
                  >
                    {this.state.custInfo.map((eachMeal) => (
                      <tr>
                        <td>{eachMeal.Full_name}</td>
                        <td>{eachMeal.Current_subscription}</td>
                        <td>{eachMeal.Weeks_left}</td>
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
          boxShadow: "0px 5px 10px 4px rgba(0,0,0,0.2)",
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
          boxShadow: "0px 5px 10px 4px rgba(0,0,0,0.2)",
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
          boxShadow: "0px 5px 10px 4px rgba(0,0,0,0.2)",
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
