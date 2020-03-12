import React, { Component } from "react";
import { Card, CardDeck, Row, Col, Container } from "react-bootstrap";
import { Link } from "react-router-dom";

export const Upcomingmeals = () =>(
    constructor(props) {
      super(props);
      this.state = { upcomingMealPlans: [] };
    }

    async componentDidMount() {
        const res = await fetch(this.props.API_URL);
        const api = await res.json();
        const upcomingMealPlans = api.result.UpcomingMealPlans.result;
        this.setState({ upcomingMealPlans });
        console.log(UpcomingMealPlans);
      }

    render(){
        return(

            <CardDeck>
                {this.state.upcomingMealPlans.map(upcomingMealPlans => (
                <Card>
                    <Card.Body>
                        <Card.Title>{ UpcomingMealPlans.M.menu_date }</Card.Title>
                        <h3>{ UpcomingMealPlans.M.menu_category }</h3>
                        <h3>{ UpcomingMealPlans.A.meal_desc }</h3>
                        <h3>{ UpcomingMealPlans.M.menu_num_sold }</h3> 
                    </Card.Body>
                </Card>
                ))}
            </CardDeck>
        )    
    }
)
