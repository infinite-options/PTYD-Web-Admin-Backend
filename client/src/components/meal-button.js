import React, { Component } from "react";
import FINDUS1 from "../img/findus1.png";
import { Grid, Cell } from "react-mdl";
import EachMeal from "./each-meal";

import { ButtonToolbar, Button, Modal, Form, Card } from "react-bootstrap";

export default class MealButton extends Component {
  constructor(props) {
    super(props);
    console.log(this.props.menu);
  }

  state = {
    count: 0,
    buttonS: false,
    buttonM: false,
    buttonSkip: false,
    buttonSelect: false,
    buttonSurprise: false,
    requestModal: false,
    countFood: 0,
    buttonDisabled: true,
    buttonSelectKeepColor: false
  };

  closeButtonSelect = () => {
    this.setState({
      buttonSelect: false,
      buttonSelectKeepColor: true
    });
  };

  changeButtonS = () => {
    this.setState({
      buttonS: true,
      buttonM: false,
      buttonSkip: false,
      buttonDisabled: false
    });
  };

  changeButtonM = () => {
    this.setState({
      buttonM: true,
      buttonS: false,
      buttonSkip: false,
      buttonDisabled: false
    });
  };

  changeButtonSkip = () => {
    this.setState({
      buttonM: false,
      buttonS: false,
      buttonSkip: true,

      buttonSurprise: false,
      buttonSelect: false,
      buttonDisabled: true,
      buttonSelectKeepColor: false
    });
  };

  changeButtonSelect = () => {
    this.setState({
      buttonSelect: true,
      buttonSurprise: false,
      buttonSelectKeepColor: true
    });
    console.log("select");
  };
  changeButtonSurprise = () => {
    this.setState({
      buttonSelect: false,
      buttonSurprise: true,
      buttonSelectKeepColor: false
    });
    console.log("surprise");
  };
  specialRequest = () => {
    this.setState({
      requestModal: !this.state.requestModal
    });
  };
  render() {
    const orange = {
      width: "90px",
      height: "90px",
      backgroundColor: "#cd790c",
      color: "white"
    };

    const hide = {
      width: "90px",
      height: "90px",
      backgroundColor: "white",
      color: "black"
    };
    const green = {
      width: "90px",
      height: "90px",
      backgroundColor: "#427c42",
      color: "white"
    };

    function SpecialRequestModal(props) {
      return (
        <Modal
          {...props}
          size="lg"
          aria-labelledby="contained-modal-title-vcenter"
          centered
        >
          <Modal.Header closeButton>
            <Modal.Title id="contained-modal-title-vcenter">
              Special Request
            </Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <Form.Group controlId="exampleForm.ControlTextarea1">
              <Form.Control as="textarea" rows="3" />
            </Form.Group>
          </Modal.Body>
          <Modal.Footer>
            <Button variant="primary" type="submit">
              Submit
            </Button>
            <Button onClick={props.onHide}>Close</Button>
          </Modal.Footer>
        </Modal>
      );
    }

    function SpecialRequestAnimation() {
      const [modalShow, setModalShow] = React.useState(false);

      return (
        <ButtonToolbar>
          <Button
            variant="outline-dark"
            style={{ width: "90px", height: "90px" }}
            onClick={() => setModalShow(true)}
          >
            Special Requests
          </Button>

          <SpecialRequestModal
            show={modalShow}
            onHide={() => setModalShow(false)}
          />
        </ButtonToolbar>
      );
    }
    return (
      <div>
        <ButtonToolbar>
          <div className="radio">
            <Button
              variant="outline-dark"
              onClick={this.changeButtonS}
              style={this.state.buttonS ? green : hide}
            >
              {this.props.day1}
              <br />
              {this.props.date1}
            </Button>
            &nbsp;
            <Button
              variant="outline-dark"
              onClick={this.changeButtonM}
              style={this.state.buttonM ? green : hide}
            >
              {this.props.day2}
              <br />
              {this.props.date2}
            </Button>
            &nbsp;
            <Button
              variant="outline-dark"
              onClick={this.changeButtonSkip}
              style={this.state.buttonSkip ? orange : hide}
            >
              Skip This Week
            </Button>
          </div>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          {/* <Link
            to={{
              pathname: "/select-meal"
            }}
          > */}
          <Button
            disabled={this.state.buttonDisabled}
            variant="outline-dark"
            ref={button => (this.button = button)}
            style={
              (this.state.buttonSelect ? green : hide,
              this.state.buttonSelectKeepColor ? green : hide)
            }
            onClick={this.changeButtonSelect}
          >
            Select Meal
          </Button>
          {/* </Link> */}
          &nbsp;
          <Button
            disabled={this.state.buttonDisabled}
            variant="outline-dark"
            ref={button => (this.button2 = button)}
            onClick={this.changeButtonSurprise}
            style={this.state.buttonSurprise ? green : hide}
          >
            Surprise Me!
          </Button>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <SpecialRequestAnimation />
          <div style={this.state.buttonSelect ? {} : { display: "none" }}>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            {this.SelectMealEachMeal()}
          </div>
        </ButtonToolbar>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </div>
    );
  }

  SelectMealEachMeal = () => {
    return (
      <Card style={{ width: "100%" }}>
        {Object.keys(this.props.menu).map(key => (
          <div>
            <Card.Header>
              <center>
                <Modal.Title>{this.props.menu[key].Category}</Modal.Title>
              </center>
            </Card.Header>
            <Card.Body>
              <Grid>
                {this.props.menu[key].Menu.map(meal => (
                  <Cell col={4}>
                    <EachMeal
                      mealTitle={meal.meal_desc}
                      ingridents="Ingredients: White Beans, Kale, Vegetable Broth"
                      detail={"Cal " + meal.meal_calories + ", Prot " + meal.meal_protein + ", Carb " + meal.meal_carbs + ", Sug " + meal.meal_sugar + ", Fib " + meal.meal_fiber + ", Fat " + meal.meal_fat + ", Sat " + meal.meal_sat }
                    />
                  </Cell>
                ))}
              </Grid>
            </Card.Body>
          </div>
        ))}
        <Card.Body>
          <center>
            <Button variant="secondary" onClick={this.closeButtonSelect}>
              Close
            </Button>
            &nbsp;&nbsp;
            <Button variant="primary">Save changes</Button>
          </center>
        </Card.Body>
      </Card>
    );
  };
}
