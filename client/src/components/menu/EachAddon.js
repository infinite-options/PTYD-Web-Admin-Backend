import React, {Component} from "react";
import {Tooltip, Button, OverlayTrigger} from "react-bootstrap";

export default class EachAddon extends Component {
  render() {
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
              src={this.props.description.meal_photo_url}
              alt='no_meal_img'
              resizemode='true'
            />
            <div
              className='top-right-meal-selection font2'
              style={{
                fontSize: "15px",
                float: "right",
                backgroundColor: "black",
                lineHeight: "25px",
                cursor: "default"
              }}
            >
              <center>${this.props.description.extra_meal_price}</center>
            </div>
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
                  <p>{this.props.description.meal_name}</p>
                  <p>
                    <strong>Ingredients:</strong>{" "}
                    {this.props.description.meal_desc}
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
                  lineHeight: "25px",
                  cursor: "default"
                }}
              >
                <center>{this.props.description.meal_name}</center>
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
              this.props.decrementAddon(this.props.id);
              this.props.decrementAddonPrice(
                this.props.description.extra_meal_price
              );
            }}
          >
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
              this.props.incrementAddon(this.props.id);
              this.props.incrementAddonPrice(
                this.props.description.extra_meal_price
              );
            }}
          >
            <b>+</b>
          </Button>
        </div>
      </div>
    );
  }
}
