import React, { Component } from "react";
import { Card, CardDeck } from "react-bootstrap";

class UpcomingMeals extends Component {
   constructor(props) {
     super(props);
     this.state = { upcomingMealPlans: [] };
   }

   async componentDidMount() {
     const res = await fetch(this.props.API_URL);
     const api = await res.json();
     const upcomingMealPlans = api.result.UpcomingMealPlans.result;
     this.setState({ upcomingMealPlans });
   }

  render() {
    return (
      <p>{this.state.upcomingMealPlans}</p>
    );
  }
}
export default UpcomingMeals;
