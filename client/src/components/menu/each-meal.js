import React, { Component } from "react";
import { Grid, Cell } from "react-mdl";
import { Alert, Tooltip, OverlayTrigger, Button } from "react-bootstrap";
import defaultMeal from "../../img/default-meal.png";

//  Replace FINDUS1 below with this.props.imgurl

class EachMeal extends Component {
  render() {
    return (
      <div>
        <center>
          <h6>
            {/* {this.props.mealTitle.length > 22 ? (
              this.props.mealTitle
            ) : (
              <div>
                {this.props.mealTitle} <br />
                <br />
              </div>
            )} */}
          </h6>
          {/* <h4>{this.props.maxmeals}</h4> */}
        </center>
        <div class="container-select-meal" style={{ color: "white" }}>
          <img
            class="img-fluid"
            src={this.props.imgurl == null ? defaultMeal : this.props.imgurl}
            alt="no_meal_img"
            style={{ width: "200px", height: "200px", objectFit: "cover" }}
          />

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
          <div
            class="bottom-right-meal-selection font2"
            style={{
              fontSize: "15px",
              float: "right",
              backgroundColor: "black",
              lineHeight: "25px"
            }}
          >
            <center>
              <OverlayTrigger
                key="top"
                placement="top"
                delay={{ show: 150, hide: 150 }}
                overlay={
                  <Tooltip id="button-tooltip">
                    <p>{this.props.detail}</p>
                    <p>
                      <strong>Ingredients:</strong> {this.props.ingridents}
                    </p>
                  </Tooltip>
                }
              >
                <Button
                  variant="primary"
                  style={{
                    width: "20px",
                    height: "25px",
                    borderRadius: "50%"
                  }}
                >
                  <b>i</b>
                </Button>
              </OverlayTrigger>
              &nbsp;&nbsp;
              {this.props.mealTitle}
            </center>
          </div>
        </div>
        <br />
        <Button
          variant="outline-dark"
          style={{
            width: "35px",
            height: "35px",
            borderRadius: "50%",
            fontSize: "15px",
            float: "left"
          }}
          onClick={() => {
            if (this.props.mealQuantities > 0) {
              this.props.incrementMaxMeal();
            }
          }}
        >
          <b>-</b>
        </Button>
        <input
          type="text"
          size="1"
          value={this.props.mealQuantities}
          id="count"
          style={{
            textAlign: "center",
            width: "40px",
            height: "40px",
            borderRadius: "50%",
            marginLeft: "22%"
          }}
        />
        <Button
          variant="outline-success"
          style={{
            width: "35px",
            height: "35px",
            borderRadius: "50%",
            fontSize: "15px",
            float: "right"
          }}
          onClick={() => {
            if (this.props.maxmeals == 0) {
              alert(
                "You have selected more meals than your subscription plan allows.  Please select additional meal in the Add-Ons menu or upgrade your Subscription Plan.  Thanks PTYD"
              );
              return;
            }
            this.props.decrementMaxMeal();
          }}
        >
          <b>+</b>
        </Button>
      </div>
    );
  }
}

export default EachMeal;
