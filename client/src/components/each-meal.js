import React, { Component } from "react";
import FINDUS1 from "../img/findus1.png";
import { Grid, Cell } from "react-mdl";

class EachMeal extends Component {
  state = {
    countFood: 0
  };
  render() {
    return (
      <div>
        <img class="img-fluid" src={FINDUS1} alt="" />
        <h6>{this.props.mealTitle}</h6>
        <Grid>
          <Cell col={3}></Cell>
          <div class="input-group">
            <div id="input_div">
              <input
                type="button"
                value="-"
                onClick={() => {
                  if (this.state.countFood > 0) {
                    this.setState({
                      countFood: this.state.countFood - 1
                    });
                  }
                }}
              />
              &nbsp;
              <input
                type="text"
                size="4"
                value={this.state.countFood}
                id="count"
              />
              &nbsp;
              <input
                type="button"
                value="+"
                onClick={() => {
                  this.setState({
                    countFood: this.state.countFood + 1
                  });
                }}
              />
            </div>
          </div>
        </Grid>
        <p>{this.props.ingridents}</p>
        <p>{this.props.detail}</p>
      </div>
    );
  }
}

export default EachMeal;
