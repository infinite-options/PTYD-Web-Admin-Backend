import React, {Component} from 'react';
import {Bar, Line, Pie} from 'react-chartjs-2';
import { Card, CardDeck } from "react-bootstrap";

class BarGraph extends Component{

    async componentDidMount() {
        const res = await fetch('https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v1/plans');
        const api = await res.json();
        const mealPlans = api.result.MealPlans;
        this.setState({ mealPlans });
        console.log({mealPlans});
      }

    constructor(props){
        super(props);
        this.state = {
            mealPlans: [],
            chartData:{
                labels:[1,2,3,4,5,6],
                datasets:[
                    {
                        label: 'Individual Meal Popularity Over Number of Times Posted',
                        data: [
                            3,
                            5,
                            10,
                            15,
                            20,
                            35
                        ],
                        backgroundColor:[
                            'rgba(255, 99, 132, 0.6)',
                            'rgba(54, 162, 235, 0.6)',
                            'rgba(255, 206, 86, 0.6)',
                            'rgba(75, 192, 192, 0.6)',
                            'rgba(153, 102, 255, 0.6)',
                            'rgba(255, 159, 64, 0.6)',
                        ]
                    }
                ]
            }
        }
    }

    render(){
        return(
            <div className="chart">
                <Bar
                    data={this.state.chartData}
                    
                    options={{
                      
                    }}
                />
                <p>{mealPlans}</p>
            </div>
        )
    }
}

export default BarGraph;