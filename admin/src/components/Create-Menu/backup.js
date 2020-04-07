// import React, { Component } from "react";

// import Jumbotron from "../Jumbotron/Jumbotron-create-menu";
// import Typography from "@material-ui/core/Typography";
// import Breadcrumbs from "@material-ui/core/Breadcrumbs";
// import Link from "@material-ui/core/Link";
// import { Table, Button, Row, Col } from "react-bootstrap";
// import MenuItem from "@material-ui/core/MenuItem";
// import FormControl from "@material-ui/core/FormControl";
// import Select from "@material-ui/core/Select";
// import TextField from "@material-ui/core/TextField";

// class CreateMenu extends Component {
//   constructor(props) {
//     super(props);
//     this.state = {
//       // columns: [
//       //   { title: "Meal", field: "meal" },
//       //   {
//       //     title: "Drop Down",
//       //     field: "dropdown",
//       //     lookup: { 1: "Spicy Chicken", 2: "salad" }
//       //   },
//       //   { title: "Avg Sales", field: "sales" }
//       // ],
//       // data: [
//       //   { meal: "Special_1", dropdown: 1, sales: 99 },
//       //   {
//       //     meal: "Secial_2",
//       //     dropdown: 2,
//       //     sales: 32
//       //   }
//       // ],
//       // query: {
//       //   page: 1,
//       //   pageSize: 10
//       // },
//       // age: 10,
//       temp: [],
//       createMenu: [],
//       details: []
//     };
//   }
//   async componentDidMount() {
//     const res = await fetch(this.props.API_URL_CREATEMENU);
//     const api = await res.json();
//     const createMenu = api.menus;
//     const details = api.result;
//     this.setState({ createMenu, details });
//   }
//   componentWillMount() {
//     this.state.temp.push(
//       <tr>
//         <td>Weekly Entree</td>
//         <td>
//           <FormControl>
//             <Select
//               labelId="demo-simple-select-label"
//               id="demo-simple-select"
//               value={this.state.age}
//               onChange={this.handleChange}
//               style={{ color: "white" }}
//             >
//               <MenuItem value={10}>Ten</MenuItem>
//               <MenuItem value={20}>Twenty</MenuItem>
//               <MenuItem value={30}>Thirty</MenuItem>
//             </Select>
//           </FormControl>
//         </td>
//         <td>25</td>
//       </tr>,
//       <tr>
//         <td>Weekly Salad</td>
//         <td>
//           <FormControl>
//             <Select
//               labelId="demo-simple-select-label"
//               id="demo-simple-select"
//               value={this.state.age}
//               onChange={this.handleChange}
//               style={{ color: "white" }}
//             >
//               <MenuItem value={10}>Ten</MenuItem>
//               <MenuItem value={20}>Twenty</MenuItem>
//               <MenuItem value={30}>Thirty</MenuItem>
//             </Select>
//           </FormControl>
//         </td>
//         <td>50</td>
//       </tr>
//     );
//   }
//   handleChange = event => {
//     this.setState({ age: event.target.value });
//   };
//   makeTable = () => {
//     let a = [];

//     for (var key in this.state.createMenu) {
//       console.log("sdsfdsfsdfsdf", this.state.createMenu[key]);
//       console.log("key", key);
//       a.push(
//         <div className="scrollItem">
//           {this.getData(this.state.createMenu[key], key)}
//         </div>
//       );
//     }
//     return a;
//   };
//   render() {
//     return (
//       <div style={{ margin: "1%" }}>
//         {/* <div className="scrollItem">Card</div> */}

//         {/* title for the site ----------------------------------------- */}
//         {/* <Jumbotron /> */}

//         <Breadcrumbs aria-label="breadcrumb">
//           <Link color="inherit" onClick={this.handleClick}>
//             Admin Site
//           </Link>
//           <Typography color="textPrimary">Create Menu</Typography>
//         </Breadcrumbs>
//         {this.makeTable()}
//       </div>
//     );
//   }
//   addRow = () => {
//     this.state.temp.push(
//       <tr>
//         <td>
//           <form noValidate autoComplete="off">
//             <TextField id="standard-basic" />
//           </form>
//         </td>
//         <td>
//           <FormControl>
//             <Select
//               labelId="demo-simple-select-label"
//               id="demo-simple-select"
//               value={this.state.age}
//               onChange={this.handleChange}
//               style={{ color: "white" }}
//             >
//               <MenuItem value={10}>Ten</MenuItem>
//               <MenuItem value={20}>Twenty</MenuItem>
//               <MenuItem value={30}>Thirty</MenuItem>
//             </Select>
//           </FormControl>
//         </td>
//         <td>50</td>
//       </tr>
//     );
//     this.setState({
//       temp: this.state.temp
//     });
//   };
//   // getdate = () =>{
//   //   let dates=[];
//   //   for (let i = 0; i < createMenu.menu_dates.length; i += 1) {
//   //     dates.push()
//   // }
//   getData = (weekArgument, date) => {
//     let arr = [];
//     for (let i = 0; i < weekArgument.length; i += 2) {
//       let first = weekArgument[i];
//       let second = weekArgument[i + 1];

//       let a = first.split(":")[1];
//       let b = second.split(":")[1];

//       arr.push(this.single_item(a, b));
//     }
//     return (
//       <Row>
//         <Col>
//           <Table striped bordered hover variant="dark">
//             <thead style={{ backgroundColor: "blue", color: "white" }}>
//               <tr>
//                 <th>Menu For</th>
//                 <th colSpan="2">
//                   {/* {this.state.createMenu.map(eachRow => ({ eachRow.menu_dates }))} */}
//                   {/* {this.getdate()} */}

//                   {/* {this.state.createMenu.menu_dates} */}
//                   {date}
//                   {/* <FormControl>
//                     <Select
//                       labelId="demo-simple-select-label"
//                       id="demo-simple-select"
//                       // value={this.state.age}
//                       onChange={this.handleChange}
//                       style={{ color: "white" }}
//                     >
//                       <MenuItem value={10}>Ten</MenuItem>
//                       <MenuItem value={20}>Twenty</MenuItem>
//                       <MenuItem value={30}>Thirty</MenuItem>
//                     </Select>
//                   </FormControl> */}
//                 </th>
//               </tr>
//             </thead>
//             <thead>
//               <tr>
//                 <th>Meal Category</th>
//                 <th>Meal</th>
//                 <th>Avg Sales/Posting</th>
//               </tr>
//             </thead>
//             {/* <tbody>{this.state.temp}</tbody> */}
//             <tbody>{arr}</tbody>
//           </Table>
//           <Button
//             variant="primary"
//             onClick={() => {
//               this.addRow();
//             }}
//           >
//             Add Meal
//           </Button>
//         </Col>
//         <Col></Col>
//       </Row>
//     );
//   };
//   single_item = (menuType, mealName) => {
//     return (
//       <tr>
//         <td>{menuType}</td>
//         <td>{mealName}</td>
//       </tr>
//     );
//   };
// }
// export default CreateMenu;
