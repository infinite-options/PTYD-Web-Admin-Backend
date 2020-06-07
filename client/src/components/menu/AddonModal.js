import React from "react";
import { Button, Card, Modal } from "react-bootstrap";
import { Grid, Cell } from "react-mdl";
import EachAddon from "./EachAddon";
import PropTypes from "prop-types";

AddonModal.propTypes = {
  mealLeft: PropTypes.number,
  Meals: PropTypes.object,
  incrementMealLeft: PropTypes.func,
  decrementMealLeft: PropTypes.func,
  clickSkip: PropTypes.func,
  clickSurprise: PropTypes.func,
};

export default function AddonModal(props) {
  const modalStyle = {
    position: "absolute",
    top: "5%",
    left: "10%",
    zIndex: "50",
    height: "700px",
    width: "600px",
  };

  return (
    <Card style={modalStyle}>
      <Card.Header>
        <Modal.Title style={{ width: "100%" }}>
          <h4 className="font2" style={{ float: "left", margin: "0" }}>
            Add Local Treats:
          </h4>
          <div style={{ float: "right" }}>
            <h4 className="font2" style={{ float: "left", margin: "0" }}>
              Total Price: ${props.total_addon_price}
            </h4>
            &nbsp;&nbsp;
            <Button variant="danger" onClick={props.closeAddonModal}>
              Close
            </Button>
            <Button variant="success" onClick={props.saveButtonAddOn}>
              Agree To Pay
            </Button>
          </div>
        </Modal.Title>
      </Card.Header>
      <div className="scrollMenu">
        {Object.values(props.Addons).map((addon) => (
          <Grid>
            <Cell col={12}>
              <h4 style={{ margin: "0" }}>{addon.Category}</h4>
            </Cell>

            {addon.Menu.map((description) => {
              let quantity = 0;
              for (let [k, v] of Object.entries(
                props.currentAddonSelected.meals_selected
              )) {
                if (k === description.menu_meal_id) {
                  quantity = v;
                }
              }
              return (
                <Cell col={4}>
                  {console.log("description: ", description)}
                  <EachAddon
                    description={description}
                    incrementMealLeft={props.incrementMealLeft}
                    decrementMealLeft={props.decrementMealLeft}
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
