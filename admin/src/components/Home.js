import React, { Component } from "react";
import { Table, Button, Card, Container, Row, Col } from "react-bootstrap";
import MaterialTable from "material-table";
import { MDBTable, MDBTableBody, MDBTableHead } from "mdbreact";
import { MenuCreation } from "./MenuCreation";
import Jumbotron from "./Jumbotron";

class Home extends Component {
  render() {
    return (
      <Container>
        <Jumbotron />
        <Row>
          <h2>Upcoming Meal Orders</h2>
        </Row>

        <Row>
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
                        <td>Weekly Special 1</td>
                        <td>Saag</td>
                        <td>45</td>
                      </tr>
                      <tr>
                        <td>Weekly Special 2</td>
                        <td>Rainbow Chopped Salad w/ Red Curry Dressing</td>
                        <td>23</td>
                      </tr>
                      <tr>
                        <td>Weekly Special 3</td>
                        <td>Veggie Medley Soup</td>
                        <td>33</td>
                      </tr>
                      <tr>
                        <td>Seasonal Favorite 1</td>
                        <td>Roasted Cauliflower Curry</td>
                        <td>60</td>
                      </tr>
                      <tr>
                        <td>Seasonal Favorite 2</td>
                        <td>Holiday Salad w/ Poppyseed Dressing</td>
                        <td>57</td>
                      </tr>
                      <tr>
                        <td>Seasonal Favorite 3</td>
                        <td>Gingerbread Oats</td>
                        <td>19</td>
                      </tr>
                      <tr>
                        <td>Smoothie 1</td>
                        <td>Energizer Smoothie</td>
                        <td>42</td>
                      </tr>
                      <tr>
                        <td>Smoothie 2</td>
                        <td>Original Smoothie</td>
                        <td>35</td>
                      </tr>
                      <tr>
                        <td>Smoothie 3</td>
                        <td>Almond Butter Smoothie</td>
                        <td>64</td>
                      </tr>
                    </tbody>
                  </Table>
                </Card.Text>
              </Card.Body>
            </Card>
          </Col>
          <Col>
            <Card style={{ width: "24rem" }}>
              <Card.Body>
                <Card.Title>Week 2</Card.Title>
                <Card.Subtitle className="mb-2 text-muted">
                  3/8 - 3/14
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
                        <td>Weekly Special 1</td>
                        <td>Saag</td>
                        <td>45</td>
                      </tr>
                      <tr>
                        <td>Weekly Special 2</td>
                        <td>Rainbow Chopped Salad w/ Red Curry Dressing</td>
                        <td>23</td>
                      </tr>
                      <tr>
                        <td>Weekly Special 3</td>
                        <td>Veggie Medley Soup</td>
                        <td>33</td>
                      </tr>
                      <tr>
                        <td>Seasonal Favorite 1</td>
                        <td>Roasted Cauliflower Curry</td>
                        <td>60</td>
                      </tr>
                      <tr>
                        <td>Seasonal Favorite 2</td>
                        <td>Holiday Salad w/ Poppyseed Dressing</td>
                        <td>57</td>
                      </tr>
                      <tr>
                        <td>Seasonal Favorite 3</td>
                        <td>Gingerbread Oats</td>
                        <td>19</td>
                      </tr>
                      <tr>
                        <td>Smoothie 1</td>
                        <td>Energizer Smoothie</td>
                        <td>42</td>
                      </tr>
                      <tr>
                        <td>Smoothie 2</td>
                        <td>Original Smoothie</td>
                        <td>35</td>
                      </tr>
                      <tr>
                        <td>Smoothie 3</td>
                        <td>Almond Butter Smoothie</td>
                        <td>64</td>
                      </tr>
                    </tbody>
                  </Table>
                </Card.Text>
              </Card.Body>
            </Card>
          </Col>
          <Col>
            <Card style={{ width: "24rem" }}>
              <Card.Body>
                <Card.Title>Week 3</Card.Title>
                <Card.Subtitle className="mb-2 text-muted">
                  3/15 - 3/21
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
                        <td>Weekly Special 1</td>
                        <td>Saag</td>
                        <td>45</td>
                      </tr>
                      <tr>
                        <td>Weekly Special 2</td>
                        <td>Rainbow Chopped Salad w/ Red Curry Dressing</td>
                        <td>23</td>
                      </tr>
                      <tr>
                        <td>Weekly Special 3</td>
                        <td>Veggie Medley Soup</td>
                        <td>33</td>
                      </tr>
                      <tr>
                        <td>Seasonal Favorite 1</td>
                        <td>Roasted Cauliflower Curry</td>
                        <td>60</td>
                      </tr>
                      <tr>
                        <td>Seasonal Favorite 2</td>
                        <td>Holiday Salad w/ Poppyseed Dressing</td>
                        <td>57</td>
                      </tr>
                      <tr>
                        <td>Seasonal Favorite 3</td>
                        <td>Gingerbread Oats</td>
                        <td>19</td>
                      </tr>
                      <tr>
                        <td>Smoothie 1</td>
                        <td>Energizer Smoothie</td>
                        <td>42</td>
                      </tr>
                      <tr>
                        <td>Smoothie 2</td>
                        <td>Original Smoothie</td>
                        <td>35</td>
                      </tr>
                      <tr>
                        <td>Smoothie 3</td>
                        <td>Almond Butter Smoothie</td>
                        <td>64</td>
                      </tr>
                    </tbody>
                  </Table>
                </Card.Text>
              </Card.Body>
            </Card>
          </Col>
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
      </Container>
    );
  }
}
export default Home;
