import React, { Component } from "react";
import { Table, Card, Nav } from "react-bootstrap";
import { Grid, Cell } from "react-mdl";
import MaterialTable from "material-table";
import Mealtable from "./meal-table";

class LandingPage extends Component {
  state = {
    MealName1: "Tomato",
    MealName2: "cake",

    columns: [
      { title: "Subscription", field: "name" },
      { title: "Meal Name", field: "surname" },
      { title: "Qty", field: "birthYear", type: "numeric" }
      // {
      //   title: "Birth Place",
      //   field: "birthCity",
      //   lookup: { 34: "İstanbul", 63: "Şanlıurfa" }
      // }
    ],
    data: [
      { name: "Wkly Spcl 1", surname: "	Tomato", birthYear: 1 },

      {
        name: "Wkly Spcl 2",
        surname: "cake",
        birthYear: 2
      }
    ]
  };
  render() {
    return (
      <div
        style={{
          width: "100%",
          height: "100%"
        }}
      >
        <Grid>
          <Cell col={12}>
            <center>
              <h1>Meal Orders</h1>
            </center>
          </Cell>
          <Cell col={7}>
            <Card>
              <Card.Header>
                <Nav variant="tabs" defaultActiveKey="#first">
                  <Nav.Item>
                    <Nav.Link
                      href="#first"
                      onClick={e => {
                        this.setState({
                          MealName1: "Tomato",
                          MealName2: "cake"
                        });
                      }}
                    >
                      Week 2/1 - 2/2
                    </Nav.Link>
                  </Nav.Item>
                  <Nav.Item>
                    <Nav.Link
                      href="#second"
                      onClick={e => {
                        this.setState({
                          MealName1: "Potato",
                          MealName2: "ice cream"
                        });
                      }}
                    >
                      Week 2/8 - 2/9
                    </Nav.Link>
                  </Nav.Item>
                </Nav>
              </Card.Header>
              <Card.Body>
                <Mealtable
                  mealname1={this.state.MealName1}
                  mealname2={this.state.MealName2}
                />
              </Card.Body>
            </Card>
          </Cell>
          <Cell col={5}>
            <Card style={{ width: "100%", height: "100%" }}>
              <Card.Header>Ingredients to Purchase</Card.Header>
              <Card.Body></Card.Body>
            </Card>
          </Cell>
        </Grid>
        <Grid>
          <Cell col={7}>
            <MaterialTable
              title="Meal Order Table"
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
          </Cell>
        </Grid>
      </div>
    );
  }
}
export default LandingPage;
