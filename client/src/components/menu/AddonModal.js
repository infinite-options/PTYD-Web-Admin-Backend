import React from "react";
import {Button, Card, Modal} from "react-bootstrap";
import {Grid, Cell} from "react-mdl";
import EachAddon from "./EachAddon";
import PropTypes from "prop-types";

AddonModal.propTypes = {
  mealLeft: PropTypes.number,
  Meals: PropTypes.object,
  incrementMealLeft: PropTypes.func,
  decrementMealLeft: PropTypes.func,
  clickSkip: PropTypes.func,
  clickSurprise: PropTypes.func
};

export default function AddonModal(props) {
  const modalStyle = {
    position: "absolute",
    top: "5%",
    left: "10%",
    zIndex: "50",
    height: "700px",
    width: "600px"
  };
  return (
    <Card style={modalStyle}>
      <Card.Header>
        <Modal.Title style={{width: "100%"}}>
          <h4 className='font2' style={{float: "left", margin: "0"}}>
            Add Local Treats:
          </h4>
          <div style={{float: "right"}}>
            <h4 className='font2' style={{float: "left", margin: "0"}}>
              Total Price: ${props.totalAddonPrice}
            </h4>
            &nbsp;&nbsp;
            {props.totalAddonPrice === 0 && (
              <Button variant='danger' onClick={props.closeAddonModal}>
                Close
              </Button>
            )}
            <Button variant='success' onClick={props.saveButtonAddOn}>
              Agree To Pay
            </Button>
          </div>
        </Modal.Title>
      </Card.Header>
      <div className='scrollMenu'>
        {Object.values(props.Addons).map(addon => (
          <Grid key={addon.Category}>
            <Cell col={12}>
              <h4 style={{margin: "0"}}>{addon.Category}</h4>
            </Cell>

            {addon.Menu.map(description => {
              let quantity = 0;
              if (props.currentAddonSelected.meals_selected !== undefined) {
                for (let [k, v] of Object.entries(
                  props.currentAddonSelected.meals_selected
                )) {
                  if (k === description.menu_meal_id) {
                    quantity = v;
                  }
                }
              }

              return (
                <Cell col={4} key={description.meal_id}>
                  <EachAddon
                    id={description.meal_id}
                    description={description}
                    incrementAddon={props.incrementAddon}
                    decrementAddon={props.decrementAddon}
                    incrementAddonPrice={props.incrementAddonPrice}
                    decrementAddonPrice={props.decrementAddonPrice}
                    quantity={quantity}
                  />
                </Cell>
              );
            })}
          </Grid>
        ))}
      </div>
    </Card>
  );
}
