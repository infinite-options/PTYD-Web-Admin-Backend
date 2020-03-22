import React, { Component } from "react";

import Jumbotron from "../Jumbotron/Jumbotron-customer";
import { Table } from "react-bootstrap";
import Button from "muicss/lib/react/button";
import MaterialTable from "material-table";

class CustomerProfile extends Component {
  constructor(props) {
    super(props);
    this.state = {
      mealInfo: [],
      columns: [
        { title: "Name", field: "name" },
        { title: "Gender", field: "gender" },
        { title: "Address", field: "address" },
        { title: "Meals Ordered", field: "mealsOrdered" },
        { title: "Customer Since", field: "customerSince" }
        // {
        //   title: "Birth Place",
        //   field: "birthCity",
        //   lookup: { 34: "İstanbul", 63: "Şanlıurfa" }
        // }
      ],
      data: [
        {
          name: "Wkly Spcl 1",
          gender: "	Tomato",
          address: "sdasdasdsada",
          mealsOrdered: "1",
          customerSince: "dasdadsada"
        },

        {
          name: "Wkly Spcl 1",
          gender: "	Tomato",
          address: "sdasdasdsada",
          mealsOrdered: "1",
          customerSince: "dasdadsada"
        }
      ]
    };
  }
  async componentDidMount() {
    // customer info
    const res = await fetch(this.props.API_URL_CUSTPROF);
    const api = await res.json();
    const mealInfo = api.result.CustomerInfo.result;
    this.setState({ mealInfo });
  }
  render() {
    return (
      <div className="container" style={{ marginTop: "10%" }}>
        {/* <div className="scrollItem">Card</div> */}

        {/* title for the site ----------------------------------------- */}
        <Jumbotron />

        <MaterialTable
          style={{ boxShadow: "0px 5px 10px 4px rgba(0,0,0,0.2)" }}
          title="Meal Creation"
          columns={this.state.columns}
          data={this.state.data}
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

        <br></br>

        <Table responsive bordered hover>
          <thead>
            <tr>
              <th>Image</th>
              <th>Name</th>
              <th>Gender</th>
              <th>Address</th>
              <th>Meals Ordered</th>
              <th>Customer Since</th>
            </tr>
          </thead>
          <tbody>
            {this.state.mealInfo.map(eachMeal => (
              <tr>
                <td>#</td>
                <td>{eachMeal.Full_name}</td>
                <td>{eachMeal.Gender}</td>
                {/* <Button variant="raised">View Map</Button> */}
                <td>{eachMeal.Address}</td>
                <td>{eachMeal.Meals_ordered}</td>
                <td>{eachMeal.Customer_Since}</td>
              </tr>
            ))}
          </tbody>
        </Table>
      </div>
    );
  }
}
export default CustomerProfile;
