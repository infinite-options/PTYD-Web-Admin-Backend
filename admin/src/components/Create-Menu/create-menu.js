import React, { Component } from "react";
import Typography from "@material-ui/core/Typography";
import Breadcrumbs from "@material-ui/core/Breadcrumbs";
import Link from "@material-ui/core/Link";
import { Table, Button, Row, Col } from "react-bootstrap";
import MenuItem from "@material-ui/core/MenuItem";
import FormControl from "@material-ui/core/FormControl";
import Select from "@material-ui/core/Select";
import TextField from "@material-ui/core/TextField";
import axios from "axios";

class CreateMenu extends Component {
  constructor(props) {
    super(props);
    this.state = {
      datekeys: [],
      details: [],
      selection: 0,
      showAdd: false,
      pastDateMeal: false,
      selectionOfDropMenu: [], //remembering Meal selection dropdown

      /**
       * selectionOfDropMenu[0] = 8
       * selectionOfDropMenu[1] = 0
       * selectionOfDropMenu[2] = 0
       * selectionOfDropMenu[3] = 0
       *
       */

      newMealCategory: "",
      newMeal: 0,
      newMeal2: 0,
      newMealName: "",
      //add selection and
    };
  }
  async componentWillMount() {
    const res = await fetch(this.props.API_URL_CREATEMENU);
    const api = await res.json();
    const createMenu = api.menus;
    const avg = api.result;

    let tempkeys = []; //dates
    let pastkeys = [];
    let futurekeys = [];
    let mealMap = {}; //meal to int
    let categorykey = []; //["Entree", "Breakfast", "Salad",...]
    let mealToAvgPostMap = {};
    for (let key of Object.keys(avg)) {
      categorykey.push(key);
    }
    let meal_type_map = {};
    let mealCount = 0;
    for (let x = 0; x < categorykey.length; x++) {
      let kms = avg[categorykey[x]];
      let category_name = categorykey[x];
      for (let j = 0; j < kms.length; j++) {
        mealMap[kms[j].Meal_Name] = mealCount; //maps meal to number
        mealToAvgPostMap[kms[j].Meal_Name] = kms[j].Avg_Sales_Posting;
        mealMap[mealCount] = kms[j].Meal_Name;
        mealCount++;
        meal_type_map[kms[j].Meal_Name] = category_name;
      }
    }

    var today = new Date();

    console.log(today);
    // console.log("tanny ", categorykey);
    for (let key of Object.keys(createMenu)) {
      //
      var mydate = new Date(key);
      if (mydate >= today) futurekeys.push(key);
      else pastkeys.push(key);
    }

    // tempkeys = tempkeys.reverse();
    tempkeys = [...futurekeys, ...pastkeys];
    let x = tempkeys[0];
    let len = createMenu[x].length;
    let tempSelectionOfDropMenu = new Array(len).fill(0);
    let initArr = createMenu[x];
    for (let i = 0; i < len; i++) {
      tempSelectionOfDropMenu[i] = mealMap[initArr[i]["Meal_Name"]];
      // console.log(mealMap[initArr[i]["Meal_Name"]]);
    }
    // let temp_newMealName = avg[categorykey[0]];
    // console.log("rtempkeys", avg[categorykey[0]][0].Avg_Sales_Posting);
    if (pastkeys.includes(x)) {
      this.setState({
        pastDateMeal: true,
      });
    }

    this.setState(
      {
        selectionOfDropMenu: tempSelectionOfDropMenu, //[1, 2 , 3, 21, 1, 2, ...]
        datekeys: tempkeys, //list of dates ["2020-01-05",...]
        createMenu, //contains list of all maels by date
        avg, //db of all meals and what their stats
        mealMap, // maps meal -> int and int -> meal {"The Energizer": 0, 0: "The Energizer", ...}
        meal_type_map, // {"The Energizer": "Local Treat", "Detox Smoothie": "Local Treat", ...}
        categorykey, //[Soup, Breakfast, Entree, ...]
        addingSelection: 0,
        mealToAvgPostMap,
        pastkeys,
        // newMealName: temp_newMealName
      },
      () => {
        // console.log("selection of drops ", this.state.selectionOfDropMenu);
        // console.log("mememememememememem", this.state.selectionOfDropMenu);
      }
    );
  }
  //date
  handleChange = (event) => {
    //get new dropdown value
    let x = this.state.datekeys[event.target.value];
    let len = this.state.createMenu[x].length;
    let tempSelectionOfDropMenu = new Array(len).fill(0);
    let initArr = this.state.createMenu[x];
    for (let i = 0; i < len; i++) {
      tempSelectionOfDropMenu[i] = this.state.mealMap[initArr[i]["Meal_Name"]];
    }
    if (this.state.pastkeys.includes(x)) {
      this.setState({
        pastDateMeal: true,
      });
    } else {
      this.setState({
        pastDateMeal: false,
      });
    }

    this.setState({
      selection: event.target.value,
      selectionOfDropMenu: tempSelectionOfDropMenu,
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
      CreateMenu: newCreateMenu,
    });
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
      let tempelement = this.state.pastDateMeal ? (
        <tr>
          <td>{arr[i].Menu_Type}</td>
          <td>{arr[i].Meal_Name}</td>
          <td>{arr[i].Meal_Cat}</td>
          <td>{arr[i].Menu_Category}</td>
          <td>{arr[i].Default_Meal}</td>
        </tr>
      ) : (
        <tr>
          <td>{arr[i].Menu_Type}</td>
          <td>{this.mealDropdown(arr[i].Meal_Name, i)}</td>
          <td>{arr[i].Meal_Cat}</td>
          <td>{arr[i].Menu_Category}</td>
          <td>{arr[i].Default_Meal}</td>
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
          <Typography color="textPrimary">Create Or Edit Menu</Typography>
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
                  <th>Meal Type</th>
                  <th>Meal</th>
                  <th>Meal Category</th>
                  <th>Menu Category</th>
                  <th>Default Meal</th>
                </tr>
              </thead>
              <tbody>{displayrows}</tbody>
              {this.state.addShow ? this.addRowTemplate() : <div></div>}
            </Table>
            {this.state.pastDateMeal ? (
              <div></div>
            ) : (
              <Button
                variant="success"
                className="float-right"
                onClick={this.postMenuForThisDate}
              >
                Save
              </Button>
            )}
          </Col>
          <Col></Col>
        </Row>
      </div>
    );
  }

  postMenuForThisDate = (e) => {
    e.preventDefault();
    let day = this.state.datekeys[this.state.selection]; //get the current date
    let newCreateMenu = this.state.createMenu;
    let mealArray = newCreateMenu[day];
    var menuData = {
      menu_date: day,
      menu: mealArray,
    };

    console.log(menuData);
    axios
      .post(this.props.API_URL_CREATEMENU, menuData)
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
          console.log("API PATCH CREATEMENU WORKED");

          window.location.reload(true);
        }
      })
      .catch((err) => {
        if (err.response !== undefined) {
          //setErro(err.response.data.result);
          //window.location.reload(false);
          console.log("API PATCH CREATEMENU Failed");
        } else if (typeof err === "string") {
          //setErro(err);
          console.log(err);
        }
        //setLoading(false);
      });
  };

  /* Savung for later:
    <Button
              variant="success"
              className="float-right"
              onClick={() => {
                this.setState({ addShow: !this.state.addShow });
              }}
            >
              Save
            </Button>
  */
  //The row that shows when we click on "Add Meal" Button
  addRowTemplate = () => {
    return (
      <tr>
        <td>{this.addMealDropdown()}</td>
        <td>{this.addMealDropdown2()}</td>
        <td>{this.avgpost(this.state.newMealName)}</td>
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
    let keyArr = this.state.categorykey; //[Soup, Entree, BreakFast]
    if (keyArr.length === 0) return <div></div>;
    let defaultNewMeal = keyArr[0];
    for (let i = 0; i < keyArr.length; i++) {
      tempmeal.push(<MenuItem value={i}>{keyArr[i]}</MenuItem>);
    }
    //newMeal is just a integer starting at 0
    return (
      <FormControl>
        <Select
          labelId="demo-simple-select-label"
          id="demo-simple-select"
          value={this.state.newMeal}
          onChange={(e) => {
            this.setState({ newMeal: e.target.value, newMeal2: 0 });
          }}
        >
          {tempmeal}
        </Select>
      </FormControl>
    );
  };

  //DropDown menu of all items for "addRowTemplate" function
  addMealDropdown2 = () => {
    let tempmeal = []; //Temporary holds the views to be printed to screen

    let specificCategory = this.state.categorykey[this.state.newMeal];
    let specificMealArr = this.state.avg[specificCategory];

    for (let i = 0; i < specificMealArr.length; i++) {
      tempmeal.push(
        <MenuItem value={i}>{specificMealArr[i].Meal_Name}</MenuItem>
      );
    }
    //newMeal is just a integer starting at 0
    return (
      <FormControl>
        <Select
          labelId="demo-simple-select-label"
          id="demo-simple-select"
          value={this.state.newMeal2}
          onChange={(e) => {
            this.setState({
              newMeal2: e.target.value,
              newMealName: specificMealArr[e.target.value].Meal_Name,
            });
          }}
        >
          {tempmeal}
        </Select>
      </FormControl>
    );
  };
  avgpost = (mealName) => {
    let x = this.state.mealToAvgPostMap[mealName];
    return this.state.mealToAvgPostMap[mealName];
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
      Meal_Name: this.state.mealMap[this.state.newMeal],
    };
    mealArray.push(element);

    this.setState({
      selectionOfDropMenu: arr,
      CreateMenu: newCreateMenu,
      newMeal: 0,
      newMealCategory: "",
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

  mealDropdown = (mealDefault, index) => {
    let tempmeal = [];
    let category = this.state.meal_type_map[mealDefault];
    for (let i = 0; i < this.state.avg[category].length; i++) {
      tempmeal.push(
        <MenuItem
          value={this.state.mealMap[this.state.avg[category][i]["Meal_Name"]]}
        >
          {this.state.avg[category][i]["Meal_Name"]}
        </MenuItem>
      );
    }
    return (
      <FormControl>
        <Select
          labelId="demo-simple-select-label"
          id="demo-simple-select"
          value={this.state.selectionOfDropMenu[index]}
          onChange={(e) => {
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
