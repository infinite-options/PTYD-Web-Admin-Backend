import React, { Component } from "react";
import Typography from "@material-ui/core/Typography";
import Breadcrumbs from "@material-ui/core/Breadcrumbs";
import Link from "@material-ui/core/Link";
import { Table, Button, Row, Col } from "react-bootstrap";
import MenuItem from "@material-ui/core/MenuItem";
import FormControl from "@material-ui/core/FormControl";
import Select from "@material-ui/core/Select";
import TextField from "@material-ui/core/TextField";

class CreateMenu extends Component {
  constructor(props) {
    super(props);
    this.state = {
      datekeys: [],
      details: [],
      selection: 0,
      showAdd: false,
      selectionOfDropMenu: [], //remembering Meal selection dropdown

      /**
       * selectionOfDropMenu[0] = 8
       * selectionOfDropMenu[1] = 0
       * selectionOfDropMenu[2] = 0
       * selectionOfDropMenu[3] = 0
       *
       */

      newMealCategory: "",
      newMeal: 0
    };
  }
  async componentWillMount() {
    const res = await fetch(this.props.API_URL_CREATEMENU);
    const api = await res.json();
    const createMenu = api.menus;
    const avg = api.result;

    let tempkeys = [];
    let mealMap = {};
    for (let x = 0; x < avg.length; x++) {
      mealMap[avg[x].Meal_Name] = x; //maps meal to number
      mealMap[x] = avg[x].Meal_Name;
    }
    for (var key of Object.keys(createMenu)) {
      tempkeys.push(key);
    }
    // tempkeys = tempkeys.reverse();
    let x = tempkeys[0];
    let len = createMenu[x].length;
    let tempSelectionOfDropMenu = new Array(len).fill(0);
    let initArr = createMenu[x];
    for (let i = 0; i < len; i++) {
      tempSelectionOfDropMenu[i] = mealMap[initArr[i]["Meal_Name"]];
    }

    this.setState(
      {
        selectionOfDropMenu: tempSelectionOfDropMenu,
        datekeys: tempkeys,
        createMenu,
        avg,
        mealMap
      },
      () => {
        // console.log("selection of drops ", this.state.selectionOfDropMenu);
      }
    );
  }
  //date
  handleChange = event => {
    //get new dropdown value
    let x = this.state.datekeys[event.target.value];
    let len = this.state.createMenu[x].length;
    let tempSelectionOfDropMenu = new Array(len).fill(0);
    let initArr = this.state.createMenu[x];
    for (let i = 0; i < len; i++) {
      tempSelectionOfDropMenu[i] = this.state.mealMap[initArr[i]["Meal_Name"]];
    }

    this.setState({
      selection: event.target.value,
      selectionOfDropMenu: tempSelectionOfDropMenu
    });
  };

  //single dropdown for meal
  handleChange2 = (newValue, index) => {
    let arr = this.state.selectionOfDropMenu;
    arr[index] = newValue;
    let day = this.state.datekeys[this.state.selection]; //get the current date
    let newCreateMenu = this.state.createMenu;
    let mealArray = newCreateMenu[day];
    mealArray[index].Meal_Name = this.state.mealMap[newValue];

    this.setState({
      selectionOfDropMenu: arr,
      CreateMenu: newCreateMenu
    });
  };

  render() {
    let displayrows = [];
    let enterDate = this.state.datekeys[this.state.selection];
    if (enterDate == null) {
      return <div></div>;
    }

    let arr = this.state.createMenu[enterDate];
    // arr = arr.reverse();
    if (arr == null) {
      return <div></div>;
    }

    for (let i = 0; i < arr.length; i++) {
      let tempelement = (
        <tr>
          <td>{arr[i].Menu_Type}</td>
          <td>{this.mealDropdown(arr[i].Meal_Name, i)}</td>
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
      </div>
    );
  }

  //The row that shows when we click on "Add Meal" Button
  addRowTemplate = () => {
    return (
      <tr>
        <td>
          <form noValidate autoComplete="off">
            <TextField
              value={this.state.newMealCategory}
              onChange={e => {
                this.setState({ newMealCategory: e.target.value });
              }}
              id="standard-basic"
            />
          </form>
          {console.log.newMealCategory}
        </td>
        <td>{this.addMealDropdown()}</td>
        <td>{this.avgpost(this.state.mealMap[this.state.newMeal])}</td>
        <td>
          <Button
            variant="primary"
            onClick={() => {
              // console.log("clicked on save");
              this.addNewRow();
            }}
          >
            Save
          </Button>
        </td>
      </tr>
    );
  };

  //DropDown menu of all items for "addRowTemplate" function
  addMealDropdown = () => {
    let tempmeal = [];
    for (let i = 0; i < this.state.avg.length; i++) {
      tempmeal.push(
        <MenuItem value={this.state.mealMap[this.state.avg[i]["Meal_Name"]]}>
          {this.state.avg[i]["Meal_Name"]}
        </MenuItem>
      );
    }
    return (
      <FormControl>
        <Select
          labelId="demo-simple-select-label"
          id="demo-simple-select"
          value={this.state.newMeal}
          onChange={e => {
            this.setState({ newMeal: e.target.value });
          }}
          // style={{ color: "white" }}
        >
          {tempmeal}
        </Select>
      </FormControl>
    );
  };

  //Adds new row to the database array: createMenu
  addNewRow = () => {
    let arr = this.state.selectionOfDropMenu;
    arr.push(this.state.newMeal);

    let day = this.state.datekeys[this.state.selection]; //get the current date
    let newCreateMenu = this.state.createMenu;
    let mealArray = newCreateMenu[day];

    let element = {
      Menu_Type: this.state.newMealCategory,
      Meal_Name: this.state.mealMap[this.state.newMeal]
    };
    mealArray.push(element);

    this.setState({
      selectionOfDropMenu: arr,
      CreateMenu: newCreateMenu,
      newMeal: 0,
      newMealCategory: ""
    });
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

  avgpost = mealName => {
    for (let i = 0; i < this.state.avg.length; i++) {
      // console.log(mealName, " and ", this.state.avg[i]["Meal_Name"]);

      if (this.state.avg[i]["Meal_Name"] == mealName) {
        // console.log("matched ", this.state.avg[i]["Avg_Sales_Posting"]);

        return this.state.avg[i]["Avg_Sales_Posting"];
      }
    }
    return "N/A";
  };

  mealDropdown = (mealDefault, index) => {
    let tempmeal = [];
    for (let i = 0; i < this.state.avg.length; i++) {
      // console.log(
      //   "key: ",
      //   this.state.mealMap[this.state.avg[i]["Meal_Name"]],
      //   " meal : ",
      //   this.state.avg[i]["Meal_Name"]
      // );
      tempmeal.push(
        <MenuItem value={this.state.mealMap[this.state.avg[i]["Meal_Name"]]}>
          {this.state.avg[i]["Meal_Name"]}
        </MenuItem>
      );
    }

    // console.log(
    //   " item is ",
    //   this.state.mealMap[this.state.avg[index]["Meal_Name"]],
    //   " with ",
    //   this.state.avg[index]["Meal_Name"],
    //   " realValue : ",
    //   mealDefault
    // );

    return (
      <FormControl>
        <Select
          labelId="demo-simple-select-label"
          id="demo-simple-select"
          value={this.state.selectionOfDropMenu[index]}
          onChange={e => {
            this.handleChange2(e.target.value, index);
          }}
          // style={{ color: "white" }}
        >
          {tempmeal}
        </Select>
      </FormControl>
    );
  };
}
export default CreateMenu;
