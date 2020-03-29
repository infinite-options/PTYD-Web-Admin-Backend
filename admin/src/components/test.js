import React, { Component } from "react";
import { Card, CardDeck } from "react-bootstrap";

class UpcomingMeals extends Component {
   constructor(props) {
     super(props);
     this.state = { mealPlans: [] };
   }

   async componentDidMount() {
     const res = await fetch('https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/plans');
     const api = await res.json();
     const mealPlans = api.result.MealPlans;
     this.setState({ mealPlans });
     console.log({mealPlans});
   }

  render() {
    return (
      <CardDeck>
              {this.state.mealPlans.map(mealPlan => (
                <div
                  style={{
                    width: "25%",
                    margin: "0",
                    padding: "0"
                  }}
                >
                  {mealPlan.num_meals === 10 ? (
                    <p class="rcorners font3">MOST POPULAR</p>
                  ) : (
                    <p style={{ height: "32px" }} />
                  )}
                  <Card
                    style={{
                      maxWidth: "20rem",
                      boxShadow: "0px 5px 32px 4px rgba(0,0,0,0.3)"
                    }}
                  >
                    <div
                      class="borderr"
                      style={
                        mealPlan.num_meals === 10
                          ? { height: "110%", color: "green" }
                          : { height: "110%" }
                      }
                    >
                      <div
                        class="selectmeal-center"
                        style={{
                          marginBottom: "10%",
                          fontSize: "30px",
                          textShadow: "2px 2px 4px #FFEFB0",
                          lineHeight: "35px",
                          color: "white"
                        }}
                      >
                        {mealPlan.num_meals} MEALS
                      </div>
                      <Card.Body>
                        <Card.Title>
                          <b>{mealPlan.num_meals} MEALS WEEKLY</b>
                        </Card.Title>
                        <Card.Text
                          style={{ fontSize: "15px", color: "#888785" }}
                        >
                          from ${mealPlan.meal_plan_price_per_meal.toFixed(2)}{" "}
                          per meal
                        </Card.Text>
                        <Card.Text style={{ fontSize: "13px" }}>
                          {mealPlan.plan_headline}
                        </Card.Text>
                        <Card.Text>
                          STARTING AT ${mealPlan.meal_plan_price.toFixed(2)}{" "}
                          /week
                        </Card.Text>
                        <Card.Text
                          style={{ fontSize: "13px", color: "#888785" }}
                        >
                          Sales tax of 8.25% will be added
                        </Card.Text>
                        
                            CHOOSE {mealPlan.num_meals} MEALS
                      </Card.Body>
                      <Card.Footer Style="bottom:0px; ">
                        <large className="text-muted">
                          {mealPlan.plan_footer}
                        </large>
                      </Card.Footer>
                    </div>
                  </Card>
                </div>
              ))}
            </CardDeck>
    );
  }
}
export default UpcomingMeals;
