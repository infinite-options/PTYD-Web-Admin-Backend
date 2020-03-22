// import React, { Component } from "react";
// import { Table, Card, Nav } from "react-bootstrap";
// import { Grid, Cell } from "react-mdl";
// import MaterialTable from "material-table";
// import Mealtable from "./meal-table";

// class LandingPage extends Component {
//   state = {
//     MealName1: "Meal Name",
//     MealName2: "cake",

//     columns: [
//       { title: "Subscription", field: "name" },
//       { title: "Meal Name", field: "surname" },
//       { title: "Qty", field: "birthYear", type: "numeric" }
//       // {
//       //   title: "Birth Place",
//       //   field: "birthCity",
//       //   lookup: { 34: "İstanbul", 63: "Şanlıurfa" }
//       // }
//     ],
//     data: [
//       { name: "Wkly Spcl 1", surname: "	Tomato", birthYear: 1 },

//       {
//         name: "Wkly Spcl 2",
//         surname: "cake",
//         birthYear: 2
//       }
//     ]
//   };
//   render() {
//     return (
//       <div
//         style={{
//           width: "100%",
//           height: "100%"
//         }}
//       >
//         <Grid>
//           <Cell col={12}>
//             <center>
//               <h1>Meal Orders</h1>
//             </center>
//           </Cell>
//           <Cell col={7}>
//             <Card>
//               <Card.Header>
//                 <Nav variant="tabs" defaultActiveKey="#first">
//                   <Nav.Item>
//                     <Nav.Link
//                       href="#first"
//                       onClick={e => {
//                         this.setState({
//                           MealName1: "Tomato",
//                           MealName2: "cake"
//                         });
//                       }}
//                     >
//                       Week 2/1 - 2/2
//                     </Nav.Link>
//                   </Nav.Item>
//                   <Nav.Item>
//                     <Nav.Link
//                       href="#second"
//                       onClick={e => {
//                         this.setState({
//                           MealName1: "Potato",
//                           MealName2: "ice cream"
//                         });
//                       }}
//                     >
//                       Week 2/8 - 2/9
//                     </Nav.Link>
//                   </Nav.Item>
//                 </Nav>
//               </Card.Header>
//               <Card.Body>
//                 <Mealtable
//                   mealname1={this.state.MealName1}
//                   mealname2={this.state.MealName2}
//                 />
//               </Card.Body>
//             </Card>
//           </Cell>
//           <Cell col={5}>
//             <Card style={{ width: "100%", height: "100%" }}>
//               <Card.Header>Ingredients to Purchase</Card.Header>
//               <Card.Body></Card.Body>
//             </Card>
//           </Cell>
//         </Grid>
//         <Grid>
//           <Cell col={7}>
//             <MaterialTable
//               title="Meal Order Table"
//               columns={this.state.columns}
//               data={this.state.data}
//               editable={{
//                 onRowAdd: newData =>
//                   new Promise(resolve => {
//                     setTimeout(() => {
//                       resolve();
//                       this.setState(prevState => {
//                         const data = [...prevState.data];
//                         data.push(newData);
//                         return { ...prevState, data };
//                       });
//                     }, 600);
//                   }),
//                 onRowUpdate: (newData, oldData) =>
//                   new Promise(resolve => {
//                     setTimeout(() => {
//                       resolve();
//                       if (oldData) {
//                         this.setState(prevState => {
//                           const data = [...prevState.data];
//                           data[data.indexOf(oldData)] = newData;
//                           return { ...prevState, data };
//                         });
//                       }
//                     }, 600);
//                   }),
//                 onRowDelete: oldData =>
//                   new Promise(resolve => {
//                     setTimeout(() => {
//                       resolve();
//                       this.setState(prevState => {
//                         const data = [...prevState.data];
//                         data.splice(data.indexOf(oldData), 1);
//                         return { ...prevState, data };
//                       });
//                     }, 600);
//                   })
//               }}
//             />
//           </Cell>
//         </Grid>
//       </div>
//     );
//   }
// }
// export default LandingPage;

import React from 'react'
import { Table, Button, Card, Container, Row, Col } from 'react-bootstrap'



export const Home = () => (
    <Container>
    <Row>
        <h2>Upcoming Meal Orders</h2>
    </Row>

    <Row>
        <Col sm={4}>
            <Card style={{ width: '18rem' }}>
                <Card.Body>
                    <Card.Title>Week 1</Card.Title> 
                    <Card.Subtitle className="mb-2 text-muted">3/1 - 3/7</Card.Subtitle>
                    <Card.Text>
                    
                    <Table responsive striped bordered hover size="sm" style={{ overflowY: 'hidden'}}>
                        <thead>
                            <tr>
                            <th>Menu</th>
                            <th>Meal</th>
                            <th>Quantity Ordered</th>
                            </tr>
                        </thead>
                        <tbody>
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
                        </tbody>
                        </Table>

                    </Card.Text>
                    <Card.Link href="#">Card Link</Card.Link>
                    <Card.Link href="#">Another Link</Card.Link>
                </Card.Body>
            </Card>
        </Col>
        <Col sm={4}>
        <Card style={{ width: '18rem' }}>
                <Card.Body>
                    <Card.Title>Week 2</Card.Title>
                    <Card.Subtitle className="mb-2 text-muted">3/8 - 3/14</Card.Subtitle>
                    <Card.Text>
                    
                    <Table responsive striped bordered hover size="sm">
                        <thead>
                            <tr>
                            <th>Menu</th>
                            <th>Meal</th>
                            <th>Quantity Ordered</th>
                            </tr>
                        </thead>
                        <tbody>
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
                        </tbody>
                        </Table>

                    </Card.Text>
                    <Card.Link href="#">Card Link</Card.Link>
                    <Card.Link href="#">Another Link</Card.Link>
                </Card.Body>
            </Card>
        </Col>
        <Col sm={4}>
        <Card style={{ width: '18rem' }}>
                <Card.Body>
                    <Card.Title>Week 3</Card.Title>
                    <Card.Subtitle className="mb-2 text-muted">3/15 - 3/21</Card.Subtitle>
                    <Card.Text>
                    
                    <Table responsive striped bordered hover size="sm">
                        <thead>
                            <tr>
                            <th>Menu</th>
                            <th>Meal</th>
                            <th>Quantity Ordered</th>
                            </tr>
                        </thead>
                        <tbody>
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
                        </tbody>
                        </Table>

                    </Card.Text>
                    <Card.Link href="#">Card Link</Card.Link>
                    <Card.Link href="#">Another Link</Card.Link>
                </Card.Body>
            </Card>
        </Col>
        <Col sm={4}>
        <Card style={{ width: '18rem' }}>
                <Card.Body>
                    <Card.Title>Week 4</Card.Title>
                    <Card.Subtitle className="mb-2 text-muted">3/22 - 3/28</Card.Subtitle>
                    <Card.Text>
                    
                    <Table responsive striped bordered hover size="sm">
                        <thead>
                            <tr>
                            <th>Menu</th>
                            <th>Meal</th>
                            <th>Quantity Ordered</th>
                            </tr>
                        </thead>
                        <tbody>
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
                        </tbody>
                        </Table>

                    </Card.Text>
                    <Card.Link href="#">Card Link</Card.Link>
                    <Card.Link href="#">Another Link</Card.Link>
                </Card.Body>
            </Card>
        </Col>
    </Row>

    <br></br>

    <Row>
        <h2>Next Week's Meals</h2>
    </Row>   

    <Row>
    <Col>
            <Card style={{ width: '15rem' }}>
                <Card.Body>
                    <Card.Title>Meal 1</Card.Title>
                    <Card.Subtitle className="mb-2 text-muted">Card Subtitle</Card.Subtitle>
                    <Card.Text>
                    Some quick example text to build on the card title and make up the bulk of
                    the card's content.
                    </Card.Text>
                    <Card.Link href="#">Card Link</Card.Link>
                    <Card.Link href="#">Another Link</Card.Link>
                </Card.Body>
            </Card>
        </Col>
        <Col>
        <Card style={{ width: '15rem' }}>
                <Card.Body>
                    <Card.Title>Meal 2</Card.Title>
                    <Card.Subtitle className="mb-2 text-muted">Card Subtitle</Card.Subtitle>
                    <Card.Text>
                    Some quick example text to build on the card title and make up the bulk of
                    the card's content.
                    </Card.Text>
                    <Card.Link href="#">Card Link</Card.Link>
                    <Card.Link href="#">Another Link</Card.Link>
                </Card.Body>
            </Card>
        </Col>
        <Col>
        <Card style={{ width: '15rem' }}>
                <Card.Body>
                    <Card.Title>Meal 3</Card.Title>
                    <Card.Subtitle className="mb-2 text-muted">Card Subtitle</Card.Subtitle>
                    <Card.Text>
                    Some quick example text to build on the card title and make up the bulk of
                    the card's content.
                    </Card.Text>
                    <Card.Link href="#">Card Link</Card.Link>
                    <Card.Link href="#">Another Link</Card.Link>
                </Card.Body>
            </Card>
        </Col>
        <Col>
        <Card style={{ width: '15rem' }}>
                <Card.Body>
                    <Card.Title>Meal 4</Card.Title>
                    <Card.Subtitle className="mb-2 text-muted">Card Subtitle</Card.Subtitle>
                    <Card.Text>
                    Some quick example text to build on the card title and make up the bulk of
                    the card's content.
                    </Card.Text>
                    <Card.Link href="#">Card Link</Card.Link>
                    <Card.Link href="#">Another Link</Card.Link>
                </Card.Body>
            </Card>
        </Col>
    </Row>

    <br></br>

    <Row>
    <Card style={{ width: '100rem'}}>
        <Card.Header as="h2">Meal Info</Card.Header>
        <Card.Body>
            <Card.Title>Special title treatment</Card.Title>
            <Card.Text>
                With supporting text below as a natural lead-in to additional content.
            </Card.Text>
            <Button variant="primary">Go somewhere</Button>
        </Card.Body>
    </Card>
    </Row>

    <br></br>

    <Row>
    <Card style={{ width: '100rem'}}>
        <Card.Header as="h2">Customer Info</Card.Header>
        <Card.Body>
            <Card.Title>Special title treatment</Card.Title>
            <Card.Text>
                With supporting text below as a natural lead-in to additional content.
            </Card.Text>
            <Button variant="primary">Go somewhere</Button>
        </Card.Body>
    </Card>
    </Row>
    </Container>
)

