import React, { Component } from "react";
import { Card, CardDeck } from "react-bootstrap";

class UpcomingMeals extends Component {
  constructor(props) {
    super(props);
    this.state = { upcomingMeals: [] };
  }

  async componentDidMount() {
    const res = await fetch(this.props.API_URL);
    const api = await res.json();
    const upcomingMeals = api.result.Meals_by_week;
    this.setState({ upcomingMeals });
  }

  render() {
    return (
      <div>
        <h1>hello</h1>
        {this.state.upcomingMeals.map(upcomingMeal => (
          <div
            style={{
              width: "25%",
              margin: "0",
              padding: "0"
            }}
          >
            {upcomingMeal.Category}
          </div>
        ))}
      </div>
    );
  }
}
export default UpcomingMeals;
