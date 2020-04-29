import React, { Component } from "react";

import Jumbotron from "../Jumbotron/Jumbotron-customer";
import { Table } from "react-bootstrap";
import Button from "muicss/lib/react/button";
import MaterialTable from "material-table";

class CustomerProfile extends Component {
  constructor(props) {
    super(props);
    this.state = {
      custInfo: [],
      columns: [
        { title: "Name", field: "Full_name" },
        { title: "Current Subscription", field: "Current_subscription" },
        { title: "Number of Meals Remaining", field: "Weeks_left" },
        { title: "Gender", field: "Gender" },
        { title: "Address", field: "Address" },
        { title: "Meals Ordered", field: "Meals_ordered" },
        { title: "Customer Since", field: "Customer_Since" }
      ]
    };
  }
  async componentDidMount() {
    // customer info
    const res = await fetch(this.props.API_URL_CUSTPROF);
    const api = await res.json();
    const custInfo = api.result.CustomerInfo.result;
    console.log("custinfo", custInfo);
    this.setState({ custInfo });
  }
  render() {
    return (
      <div style={{ margin: "1%" }}>
        {/* <div className="scrollItem">Card</div> */}

        {/* title for the site ----------------------------------------- */}
        {/* <Jumbotron /> */}

        <MaterialTable
          style={{ boxShadow: "0px 5px 10px 4px rgba(0,0,0,0.2)" }}
          title="Customer Profile"
          columns={this.state.columns}
          data={this.state.custInfo}
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

        {/* <Table responsive bordered hover>
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
            {this.state.custInfo.map(eachMeal => (
              <tr>
                <td>#</td>
                <td>{eachMeal.Full_name}</td>
                <td>{eachMeal.Gender}</td>
                <Button variant="raised">View Map</Button>
                <td>{eachMeal.Address}</td>
                <td>{eachMeal.Meals_ordered}</td>
                <td>{eachMeal.Customer_Since}</td>
              </tr>
            ))}
          </tbody>
        </Table> */}
      </div>
    );
  }
}
export default CustomerProfile;
