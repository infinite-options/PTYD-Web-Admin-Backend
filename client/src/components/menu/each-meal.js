import React, { Component } from "react";
import { Grid, Cell } from "react-mdl";
import { Alert, Tooltip, OverlayTrigger, Button } from "react-bootstrap";

//  Replace FINDUS1 below with this.props.imgurl

class EachMeal extends Component {
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
            <OverlayTrigger
              key="top"
              placement="top"
              delay={{ show: 150, hide: 150 }}
              overlay={
                <Tooltip id="button-tooltip">
                  <p>{this.props.detail}</p>
                  <p><strong>Ingredients:</strong> {this.props.ingridents}</p>
                </Tooltip>
              }
            >
              <Button variant="primary"><strong><i>i</i></strong></Button>
            </OverlayTrigger>
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
                  value={this.props.mealQuantities}
                  id="count"
                  style={{ textAlign: "center", width: "90%" }}
                />
                &nbsp;
                <input
                  type="button"
                  value="-"
                  onClick={() => {
                    if (this.props.mealQuantities > 0) {
                      this.props.incrementMaxMeal();
                      // this.setState({
                      //   countFood: this.state.countFood - 1
                      // });
                    }
                  }}
                />
                <input
                  type="button"
                  value="+"
                  onClick={() => {
                    if (this.props.maxmeals == 0) {
                      alert(
                        "You have selected more meals than your subscription plan allows.  Please select additional meal in the Add-Ons menu or upgrade your Subscription Plan.  Thanks PTYD"
                      );
                      return;
                    }
                    this.props.decrementMaxMeal();
                    // this.setState({
                    //   countFood: this.state.countFood + 1
                    // });
                  }}
                />
              </div>
            </div>
          </Cell>
        </Grid>
      </div>
    );
  }
}

export default EachMeal;
