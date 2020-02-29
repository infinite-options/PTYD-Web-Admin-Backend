import React, { Component } from "react";
import { Grid, Cell } from "react-mdl";
import { Alert } from "react-bootstrap";

//  Replace FINDUS1 below with this.props.imgurl

class EachMeal extends Component {
  state = {
    countFood: 0,
    mealselected: [0]
  };
  render() {
    return (
      <div>
        <center>
          <h6>
            {this.props.mealTitle.length > 22 ? (
              this.props.mealTitle
            ) : (
              <div>
                {this.props.mealTitle} <br />
                <br />
              </div>
            )}
          </h6>
          {/* <h4>{this.props.maxmeals}</h4> */}
        </center>

        <Grid>
          <Cell col={7}>
            <img class="img-fluid" src={this.props.imgurl} alt="no_meal_img" />
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
                      this.props.incrementMaxMeal();
                      this.setState({
                        countFood: this.state.countFood - 1
                      });
                      this.setState({
                        mealselected: this.state.mealselected - 1
                      });
                      this.props.mealselected(this.state.mealselected);
                      // console.log("bbbbbbbbbbbbbb");
                      // console.log(this.state.mealselected);
                      // console.log(this.state.countFood);
                    }
                  }}
                />
                <input
                  type="button"
                  value="+"
                  onClick={() => {
                    if (this.props.maxmeals == 0) {
                      alert("You have selected more meals than your selection");
                      return;
                    }
                    this.props.decrementMaxMeal();
                    // if (this.state.mealselected.length == 0) {
                    //   this.state.mealselected.push(this.state.countFood + 1);
                    // } else {
                    this.setState({
                      mealselected: this.state.mealselected + 1
                    });
                    this.props.mealselected(this.state.mealselected);
                    // console.log("aaaaaaaaaaaaaaaaaaa");
                    // console.log(this.state.mealselected);
                    // console.log(this.state.countFood);
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
          {/* {this.state.mealselected.push(
            this.props.mealTitle
            // this.props.ingridents,
            // this.props.detail
          )} */}
          {/* {console.log(this.state.mealselected)} */}
        </Grid>
      </div>
    );
  }
}

export default EachMeal;
