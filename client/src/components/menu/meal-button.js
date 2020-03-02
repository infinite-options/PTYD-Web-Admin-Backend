import React, { Component } from "react";
import { Grid, Cell } from "react-mdl";
import EachMeal from "./each-meal";
import EachAddon from "./each-addon";

import { ButtonToolbar, Button, Modal, Card } from "react-bootstrap";

export default class MealButton extends Component {
  constructor(props) {
    super(props);
  }

  state = {
    count: 0,
    buttonS: true,
    buttonM: false,
    buttonSkip: false,
    buttonSelect: false,
    buttonSurprise: true,
    buttonAddOn: false,
    requestModal: false,
    // buttonDisabled: true,
    buttonSelectKeepColor: false,
    buttonAddOnKeepColor: false,
    mealQuantities: this.props.mealQuantities,
    maxmeals: this.props.maxmeals,
    addonActivated: false
  };

  sendForm = () => {
    console.log(this.props.API_URL);
    fetch(this.props.API_URL, {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        'recipient_id': '??',
        'start_date': 'xx',
        'meal_quantities': this.state.mealQuantities,
        'delivery_day': 'yy',
      })
    })
  };

  closeButtonSelect = () => {
    this.setState({
      buttonSelect: false,
      buttonSelectKeepColor: true
    });
  };
  closeButtonAddOn = () => {
    this.setState({
      buttonAddOn: false,
      buttonAddOnKeepColor: true
    });
    console.log("addon");
  };
  // keepButtonAddOn = () => {
  //   this.setState({
  //     buttonAddOn: false,
  //     buttonAddOnKeepColor: true
  //   });
  // };

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
      buttonAddOn: false,
      buttonDisabled: true,
      buttonSelectKeepColor: false,
      buttonAddOnKeepColor: false
    });
  };

  changeButtonSelect = () => {
    this.setState({
      buttonSelect: true,
      buttonSurprise: false,
      buttonAddOn: false,
      buttonSelectKeepColor: true
    });
    console.log("select");
  };
  changeButtonSurprise = () => {
    this.setState({
      buttonSelect: false,
      buttonSurprise: true,
      buttonAddOn: false,
      buttonSelectKeepColor: false
    });
    console.log("surprise");
  };
  changeButtonAddOn = () => {
    this.setState({
      buttonAddOn: true,
      buttonAddOnKeepColor: true,
      buttonSelect: false
    });
  };
  specialRequest = () => {
    this.setState({
      requestModal: !this.state.requestModal
    });
  };
  saveButtonActivateAddons = () => {
    this.setState({
      addonActivated: true,
      buttonSelect: false,
      buttonSelectKeepColor: true
    });
    this.sendForm();
  };

  render() {
    const orange = {
      width: "95px",
      height: "95px",
      backgroundColor: "#cd790c",
      color: "white"
    };

    const hide = {
      width: "95px",
      height: "95px",
      backgroundColor: "white",
      color: "black"
    };
    const green = {
      width: "95px",
      height: "95px",
      backgroundColor: "#427c42",
      color: "white"
    };

    // function SpecialRequestModal(props) {
    //   return (
    //     <Modal
    //       {...props}
    //       size="lg"
    //       aria-labelledby="contained-modal-title-vcenter"
    //       centered
    //     >
    //       <Modal.Header closeButton>
    //         <Modal.Title id="contained-modal-title-vcenter">
    //           Special Request
    //         </Modal.Title>
    //       </Modal.Header>
    //       <Modal.Body>
    //         <Form.Group controlId="exampleForm.ControlTextarea1">
    //           <Form.Control as="textarea" rows="3" />
    //         </Form.Group>
    //       </Modal.Body>
    //       <Modal.Footer>
    //         <Button variant="primary" type="submit">
    //           Submit
    //         </Button>
    //         <Button onClick={props.onHide}>Close</Button>
    //       </Modal.Footer>
    //     </Modal>
    //   );
    // }

    // function SpecialRequestAnimation() {
    //   const [modalShow, setModalShow] = React.useState(false);

    //   return (
    //     <ButtonToolbar>
    //       <Button
    //         variant="outline-dark"
    //         style={{ width: "90px", height: "90px" }}
    //         onClick={() => setModalShow(true)}
    //       >
    //         Special Requests
    //       </Button>

    //       <SpecialRequestModal
    //         show={modalShow}
    //         onHide={() => setModalShow(false)}
    //       />
    //     </ButtonToolbar>
    //   );
    // }
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
            Select <br />
            Meal
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
          {/* <SpecialRequestAnimation /> */}
          <Button
            variant="outline-dark"
            style={
              (this.state.buttonAddOn ? orange : hide,
              this.state.buttonAddOnKeepColor ? orange : hide)
            }
            onClick={this.changeButtonAddOn}
          >
            Add Local Treats
          </Button>
          <div style={this.state.buttonSelect ? {} : { display: "none" }}>
            {this.SelectMealEachMeal()}
          </div>
          <div style={this.state.buttonAddOn ? {} : { display: "none" }}>
            {this.SelectMealEachMealAddOn()}
          </div>
        </ButtonToolbar>
        <br />
      </div>
    );
  }

  SelectMealEachMeal = () => {
    return (
      <Card style={{ width: "92%" }}>
        <Card.Header>
          <center>
            <Modal.Title>
              <p style={{ float: "left" }}>
                {" "}
                total meals left:{this.state.maxmeals}
              </p>
              Select Meal Menu{" "}
              <Button
                variant="secondary"
                onClick={this.closeButtonSelect}
                style={{ float: "right" }}
              >
                Close
              </Button>
            </Modal.Title>
          </center>
        </Card.Header>
        {Object.keys(this.props.menu).map(key => (
          <div>
            <Grid>
              <Cell col={12}>
                <center>
                  <h4 style={{ margin: "0" }}>
                    {this.props.menu[key].Category}
                  </h4>
                </center>
              </Cell>
              <br />
              {this.props.menu[key].Menu.map(meal => (
                <Cell col={4}>
                  <EachMeal
                    mealTitle={meal.meal_desc}
                    ingridents="Ingredients: Not Yet in Database"
                    detail={
                      "Cal " +
                      meal.meal_calories +
                      ", Prot " +
                      meal.meal_protein +
                      ", Carb " +
                      meal.meal_carbs +
                      ", Sug " +
                      meal.meal_sugar +
                      ", Fib " +
                      meal.meal_fiber +
                      ", Fat " +
                      meal.meal_fat +
                      ", Sat " +
                      meal.meal_sat
                    }
                    imgurl={meal.meal_photo_url}
                    maxmeals={this.state.maxmeals}
                    incrementMaxMeal={() => {
                      var stateCopy = Object.assign({}, this.state);
                      stateCopy.mealQuantities[meal.menu_meal_id] -= 1;
                      this.setState(stateCopy);
                      this.setState({ maxmeals: this.state.maxmeals + 1 });
                      console.log(this.state.mealQuantities);
                    }}
                    decrementMaxMeal={() => {
                      var stateCopy = Object.assign({}, this.state);
                      stateCopy.mealQuantities[meal.menu_meal_id] += 1;
                      this.setState(stateCopy);
                      this.setState({ maxmeals: this.state.maxmeals - 1 });
                      console.log(this.state.mealQuantities);
                    }}
                  />
                </Cell>
              ))}
            </Grid>
          </div>
        ))}
        <Card.Body>
          <center>
            <Button variant="secondary" onClick={this.closeButtonSelect}>
              Close
            </Button>
            &nbsp;&nbsp;
            <Button variant="primary" onClick={this.saveButtonActivateAddons}>
              Save changes
            </Button>
          </center>
        </Card.Body>
      </Card>
    );
  };
  SelectMealEachMealAddOn = () => {
    return (
      <Card style={{ width: "92%" }}>
        <Card.Header>
          <center>
            <Modal.Title>
              Add Local Treats{" "}
              <Button
                variant="secondary"
                onClick={this.closeButtonAddOn}
                style={{ float: "right" }}
              >
                Close
              </Button>
            </Modal.Title>
          </center>
        </Card.Header>
        {this.state.addonActivated ? (
          <div>
            {Object.keys(this.props.addons).map(key => (
              <div>
                <Grid>
                  <Cell col={12}>
                    <center>
                      <h4 style={{ margin: "0" }}>
                        {this.props.addons[key].Category}
                      </h4>
                    </center>
                  </Cell>

                  {this.props.addons[key].Menu.map(meal => (
                    <Cell col={4}>
                      <EachAddon
                        mealTitle={meal.meal_desc}
                        ingridents="Ingredients: Not Yet in Database"
                        detail={
                          "Cal " +
                          meal.meal_calories +
                          ", Prot " +
                          meal.meal_protein +
                          ", Carb " +
                          meal.meal_carbs +
                          ", Sug " +
                          meal.meal_sugar +
                          ", Fib " +
                          meal.meal_fiber +
                          ", Fat " +
                          meal.meal_fat +
                          ", Sat " +
                          meal.meal_sat
                        }
                        imgurl={meal.meal_photo_url}
                        incrementAddon={() => {
                          var stateCopy = Object.assign({}, this.state);
                          stateCopy.mealQuantities[meal.menu_meal_id] += 1;
                          this.setState(stateCopy);
                          console.log(this.state.mealQuantities);
                        }}
                        decrementAddon={() => {
                          var stateCopy = Object.assign({}, this.state);
                          stateCopy.mealQuantities[meal.menu_meal_id] -= 1;
                          this.setState(stateCopy);
                          console.log(this.state.mealQuantities);
                        }}
                      />
                    </Cell>
                  ))}
                </Grid>
              </div>
            ))}
          </div>
        ) : (
          <div>
            {/* {Object.keys(this.props.addons["Addons"]).map(key => ( */}
            <div>
              <Grid>
                <Cell col={12}>
                  <center>
                    <h4 style={{ margin: "0" }}>
                      {this.props.addons["Addons"].Category}
                    </h4>
                  </center>
                </Cell>

                {this.props.addons["Addons"].Menu.map(meal => (
                  <Cell col={4}>
                    <EachAddon
                      mealTitle={meal.meal_desc}
                      ingridents="Ingredients: Not Yet in Database"
                      detail={
                        "Cal " +
                        meal.meal_calories +
                        ", Prot " +
                        meal.meal_protein +
                        ", Carb " +
                        meal.meal_carbs +
                        ", Sug " +
                        meal.meal_sugar +
                        ", Fib " +
                        meal.meal_fiber +
                        ", Fat " +
                        meal.meal_fat +
                        ", Sat " +
                        meal.meal_sat
                      }
                      imgurl={meal.meal_photo_url}
                      incrementAddon={() => {
                        var stateCopy = Object.assign({}, this.state);
                        stateCopy.mealQuantities[meal.menu_meal_id] += 1;
                        this.setState(stateCopy);
                        console.log(this.state.mealQuantities);
                      }}
                      decrementAddon={() => {
                        var stateCopy = Object.assign({}, this.state);
                        stateCopy.mealQuantities[meal.menu_meal_id] -= 1;
                        this.setState(stateCopy);
                        console.log(this.state.mealQuantities);
                      }}
                    />
                  </Cell>
                ))}
              </Grid>
            </div>
            {/* ))} */}
          </div>
        )}
        <Card.Body>
          <center>
            <Button variant="secondary" onClick={this.closeButtonAddOn}>
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
