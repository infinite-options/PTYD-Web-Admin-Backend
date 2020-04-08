import React, { Component } from "react";

import Jumbotron from "../Jumbotron/Jumbotron-create-menu";
import Typography from "@material-ui/core/Typography";
import Breadcrumbs from "@material-ui/core/Breadcrumbs";
import Link from "@material-ui/core/Link";
import { Table, Button, Row, Col } from "react-bootstrap";
import MenuItem from "@material-ui/core/MenuItem";
import FormControl from "@material-ui/core/FormControl";
import Select from "@material-ui/core/Select";
import TextField from "@material-ui/core/TextField";
import MaterialTable from "material-table";
import { display } from "@material-ui/system";

class CreateMenu extends Component {
  constructor(props) {
    super(props);
    this.state = {
      datekeys: [],
      details: [],
      selection: 0,
      showAdd: false
    };
  }
  async componentWillMount() {
    const res = await fetch(this.props.API_URL_CREATEMENU);
    const api = await res.json();
    const createMenu = api.menus;
    const avg = api.result;
    let tempkeys = [];

    for (var key of Object.keys(createMenu)) {
      tempkeys.push(key);
    }
    this.setState({ datekeys: tempkeys, createMenu, avg });
  }
  handleChange = event => {
    this.setState({ selection: event.target.value });
  };
  render() {
    let displayrows = [];
    let enterDate = this.state.datekeys[this.state.selection];
    if (enterDate == null) {
      return <div></div>;
    }
    let arr = this.state.createMenu[enterDate];

    if (arr == null) {
      return <div></div>;
    }
    for (let i = 0; i < arr.length; i++) {
      let tempelement = (
        <tr>
          <td>{arr[i].Menu_Type}</td>
          <td>{arr[i].Meal_Name}</td>
          <td>{this.avgpost(arr[i].Meal_Name)}</td>
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
          <Typography color="textPrimary">Create Menu</Typography>
        </Breadcrumbs>
        <Row>
          <Col>
            <Table striped bordered hover>
              {/* variant="dark" */}
              <thead>
                <tr>
                  <th>Menu For</th>
                  <th colSpan="2">{this.dateDropdown()}</th>
                </tr>
              </thead>
              <thead>
                <tr>
                  <th>Meal Category</th>
                  <th>Meal</th>
                  <th>Avg Sales/Posting</th>
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

        {/* {this.state.createMenu.map(eachMeal => (
          <tr>
            <td>{eachMeal.Menu_Type}</td>
            <td>{eachMeal.Meal_Name}</td>
          </tr>



          <MaterialTable
            style={{ boxShadow: "0px 5px 10px 4px rgba(0,0,0,0.2)" }}
            title="Customer Profile"
            columns={this.state.columns}
            data={eachItem.createMenu}
            editable={{
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
                }),
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
                })
            }}
          />
        ))} */}
      </div>
    );
  }
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
  // this.setState({
  //   temp: this.state.temp
  // });
  // getdate = () =>{
  //   let dates=[];
  //   for (let i = 0; i < createMenu.menu_dates.length; i += 1) {
  //     dates.push()
  // }
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
  avgpost = mealName => {
    for (let i = 0; i < this.state.avg.length; i++) {
      if (this.state.avg[i]["Meal_Name"] == mealName) {
        return this.state.avg[i]["Avg_Sales_Posting"];
      }
    }
    return "N/A";
  };
}
export default CreateMenu;
