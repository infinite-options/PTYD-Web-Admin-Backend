import React, { useState, useEffect } from "react";
import Typography from "@material-ui/core/Typography";
import Link from "@material-ui/core/Link";
import Breadcrumbs from "@material-ui/core/Breadcrumbs";
import OrderTable from "./OrderTable";
import IngredientTable from "./IngredientTable";
import DropDownMenu from "./DropDownMenu";
import { css } from "@emotion/core";
import BeatLoader from "react-spinners/BeatLoader";
import { MdError } from "react-icons/md";
import useFetch from "../hooks/useFetch";

const override = css`
  display: flex;
  justify-content: center;
  align-items: center;
  height: 30vh;
`;

const centerStyle = {
  display: "flex",
  justifyContent: "center",
  alignItems: "center",
  height: "30vh",
};

export default function Orders(props) {
  const [date, setDate] = useState("2020-06-20");

  const order = useFetch(props.API_URL + `All_Meals?date=${date}`, date);
  // const ingredient = useFetch(props.API_URL + `All_Meals?date=${date}`, date);

  const handleChange = (event) => {
    setDate(event.target.value);
  };

  return (
    <div style={{ padding: "10px 20px" }}>
      <Breadcrumbs aria-label="breadcrumb" style={{ marginBottom: "10px" }}>
        <Link color="inherit">Admin Site</Link>
        <Typography color="textPrimary">Create Menu</Typography>
      </Breadcrumbs>
      <DropDownMenu date={date} handleChange={handleChange} />
      {order.loading ? (
        <BeatLoader css={override} color={"#36D7B7"} loading={order.loading} />
      ) : order.error ? (
        <h3 style={centerStyle}>
          <MdError style={{ color: "#F40057" }} />
          &nbsp;Failed to fetch data for Order's table
        </h3>
      ) : (
        <OrderTable data={order.data} />
      )}
      {/* {ingredient.loading ? (
        <BeatLoader css={override} color={"#36D7B7"} loading={ingredient.loading} />
      ) : ingredient.error ? (
        <h3 style={centerStyle}>
          <MdError style={{ color: "#F40057" }} />
          &nbsp;Failed to fetch data for Ingredient's table
        </h3>
      ) : (
        <OrderTable data={ingredient.data} />
      )} */}
    </div>
  );
}
