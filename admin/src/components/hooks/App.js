// import React from "react";
// import useFetch from "./hooks/useFetch";
// import OrderTable from "./OrderTable";
// import IngredientTable from "./IngredientTable";

// const App = () => {
//   const { data, loading, error } = useFetch(url_order, date);
//   const { data, loading, error } = useFetch(url_ingredient, date);

//   return (
//     <div>
//       {loading ? (
//         <BeatLoader css={override} color={"#36D7B7"} loading={loading} />
//       ) : error ? (
//         <h3>Failed to fetch data for Order's table</h3>
//       ) : (
//         <OrderTable data={data} />
//       )}

//       {loading ? (
//         <BeatLoader css={override} color={"#36D7B7"} loading={loading} />
//       ) : error ? (
//         <h3>Failed to fetch data for Ingredient's table</h3>
//       ) : (
//         <IngredientTable data={data} />
//       )}
//     </div>
//   );
// };

// export default App;
