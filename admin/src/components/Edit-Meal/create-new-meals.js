import React, { Component, useState } from "react";

import Typography from "@material-ui/core/Typography";
import Breadcrumbs from "@material-ui/core/Breadcrumbs";
import Link from "@material-ui/core/Link";
import { Table, Button, Row, Col } from "react-bootstrap";
import MenuItem from "@material-ui/core/MenuItem";
import FormControl from "@material-ui/core/FormControl";
import Select from "@material-ui/core/Select";
import { withStyles } from "@material-ui/core/styles";

import TextField from "@material-ui/core/TextField";
import { SingleSelect, ColorSelect } from "react-select-material-ui";
import ReactSelectMaterialUi from "react-select-material-ui";
import axios from "axios";

import Autocomplete, {
  createFilterOptions,
} from "@material-ui/lab/Autocomplete";
import Alert from "@material-ui/lab/Alert";
import Divider from "@material-ui/core/Divider";
import Input from "@material-ui/core/Input";
import Grid from "@material-ui/core/Grid";
//const [value, setValue] = React.useState(null);
const filter = createFilterOptions();
const WhiteTextTypography = withStyles({
  root: {
    color: "Green",
  },
})(Typography);
//const [erro, setErro] = useState(null);
//const [loading, setLoading] = useState(false);

class CreateNewMeal extends Component {
  constructor(props) {
    super(props);
    this.state = {
      mealkeys: [],
      details: [],
      mealidkey: [],
      allIngr: [],
      selection: 0,
      showAdd: false,
      allUnits: [],
      currIngr: [],
      golu: 10,
      newIngrName: "New Ingredient",
      newQty: 1,
      newUnit: "Cup",
      mapIngrNameToIngrId: new Map(),
      mapIngrUnitMeasureId: new Map(),
      newMealName: "New Meal",
      brandNewIngr: "New Ingredient Name",
      brandNewQty: 1,
      brandNewIngrPrice: 5,
      brandNewUnit: "Cup",
      supportNewRecipe: true,
      MealDesc: "",
      MealCategory: "",
      MealHint: "",
      MealPhotoURL: "",
      ExtraMealPrice: "",
      MealCalories: "",
      MealProtein: "",
      MealCarbs: "",
      MealFiber: "",
      MealSugar: "",
      MealFat: "",
      MealSat: "",
    };
  }
  async componentWillMount() {
    //const res = await fetch(this.props.API_URL_CREATEMEAL);
    //const api = await res.json();
    const res1 = await fetch(this.props.API_URL_ADDINGREDIENT);
    const api1 = await res1.json();
    const res2 = await fetch(this.props.API_URL_GETUNITS);
    const api2 = await res2.json();
    //const createMeal = api.result;
    let tempkeys = [];
    let mealid = [];
    let ingrs = [];
    let unit = [];
    let ingrArr = [];
    let mapIngrNameToIngrIdLocal = new Map();
    let mapIngrUnitMeasureIdLocal = new Map();

    let dummyEntry = {
      NewMealId: {
        meal_name: "Create New Meal",
        ingredients: [
          {
            name: "New Ingredient",
            qty: 1,
            units: "Cup",
            ingredient_id: "NewIngrId",
            measure_id: "130-000005",
          },
        ],
      },
    };

    const createMeal = {
      ...dummyEntry,
      //...api.result,
    };

    if (api1.result.result != null) {
      console.log(api1.result.result);

      for (let idx = 0; idx < api1.result.result.length; idx++) {
        console.log(api1.result.result[idx].ingredient_desc);
        if (!ingrs.includes(api1.result.result[idx].ingredient_desc)) {
          ingrs.push(api1.result.result[idx].ingredient_desc);
          mapIngrNameToIngrIdLocal.set(
            api1.result.result[idx].ingredient_desc,
            api1.result.result[idx].ingredient_id
          );
        }
      }

      ingrs.sort(function (a, b) {
        return a.toLowerCase().localeCompare(b.toLowerCase());
      });
    }

    if (api2.result.result != null) {
      console.log(api2.result.result);

      for (let idx = 0; idx < api2.result.result.length; idx++) {
        console.log(api2.result.result[idx].measure_name);
        if (!unit.includes(api2.result.result[idx].measure_name)) {
          unit.push(api2.result.result[idx].measure_name);
          mapIngrUnitMeasureIdLocal.set(
            api2.result.result[idx].measure_name,
            api2.result.result[idx].measure_unit_id
          );
        }
      }

      unit.sort(function (a, b) {
        return a.toLowerCase().localeCompare(b.toLowerCase());
      });
    }

    console.log(ingrs);

    for (var key in createMeal) {
      tempkeys.push(createMeal[key]["meal_name"]);
      mealid.push(key);
    }
    let enterMeal = mealid[this.state.selection];

    console.log(mapIngrUnitMeasureIdLocal);

    for (let j = 0; j < createMeal[enterMeal]["ingredients"].length; j++) {
      ingrArr.push(Object.assign({}, createMeal[enterMeal]["ingredients"][j]));
    }

    this.setState({
      mealkeys: tempkeys,
      createMeal,
      mealidkey: mealid,
      allIngr: ingrs,
      allUnits: unit,
      currIngr: ingrArr,
      mapIngrNameToIngrId: mapIngrNameToIngrIdLocal,
      mapIngrUnitMeasureId: mapIngrUnitMeasureIdLocal,
    });
  }

  handleMealDesc = (e) => {
    this.setState({ MealDesc: e.target.value });
  };
  handleMealCategory = (e) => {
    this.setState({ MealCategory: e.target.value });
  };
  handleMealPhotoURL = (e) => {
    this.setState({ MealPhotoURL: e.target.value });
  };
  handleExtraMealPrice = (e) => {
    this.setState({ ExtraMealPrice: e.target.value });
  };
  handleMealCalories = (e) => {
    this.setState({ MealCalories: e.target.value });
  };
  handleMealProtein = (e) => {
    this.setState({ MealProtein: e.target.value });
  };
  handleMealCarbs = (e) => {
    this.setState({ MealCarbs: e.target.value });
  };
  handleMealFiber = (e) => {
    this.setState({ MealFiber: e.target.value });
  };
  handleMealFat = (e) => {
    this.setState({ MealFat: e.target.value });
  };
  handleMealSat = (e) => {
    this.setState({ MealSat: e.target.value });
  };

  handleBNewIngrName = (event) => {
    this.setState({ brandNewIngr: event.target.value });
  };
  handleBNewQty = (event) => {
    this.setState({ brandNewQty: event.target.value });
  };
  handleBNewIngrPrice = (event) => {
    this.setState({ brandNewIngrPrice: event.target.value });
  };

  handleChange = (event) => {
    console.log(event.target.value);
    this.setState({ selection: event.target.value });
    let enterMeal = this.state.mealidkey[event.target.value];
    let ingrArr = [];
    for (
      let i = 0;
      i < this.state.createMeal[enterMeal]["ingredients"].length;
      i++
    ) {
      ingrArr.push(
        Object.assign({}, this.state.createMeal[enterMeal]["ingredients"][i])
      );
    }
    //console.log(JSON.stringify(this.state.createMeal));
    this.setState({ currIngr: ingrArr, addShow: false });
  };

  onChange = (event) => {
    //console.log(event.target.value);
    this.setState({ newQty: event.target.value });
  };

  handleChange2 = (newValue, index) => {
    let currIngrNew = this.state.currIngr;
    if (newValue) {
      console.log("Changing State");
      console.log(newValue);
      console.log("Before");
      console.log(currIngrNew[index].name);
      if (newValue.inputValue) {
        currIngrNew[index].name = newValue.inputValue;
      } else {
        currIngrNew[index].name = newValue.title;
      }
      console.log("After");
      console.log(currIngrNew[index].name);
      //Add

      if (this.state.mapIngrNameToIngrId.has(currIngrNew[index].name)) {
        currIngrNew[index].ingredient_id = this.state.mapIngrNameToIngrId.get(
          currIngrNew[index].name
        );
      } else {
        currIngrNew[index].ingredient_id = "NewIngrId";
      }
      this.setState({
        currIngr: currIngrNew,
      });
    }
  };

  handleChange2dropdown = (newValue, index) => {
    let currIngrNew = this.state.currIngr;
    if (newValue) {
      console.log("Changing State");
      console.log(newValue);
      console.log("Before");
      console.log(currIngrNew[index].name);
      /*if (newValue.inputValue) {
        currIngrNew[index].name = newValue.inputValue;
      } else {
        currIngrNew[index].name = newValue.title;
      }*/
      currIngrNew[index].name = newValue;
      console.log("After");
      console.log(currIngrNew[index].name);
      //Add

      if (this.state.mapIngrNameToIngrId.has(currIngrNew[index].name)) {
        currIngrNew[index].ingredient_id = this.state.mapIngrNameToIngrId.get(
          currIngrNew[index].name
        );
      } else {
        currIngrNew[index].ingredient_id = "NewIngrId";
      }
      this.setState({
        currIngr: currIngrNew,
      });
    }
  };

  handleChange2new = (newValue) => {
    let updatedNewIngrVal = this.state.newIngrName;
    if (newValue) {
      console.log("Changing newIngrNam State");
      console.log(newValue);
      console.log("Before newIngrNam");
      console.log(this.state.newIngrName);
      if (newValue.inputValue) {
        updatedNewIngrVal = newValue.inputValue;
      } else {
        updatedNewIngrVal = newValue.title;
      }
      console.log("After newIngrNam");
      console.log(updatedNewIngrVal);
      //Add
      //currIngrNew[index].ingredient_id = this.state.mapIngrNameToIngrId[index];
      this.setState({
        newIngrName: updatedNewIngrVal,
      });
    }
  };

  handleChange2newdropdown = (newValue) => {
    let updatedNewIngrVal = this.state.newIngrName;
    if (newValue) {
      console.log("Changing newIngrNam State");
      console.log(newValue);
      console.log("Before newIngrNam");
      console.log(this.state.newIngrName);
      updatedNewIngrVal = newValue;
      console.log("After newIngrNam");
      console.log(updatedNewIngrVal);
      //Add
      //currIngrNew[index].ingredient_id = this.state.mapIngrNameToIngrId[index];
      this.setState({
        newIngrName: updatedNewIngrVal,
      });
    }
  };

  handleChange3 = (newValue, index) => {
    let currIngrNew = this.state.currIngr;
    currIngrNew[index].units = newValue;
    //Add
    if (this.state.mapIngrUnitMeasureId.has(newValue)) {
      currIngrNew[index].measure_id = this.state.mapIngrUnitMeasureId.get(
        newValue
      );
    } else {
      console.log("ERROR NEVER");
      currIngrNew[index].measure_id = "NewMeasureId";
    }
    this.setState({
      currIngr: currIngrNew,
    });
  };

  handleChange3new = (newValue) => {
    //Add
    //currIngrNew[index].measure_id = this.state.mapIngrUnitMeasureId[index];
    this.setState({
      newUnit: newValue,
    });
  };

  handleChange3brandnew = (newValue) => {
    //Add
    //currIngrNew[index].measure_id = this.state.mapIngrUnitMeasureId[index];
    this.setState({
      brandNewUnit: newValue,
    });
  };

  handleChange4 = (newValue, index) => {
    let currIngrNew = this.state.currIngr;
    currIngrNew[index].qty = newValue;
    this.setState({
      currIngr: currIngrNew,
    });
  };

  makeNewIngrEntry = () => {
    if (this.state.addShow) {
    } else {
      this.setState({
        addShow: !this.state.addShow,
      });
    }
  };

  setNewMealName = (e) => {
    console.log(e.target.value);
    this.setState({
      newMealName: e.target.value,
    });
  };

  saveNewEntry = () => {
    if (!this.state.addShow) {
      this.setState({
        addShow: true,
      });
    } else {
      let currIngrNew = this.state.currIngr;
      let ingrId = this.state.mapIngrNameToIngrId.has(this.state.newIngrName)
        ? this.state.mapIngrNameToIngrId.get(this.state.newIngrName)
        : "NewIngrId";
      let measureId = this.state.mapIngrUnitMeasureId.has(this.state.newUnit)
        ? this.state.mapIngrUnitMeasureId.get(this.state.newUnit)
        : "NewMeasureId";
      let newEntry = {
        name: this.state.newIngrName,
        qty: this.state.newQty,
        units: this.state.newUnit,
        ingredient_id: ingrId,
        measure_id: measureId,
      };
      console.log("MAKE NEW ENTRY");
      console.log(newEntry);
      currIngrNew.push(newEntry);
      console.log(currIngrNew);
      this.setState({
        currIngr: currIngrNew,
        newIngrName: "New Ingredient",
        newQty: 1,
        newUnit: "Cup",
        addShow: false,
      });
    }
  };

  saveBrandNewIngr = (e) => {
    e.preventDefault();
    let measureId = this.state.mapIngrUnitMeasureId.has(this.state.brandNewUnit)
      ? this.state.mapIngrUnitMeasureId.get(this.state.brandNewUnit)
      : "NewMeasureId";
    var ingrData = {
      ingredient_id: "NewIngrId",
      ingredient_desc: this.state.brandNewIngr,
      package_size: this.state.brandNewQty,
      ingredient_measure_id: measureId,
      ingredient_cost: this.state.brandNewIngrPrice,
      ingredient_measure: this.state.brandNewUnit,
    };

    console.log(ingrData);
    axios
      .post(this.props.API_URL_ADDINGREDIENT, ingrData)
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
          console.log("API ADD_NEW_INGREDIENT POST WORKED");
          window.location.reload(true);
        }
      })
      .catch((err) => {
        if (err.response !== undefined) {
          //setErro(err.response.data.result);
          //window.location.reload(false);
          console.log("API ADD_NEW_INGREDIENT POST Failed");
        } else if (typeof err === "string") {
          //setErro(err);
          console.log(err);
        }
        //setLoading(false);
      });
  };

  postMealChanges = (e) => {
    e.preventDefault();
    let ingredients_list = this.state.currIngr;
    let key = "NewMealId";
    let mealName = this.state.newMealName;
    if (this.state.selection == 0) {
      key = "NewMealId";
      mealName = this.state.newMealName;
    } else {
      key = this.state.mealidkey[this.state.selection];
      mealName = this.state.mealkeys[this.state.selection];
    }
    //setLoading(true);
    var mealData = {
      meal_id: key,
      meal_name: mealName,
      meal_category: this.state.MealCategory,
      meal_desc: this.state.MealDesc,
      meal_hint: this.state.MealHint,
      meal_photo_URL: this.state.MealPhotoURL,
      extra_meal_price: this.state.ExtraMealPrice,
      meal_calories: this.state.MealCalories,
      meal_protein: this.state.MealProtein,
      meal_carbs: this.state.MealCarbs,
      meal_fiber: this.state.MealFiber,
      meal_sugar: this.state.MealSugar,
      meal_fat: this.state.MealFat,
      meal_sat: this.state.MealSat,
    };
    console.log("Sending Out:");
    console.log(mealData);
    console.log(JSON.stringify(mealData));
    axios
      .post(this.props.API_URL_ADDMEAL, mealData)
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
          console.log("API ADD_MEAL WORKED");
          window.location.reload(true);
        }
      })
      .catch((err) => {
        if (err.response !== undefined) {
          //setErro(err.response.data.result);
          //window.location.reload(false);
          console.log("API ADD_MEAL Failed");
        } else if (typeof err === "string") {
          //setErro(err);
          console.log(err);
        }
        //setLoading(false);
      });
  };

  unitDropdown = (defaultUnit, index) => {
    let tempUnit = [];
    let unit = this.state.allUnits;
    for (let j = 0; j < unit.length; j++) {
      tempUnit.push(<MenuItem value={unit[j]}>{unit[j]}</MenuItem>);
    }
    return (
      <FormControl>
        <Select
          labelId="demo-simple-select-label"
          id="demo-simple-select"
          value={this.state.currIngr[index].units}
          onChange={(e) => {
            this.handleChange3(e.target.value, index);
          }}
          // style={{ color: "white" }}
        >
          {tempUnit}
        </Select>
      </FormControl>
    );
  };

  unitDropdownBrandNew = () => {
    let tempUnit = [];
    let unit = this.state.allUnits;
    for (let j = 0; j < unit.length; j++) {
      tempUnit.push(<MenuItem value={unit[j]}>{unit[j]}</MenuItem>);
    }
    return (
      <FormControl>
        <Select
          labelId="demo-simple-select-label"
          id="demo-simple-select"
          value={this.state.brandNewUnit}
          onChange={(e) => {
            this.handleChange3brandnew(e.target.value);
          }}
          // style={{ color: "white" }}
        >
          {tempUnit}
        </Select>
      </FormControl>
    );
  };

  unitDropdownNew = () => {
    let tempUnit = [];
    let unit = this.state.allUnits;
    for (let j = 0; j < unit.length; j++) {
      tempUnit.push(<MenuItem value={unit[j]}>{unit[j]}</MenuItem>);
    }
    return (
      <FormControl>
        <Select
          labelId="demo-simple-select-label"
          id="demo-simple-select"
          value={this.state.newUnit}
          onChange={(e) => {
            this.handleChange3new(e.target.value);
          }}
          // style={{ color: "white" }}
        >
          {tempUnit}
        </Select>
      </FormControl>
    );
  };

  ingrDropdown2new = (defaultIngr) => {
    let tempmeal = [];
    let ingrs = this.state.allIngr;
    for (let i = 0; i < ingrs.length; i++) {
      tempmeal.push(<MenuItem value={ingrs[i]}>{ingrs[i]}</MenuItem>);
    }
    return (
      <FormControl>
        <Select
          labelId="demo-simple-select-label"
          id="demo-simple-select"
          value={this.state.newIngrName}
          onChange={(e) => {
            this.handleChange2newdropdown(e.target.value);
          }}
          // style={{ color: "white" }}
        >
          {tempmeal}
        </Select>
      </FormControl>
    );
  };

  ingrDropdown2 = (defaultIngr, index) => {
    let tempmeal = [];
    let ingrs = this.state.allIngr;
    for (let i = 0; i < ingrs.length; i++) {
      tempmeal.push(<MenuItem value={ingrs[i]}>{ingrs[i]}</MenuItem>);
    }
    return (
      <FormControl>
        <Select
          labelId="demo-simple-select-label"
          id="demo-simple-select"
          value={this.state.currIngr[index].name}
          onChange={(e) => {
            this.handleChange2dropdown(e.target.value, index);
          }}
          // style={{ color: "white" }}
        >
          {tempmeal}
        </Select>
      </FormControl>
    );
  };

  ingrDropdown1 = (defaultIngr, index) => {
    let tempmeal = [];
    let ingrs = this.state.allIngr;
    const selectStyles = {
      menu: (base) => ({
        ...base,
        zIndex: 100,
      }),
    };

    const customStyles = {
      option: (provided, state) => ({
        ...provided,
        borderBottom: "1px dotted pink",
        color: state.isSelected ? "red" : "blue",
        padding: 20,
      }),
      control: () => ({
        // none of react-select's styles are passed to <Control />
        width: 200,
      }),
      singleValue: (provided, state) => {
        const opacity = state.isDisabled ? 1 : 1;
        const transition = "opacity 300ms";

        return { ...provided, opacity, transition };
      },
    };
    return (
      <SingleSelect
        style={{
          width: 100,
          zIndex: "1000",
          display: "top",
          background: "black",
          color: "red",
          backgroundColor: "black",
        }}
        value="Europe"
        options={ingrs}
        //onChange={this.handleChange}
        //styles={customStyles}
        SelectProps={{
          isCreatable: true,
          isClearable: true,
          menuColor: "red",
          styles: {
            width: 100,
            zIndex: 100,
            display: "block",
            zIndex: 1,
            background: "pink",
            color: "green",
            backgroundColor: "blue",
          },
        }}
      />
    );
  };

  ingrDropdown = (defaultIngr, index) => {
    let tempmeal = [];
    let ingrs = this.state.allIngr;
    for (let i = 0; i < ingrs.length; i++) {
      tempmeal.push({ title: ingrs[i] });
    }

    return (
      <Autocomplete
        defaultValue={this.state.currIngr[index].name}
        value={this.state.currIngr[index].name}
        onChange={(e, v) => {
          console.log(v);
          this.handleChange2(v, index);
        }}
        filterOptions={(options, params) => {
          console.log("filterOptions");
          console.log(options);
          console.log(params);
          const filtered = filter(options, params);
          console.log(filtered);

          // Suggest the creation of a new value
          if (params.inputValue !== "") {
            filtered.push({
              inputValue: params.inputValue,
              title: `Add "${params.inputValue}"`,
            });
          }

          return filtered;
        }}
        selectOnFocus
        clearOnBlur
        handleHomeEndKeys
        id="Add New or Select"
        options={tempmeal}
        getOptionLabel={(option) => {
          // Value selected with enter, right from the input
          //console.log("getOptionLabel");
          //console.log(option);
          if (typeof option === "string") {
            return option;
          }
          // Add "xxx" option created dynamically
          if (option.inputValue) {
            return option.inputValue;
          }
          // Regular option
          return option.title;
        }}
        renderOption={(option) => option.title}
        style={{ width: 300 }}
        freeSolo
        renderInput={(params) => (
          <TextField {...params} label="Add New Or Select" variant="outlined" />
        )}
      />
    );
  };

  qtyDropdown = (defaultQty, index) => {
    return (
      <input
        type="number"
        step="0.1"
        min="0"
        max="1000000"
        className="form-control"
        value={this.state.currIngr[index].qty}
        onChange={(e) => {
          this.handleChange4(e.target.value, index);
        }}
      />
    );
  };

  ingrDropdownNew = () => {
    let tempmeal = [];
    let ingrs = this.state.allIngr;
    for (let i = 0; i < ingrs.length; i++) {
      tempmeal.push({ title: ingrs[i] });
    }

    return (
      <Autocomplete
        defaultValue={this.state.newIngrName}
        value={this.state.newIngrName}
        onChange={(e, v) => {
          console.log(v);
          this.handleChange2new(v);
        }}
        filterOptions={(options, params) => {
          console.log("filterOptions");
          console.log(options);
          console.log(params);
          const filtered = filter(options, params);
          console.log(filtered);

          // Suggest the creation of a new value
          if (params.inputValue !== "") {
            filtered.push({
              inputValue: params.inputValue,
              title: `Add "${params.inputValue}"`,
            });
          }

          return filtered;
        }}
        selectOnFocus
        clearOnBlur
        handleHomeEndKeys
        id="Add New or Select"
        options={tempmeal}
        getOptionLabel={(option) => {
          // Value selected with enter, right from the input
          //console.log("getOptionLabel");
          //console.log(option);
          if (typeof option === "string") {
            return option;
          }
          // Add "xxx" option created dynamically
          if (option.inputValue) {
            return option.inputValue;
          }
          // Regular option
          return option.title;
        }}
        renderOption={(option) => option.title}
        style={{ width: 300 }}
        freeSolo
        renderInput={(params) => (
          <TextField {...params} label="Add New Or Select" variant="outlined" />
        )}
      />
    );
  };

  render() {
    let displayrows = [];
    let displayrowsingr = [];
    let enterMeal = this.state.mealidkey[this.state.selection];
    if (enterMeal == null) {
      return <div></div>;
    }
    //let arr = this.state.createMeal[enterMeal]["ingredients"];
    ////{this.state.addShow ? this.addRowTemplate() : <div></div>}
    let arr = this.state.currIngr;
    console.log(this.state.selection);
    console.log(this.state.currIngr);
    if (arr == null) {
      return <div></div>;
    }
    for (let i = 0; i < arr.length; i++) {
      let tempelement = (
        <tr>
          <td>Ingredient {i + 1}</td>
          <td>{this.ingrDropdown2(arr[i].name, i)}</td>
          <td>{this.qtyDropdown(arr[i].qty, i)}</td>
          <td>{this.unitDropdown(arr[i].units, i)}</td>
        </tr>
      );
      displayrows.push(tempelement);
    }
    if (this.state.addShow) {
      displayrows.push(this.addRowTemplate());
    }
    displayrowsingr.push(this.addFirstIngrRow());

    return (
      <div>
        <Grid container spacing={3}>
          <Grid item xs={12}>
            <div style={{ margin: "1%" }}>
              <WhiteTextTypography color="blue" variant="h5" gutterBottom>
                Create Meal
              </WhiteTextTypography>
              <Row>
                <Col>
                  <Table striped bordered hover>
                    {/* variant="dark" */}
                    <thead>
                      <tr>
                        <th colSpan="2">New Meal</th>
                        <th colSpan="3">{this.dateDropdown()}</th>
                      </tr>
                    </thead>
                    <thead>
                      <tr>
                        <th colSpan="2">Meal Desc</th>
                        <th colSpan="3">
                          <Input
                            placeholder={"Meal Desc"}
                            inputProps={{ "aria-label": "description" }}
                            onChange={this.handleMealDesc}
                          />
                        </th>
                      </tr>
                    </thead>
                    <thead>
                      <tr>
                        <th colSpan="2">Meal Category</th>
                        <th colSpan="3">
                          <Input
                            placeholder={"Meal Category"}
                            inputProps={{ "aria-label": "description" }}
                            onChange={this.handleMealCategory}
                          />
                        </th>
                      </tr>
                    </thead>
                    <thead>
                      <tr>
                        <th colSpan="2">Meal Hint</th>
                        <th colSpan="3">
                          <Input
                            placeholder={"Meal Hint"}
                            inputProps={{ "aria-label": "description" }}
                            onChange={this.handleMealhHit}
                          />
                        </th>
                      </tr>
                    </thead>
                    <thead>
                      <tr>
                        <th colSpan="2">Meal Photo URL</th>
                        <th colSpan="3">
                          <Input
                            placeholder={"Meal Photo URL"}
                            inputProps={{ "aria-label": "description" }}
                            onChange={this.handleMealPhotoURL}
                          />
                        </th>
                      </tr>
                    </thead>
                    <thead>
                      <tr>
                        <th colSpan="2">Extra Meal Price</th>
                        <th colSpan="3">
                          <Input
                            placeholder={"Extra Meal Price"}
                            inputProps={{ "aria-label": "description" }}
                            onChange={this.handleExtraMealPrice}
                          />
                        </th>
                      </tr>
                    </thead>
                    <thead>
                      <tr>
                        <th colSpan="2">Meal Calories</th>
                        <th colSpan="3">
                          <Input
                            placeholder={"Meal Calories"}
                            inputProps={{ "aria-label": "description" }}
                            onChange={this.handleMealCalories}
                          />
                        </th>
                      </tr>
                    </thead>
                    <thead>
                      <tr>
                        <th colSpan="2">Meal Protein</th>
                        <th colSpan="3">
                          <Input
                            placeholder={"Meal Protein"}
                            inputProps={{ "aria-label": "description" }}
                            onChange={this.handleMealProtein}
                          />
                        </th>
                      </tr>
                    </thead>
                    <thead>
                      <tr>
                        <th colSpan="2">Meal Carbs</th>
                        <th colSpan="3">
                          <Input
                            placeholder={"Meal Carbs"}
                            inputProps={{ "aria-label": "description" }}
                            onChange={this.handleMealCarbs}
                          />
                        </th>
                      </tr>
                    </thead>
                    <thead>
                      <tr>
                        <th colSpan="2">Meal Fiber</th>
                        <th colSpan="3">
                          <Input
                            placeholder={"Meal Fiber"}
                            inputProps={{ "aria-label": "description" }}
                            onChange={this.handleMealFiber}
                          />
                        </th>
                      </tr>
                    </thead>
                    <thead>
                      <tr>
                        <th colSpan="2">Meal Sugar</th>
                        <th colSpan="3">
                          <Input
                            placeholder={"Meal Sugar"}
                            inputProps={{ "aria-label": "description" }}
                            onChange={this.handleMealSugar}
                          />
                        </th>
                      </tr>
                    </thead>
                    <thead>
                      <tr>
                        <th colSpan="2">Meal Fat</th>
                        <th colSpan="3">
                          <Input
                            placeholder={"Meal Fat"}
                            inputProps={{ "aria-label": "description" }}
                            onChange={this.handleMealFat}
                          />
                        </th>
                      </tr>
                    </thead>
                    <thead>
                      <tr>
                        <th colSpan="2">Meal Sat</th>
                        <th colSpan="3">
                          <Input
                            placeholder={"Meal Sat"}
                            inputProps={{ "aria-label": "description" }}
                            onChange={this.handleMealSat}
                          />
                        </th>
                      </tr>
                    </thead>
                  </Table>
                  <Button
                    variant="success"
                    className="float-right"
                    onClick={this.postMealChanges}
                  >
                    Save Meal
                  </Button>
                </Col>
                <Col></Col>
              </Row>
            </div>
          </Grid>
          <Divider />
          <Grid item xs={12}>
            <div style={{ margin: "1%" }}>
              <WhiteTextTypography color="blue" variant="h5" gutterBottom>
                Create New Ingredient
              </WhiteTextTypography>
              <Row>
                <Col>
                  <Table striped bordered hover>
                    {/* variant="dark" */}
                    <thead>
                      <tr>
                        <th>Ingredient</th>
                        <th>Quantity</th>
                        <th>Units</th>
                        <th>Price</th>
                      </tr>
                    </thead>
                    <tbody>{displayrowsingr}</tbody>
                  </Table>
                </Col>
                <Col></Col>
              </Row>
            </div>
          </Grid>
        </Grid>
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
      temp: this.state.temp,
    });
  };
  addRowTemplate = () => {
    return (
      <tr style={{ backgroundColor: "lightcyan" }}>
        <td>Ingredient {this.state.currIngr.length + 1}</td>
        <td>{this.ingrDropdown2new()}</td>
        <td>
          <input
            type="number"
            step="0.1"
            min="0"
            max="1000000"
            className="form-control"
            value={this.state.newQty}
            onChange={this.onChange}
          />
        </td>
        <td>{this.unitDropdownNew()}</td>
        <td>
          <Button variant="primary" onClick={this.saveNewEntry}>
            Save
          </Button>
        </td>
      </tr>
    );
  };

  addFirstIngrRow = () => {
    return (
      <tr>
        <td>
          <input
            type="text"
            value={this.state.brandNewIngr}
            onChange={this.handleBNewIngrName}
          />
        </td>
        <td>
          <input
            type="number"
            step="0.1"
            min="0"
            max="1000000"
            className="form-control"
            value={this.state.brandNewQty}
            onChange={this.handleBNewQty}
          />
        </td>
        <td>{this.unitDropdownBrandNew()}</td>
        <td>
          <input
            type="number"
            step="0.1"
            min="0"
            max="1000000"
            className="form-control"
            value={this.state.brandNewIngrPrice}
            onChange={this.handleBNewIngrPrice}
          />
        </td>
        <td>
          <Button variant="primary" onClick={this.saveBrandNewIngr}>
            Save Ingredient
          </Button>
        </td>
      </tr>
    );
  };

  dateDropdown = () => {
    let tempdate = [];
    let newMealInput =
      this.state.selection == 0 ? (
        <div>
          <Input
            placeholder="New Meal Name"
            inputProps={{ "aria-label": "description" }}
            onChange={this.setNewMealName}
          />
        </div>
      ) : (
        <div></div>
      );

    for (let i = 0; i < this.state.mealkeys.length; i++) {
      if (!this.state.supportNewRecipe && i == 0) continue;
      else if (this.state.supportNewRecipe && i != 0) continue;
      tempdate.push(<MenuItem value={i}>{this.state.mealkeys[i]}</MenuItem>);
    }
    return <FormControl>{newMealInput}</FormControl>;
  };

  formentry = (label, foo) => {
    let newMealInput = (
      <div>
        <Input
          placeholder={label}
          inputProps={{ "aria-label": "description" }}
          onChange={foo()}
        />
      </div>
    );
    return <FormControl>{newMealInput}</FormControl>;
  };
}
export default CreateNewMeal;
