import React, { useState, useEffect } from "react";
import Typography from "@material-ui/core/Typography";
import Link from "@material-ui/core/Link";
import Breadcrumbs from "@material-ui/core/Breadcrumbs";
import EnhancedTable from "./EnhancedTable";
import DropDownMenu from "./DropDownMenu";

export default function Orders(props) {
  const [date, setDate] = useState("2020-05-23");
  const [data, setData] = useState([]);

  useEffect(() => {
    fetchData();
  }, [date]);

  const fetchData = async () => {
    const res = await (
      await fetch(props.API_URL_Meal_Info1 + `?date=${date}`)
    ).json();

    setData(res.result.result);
  };
  if (data) {
    console.log("true");
  } else console.log("flase");
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
      <EnhancedTable data={data} />
    </div>
  );
}
