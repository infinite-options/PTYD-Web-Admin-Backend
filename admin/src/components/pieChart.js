import React, {Component} from 'react';
import {Pie} from 'react-chartjs-2';


class PieGraph extends Component{
    constructor(props){
        super(props);
        this.state = {
            chartData:{
                labels: ['Labor', 'Facility', 'Ingredients', 'Delivery', 'Preparation'],
                datasets:[
                    {
                        data: [
                            617594,
                            181045,
                            153060,
                            203050,
                            257395
                        ],
                        backgroundColor: [
                            '#FF6384',
                            '#36A2EB',
                            '#FFCE56',
                            'rgba(75, 192, 192, 0.6)',
                            'rgba(153, 102, 255, 0.6)'
                        ],
                        hoverBackgroundColor: [
                        '#FF6384',
                        '#36A2EB',
                        '#FFCE56',
                        'rgba(75, 192, 192, 0.6)',
                        'rgba(153, 102, 255, 0.6)'
                        ]
                    }
                ]
            }
        }
    }
    
    render(){
        return(
            <div className="pieChart">
                <Pie
                    data={this.state.chartData}
                    
                    options={{
                      
                    }}
                />
            </div>
        )
    }
}

export default PieGraph;