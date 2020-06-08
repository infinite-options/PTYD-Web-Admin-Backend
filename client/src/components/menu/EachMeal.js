import React, {Component} from "react";
import {OverlayTrigger, Tooltip, Button} from "react-bootstrap";
import defaultMeal from "../../img/default-meal.png";

export default class EachMeal extends Component {
  constructor(props) {
    super(props);
    this.state = {
      description: this.props.description
    };
  }
  componentDidMount = () => {
    console.log("description in Each Meal: ", this.state.description);
  };
  render() {
    let desc = this.state.description;
    return (
      <div>
        <div className='container-select-meal' style={{color: "white"}}>
          <div
            className='meal-img-wrapper'
            style={{
              overflow: "hidden",
              width: "100%",
              minWidth: "100%",
              height: "200px",
              maxHeight: "200px"
            }}
          >
            <img
              className='img-fluid'
              src={
                desc.meal_photo_url === null ? defaultMeal : desc.meal_photo_url
              }
              alt='no_meal_img'
              resizemode='true'
            />

            <OverlayTrigger
              placement='bottom'
              delay={{show: 100, hide: 100}}
              popperConfig={{
                modifiers: {
                  preventOverflow: {
                    boundariesElement: "offsetParent"
                  }
                }
              }}
              overlay={
                <Tooltip id='button-tooltip'>
                  <p>{this.props.detail}</p>
                  <p>
                    <strong>Ingredients:</strong> {desc.meal_desc}
                  </p>
                </Tooltip>
              }
            >
              <div
                className='bottom-right-meal-selection font2'
                style={{
                  fontSize: "15px",
                  float: "right",
                  backgroundColor: "black",
                  lineHeight: "25px"
                }}
              >
                <center>{desc.meal_name}</center>
              </div>
            </OverlayTrigger>
          </div>
        </div>
        <div
          style={{
            textAlign: "center",
            marginTop: "8px"
          }}
        >
          <Button
            variant='outline-dark'
            style={{
              width: "35px",
              height: "35px",
              borderRadius: "50%",
              fontSize: "15px",
              float: "left",
              marginLeft: "30px"
            }}
            onClick={() => {
              this.props.decrementMealLeft(this.props.id);
            }}
          >
            {/* reduce the meal selected means increase number of meals left */}
            <b>-</b>
          </Button>
          <input
            type='text'
            size='1'
            value={this.props.quantity}
            style={{
              textAlign: "center",
              width: "40px",
              height: "40px",
              borderRadius: "50%"
            }}
            readOnly
          />
          <Button
            variant='outline-success'
            style={{
              width: "35px",
              height: "35px",
              borderRadius: "50%",
              fontSize: "15px",
              float: "right",
              marginRight: "30px"
            }}
            onClick={() => {
              if (this.props.maxMeals === 0) {
                alert(
                  "You have selected more meals than your subscription plan allows.  Please select additional meals in the Add Local Treats menu or upgrade your Subscription Plan.  Thanks PTYD"
                );
                return;
              }
              console.log(this.props.id);
              this.props.incrementMealLeft(this.props.id);
              this.props.decrementMaxMeal();
            }}
          >
            <b>+</b>
          </Button>
        </div>
      </div>
    );
  }
}
