import React, { Component } from "react";
import { Breadcrumbs, Link, Typography, Select, FormControl, MenuItem } from "@material-ui/core";
import { Table, Button, Row, Col } from "react-bootstrap";
import TextField from "@material-ui/core/TextField";
import axios from "axios";

class CreateMenu extends Component {
  constructor(props) {
    super(props);
    this.state = {
      datekeys: [],
      pastkeys: [],
      selection: 0,
      pastDateMeal: false,
      selectionOfDropMenu: [], //remembering Meal selection dropdown
      selectionOfDefaultMeal: [],
      mealTypes: [],
      menuCategories: [],
      mealCategories: [],
      newMealCategory: 0, //New meal Category
      newMeal2: 0, //New meal selected by index
      newMealName: "", //Name of new meal selected
      newMealType: "", //New meal type
      newMenuCategory: "", //New meal category
      newMealDefault: "FALSE", // New meal Default
      //add selection and
      addShow: false,
      avg: {},
      categorykey: [],
      createMenu: {},
      mealToAvgPostMap: {},
      meal_type_map: {},
      mealMap: {},
    };
  }
  async componentDidMount() {
    let res = await axios.get(this.props.API_URL_CREATEMENU);
    let api = res.data;
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
    let tempSelectionOfDefaultMeal = new Array(len).fill("FALSE");
    let initArr = createMenu[x];
    for (let i = 0; i < len; i++) {
      tempSelectionOfDropMenu[i] = mealMap[initArr[i]["Meal_Name"]];
      // console.log(mealMap[initArr[i]["Meal_Name"]]);
      tempSelectionOfDefaultMeal[i] = initArr[i]["Default_Meal"];
    }
    // let temp_newMealName = avg[categorykey[0]];
    // console.log("rtempkeys", avg[categorykey[0]][0].Avg_Sales_Posting);
    if (pastkeys.includes(x)) {
      this.setState({
        pastDateMeal: true,
      });
    }

    res = await axios.get(this.props.API_URL_MEALTYPE);
    api = res.data;
    let mealType = api.result['menu_categories'];

    res = await axios.get(this.props.API_URL_MENUCAT);
    api = res.data;
    let menuCat = api.result['meals_types']

    res = await axios.get(this.props.API_URL_MEALCAT);
    api = res.data;
    let mealCat = api.result['meal_categories'];

    this.setState(
      {
        selectionOfDropMenu: tempSelectionOfDropMenu, //[1, 2 , 3, 21, 1, 2, ...]
        selectionOfDefaultMeal: tempSelectionOfDefaultMeal,
        datekeys: tempkeys, //list of dates ["2020-01-05",...]
        createMenu, //contains list of all maels by date
        avg, //db of all meals and what their stats
        mealMap, // maps meal -> int and int -> meal {"The Energizer": 0, 0: "The Energizer", ...}
        meal_type_map, // {"The Energizer": "Local Treat", "Detox Smoothie": "Local Treat", ...}
        categorykey, //[Soup, Breakfast, Entree, ...]
        mealToAvgPostMap,
        pastkeys,
        mealTypes: mealType,
        newMealType: mealType[0],
        menuCategories: menuCat,
        newMenuCategory: menuCat[0],
        mealCategories: mealCat,
        newMealCategory: mealCat[0],
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
        <tr key={i}>
          <td>{arr[i].Menu_Type}</td>
          <td>{arr[i].Meal_Name}</td>
          <td>{arr[i].Meal_Cat}</td>
          <td>{arr[i].Menu_Category}</td>
          <td>{arr[i].Default_Meal}</td>
        </tr>
      ) : (
        <tr key={i}>
          <td>{arr[i].Menu_Type}</td>
          <td>{this.mealDropdown(arr[i].Meal_Name, i)}</td>
          <td>{arr[i].Meal_Cat}</td>
          <td>{arr[i].Menu_Category}</td>
          {/* <td>{arr[i].Default_Meal}</td> */}
          <td> {this.defaultMealDropdown(i)} </td>
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
              <tfoot>
                {this.state.addShow && this.addRowTemplate()}
              </tfoot>
            </Table>
            {this.state.pastDateMeal ? (
              <div></div>
            ) : (
              <div>
                <Button
                  variant="success"
                  className="float-right"
                  onClick={this.postMenuForThisDate}
                  style={{
                    marginRight: "15px",
                  }}
                >
                  Save
                </Button>
                  { this.state.addShow &&
                    <Button
                      variant="success"
                      className="float-left"
                      onClick={() => {
                        // console.log("clicked on save");
                        this.addNewRow();
                      }}
                      style={{
                        marginRight: "15px",
                      }}
                    >
                      Save New Menu Item
                    </Button>
                  }
                    <Button
                      variant="success"
                      className="float-left"
                      onClick={() => {
                        this.setState({
                          addShow: !this.state.addShow,
                          // Default value African Peanut Soup
                          newMeal: 0, //Category
                          newMeal2: 0, //Meal
                          newMealName: this.state.mealMap[0],
                        });
                      }}
                      style={{
                        marginRight: "15px",
                      }}
                    >
                      {this.state.addShow ? "Cancel New Menu Item" : "Add Menu Item"}
                    </Button>
              </div>
            )}
          </Col>
        </Row>
      </div>
    );
  }
  /* Savung for later:
  */
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

  //The row that shows when we click on "Add Meal" Button
  addRowTemplate = () => {
    return (
      <tr>
        <td> {this.addMealTypeDropdown()} </td>
        <td> {this.addMealDropdown2()}</td>
        <td> {this.addMealDropdown()}</td>
        <td> {this.addMealMenuCategoryDropdown()} </td>
        <td> {this.addMealDefaultDropdown()}</td>
      </tr>
    );
  };

  //DropDown menu of all items for "addRowTemplate" function
  addMealDropdown = () => {
    return (
      <Select
        value={this.state.newMealCategory}
        onChange={(e) => {
          this.setState({ newMealCategory: e.target.value, newMeal2: 0 });
        }}
      >
        {this.state.mealCategories.map(mealCat => (
          <MenuItem value={mealCat} key={mealCat}> {mealCat} </MenuItem>
        ))}
      </Select>
    );
  };

  //DropDown menu of all items for "addRowTemplate" function
  // addMealDropdown2 = () => {
  //   let tempmeal = []; //Temporary holds the views to be printed to screen
    
  //   let specificCategory = this.state.categorykey[this.state.newMeal];
  //   let specificMealArr = this.state.avg[specificCategory];

  //   for (let i = 0; i < specificMealArr.length; i++) {
  //     tempmeal.push(
  //       <MenuItem value={i} key={i}>{specificMealArr[i].Meal_Name}</MenuItem>
  //     );
  //   }
  //   //newMeal is just a integer starting at 0
  //   return (
  //     <FormControl>
  //       <Select
  //         labelId="demo-simple-select-label"
  //         id="demo-simple-select"
  //         value={this.state.newMeal2}
  //         onChange={(e) => {
  //           this.setState({
  //             newMeal2: e.target.value,
  //             newMealName: specificMealArr[e.target.value].Meal_Name,
  //           });
  //         }}
  //       >
  //         {tempmeal}
  //       </Select>
  //     </FormControl>
  //   );
  // };

  // Attempt to show all meals when addon category selected; fail
  addMealDropdown2 = () => {
    let tempmeal = []; //Temporary holds the views to be printed to screen
    let specificCategory = this.state.newMealCategory;
    let specificMealArr = []
    if(this.state.newMealCategory !== "Add-On") {
      specificMealArr = this.state.avg[specificCategory];
      for (let i = 0; i < specificMealArr.length; i++) {
        tempmeal.push(
          <MenuItem value={i} key={i}>{specificMealArr[i].Meal_Name}</MenuItem>
        );
      }
    } else {
      specificMealArr = Object.keys(this.state.meal_type_map);
      for (let i = 0; i < specificMealArr.length; i++) {
        tempmeal.push(
          <MenuItem value={i} key={i}>{specificMealArr[i]}</MenuItem>
        );
      }
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

  addMealDefaultDropdown = () => {
    return (
      <Select
        value={this.state.newMealDefault}
        onChange={(e) => {
          this.setState({
            newMealDefault: e.target.value,
          })
        }}
      >
        <MenuItem value="FALSE"> False </MenuItem>
        <MenuItem value="TRUE"> True </MenuItem>
      </Select>
    );
  }

  addMealTypeDropdown = () => {
    return (
      <Select
        value={this.state.newMealType}
        onChange={(e) => {
          this.setState({
            newMealType: e.target.value,
          })
        }}
        >
          {
            this.state.mealTypes.map(mealType => (
              <MenuItem value={mealType} key={mealType}> {mealType} </MenuItem>
            ))
          }
        </Select>
    )
  }

  addMealMenuCategoryDropdown = () => {
    return (
      <Select
        value={this.state.newMenuCategory}
        onChange={(e) => {
          this.setState({
            newMealCategory: e.target.value,
          })
        }}
      >
        {
          this.state.menuCategories.map(mealCategory => (
            <MenuItem value={mealCategory} key={mealCategory}> {mealCategory} </MenuItem>
          ))
        }
      </Select>
    )
  }

  avgpost = (mealName) => {
    let x = this.state.mealToAvgPostMap[mealName];
    return this.state.mealToAvgPostMap[mealName];
  };

  //Adds new row to the database array: createMenu
  addNewRow = () => {
    let mealArr = this.state.selectionOfDropMenu;
    let mealIndex = this.state.mealMap[this.state.newMealName];
    mealArr.push(mealIndex);

    let defaultMealArr = this.state.selectionOfDefaultMeal;
    defaultMealArr.push(this.state.newMealDefault);

    let day = this.state.datekeys[this.state.selection]; //get the current date
    let newCreateMenu = this.state.createMenu;
    let mealArray = newCreateMenu[day];

    let element = {
      Menu_Type: this.state.newMealType,
      Meal_Name: this.state.newMealName,
      Meal_Cat: this.state.newMealCategory,
      Menu_Category: this.state.newMenuCategory,
      Default_Meal: this.state.newMealDefault,
    };
    mealArray.push(element);

    this.setState({
      addShow: false,
      selectionOfDropMenu: mealArr,
      selectionOfDefaultMeal: defaultMealArr,
      CreateMenu: newCreateMenu,
      newMeal: 0,
    });
  };

  dateDropdown = () => {
    let tempdate = [];
    for (let i = 0; i < this.state.datekeys.length; i++) {
      tempdate.push(
        <MenuItem
          value={i}
          key={i}
        >
          {this.state.datekeys[i]}
        </MenuItem>);
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
          key={this.state.mealMap[this.state.avg[category][i]["Meal_Name"]]}
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

  defaultMealDropdown = (index) => {
    return (
      <Select
        value={this.state.selectionOfDefaultMeal[index]}
        onChange = {(e) => {
          this.handleDefaultMealChange(e.target.value,index)
        }}
      >
        <MenuItem value={'FALSE'}> False </MenuItem>
        <MenuItem value={'TRUE'}> True </MenuItem>
      </Select>
    )
  }

  handleDefaultMealChange = (newValue, index) => {
    let arr = this.state.selectionOfDefaultMeal;
    arr[index] = newValue;
    let day = this.state.datekeys[this.state.selection]; //get the current date
    let newCreateMenu = this.state.createMenu;
    let mealArray = newCreateMenu[day];
    mealArray[index].Default_Meal = newValue;

    this.setState({
      selectionOfDefaultMeal: arr,
      CreateMenu: newCreateMenu,
    });
  }

}
export default CreateMenu;
