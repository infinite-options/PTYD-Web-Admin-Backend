import React, { Component } from "react";

import Typography from "@material-ui/core/Typography";
import Breadcrumbs from "@material-ui/core/Breadcrumbs";
import Link from "@material-ui/core/Link";
import { Table, Button, Row, Col } from "react-bootstrap";
import MenuItem from "@material-ui/core/MenuItem";
import FormControl from "@material-ui/core/FormControl";
import Select from "@material-ui/core/Select";

import TextField from "@material-ui/core/TextField";

class EditCreateMeal extends Component {
  constructor(props) {
    super(props);
    this.state = {
      mealkeys: [],
      details: [],
      mealidkey: [],
      selection: 0,
      showAdd: false
    };
  }
  async componentWillMount() {
    const res = await fetch(this.props.API_URL_CREATEMEAL);
    const api = await res.json();
    const createMeal = api.result;
    let tempkeys = [];
    let mealid = [];

    for (var key in createMeal) {
      tempkeys.push(createMeal[key]["meal_name"]);
      mealid.push(key);
    }
    this.setState({ mealkeys: tempkeys, createMeal, mealidkey: mealid });
  }
  handleChange = event => {
    this.setState({ selection: event.target.value });
  };
  render() {
    let displayrows = [];
    let enterMeal = this.state.mealidkey[this.state.selection];
    if (enterMeal == null) {
      return <div></div>;
    }
    let arr = this.state.createMeal[enterMeal]["ingredients"];
    if (arr == null) {
      return <div></div>;
    }
    for (let i = 0; i < arr.length; i++) {
      let tempelement = (
        <tr>
          <td>Ingredient {i + 1}</td>
          <td>{arr[i].name}</td>
          <td>{arr[i].qty}</td>
          <td>{arr[i].units}</td>
        </tr>
      );
      displayrows.push(tempelement);
    }
    return (
      <div style={{ margin: "1%" }}>
        <Breadcrumbs aria-label="breadcrumb">
          <Link color="inherit" onClick={this.handleClick}>
            Admin Site
          </Link>
          <Typography color="textPrimary">Create Meal</Typography>
        </Breadcrumbs>
        <Row>
          <Col>
            <Table striped bordered hover>
              {/* variant="dark" */}
              <thead>
                <tr>
                  <th>Menu For</th>
                  <th colSpan="3">{this.dateDropdown()}</th>
                </tr>
              </thead>
              <thead>
                <tr>
                  <th>Number</th>
                  <th>Ingredient</th>
                  <th>Qty</th>
                  <th>Units</th>
                </tr>
              </thead>
              <tbody>{displayrows}</tbody>
              {this.state.addShow ? this.addRowTemplate() : <div></div>}
            </Table>
            <Button
              variant="primary"
              onClick={() => {
                this.setState({ addShow: !this.state.addShow });
              }}
            >
              Add Meal
            </Button>
          </Col>
          <Col></Col>
        </Row>
      </div>
    );
  }
  addRow = () => {
    this.state.temp.push(
      <tr>
        <td>
          <form noValidate autoComplete="off">
            <TextField id="standard-basic" />
          </form>
        </td>
        <td>
          <FormControl>
            <Select
              labelId="demo-simple-select-label"
              id="demo-simple-select"
              value={this.state.age}
              onChange={this.handleChange}
              style={{ color: "white" }}
            >
              <MenuItem value={10}>Ten</MenuItem>
              <MenuItem value={20}>Twenty</MenuItem>
              <MenuItem value={30}>Thirty</MenuItem>
            </Select>
          </FormControl>
        </td>
        <td>5</td>
        <td>
          <FormControl>
            <Select
              labelId="demo-simple-select-label"
              id="demo-simple-select"
              value={this.state.age}
              onChange={this.handleChange}
              style={{ color: "white" }}
            >
              <MenuItem value={10}>Ten</MenuItem>
              <MenuItem value={20}>Twenty</MenuItem>
              <MenuItem value={30}>Thirty</MenuItem>
            </Select>
          </FormControl>
        </td>
      </tr>
    );
    this.setState({
      temp: this.state.temp
    });
  };
  addRowTemplate = () => {
    return (
      <tr>
        <td>
          <form noValidate autoComplete="off">
            <TextField id="standard-basic" />
          </form>
        </td>
        <td>
          <form noValidate autoComplete="off">
            <TextField id="standard-basic" />
          </form>
        </td>
        <td>
          <form noValidate autoComplete="off">
            <TextField id="standard-basic" />
          </form>
        </td>
      </tr>
    );
  };
  dateDropdown = () => {
    let tempdate = [];
    for (let i = 0; i < this.state.mealkeys.length; i++) {
      tempdate.push(<MenuItem value={i}>{this.state.mealkeys[i]}</MenuItem>);
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
}
export default EditCreateMeal;
