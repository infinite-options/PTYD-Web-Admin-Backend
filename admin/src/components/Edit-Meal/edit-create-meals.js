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
 
import Autocomplete, { createFilterOptions } from '@material-ui/lab/Autocomplete';
import Alert from '@material-ui/lab/Alert';
import Divider from '@material-ui/core/Divider';
import Input from '@material-ui/core/Input';
//const [value, setValue] = React.useState(null);
const filter = createFilterOptions();


class EditCreateMeal extends Component {
  constructor(props) {
    super(props);
    this.state = {
      mealkeys: [],
      details: [],
      mealidkey: [],
      allIngr : [],
      selection: 1,
      showAdd: false,
      allUnits : [],
      currIngr : [],
      golu : 10,
      newIngrName : "New Ingredient",
      newQty : 1,
      newUnit : "Cup",
      mapIngrNameToIngrId : new Map(),
      mapIngrUnitMeasureId : new Map(),
      newMealName : "New Meal"
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
    let mapIngrNameToIngrIdLocal = new Map();
    let mapIngrUnitMeasureIdLocal = new Map();

    let dummyEntry = {"NewMealId": {
            "meal_name": "Create New Meal",
            "ingredients": [
                {
                    "name": "New Ingredient",
                    "qty": 1,
                    "units": "Cup",
                    "ingredient_id": "NewIngrId",
                    "measure_id": "130-000005"
                }
                ]
              }
            };

    const createMeal = {
        ...dummyEntry,
        ...api.result
    };         

    for (var key in createMeal) {
      tempkeys.push(createMeal[key]["meal_name"]);
      mealid.push(key);

      for (let i = 0; i < createMeal[key]["ingredients"].length; i++) {
          if(!ingrs.includes(createMeal[key]["ingredients"][i].name)) {
            ingrs.push(createMeal[key]["ingredients"][i].name);
          }
          if(!unit.includes(createMeal[key]["ingredients"][i].units)){
            unit.push(createMeal[key]["ingredients"][i].units)
          }
          mapIngrNameToIngrIdLocal.set(createMeal[key]["ingredients"][i].name, createMeal[key]["ingredients"][i].ingredient_id);
          mapIngrUnitMeasureIdLocal.set(createMeal[key]["ingredients"][i].units, createMeal[key]["ingredients"][i].measure_id);
      }

    }
    let enterMeal = mealid[this.state.selection];

    console.log(mapIngrUnitMeasureIdLocal);

    for(let j = 0; j < createMeal[enterMeal]["ingredients"].length; j++) {
           ingrArr.push(Object.assign({}, createMeal[enterMeal]["ingredients"][j]));
    }

    this.setState({ mealkeys: tempkeys, createMeal, mealidkey: mealid, allIngr : ingrs, allUnits : unit, currIngr : ingrArr, mapIngrNameToIngrId : mapIngrNameToIngrIdLocal, mapIngrUnitMeasureId : mapIngrUnitMeasureIdLocal});
  }
  handleChange = event => {
    console.log(event.target.value);
    this.setState({ selection: event.target.value });
    let enterMeal = this.state.mealidkey[event.target.value];
    let ingrArr = [];
    for(let i = 0; i < this.state.createMeal[enterMeal]["ingredients"].length; i++) {
           ingrArr.push(Object.assign({}, this.state.createMeal[enterMeal]["ingredients"][i]));
    }
    //console.log(JSON.stringify(this.state.createMeal));
    this.setState({ currIngr : ingrArr, addShow : false});

  };

  onChange = event => {
    //console.log(event.target.value);
    this.setState({ newQty : event.target.value });

  };

  handleChange2 = (newValue, index) => {
    let currIngrNew = this.state.currIngr;
    if (newValue) {
    console.log("Changing State")  
    console.log(newValue);  
    console.log("Before")
    console.log(currIngrNew[index].name);
    if(newValue.inputValue) {
      currIngrNew[index].name = newValue.inputValue;
    } else {
      currIngrNew[index].name = newValue.title;
    }
    console.log("After")
    console.log(currIngrNew[index].name);
        //Add

    if(this.state.mapIngrNameToIngrId.has(currIngrNew[index].name)) {   
       currIngrNew[index].ingredient_id = this.state.mapIngrNameToIngrId.get(currIngrNew[index].name);
    }else{
       currIngrNew[index].ingredient_id = "NewIngrId";
    }
    this.setState({
      currIngr : currIngrNew
    });
    }

  };

  handleChange2new = (newValue) => {
    let updatedNewIngrVal = this.state.newIngrName;
    if (newValue) {
    console.log("Changing newIngrNam State")  
    console.log(newValue);  
    console.log("Before newIngrNam")
    console.log(this.state.newIngrName);
    if(newValue.inputValue) {
      updatedNewIngrVal = newValue.inputValue;
    } else {
      updatedNewIngrVal = newValue.title;
    }
    console.log("After newIngrNam")
    console.log(updatedNewIngrVal);
        //Add
    //currIngrNew[index].ingredient_id = this.state.mapIngrNameToIngrId[index];
    this.setState({
      newIngrName : updatedNewIngrVal
    });
    }

  };

  handleChange3 = (newValue, index) => {
    let currIngrNew = this.state.currIngr;
    currIngrNew[index].units = newValue;
    //Add
    if(this.state.mapIngrUnitMeasureId.has(newValue)) {
        currIngrNew[index].measure_id = this.state.mapIngrUnitMeasureId.get(newValue);
    } else {
      console.log("ERROR NEVER");
      currIngrNew[index].measure_id = "NewMeasureId";
    }
    this.setState({
      currIngr : currIngrNew
    });
  };

  handleChange3new = (newValue) => {
    //Add
    //currIngrNew[index].measure_id = this.state.mapIngrUnitMeasureId[index];
    this.setState({
      newUnit : newValue
    });
  };



  handleChange4 = (newValue, index) => {
    let currIngrNew = this.state.currIngr;
    currIngrNew[index].qty = newValue;
    this.setState({
      currIngr : currIngrNew
    });
  };

  makeNewIngrEntry = () => {
      if(this.state.addShow) {
      } else {
          this.setState({
              addShow : !this.state.addShow
          });

      }
  };

  setNewMealName = (e) => {
          console.log(e.target.value)
          this.setState({
              newMealName : e.target.value
          }); 
  }

  saveNewEntry = () => {

    if(!this.state.addShow) {
          this.setState({
              addShow : true
          });
    } else {

      let currIngrNew = this.state.currIngr;
      let ingrId = this.state.mapIngrNameToIngrId.has(this.state.newIngrName) ? this.state.mapIngrNameToIngrId.get(this.state.newIngrName) : "NewIngrId";
      let measureId = this.state.mapIngrUnitMeasureId.has(this.state.newUnit) ? this.state.mapIngrUnitMeasureId.get(this.state.newUnit) : "NewMeasureId";
      let newEntry = {
         "name" : this.state.newIngrName,
         "qty"  : this.state.newQty,
         "units" : this.state.newUnit,
         "ingredient_id" : ingrId,
         "measure_id" : measureId
       };
       console.log("MAKE NEW ENTRY");
       console.log(newEntry);
       currIngrNew.push(newEntry);
       console.log(currIngrNew);
        this.setState({
          currIngr : currIngrNew,
          newIngrName : "New Ingredient",
          newQty : 1,
          newUnit : "Cup",
          addShow : false
        });


    }


  };

  postMealChanges = () => {

    let ingredients_list = this.state.currIngr;
    let key = "NewMealId";
    let mealName = this.state.newMealName;
    if(this.state.selection == 0) {
      key = "NewMealId";
      mealName = this.state.newMealName;
    } else {
      key = this.state.mealidkey[this.state.selection];
      mealName = this.state.mealkeys[this.state.selection];
    }

    let mealData = {         "meal_id" : key,
                             "meal_name" : mealName,
                             "ingredients" : ingredients_list
                    };
    console.log("Sending Out:");
    console.log(mealData);
    

  };

  unitDropdown = (defaultUnit, index) => {
    let tempUnit = [];
    let unit = this.state.allUnits;
    for(let j = 0; j < unit.length; j++){
      tempUnit.push(
        <MenuItem
          value={unit[j]}
        >
        {unit[j]}
        </MenuItem>
        );
    }
    return (
      <FormControl>
        <Select
          labelId="demo-simple-select-label"
          id="demo-simple-select"
          value={this.state.currIngr[index].units}
          onChange={e => {
            this.handleChange3(e.target.value, index);
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
    for(let j = 0; j < unit.length; j++){
      tempUnit.push(
        <MenuItem
          value={unit[j]}
        >
        {unit[j]}
        </MenuItem>
        );
    }
    return (
      <FormControl>
        <Select
          labelId="demo-simple-select-label"
          id="demo-simple-select"
          value={this.state.newUnit}
          onChange={e => {
            this.handleChange3new(e.target.value);
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
      tempmeal.push(
        <MenuItem
          value={ingrs[i]}
        >
          {ingrs[i]}
        </MenuItem>
      );
    }
    return (
      <FormControl>
        <Select
          labelId="demo-simple-select-label"
          id="demo-simple-select"
          value={this.state.currIngr[index].name}
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

  ingrDropdown1 = (defaultIngr, index) => {
    let tempmeal = [];
    let ingrs = this.state.allIngr;
    const selectStyles = {
      menu: base => ({
        ...base,
        zIndex: 100
      })
    };

    const customStyles = {
  option: (provided, state) => ({
    ...provided,
    borderBottom: '1px dotted pink',
    color: state.isSelected ? 'red' : 'blue',
    padding: 20,
  }),
  control: () => ({
    // none of react-select's styles are passed to <Control />
    width: 200,
  }),
  singleValue: (provided, state) => {
    const opacity = state.isDisabled ? 1: 1;
    const transition = 'opacity 300ms';

    return { ...provided, opacity, transition };
  }
};
    return (
 
        <SingleSelect
          style={{ width: 100, zIndex : '1000', display : "top",background : "black", color: "red", backgroundColor: "black"}}
          value="Europe"
          options={ingrs}
          //onChange={this.handleChange}
          //styles={customStyles}
           SelectProps={{
            isCreatable: true,
            isClearable: true,
            menuColor: 'red',
            styles:{width: 100, zIndex : 100, display : "block", zIndex : 1, background : "pink", color: "green", backgroundColor: "blue"}

          }}
        />

    
    );
  };


 ingrDropdown = (defaultIngr, index) => {
    let tempmeal = [];
    let ingrs = this.state.allIngr;
    for (let i = 0; i < ingrs.length; i++) {
         tempmeal.push( {title : ingrs[i]});
    
    }    

    return (

    <Autocomplete
      defaultValue={this.state.currIngr[index].name}
      value={this.state.currIngr[index].name}
      onChange={(e,v) => {
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
        if (params.inputValue !== '') {
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
        if (typeof option === 'string') {
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
                type='number'
                step="0.1"
                min='0'
                max='1000000'
                className='form-control'
                value={this.state.currIngr[index].qty}
                onChange={e => {
                    this.handleChange4(e.target.value, index);
                }}
              />
     );
  };

  ingrDropdownNew = () => {
    let tempmeal = [];
    let ingrs = this.state.allIngr;
    for (let i = 0; i < ingrs.length; i++) {
         tempmeal.push( {title : ingrs[i]});
    
    }    

    return (

    <Autocomplete
      defaultValue={this.state.newIngrName}
      value={this.state.newIngrName}
      onChange={(e,v) => {
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
        if (params.inputValue !== '') {
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
        if (typeof option === 'string') {
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
          <td>{this.ingrDropdown(arr[i].name, i)}</td>
          <td>{this.qtyDropdown(arr[i].qty, i)}</td>
          <td>{this.unitDropdown(arr[i].units, i)}</td>
        </tr>
      );
      displayrows.push(tempelement);
      
    }
    if(this.state.addShow) {displayrows.push(this.addRowTemplate());}
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
                  <th colSpan="3">{this.dateDropdown()}
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
              <tbody>{displayrows}</tbody>
            </Table>
            <Button
              variant="success"
              onClick={this.makeNewIngrEntry}
            >
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
      <tr style={{ backgroundColor: "lightcyan" }}>
        <td>Ingredient {this.state.currIngr.length + 1}</td>
        <td>{this.ingrDropdownNew()}</td>
        <td>
            <input
                type='number'
                step="0.1"
                min='0'
                max='1000000'
                className='form-control'
                value={this.state.newQty}
                onChange={this.onChange}
              />
        </td>
      <td>{this.unitDropdownNew()}</td>
      <td>
          <Button
            variant="primary"
            onClick={this.saveNewEntry}
          >
            Save
          </Button>
      </td>
      </tr>
    );
  };
  dateDropdown = () => {
    let tempdate = [];
    let newMealInput = (this.state.selection == 0) ?         <div> 
        <Input placeholder="New Meal Name" inputProps={{ 'aria-label': 'description' }} onChange={this.setNewMealName}/></div>: <div></div>;

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
        {newMealInput}
      </FormControl>
    );
  };
}
export default EditCreateMeal;
