import React, { useState, useEffect, Component } from "react";
import Typography from "@material-ui/core/Typography";
import Link from "@material-ui/core/Link";
import Breadcrumbs from "@material-ui/core/Breadcrumbs";
import OrderTable from "./OrderTable";
import IngredientTable from "./IngredientTable";
import DropDownMenu from "./DropDownMenu";
import { css } from "@emotion/core";
import BeatLoader from "react-spinners/BeatLoader";
import { MdError } from "react-icons/md";
import axios from "axios";
import useFetch from "../hooks/useFetch";
import ReactDOM from "react-dom";
import tableau from "tableau-api";

class Orders extends Component {
  componentDidMount() {
    this.initViz();
  }
  initViz() {
    const vizUrl =
      "https://public.tableau.com/views/Orders_15948613601670/Dashboard1?:language=en&:display_count=y&:origin=viz_share_link";
    const vizContainer = this.vizContainer;
    let viz = new window.tableau.Viz(vizContainer, vizUrl);
  }
  render() {
    return (
      <div style={{ margin: "0%" }}>
        <div
          ref={(div) => {
            this.vizContainer = div;
          }}
        ></div>
      </div>
    );
  }
}
export default Orders;

/*const override = css`
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
  const [date, setDate] = useState();
  const [dates, setDates] = useState([]);

  useEffect(() => {
    fetchSaturdays();
  }, []);

  const fetchSaturdays = async () => {
    const res = await axios.get(props.DISPLAY_SAT_API_URL);
    const valueArr = [];

    for (let ele of res.data.result.result) {
      const v = ele["Saturday"];
      valueArr.push(v);
    }

    valueArr.sort((a, b) => {
      return new Date(a) - new Date(b);
    });

    setDates(valueArr);
    setDate(res.data.result.result[4]["Saturday"]);
  };

  const order = useFetch(props.API_URL + `All_Meals?date=${date}`, date);
  console.log(order.data);
  const ingredient = useFetch(
    props.API_URL + `All_Ingredients?date=${date}`,
    date
  );
  console.log(ingredient.data);

  const handleChange = (event) => {
    setDate(event.target.value);
  };

  return (
    <div style={{ padding: "10px 20px" }}>
      <Breadcrumbs aria-label="breadcrumb" style={{ marginBottom: "10px" }}>
        <Link color="inherit">Admin Site</Link>
        <Typography color="textPrimary">Orders</Typography>
      </Breadcrumbs>
      <DropDownMenu dates={dates} date={date} handleChange={handleChange} />
      {order.loading && (
        <BeatLoader css={override} color={"#36D7B7"} loading={order.loading} />
      )}
      {order.error && (
        <h3 style={centerStyle}>
          <MdError style={{ color: "#F40057" }} />
          &nbsp;Failed to fetch data for Order's table
        </h3>
      )}
      {order.data && <OrderTable data={order.data} />}

      {ingredient.loading && (
        <BeatLoader
          css={override}
          color={"#36D7B7"}
          loading={ingredient.loading}
        />
      )}
      {ingredient.error && (
        <h3 style={centerStyle}>
          <MdError style={{ color: "#F40057" }} />
          &nbsp;Failed to fetch data for Ingredient's table
        </h3>
      )}
      {ingredient.data && <IngredientTable data={ingredient.data} />}
    </div>
  );
  
}
*/
