import React, { Component } from "react";
import { Table, Card, Container, Row, Col } from "react-bootstrap";
// import { MDBTable, MDBTableBody, MDBTableHead } from "mdbreact";
// import { MenuCreation } from "./MenuCreation";
import Typography from "@material-ui/core/Typography";
import Breadcrumbs from "@material-ui/core/Breadcrumbs";
import Link from "@material-ui/core/Link";
import ItemToPurchase from "./ItemToPurchase";

class UpcomingMeals extends Component {
  constructor(props) {
    super(props);
    this.state = {
      upcomingMeals: [],
      ingredients: [],
      datekeys: []
    };
  }

  async componentWillMount() {
    // upcoming meals
    const res = await fetch(this.props.API_URL_MEALSELECT);
    const api = await res.json();
    const upcomingMeals = api.result;
    // upcoming meals
    const res4 = await fetch(this.props.API_URL_INGREDIENTS);
    const api4 = await res4.json();
    const ingredients = api4.result;

    this.setState({ upcomingMeals, ingredients });
  }
  handleClick(event) {
    event.preventDefault();
  }

  makeTable = () => {
    // if (this.state.upcomingMeals == null) {
    //   return <div></div>;
    // }
    let a = [];

    for (var key in this.state.upcomingMeals) {
      // console.log(this.state.upcomingMeals[key]);
      // console.log(key);

      a.push(
        <div className="scrollItem">
          {this.upcomingMeals_and_weeklyPurchase(
            this.state.upcomingMeals[key],
            // this.state.ingredients[key],
            key
          )}
        </div>
      );
    }
    return a;
  };
  render() {
    return <div className="scrollMenu">{this.makeTable()}</div>;
  }
  upcomingMeals_and_weeklyPurchase = (
    weekArgument,
    // ingredientArgument,
    date
  ) => {
    let arr = [];
    let arr2 = [];
    for (let i = 0; i < weekArgument.length; i += 3) {
      let first = weekArgument[i];
      let second = weekArgument[i + 1];
      let third = weekArgument[i + 2];

      let a = first.split(":")[1];
      let b = second.split(":")[1];
      let c = third.split(":")[1];

      arr.push(this.single_item(a, b, c));
      console.log("datessssssssssssssss", date);
    }

    // for (let i = 0; i < ingredientArgument.length; i += 2) {
    //   let one = ingredientArgument[i];
    //   let two = ingredientArgument[i + 1];

    //   let c = one.split(":")[1];
    //   let d = two.split(":")[1];

    //   arr2.push(this.single_item_ingredients(c, d));
    // }
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
                <Card.Title>
                  The week of: {date}
                  {this.dateDropdown()}
                </Card.Title>
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
                        </tr>
                      </thead>
                      <tbody
                        style={{
                          height: "300px",
                          overflowY: "scroll"
                        }}
                      >
                        {arr2}
                      </tbody>
                    </Table>
                  </div>
                </Card.Text>
              </Card.Body>
            </Card>
          </Col>
        </Row>
      </Container>
    );
  };
  dateDropdown = () => {
    let tempdate = [];
    for (let i = 0; i < this.state.datekeys.length; i++) {
      tempdate.push(<MenuItem value={i}>{this.state.datekeys[i]}</MenuItem>);
    }
    return (
      <FormControl>
        <Select
          labelId="demo-simple-select-label"
          id="demo-simple-select"
          value={this.state.selection}
          onChange={this.handleChange}
          // style={{ color: "white" }}
        >
          {tempdate}
        </Select>
      </FormControl>
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
  single_item_ingredients = (ingredient, amount) => {
    return (
      <tr>
        <td>{ingredient}</td>
        <td>{amount}</td>
      </tr>
    );
  };
}
export default UpcomingMeals;
