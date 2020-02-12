import React, { Component } from "react";
import { Card } from "react-bootstrap";

//  Not using images currently

class Selectmealplan extends Component {
  constructor(props) {
    super(props);
    this.state = { currentWeek: null, dates: null, meals: { Seasonal: { Category: null, Menu: [] }, Weekly: { Category: null, Menu: [] }, Smoothies: { Category: null, Menu: [] }, Addons: { Category: null, Menu: [] }, Misc: { Category: null, Menu: [] } } };
  }

  async componentDidMount() {
    console.log(this.props);
    this.setState( {currentWeek: this.props.objectIndex} );
    const res = await fetch(`${this.props.API_URL}`);
    const api = await res.json();
    const sundayDate = api.result[this.state.currentWeek].Sunday;
    const mondayDate = api.result[this.state.currentWeek].Monday;
    const deliveryDates = sundayDate + " & " + mondayDate
    this.setState( {dates: deliveryDates} );
    const mealsData = api.result[this.state.currentWeek].Meals;
    this.setState( {meals: mealsData} );
  }
  render() {
    return (
        <main Style="margin-top:-80px;">
          <div class="container text-center">
              <h3>{this.props.header_label}</h3>
              <h5 Style="margin-top:-10px;">{this.state.dates}</h5>
              <hr></hr>
              <div class="row justify-content-md-center" Style="margin-top:-10px; margin-bottom:-10px;">
                  <ul class="navbar-nav">
                      <li class="nav-item">
                          <a class="nav-link" href={this.props.header_link_url}>{this.props.header_link_label}</a>
                      </li>
                  </ul>
              </div>
              <hr></hr>
              <h5>LOCAL. ORGANIC. RESPONSIBLE.</h5>
              <h6 Style="margin-top:-10px;">STRAIGHT TO YOUR DOOR</h6>
              <hr></hr>
          </div>
          <div class="album py-5 bg-white">
            <div class="container" Style="margin-top:-40px;">
              <div class="row justify-content-center">
                {Object.keys(this.state.meals).map(key => (
                  this.state.meals[key].Menu.map(meal => (
                    <div class="col-md-4">
                      <div class="card mb-4 shadow-sm" Style="height:300px; width:300px;">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="200" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                        <Card.Body>
                          <Card.Title>{meal.meal_desc}</Card.Title>
                          <Card.Text>
                            Cal {meal.meal_calories}, Prot {meal.protein}, Carb {meal.meal_carbs}, Sug {meal.meal_sugar}, Fat {meal.meal_fat}, Sat {meal.meal_sat}
                          </Card.Text>
                        </Card.Body>
                      </div>
                    </div>
                  ))
                ))}
              </div>
            </div>
          </div>
        </main>
    );
  }
}

export default Selectmealplan;
