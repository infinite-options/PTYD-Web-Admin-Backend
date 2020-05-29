import React, { Component } from "react";

import Typography from "@material-ui/core/Typography";
import Breadcrumbs from "@material-ui/core/Breadcrumbs";
import Link from "@material-ui/core/Link";
import { Table, Button, Row, Col } from "react-bootstrap";
import MenuItem from "@material-ui/core/MenuItem";
import FormControl from "@material-ui/core/FormControl";
import Select from "@material-ui/core/Select";

import TextField from "@material-ui/core/TextField";
import { SingleSelect } from "react-select-material-ui";
import ReactSelectMaterialUi from "react-select-material-ui";

import Autocomplete, {
  createFilterOptions,
} from "@material-ui/lab/Autocomplete";

//const [value, setValue] = React.useState(null);
const filter = createFilterOptions();

class EditCreateMeal extends Component {
  constructor(props) {
    super(props);
    this.state = {
      mealkeys: [],
      details: [],
      mealidkey: [],
      allIngr: [],
      selection: 1,
      showAdd: false,
      allUnits: [],
      currIngr: [],
      golu: 10,
    };
  }
  async componentWillMount() {
    const res = await fetch(this.props.API_URL_CREATEMEAL);
    const api = await res.json();
    //const createMeal = api.result;
    let tempkeys = [];
    let mealid = [];
    let ingrs = [];
    let unit = [];
    let ingrArr = [];
    let dummyEntry = {
      NewMealID: {
        meal_name: "Add New Meal",
        ingredients: [
          {
            name: "Dummy Ingredient",
            qty: 1,
            units: "Dummy Unit",
            ingredient_id: "NewIngrId",
            measure_id: "NewMeasureId",
          },
        ],
      },
    };

    const createMeal = {
      ...dummyEntry,
      ...api.result,
    };

    for (var key in createMeal) {
      tempkeys.push(createMeal[key]["meal_name"]);
      mealid.push(key);

      for (let i = 0; i < createMeal[key]["ingredients"].length; i++) {
        if (!ingrs.includes(createMeal[key]["ingredients"][i].name)) {
          ingrs.push(createMeal[key]["ingredients"][i].name);
        }
        if (!unit.includes(createMeal[key]["ingredients"][i].units)) {
          unit.push(createMeal[key]["ingredients"][i].units);
        }
      }
    }
    let enterMeal = mealid[this.state.selection];

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
    });
  }
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
    this.setState({ currIngr: ingrArr });
  };

  onChange = (event) => {
    //console.log(event.target.value);
    this.setState({ golu: event.target.value });
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
      //currIngrNew[index].ingredient_id = this.state.mapIngrNameToIngrId[index];
      this.setState({
        currIngr: currIngrNew,
      });
    }
  };

  handleChange3 = (newValue, index) => {
    let currIngrNew = this.state.currIngr;
    currIngrNew[index].units = newValue;
    //Add
    //currIngrNew[index].measure_id = this.state.mapIngrUnitMeasureId[index];
    this.setState({
      currIngr: currIngrNew,
    });
  };

  handleChange4 = (newValue, index) => {
    let currIngrNew = this.state.currIngr;
    currIngrNew[index].qty = newValue;
    this.setState({
      currIngr: currIngrNew,
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
            this.handleChange2(e.target.value, index);
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

  render() {
    let displayrows = [];
    let enterMeal = this.state.mealidkey[this.state.selection];
    if (enterMeal == null) {
      return <div></div>;
    }
    //let arr = this.state.createMeal[enterMeal]["ingredients"];
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
          <td>{this.ingrDropdown(arr[i].name, i)}</td>
          <td>{this.qtyDropdown(arr[i].qty, i)}</td>
          <td>{this.unitDropdown(arr[i].units, i)}</td>
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
              variant="success"
              onClick={() => {
                this.setState({ addShow: !this.state.addShow });
              }}
            >
              Add Ingredient
            </Button>
            <Button
              variant="success"
              className="float-right"
              //style={{ marginLeft : "auto"}}
              //onClick={() => {
              //  this.setState({ addShow: !this.state.addShow });
              //}}
            >
              Update Recipe
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
      temp: this.state.temp,
    });
  };
  addRowTemplate = () => {
    return (
      <tr>
        <td>Ingredient {this.state.currIngr.length + 1}</td>
        <td>
          <form noValidate autoComplete="off">
            <TextField id="standard-basic" />
          </form>
        </td>
        <td>
          <input
            type="number"
            step="0.1"
            min="0"
            max="1000000"
            className="form-control"
            value={this.state.golu}
            onChange={this.onChange}
          />
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
