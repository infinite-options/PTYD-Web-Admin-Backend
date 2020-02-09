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
        <center>
          <h6>{this.props.mealTitle}</h6>
        </center>

        <Grid>
          <Cell col={7}>
            <img class="img-fluid" src={FINDUS1} alt="" />
          </Cell>
          <Cell col={5}>
            <div class="input-group">
              <div id="input_div">
                <input
                  type="text"
                  size="4"
                  value={this.state.countFood}
                  id="count"
                  style={{ textAlign: "center" }}
                />
                &nbsp;
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
          </Cell>
          <p>{this.props.ingridents}</p>
          <p>{this.props.detail}</p>
        </Grid>
      </div>
    );
  }
}

export default EachMeal;
