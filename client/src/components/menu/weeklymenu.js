import React, { Component } from "react";

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
    const sundayDate = api.result[this.state.currentWeek].Sunday;
    const mondayDate = api.result[this.state.currentWeek].Monday;
    const deliveryDates = sundayDate + " & " + mondayDate;
    this.setState({ dates: deliveryDates });
    const mealsData = api.result[this.state.currentWeek].Meals;
    this.setState({ meals: mealsData });
  }
  render() {
    return (
      <main>
        <div class="container text-center mobile-weekly-menu">
          <h3 class="font1">{this.props.header_label}</h3>
          <h5 class="font3" Style="margin-top:-10px;">
            {this.state.dates}
          </h5>
          <hr/>
          <div
            class="row justify-content-md-center"
            Style="margin-top:-10px; margin-bottom:-10px;display:block;text-align:center"
          >
            <ul class="navbar-nav">
              <li class="nav-item font3">
                <a class="nav-link" style={{color: "black", fontSize:"15px"}} href={this.props.header_link_url}>
                  {this.props.header_link_label}
                </a>
              </li>
            </ul>
          </div>
          <hr/>
          <p style={{fontSize: "18px"}}>LOCAL. ORGANIC. RESPONSIBLE.</p>
          <p Style="margin-top:-10px;font-size:16px">
            STRAIGHT TO YOUR DOOR
          </p>
          <hr/>

          <div 
            style={{textAlign:"center"}}>
          <div 
            className='mobile-weekly-menu-grid'
            style={{
              display:"grid",
              gridTemplateColumns:"repeat(3, 1fr)",
              // gridTemplateRows:"300px 300px"
              gridTemplateRows:"repeat(2, auto)"
            }}
          >
            {Object.keys(this.state.meals).map(key =>
                this.state.meals[key].Menu.map(meal => (
                <div 
                  className='mobile-weekly-menu-object'
                  key={meal.meal_plan_id}
                  style={{margin: "30px"}}
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
                  <div>
                    <div
                      style={{
                        wordWrap:"break-word",
                        color: "grey",
                        textAlign:"right",
                      }}
                    >
                      <h4>{meal.meal_name}</h4>
                      <p className='mobile-menu-display-none'>
                        Cal {meal.meal_calories}, Prot {meal.protein}, Carb{" "}
                        {meal.meal_carbs}, Sug {meal.meal_sugar}, Fat{" "}
                        {meal.meal_fat}, Sat {meal.meal_sat}
                      </p>

                      <p className='mobile-menu-display-none'>Ingredients:</p>
                      <p className='mobile-menu-display-none'>{meal.meal_desc}</p>

                    </div>
                  </div>
                </div>
                ))
              )}
          </div>
        </div>
        </div>

      </main>
    );
  }
}

export default WeeklyMenu;