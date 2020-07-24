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
import IconButton from "@material-ui/core/IconButton";
import DeleteIcon from "@material-ui/icons/Delete";
import DeleteForeverRoundedIcon from "@material-ui/icons/DeleteForeverRounded";
import { MdStayPrimaryLandscape } from "react-icons/md";
//const [value, setValue] = React.useState(null);
const filter = createFilterOptions();
//const [erro, setErro] = useState(null);
//const [loading, setLoading] = useState(false);
const WhiteTextTypography = withStyles({
  root: {
    color: "Green",
  },
})(Typography);

class EditCreateMeal extends Component {
  constructor(props) {
    super(props);
    this.state = {
      mealkeys: [],
      details: [],
      mealidkey: [],
      allIngr: [],
      selection: localStorage.getItem("selIndex1") || 1,
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
      newUnitName: "None",
      brandNewQty: 1,
      brandNewIngrPrice: 5,
      brandNewUnit: "Cup",
      supportNewRecipe: false,
      mealNameRedirected: "",
      unit1: "Cup",
      unit2: "liter",
      conversionRatio: 0.236,
    };
  }
  async componentWillMount() {
    const res = await fetch(this.props.API_URL_CREATEMEAL);
    const api = await res.json();
    const res1 = await fetch(this.props.API_URL_ADDINGREDIENT);
    const api1 = await res1.json();
    const res2 = await fetch(this.props.API_URL_GETUNITS);
    const api2 = await res2.json();
    const mealNameRedirected = this.props.location.state;
    let redirectedSel = -1;
    let redirectedName = "NONE";

    console.log(mealNameRedirected);
    if (mealNameRedirected != null) {
      if (
        mealNameRedirected.mealName != null ||
        mealNameRedirected.mealName != ""
      ) {
        this.setState({ mealNameRedirected: mealNameRedirected.mealName });
        redirectedName = mealNameRedirected.mealName;
      }
    }

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
      ...api.result,
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
      if (
        redirectedName != "NONE" &&
        redirectedName == createMeal[key]["meal_name"]
      ) {
        redirectedSel = mealid.indexOf(key);
        this.setState({ selection: redirectedSel });
      }
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

  handleBNewIngrName = (event) => {
    this.setState({ brandNewIngr: event.target.value });
  };
  handleNewUnitName = (event) => {
    this.setState({ newUnitName: event.target.value });
  };
  handleBNewQty = (event) => {
    this.setState({ brandNewQty: event.target.value });
  };
  handleBNewIngrPrice = (event) => {
    this.setState({ brandNewIngrPrice: event.target.value });
  };

  deleteChanges = (index) => {
    console.log("DELETE CALLED");
    console.log(index);
    console.log(this.state.currIngr);
    let newCurrIngr = [];
    if (index > -1) {
      if (
        !(
          this.state.currIngr.length == 1 && this.state.currIngr[0].name == null
        )
      ) {
        for (let i = 0; i < this.state.currIngr.length; i++) {
          if (i == index) continue;
          newCurrIngr.push(Object.assign({}, this.state.currIngr[i]));
        }
        this.setState({ currIngr: newCurrIngr });
      } else {
        console.log("DELETE Skipped the null ingredient element");
      }
    }
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

  saveNewUnit = (e) => {
    e.preventDefault();
    var unitData = {
      measure_id: "NewUnitId",
      measure_name: this.state.newUnitName,
    };

    console.log(unitData);
    axios
      .post(this.props.API_URL_ADDUNIT, unitData)
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
          console.log("API ADD_NEW_UNIT POST WORKED");
          window.location.reload(true);
        }
      })
      .catch((err) => {
        if (err.response !== undefined) {
          //setErro(err.response.data.result);
          //window.location.reload(false);
          console.log("API ADD_NEW_UNIT POST Failed");
        } else if (typeof err === "string") {
          //setErro(err);
          console.log(err);
        }
        //setLoading(false);
      });
  };

  saveUnitConversion = (e) => {
    e.preventDefault();

    var myType = "mass";
    if (this.state.unit2 === "liter") myType = "volume";
    if (this.state.unit2 === "cm") myType = "length";

    var unitData = {
      unit1: this.state.unit1,
      unit2: this.state.unit2,
      conversion_ratio: this.state.conversionRatio,
      type: myType,
    };

    console.log(unitData);
    axios
      .post(this.props.API_URL_SAVEUNITCONVERSION, unitData)
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
          console.log("API ADD CONVERSION POST WORKED");
          window.location.reload(true);
        }
      })
      .catch((err) => {
        if (err.response !== undefined) {
          //setErro(err.response.data.result);
          //window.location.reload(false);
          console.log("API ADD CONVERSION POST Failed");
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
      ingredients: ingredients_list,
    };

    localStorage.setItem("selIndex1", this.state.selection);
    console.log("Sending Out:");
    console.log(mealData);
    console.log(JSON.stringify(mealData));
    axios
      .post(this.props.API_URL_SAVERECIPE, mealData)
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

          console.log("API ADD_NEW_INGREDIENT WORKED");
          window.location.reload(true);
        }
      })
      .catch((err) => {
        if (err.response !== undefined) {
          //setErro(err.response.data.result);
          //window.location.reload(false);
          console.log("API ADD_NEW_INGREDIENT Failed");
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

  unit1Dropdown = () => {
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
          value={this.state.unit1}
          onChange={(e) => {
            this.setState({
              unit1: e.target.value,
            });
          }}
          // style={{ color: "white" }}
        >
          {tempUnit}
        </Select>
      </FormControl>
    );
  };

  unit2Dropdown = () => {
    let tempUnit = [];
    let unit = this.state.allUnits;
    for (let j = 0; j < unit.length; j++) {
      if (unit[j] === "kg" || unit[j] === "liter" || unit[j] === "cm")
        tempUnit.push(<MenuItem value={unit[j]}>{unit[j]}</MenuItem>);
    }
    return (
      <FormControl>
        <Select
          labelId="demo-simple-select-label"
          id="demo-simple-select"
          value={this.state.unit2}
          onChange={(e) => {
            this.setState({
              unit2: e.target.value,
            });
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

  deleteColumn = (index) => {
    return (
      <IconButton
        aria-label="delete"
        variant="primary"
        color="secondary"
        className="float-right"
        onClick={(e) => {
          this.deleteChanges(index);
        }}
      >
        <DeleteIcon />
      </IconButton>
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
    let displayrowconversion = [];
    let displayrowunit = [];
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
          <td>{this.deleteColumn(i)}</td>
        </tr>
      );
      displayrows.push(tempelement);
    }
    if (this.state.addShow) {
      displayrows.push(this.addRowTemplate());
    }
    displayrowsingr.push(this.addFirstIngrRow());
    displayrowconversion.push(this.addRowConversion());
    displayrowunit.push(this.addUnitRow());

    return (
      <div>
        <Grid container spacing={3}>
          <Grid item xs={12}>
            <div style={{ margin: "1%" }}>
              <WhiteTextTypography color="blue" variant="h5" gutterBottom>
                Edit Meal Recipe Here
              </WhiteTextTypography>
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
                        <th>Quantity</th>
                        <th>Units</th>
                      </tr>
                    </thead>
                    <tbody>{displayrows}</tbody>
                  </Table>
                  <Button variant="success" onClick={this.makeNewIngrEntry}>
                    Add Ingredient
                  </Button>
                  <Button
                    variant="success"
                    className="float-right"
                    onClick={this.postMealChanges}
                  >
                    Save Recipe
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
                        <th>Price Per Unit</th>
                      </tr>
                    </thead>
                    <tbody>{displayrowsingr}</tbody>
                  </Table>
                </Col>
                <Col></Col>
              </Row>
            </div>
          </Grid>
          <Divider />
          <Grid item xs={12}>
            <div style={{ margin: "1%" }}>
              <WhiteTextTypography color="blue" variant="h5" gutterBottom>
                Create New Measure Unit
              </WhiteTextTypography>
              <Row>
                <Col>
                  <Table striped bordered hover>
                    {/* variant="dark" */}
                    <thead>
                      <tr>
                        <th>New Unit Name</th>
                      </tr>
                    </thead>
                    <tbody>{displayrowunit}</tbody>
                  </Table>
                </Col>
                <Col></Col>
              </Row>
            </div>
          </Grid>
          <Divider />
          <Grid item xs={12}>
            <div style={{ margin: "1%" }}>
              <WhiteTextTypography color="blue" variant="h5" gutterBottom>
                Unit Conversion
              </WhiteTextTypography>
              <Row>
                <Col>
                  <Table striped bordered hover>
                    {/* variant="dark" */}
                    <thead>
                      <tr>
                        <th>From Unit</th>
                        <th>To Unit</th>
                        <th>Conversion Ratio</th>
                      </tr>
                    </thead>
                    <tbody>{displayrowconversion}</tbody>
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

  addUnitRow = () => {
    return (
      <tr>
        <td>
          <input
            type="text"
            placeholder={"Enter Here"}
            value={this.state.newUnitName}
            onChange={this.handleNewUnitName}
          />
        </td>
        <td>
          <Button variant="primary" onClick={this.saveNewUnit}>
            Save Unit
          </Button>
        </td>
      </tr>
    );
  };

  addRowConversion = () => {
    return (
      <tr>
        <td>{this.unit1Dropdown()}</td>
        <td>{this.unit2Dropdown()}</td>
        <td>
          <input
            type="number"
            step="0.01"
            min="0"
            max="1000000"
            className="form-control"
            value={this.state.conversionRatio}
            onChange={(e) => {
              this.setState({
                conversionRatio: e.target.value,
              });
            }}
          />
        </td>
        <td>
          <Button variant="primary" onClick={this.saveUnitConversion}>
            Save Conversion
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
        {newMealInput}
      </FormControl>
    );
  };
}
export default EditCreateMeal;
