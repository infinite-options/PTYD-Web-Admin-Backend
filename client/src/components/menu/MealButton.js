import React, {Component} from "react";
import {Button, ButtonToolbar} from "react-bootstrap";

export default class MealButton extends Component {
  constructor(props) {
    super(props);
    this.state = {
      currentPurchase: {}, // get from meal schedule
      menu: [], // get from meal schedule. this is 6 week menu

      //some variable to control button
      sundayButton: {
        chosen: false,
        active: true
      },
      mondayButton: {
        chosen: false,
        active: true
      },
      skipButton: {
        chosen: false,
        active: true
      },
      selectButton: {
        chosen: false,
        red: false,
        active: true
      },
      surpriseButton: {
        chosen: false,
        active: true
      },
      addonButton: {
        chosen: false,
        red: false,
        active: true
      }
    };
  }
  componentDidMount = prevProps => {
    // watching on changing of purchase_id from parent to load the newest currentPurchase
  };

  clickSunday = () => {
    this.setState(prevState => ({
      sundayButton: {
        ...prevState.sundayButton,
        chosen: true,
        active: true
      },
      mondayButton: {
        ...prevState.mondayButton,
        chosen: false,
        active: true
      },
      skipButton: {
        ...prevState.skipButton,
        chosen: false,
        active: true
      },
      selectButton: {
        ...prevState.selectButton,
        active: true
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        active: true
      },
      addonButton: {
        ...prevState.addonButton,
        active: true
      }
    }));
  };

  clickMonday = () => {
    this.setState(prevState => ({
      sundayButton: {
        ...prevState.sundayButton,
        chosen: false,
        active: true
      },
      mondayButton: {
        ...prevState.mondayButton,
        chosen: true,
        active: true
      },
      skipButton: {
        ...prevState.skipButton,
        chosen: false,
        active: true
      },
      selectButton: {
        ...prevState.selectButton,
        active: true
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        active: true
      },
      addonButton: {
        ...prevState.addonButton,
        active: true
      }
    }));
  };

  clickSkip = () => {
    this.setState(prevState => ({
      sundayButton: {
        ...prevState.sundayButton,
        active: true
      },
      mondayButton: {
        ...prevState.mondayButton,
        active: true
      },
      skipButton: {
        ...prevState.skipButton,
        chosen: true,
        active: true
      },
      selectButton: {
        ...prevState.selectButton,
        active: false
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        active: false
      },
      addonButton: {
        ...prevState.addonButton,
        active: false
      }
    }));
    // send a form to database to write a
  };
  clickSelect = () => {
    this.setState(prevState => ({
      sundayButton: {
        ...prevState.sundayButton,
        active: false
      },
      mondayButton: {
        ...prevState.mondayButton,
        active: false
      },
      skipButton: {
        ...prevState.skipButton,
        active: true
      },
      selectButton: {
        ...prevState.selectButton,
        chosen: true,
        red: true,
        active: true
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        chosen: false,
        active: true
      },
      addonButton: {
        ...prevState.addonButton,
        active: false
      }
    }));
  };
  clickSurprise = () => {
    this.setState(prevState => ({
      sundayButton: {
        ...prevState.sundayButton,
        active: true
      },
      mondayButton: {
        ...prevState.mondayButton,
        active: true
      },
      skipButton: {
        ...prevState.skipButton,
        active: true
      },
      selectButton: {
        ...prevState.selectButton,
        chosen: false,
        active: true
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        chosen: true,
        active: true
      },
      addonButton: {
        ...prevState.addonButton,
        active: true
      }
    }));
    //send a request to database
  };
  /* Addon button is clicked. All others button will inactive. until Agree to Pay is clicked */
  clickAddOn = () => {
    this.setState(prevState => ({
      sundayButton: {
        ...prevState.sundayButton,
        active: false
      },
      mondayButton: {
        ...prevState.mondayButton,
        active: false
      },
      skipButton: {
        ...prevState.skipButton,
        active: true
      },
      selectButton: {
        ...prevState.selectButton,
        active: false
      },
      surpriseButton: {
        ...prevState.surpriseButton,
        active: false
      },
      addonButton: {
        ...prevState.addonButton,
        chosen: true,
        red: true,
        active: true
      }
    }));
  };

  render() {
    const orange = {
      width: "95px",
      height: "95px",
      backgroundColor: "#cd790c",
      color: "white"
    };

    const clear = {
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
    const red = {
      width: "95px",
      height: "95px",
      backgroundColor: "#d9534f",
      color: "white"
    };

    // defined color for buttons
    var sundayColor, mondayColor, selectColor, addonColor;
    //sunday button

    sundayColor =
      this.state.sundayButton.chosen && !this.state.skipButton.chosen
        ? green
        : clear;

    //Monday button
    mondayColor =
      this.state.mondayButton.chosen && !this.state.skipButton.chosen
        ? green
        : clear;

    //select button

    if (this.state.selectButton.chosen && this.state.selectButton.red) {
      selectColor = red;
    } else if (this.state.selectButton.chosen && !this.state.selectButton.red) {
      selectColor = green;
    } else {
      selectColor = clear;
    }
    //addon button
    if (this.state.addonButton.chosen && this.state.addonButton.red) {
      addonColor = red;
    } else if (this.state.addonButton.chosen && !this.state.addonButton.red) {
      addonColor = green;
    } else {
      addonColor = clear;
    }

    return (
      <div>
        <ButtonToolbar className='mb-5'>
          <div className='radio'>
            <Button
              variant='outline-dark'
              disabled={!this.state.sundayButton.active}
              onClick={this.clickSunday}
              style={sundayColor}
            >
              Sunday date
            </Button>
            &nbsp;
            <Button
              variant='outline-dark'
              disabled={!this.state.mondayButton.active}
              onClick={this.clickMonday}
              style={mondayColor}
            >
              Monday date
            </Button>
            &nbsp;
            <Button
              disabled={!this.state.skipButton.active}
              variant='outline-dark'
              style={this.state.skipButton.chosen ? orange : clear}
              onClick={this.clickSkip}
            >
              Skip This Week
            </Button>
          </div>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <Button
            disabled={!this.state.selectButton.active}
            variant='outline-dark'
            style={selectColor}
            onClick={this.clickSelect}
          >
            Select Meal
          </Button>
          &nbsp;
          <Button
            disabled={!this.state.surpriseButton.active}
            variant='outline-dark'
            onClick={this.clickSurprise}
            style={this.state.surpriseButton.chosen ? green : clear}
          >
            Surprise Me!
          </Button>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <Button
            disabled={!this.state.addonButton.active}
            variant='outline-dark'
            style={addonColor}
            onClick={this.clickAddOn}
          >
            Add Local Treats
          </Button>
        </ButtonToolbar>
      </div>
    );
  }
}
