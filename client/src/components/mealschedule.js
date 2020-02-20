import React, { Component } from "react";
import { ButtonToolbar, Button } from "react-bootstrap";
import { Grid, Cell } from "react-mdl";
import IMG8 from "../img/img8.jpeg";
import MealButton from "./meal-button";


class Mealschedule extends Component {
  constructor(props) {
    super(props);
    this.state = { 
      menu: [] ,
      user_uid: searchCookie4UserID(document.cookie),
      user: {}
    };

    function searchCookie4UserID (str) {
      let arr = str.split(" ")
      let i = arr.indexOf("user_uid:") 
      return arr[i+1]
    };
  }
  
  async componentDidMount() {
    console.log(this.props);
    console.log(this.state);
    const res = await fetch(this.props.API_URL);
    const api = await res.json();

    let currUser = {"user_uid": "null", "user_name": "null", "first_name": "null", "last_name": "null", "user_email": "null@gmail.com", "phone_number": "null", "user_address": "null", "address_unit": null, "user_city": "null", "user_state": "null", "user_zip": "null", "user_region": "US", "user_gender": "null", "create_date": "2018-08-27", "last_update": "2019-09-14", "activeBool": "Yes", "last_delivery": "2020-02-08", "referral_source": "Website", "user_note": null, "password_sha512": "bed5b0364207eb5b8a51b4d8f646f151c0cd3d9b05cd0f405bf1fc4d816b90eb322460d9e5ad8e329e218a402380694fd08fcaf1116b9e48ddb68e1823caf10d"};

    if ( this.user_uid != "null" ) {
      const users = await fetch(this.props.USERS_API_URL);
      const usersApi = await users.json();
      const Ausers = usersApi.result;
      console.log(Ausers);
      console.log(this.state.user_uid)
      for (let i in Ausers) {
        
        // console.log(Ausers[i].user_uid)
        if (Ausers[i].user_uid == this.state.user_uid) {
          currUser = Ausers[i]
          console.log(currUser)
        }
      }



    }

    let key;
    let sixWeekMenu = [];
    let weekNum;
    for (weekNum = 1; weekNum < 7; weekNum++) {
      key = "MenuForWeek" + weekNum;
      let currentWeek = {};
      currentWeek.sun = api.result[key].Sunday;
      currentWeek.mon = api.result[key].Monday;
      currentWeek.menu = api.result[key].Meals;
      sixWeekMenu.push(currentWeek);
    }
    this.setState( {menu: sixWeekMenu, user: currUser} );

//  const users_res = await fetch(this.props.USERS_API_URL);
//  const users_api = await users_res.json();
  }

  render() {
    return (
      <div>
        <section class="content-section">
          <div class="container">
            <Grid>
              <Cell col={3}>
                {" "}
                <Grid>
                  <Cell col={4}>
                    <img
                      style={{
                        borderRadius: "50%",
                        width: "70px",
                        height: "70px",
                        marginTop: "10px"
                      }}
                      src={IMG8}
                      alt="Avatar"
                    ></img>
                  </Cell>
                  <Cell col={8}>
                    <h4>Hi, {this.state.user.first_name}</h4>
                  </Cell>
                </Grid>
                <button
                  type="button"
                  class="btn2 btn2-primary"
                  style={{
                    marginTop: "10px",
                    paddingLeft: "10px",
                    paddingRight: "10px",
                    paddingTop: "5px",
                    paddingBottom: "5px",
                    color: "white",
                    fontSize: "12px"
                  }}
                >
                  Make Account Changes
                </button>
                <br />
                <h4>Subscription Details</h4> <p>My Subscription:</p>
                <p>Payment Plan:</p>
                <p>Paid Weeks Remaining:</p>
                <p>Next Charge:</p>
                <p>Next Charge Date:</p>
                <p>Coupons:</p>
                <p>Account Status:</p>
                <h4>Credit Card Details</h4> <p>Credit Card:</p>
                <p>Expiration Date:</p>
                <p>CVV:</p>
                <h4>Delivery Details</h4> <p>Address: {this.state.user.user_address}</p>
                <p>Unit: {this.state.user.address_unit}</p>
                <p>City, State ZIP: {this.state.user.user_city}, {this.state.user.user_state} {this.state.user.user_zip}</p>
                <p>Instructions:</p>
              </Cell>{" "}
              <Cell col={9}>
                <br />
                <br />
                <h3>Select Meals Around Your Schedule</h3>
                <br />
                <div class="meals-button">
                  {this.state.menu.map(eachWeek => (
                  <MealButton
                    day1="Sunday"
                    day2="Monday"
                    date1={eachWeek.sun}
                    date2={eachWeek.mon}
                    menu={eachWeek.menu}
                  />
                  ))}
                </div>
              </Cell>
            </Grid>
          </div>
        </section>
      </div>
    );
  }
}

export default Mealschedule;
