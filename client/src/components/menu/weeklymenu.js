import React, { Component } from "react";
import { Card } from "react-bootstrap";

import defaultMeal from "../../img/default-meal.png";

class WeeklyMenu extends Component {
  constructor(props) {
    super(props);
    this.state = {
      currentWeek: null,
      dates: null,
      meals: {
        Seasonal: { Category: null, Menu: [] },
        Weekly: { Category: null, Menu: [] },
        Smoothies: { Category: null, Menu: [] },
        Addons: { Category: null, Menu: [] },
        Misc: { Category: null, Menu: [] }
      }
    };
  }

  async componentDidMount() {
    this.setState({ currentWeek: this.props.objectIndex });
    const res = await fetch(this.props.API_URL);
    const api = await res.json();
    console.log(api)
    const sundayDate = api.result[this.state.currentWeek].Sunday;
    const mondayDate = api.result[this.state.currentWeek].Monday;
    const deliveryDates = sundayDate + " & " + mondayDate;
    this.setState({ dates: deliveryDates });
    const mealsData = api.result[this.state.currentWeek].Meals;
    this.setState({ meals: mealsData });
  }
  render() {
    return (
      <main Style="margin-top:-80px;">
        <div class="container text-center">
          <h3 class="font1">{this.props.header_label}</h3>
          <h5 class="font3" Style="margin-top:-10px;">
            {this.state.dates}
          </h5>
          <hr></hr>
          <div
            class="row justify-content-md-center"
            Style="margin-top:-10px; margin-bottom:-10px;"
          >
            <ul class="navbar-nav">
              <li class="nav-item font3">
                <a class="nav-link" href={this.props.header_link_url}>
                  {this.props.header_link_label}
                </a>
              </li>
            </ul>
          </div>
          <hr></hr>
          <h5 class="font3">LOCAL. ORGANIC. RESPONSIBLE.</h5>
          <h6 class="font3" Style="margin-top:-10px;">
            STRAIGHT TO YOUR DOOR
          </h6>
          <hr></hr>
        </div>

        <div 
          //grid of items plus margins/center
          // id='menu-container'
          style={{
            margin: "0 200px",
            textAlign:"center",
          }}>
          <div 
            //grid of items
            style={{
              display:"grid",
              gridTemplateColumns:"1fr 1fr 1fr",
            }}
          >
            {Object.keys(this.state.meals).map(key =>
                this.state.meals[key].Menu.map(meal => (
                <div 
                  //each item plus padding
                  style={{
                    margin: "30px",
                  }}
                >
                  <img
                    src={meal.meal_photo_url === null ? defaultMeal : meal.meal_photo_url}
                    alt="meal pic"
                    style={{
                      height:"300px",
                      width:"100%",
                      objectFit:"cover",
                      boxShadow:"1px 2px 5px 1px grey"
                    }}
                  />
                  <div
                    style={{
                      
                    }}
                  >
                    <div
                      //meal titles (to show)
                      style={{
                        wordWrap:"break-word",
                        color: "grey",
                        textAlign:"right",
                      }}
                    >
                      <h4>{meal.meal_name}</h4>
                      <p>
                        Cal {meal.meal_calories}, Prot {meal.protein}, Carb{" "}
                        {meal.meal_carbs}, Sug {meal.meal_sugar}, Fat{" "}
                        {meal.meal_fat}, Sat {meal.meal_sat}
                      </p>

                      <p>
                        
                      </p>

                    </div>
                  </div>
                </div>
                ))
              )}
          </div>
        </div>

        {/* <div class="album py-5 bg-white">
          <div class="container" Style="margin-top:-40px;">
            <div class="row justify-content-center">
              {Object.keys(this.state.meals).map(key =>
                this.state.meals[key].Menu.map(meal => (
                  <div class="col-md-4">
                    <div
                      class="card mb-4 shadow-sm"
                      Style="height:300px; width:300px;"
                    >
                      <img
                        class="card-img-top"
                        width="100%"
                        height="200px"
                        src={meal.meal_photo_url === null ? defaultMeal : meal.meal_photo_url}
                        alt="meal pic"
                      />
                      <Card.Body class="font2">
                        <Card.Title>{meal.meal_name}</Card.Title>
                        <Card.Text>
                          Cal {meal.meal_calories}, Prot {meal.protein}, Carb{" "}
                          {meal.meal_carbs}, Sug {meal.meal_sugar}, Fat{" "}
                          {meal.meal_fat}, Sat {meal.meal_sat}
                        </Card.Text>
                      </Card.Body>
                    </div>
                  </div>
                ))
              )}
            </div>
          </div>
        </div> */}

      </main>
    );
  }
}

export default WeeklyMenu;
