import React, {Component} from 'react';
import {Line} from 'react-chartjs-2';

class LineGraph extends Component {
    constructor(props){
        super(props);
        this.state = {
            chartData:{
                labels: ['January', 'February', 'March', 'April'],
                datasets:[
                    {
                        label: 'Expenses Per Month',
                        data: [65000, 80000, 43000, 86000],
                        backgroundColor: 'rgba(75,192,192,0.4)'
                    
                    }
                ]
            }
        }
    }
    
    render(){
        return(
            <div className="line">
                <Line
                    data={this.state.chartData}

                    options={{}}
                />
            </div>
        )
    }
}

export default LineGraph;