import React, { Component } from "react";

import Jumbotron from "../Jumbotron/Jumbotron-edit-meal";
import Typography from "@material-ui/core/Typography";
import Breadcrumbs from "@material-ui/core/Breadcrumbs";
import Link from "@material-ui/core/Link";
import MaterialTable from "material-table";
import {
  Dropdown,
  Table,
  Card,
  Button,
  Tabs,
  Tab,
  Row,
  Col
} from "react-bootstrap";
import { makeStyles } from "@material-ui/core/styles";
import InputLabel from "@material-ui/core/InputLabel";
import MenuItem from "@material-ui/core/MenuItem";
import FormHelperText from "@material-ui/core/FormHelperText";
import FormControl from "@material-ui/core/FormControl";
import Select from "@material-ui/core/Select";
import TableCell from "@material-ui/core/TableCell";
import TableRow from "@material-ui/core/TableRow";
import TextField from "@material-ui/core/TextField";

class EditCreateMeal extends Component {
  constructor(props) {
    super(props);
    this.state = {
      // columns: [
      //   { title: "Meal", field: "meal" },
      //   {
      //     title: "Drop Down",
      //     field: "dropdown",
      //     lookup: { 1: "Spicy Chicken", 2: "salad" }
      //   },
      //   { title: "Avg Sales", field: "sales" }
      // ],
      // data: [
      //   { meal: "Special_1", dropdown: 1, sales: 99 },
      //   {
      //     meal: "Secial_2",
      //     dropdown: 2,
      //     sales: 32
      //   }
      // ],
      // query: {
      //   page: 1,
      //   pageSize: 10
      // },
      age: 10,
      temp: [],
      createMeal: [],
      temp2: []
    };
  }
  async componentDidMount() {
    const res = await fetch(this.props.API_URL_CREATEMEAL);
    const api = await res.json();
    const createMeal = api.result;

    const res2 = await fetch(this.props.API_URL_TEMP);
    const api2 = await res2.json();
    const temp2 = api2.result.result;
    this.setState({ createMeal, temp2 });
    console.log(createMeal);
  }
  componentWillMount() {
    this.state.temp.push(
      <tr>
        <td>Weekly Entree</td>
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
        <td>4</td>
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
      </tr>,
      <tr>
        <td>Weekly Salad</td>
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
        <td>1</td>
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
  }
  handleChange = event => {
    this.setState({ age: event.target.value });
  };
  render() {
    return (
      <div style={{ margin: "1%" }}>
        {/* <div className="scrollItem">Card</div> */}

        {/* title for the site ----------------------------------------- */}
        {/* <Jumbotron /> */}

        <Breadcrumbs aria-label="breadcrumb">
          <Link color="inherit" onClick={this.handleClick}>
            Admin Site
          </Link>
          <Typography color="textPrimary">Edit/Create Meal</Typography>
        </Breadcrumbs>
        {/* {this.state.createMeal} */}
        {this.state.temp2.meal_plan_id}
        <br />
        {/* <FormControl>
          <InputLabel id="demo-simple-select-label">Age</InputLabel>
          <Select
            labelId="demo-simple-select-label"
            id="demo-simple-select"
            value={this.state.age}
            onChange={this.handleChange}
          >
            <MenuItem value={10}>Ten</MenuItem>
            <MenuItem value={20}>Twenty</MenuItem>
            <MenuItem value={30}>Thirty</MenuItem>
          </Select>
        </FormControl> */}
        <Row>
          <Col>
            <Table striped bordered hover variant="dark">
              <thead style={{ backgroundColor: "blue", color: "white" }}>
                <tr>
                  <th>Meal Name</th>
                  <th colSpan="3">
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
                  </th>
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
              <tbody>{this.state.temp}</tbody>
            </Table>
            <Button
              variant="primary"
              onClick={() => {
                this.addRow();
              }}
            >
              Add Ingredient
            </Button>

            {/* <Dropdown>
          <Dropdown.Toggle variant="success" id="dropdown-basic">
            Dropdown Button
          </Dropdown.Toggle>

          <Dropdown.Menu>
            <Dropdown.Item href="#/action-1">Action</Dropdown.Item>
            <Dropdown.Item href="#/action-2">Another action</Dropdown.Item>
            <Dropdown.Item href="#/action-3">Something else</Dropdown.Item>
          </Dropdown.Menu>
        </Dropdown> */}

            {/* <Card style={{ boxShadow: "0px 5px 10px 4px rgba(0,0,0,0.2)" }}>
          <MaterialTable
            title={this.date()}
            columns={this.state.columns}
            data={this.state.data}
            options={{
              selection: true,
              actionsColumnIndex: -1,
              pageSize: this.state.query.pageSize
            }}
            actions={[
              {
                tooltip: "Remove All Selected Users",
                icon: "delete",
                onClick: (evt, data) =>
                  alert("You want to delete " + data.length + " rows")
              }
            ]}
            editable={{
              onRowUpdate: (newData, oldData) =>
                new Promise(resolve => {
                  setTimeout(() => {
                    resolve();
                    if (oldData) {
                      this.setState(prevState => {
                        const data = [...prevState.data];
                        data[data.indexOf(oldData)] = newData;
                        return { ...prevState, data };
                      });
                    }
                  }, 600);
                }),
              onRowDelete: oldData =>
                new Promise(resolve => {
                  setTimeout(() => {
                    resolve();
                    this.setState(prevState => {
                      const data = [...prevState.data];
                      data.splice(data.indexOf(oldData), 1);
                      return { ...prevState, data };
                    });
                  }, 600);
                }),
              onRowAdd: newData =>
                new Promise(resolve => {
                  setTimeout(() => {
                    resolve();
                    this.setState(prevState => {
                      const data = [...prevState.data];
                      data.push(newData);
                      return { ...prevState, data };
                    });
                  }, 600);
                })
            }}
          />
          <TableRow>
            <TableCell>Expect Number of Sales (Total)</TableCell>
          </TableRow>
        </Card> */}
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
}
export default EditCreateMeal;
