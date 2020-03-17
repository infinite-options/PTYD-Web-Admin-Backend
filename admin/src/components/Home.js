import React, { Component } from "react";
import { Table, Button, Card, Container, Row, Col } from "react-bootstrap";
import MaterialTable from "material-table";
import { MDBTable, MDBTableBody, MDBTableHead } from "mdbreact";
import { MenuCreation } from "./MenuCreation";
import Jumbotron from "./Jumbotron";

class Home extends Component {
  constructor(props) {
    super(props);
    this.state = { upcomingMeals: [] };
  }
  async componentDidMount() {
    const res = await fetch(this.props.API_URL);
    const api = await res.json();
    const upcomingMeals = api.result.Meals_by_week;
    this.setState({ upcomingMeals });
  }

  render() {
    return (
      <div class="container" style={{ marginTop: "10%" }}>
        <center>
          <h1>PTYD Admin Site</h1>
        </center>
        {/* <Jumbotron /> */}
        <h2>Upcoming Meal Orders</h2>
        {/* {this.state.upcomingMeals.map(upcomingMeal => (
          <div
            style={{
              width: "25%",
              margin: "0",
              padding: "0"
            }}
          >
            {upcomingMeal.Category}
          </div>
        ))} */}
        <Row>
          {this.state.upcomingMeals.map(upcomingMeal => (
            <Col>
              <Card style={{ width: "24rem" }}>
                <Card.Body>
                  <Card.Title>Week 1</Card.Title>
                  <Card.Subtitle className="mb-2 text-muted">
                    3/1 - 3/7
                  </Card.Subtitle>
                  <Card.Text>
                    <Table
                      responsive
                      striped
                      bordered
                      style={{ textAlign: "center" }}
                    >
                      <thead style={{ overflow: "scroll", display: "block" }}>
                        <tr>
                          <th>Menu</th>
                          <th>Meal</th>
                          <th>Quantity Ordered</th>
                        </tr>
                      </thead>
                      <tbody
                        style={{
                          height: "300px",
                          overflowY: "scroll",
                          display: "block"
                        }}
                      >
                        <tr>
                          <td>{upcomingMeal.Category}</td>
                          <td>Saag</td>
                          <td>45</td>
                        </tr>
                      </tbody>
                    </Table>
                  </Card.Text>
                </Card.Body>
              </Card>
            </Col>
          ))}
        </Row>

        <br></br>

        <Row>
          <h2>Menu Creation</h2>
        </Row>

        <Row>
          {/* <MaterialTable style={{width: '100rem'}}
      title="Editable Example"
      columns= [
               { title: "Subscription", field: "name" },
               { title: "Meal Name", field: "surname" },
               { title: "Qty", field: "birthYear", type: "numeric" }
                ] 
      data={state.data}
      editable={{
        onRowAdd: newData =>
          new Promise(resolve => {
            setTimeout(() => {
              resolve();
              setState(prevState => {
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
                setState(prevState => {
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
              setState(prevState => {
                const data = [...prevState.data];
                data.splice(data.indexOf(oldData), 1);
                return { ...prevState, data };
              });
            }, 600);
          }),
      }}
    /> */}
          <MaterialTable style={{ width: "100rem" }}></MaterialTable>
        </Row>

        <br></br>

        <Row>
          <Card style={{ width: "100rem" }}>
            <Card.Header as="h2">Meal Info</Card.Header>
            <Card.Body>
              <Card.Title>Special title treatment</Card.Title>
              <Card.Text>
                With supporting text below as a natural lead-in to additional
                content.
              </Card.Text>
              <Button variant="primary">Go somewhere</Button>
            </Card.Body>
          </Card>
        </Row>

        <br></br>

        <Row>
          <Card style={{ width: "100rem" }}>
            <Card.Header as="h2">Customer Info</Card.Header>
            <Card.Body>
              <Card.Title>Special title treatment</Card.Title>
              <Card.Text>
                With supporting text below as a natural lead-in to additional
                content.
              </Card.Text>
              <Button variant="primary">Go somewhere</Button>
            </Card.Body>
          </Card>
        </Row>
      </div>
    );
  }
}
export default Home;
