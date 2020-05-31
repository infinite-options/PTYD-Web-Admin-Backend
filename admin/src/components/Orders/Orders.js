import React, { useState, useEffect } from "react";
import Typography from "@material-ui/core/Typography";
import Link from "@material-ui/core/Link";
import Breadcrumbs from "@material-ui/core/Breadcrumbs";
import OrderTable from "./OrderTable";
import IngredientTable from "./IngredientTable";
import DropDownMenu from "./DropDownMenu";
import { css } from "@emotion/core";
import BeatLoader from "react-spinners/BeatLoader";

const override = css`
  display: flex;
  justify-content: center;
  align-items: center;
  height: 30vh;
`;

export default function Orders(props) {
  const [date, setDate] = useState("2020-07-11");
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchData();
  }, [date]);

  const fetchData = async () => {
    setLoading(true);

    const res = await (
      await fetch(props.API_URL + `All_Meals?date=${date}`)
    ).json();

    setLoading(false);
    setData(res.result.result);
  };

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
      {loading ? (
        <BeatLoader css={override} color={"#36D7B7"} loading={loading} />
      ) : (
        <OrderTable data={data} />
      )}
      <IngredientTable />
    </div>
  );
}
