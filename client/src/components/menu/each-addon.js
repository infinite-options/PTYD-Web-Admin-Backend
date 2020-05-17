import React, { Component } from "react";
//import { Grid, Cell } from "react-mdl";
import { Alert, Tooltip, OverlayTrigger, Button } from "react-bootstrap";
import defaultMeal from "../../img/default-meal.png";

//  Replace FINDUS1 below with this.props.imgurl

class EachAddon extends Component {
  render() {
    console.log("EACH ADDON ", this.props);
    return (
      <div>
        {/* <center>
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
        </center> */}

        <div class="container-select-meal" style={{ color: "white" }}>
          {/* <div class='meal-img-wrapper2' style={{objectFit: "cover", width:"100%", height: "100%"}}> */}
          <div
            class="meal-img-wrapper"
            style={{
              overflow: "hidden",
              width: "100%",
              minWidth: "100%",
              height: "200px",
              maxHeight: "200px"
            }}
          >
            <OverlayTrigger
              placement="bottom"
              delay={{ show: 100, hide: 100 }}
              popperConfig={{
                modifiers: {
                  preventOverflow: {
                    boundariesElement: "offsetParent"
                  }
                }
              }}
              overlay={
                <Tooltip id="button-tooltip">
                  <p>{this.props.detail}</p>
                  <p>
                    <strong>Ingredients:</strong> {this.props.ingridents}
                  </p>
                </Tooltip>
              }
            >
              <img
                class="img-fluid"
                src={
                  this.props.imgurl == null ? defaultMeal : this.props.imgurl
                }
                alt="no_meal_img"
                resizeMode
              />
            </OverlayTrigger>
            {/* <div
                class="bottom-right-meal-selection font2"
                style={{
                  fontSize: "20px",
                  backgroundColor: "black",
                  height: "30px"
                }}
              >
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              </div> */}
            <OverlayTrigger
              placement="bottom"
              delay={{ show: 100, hide: 100 }}
              popperConfig={{
                modifiers: {
                  preventOverflow: {
                    boundariesElement: "offsetParent"
                  }
                }
              }}
              overlay={
                <Tooltip id="button-tooltip">
                  <p>{this.props.detail}</p>
                  <p>
                    <strong>Ingredients:</strong> {this.props.ingridents}
                  </p>
                </Tooltip>
              }
            >
              <div
                class="bottom-right-meal-selection font2"
                style={{
                  fontSize: "15px",
                  float: "right",
                  backgroundColor: "black",
                  lineHeight: "25px"
                }}
              >
                <center>{this.props.mealTitle}</center>
              </div>
            </OverlayTrigger>
          </div>
          {/* </div> */}
        </div>

        {/* <Grid>
          <Cell col={7}>
            <img class="img-fluid" src={this.props.imgurl} alt="no_meal_img" />
          </Cell>
          <Cell col={5}>
            <div class="input-group">
              <div id="input_div">
                <input
                  type="text"
                  size="4"
                  value={this.props.addonQuantities}
                  id="count"
                  style={{ textAlign: "center", width: "90%" }}
                />
                &nbsp;
                <input
                  type="button"
                  value="-"
                  onClick={() => {
                    if (this.props.addonQuantities > 0) {
                      this.props.decrementAddon();
                    }
                  }}
                />
                <input
                  type="button"
                  value="+"
                  onClick={() => {
                    this.props.incrementAddon();
                  }}
                />
              </div>
            </div>
          </Cell>
          <p>{this.props.ingridents}</p>
          <p>{this.props.detail}</p>
        </Grid> */}

        <div
          style={{
            textAlign: "center",
            marginTop: "8px"
          }}
        >
          <Button
            variant="outline-dark"
            style={{
              width: "35px",
              height: "35px",
              borderRadius: "50%",
              fontSize: "15px",
              float: "left",
              marginLeft: "30px"
            }}
            onClick={() => {
              if (this.props.addonQuantities > 0) {
                this.props.decrementAddon();
              }
            }}
          >
            <b>-</b>
          </Button>
          <input
            type="text"
            size="1"
            value={this.props.addonQuantities}
            id="count"
            style={{
              textAlign: "center",
              width: "40px",
              height: "40px",
              borderRadius: "50%"
            }}
          />
          <Button
            variant="outline-success"
            style={{
              width: "35px",
              height: "35px",
              borderRadius: "50%",
              fontSize: "15px",
              float: "right",
              marginRight: "30px"
            }}
            onClick={() => {
              this.props.incrementAddon();
            }}
          >
            <b>+</b>
          </Button>
        </div>
      </div>
    );
  }
}

export default EachAddon;
