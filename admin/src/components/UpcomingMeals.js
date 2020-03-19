// import React, { Component } from "react";
// import { Card, CardDeck } from "react-bootstrap";

// class UpcomingMeals extends Component {
//   constructor(props) {
//     super(props);
//     this.state = { upcomingMeals: [] };
//   }

//   async componentDidMount() {
//     const res = await fetch(this.props.API_URL);
//     const api = await res.json();
//     const upcomingMeals = api.result.Meals_by_week;
//     this.setState({ upcomingMeals });
//   }

//   render() {
//     return (
//       <div>
//         <h1>hello</h1>
//         {this.state.upcomingMeals.map(upcomingMeal => (
//           <div
//             style={{
//               width: "25%",
//               margin: "0",
//               padding: "0"
//             }}
//           >
//             {upcomingMeal.Category}
//           </div>
//         ))}
//       </div>
//     );
//   }
// }
// export default UpcomingMeals;
import React, { Component } from "react";
import ScrollMenu from "react-horizontal-scrolling-menu";

// list of items
const list = [
  { name: "item1" },
  { name: "item2" },
  { name: "item3" },
  { name: "item4" },
  { name: "item5" },
  { name: "item6" },
  { name: "item7" },
  { name: "item8" },
  { name: "item9" }
];

// One item component
// selected prop will be passed
const MenuItem = ({ text, selected }) => {
  return <div className={`menu-item ${selected ? "active" : ""}`}>{text}</div>;
};

// All items component
// Important! add unique key
export const Menu = (list, selected) =>
  list.map(el => {
    const { name } = el;

    return <MenuItem text={name} key={name} selected={selected} />;
  });

const Arrow = ({ text, className }) => {
  return <div className={className}>{text}</div>;
};

const ArrowLeft = Arrow({ text: "<", className: "arrow-prev" });
const ArrowRight = Arrow({ text: ">", className: "arrow-next" });

const selected = "item1";

class UpcomingMeals extends Component {
  constructor(props) {
    super(props);
    // call it again if items count changes
    this.menuItems = Menu(list, selected);
  }

  state = {
    selected
  };

  onSelect = key => {
    this.setState({ selected: key });
  };

  render() {
    const { selected } = this.state;
    // Create menu from items
    const menu = this.menuItems;

    return (
      <div className="App">
        <ScrollMenu
          data={menu}
          arrowLeft={ArrowLeft}
          arrowRight={ArrowRight}
          selected={selected}
          onSelect={this.onSelect}
        />
      </div>
    );
  }
}
export default UpcomingMeals;
