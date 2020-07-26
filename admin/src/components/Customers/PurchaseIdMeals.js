import React from 'react';
import axios from 'axios';
import { Paper, Typography } from "@material-ui/core";
import MaterialTable from 'material-table';

class PurchaseIdMeals extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            loaded: false,
            data: [],
        }
    }

    componentDidMount() {
        let curComponent = this;
        axios
            .get(`${this.props.PURCHASE_MEAL_API_URL}/${this.props.purchaseID}`)
            .then(function (res) {
                console.log(res);
                curComponent.setState({
                    loaded: true,
                    data: res.data.result.result,
                })
            })
            .catch(function (error) {
                console.log(error);
            })
    }

    componentDidUpdate(prevProps) {
        if(this.props.purchaseID !== prevProps.purchaseID) {
            this.fetchData();
        }
    }

    fetchData = () => {
        let curComponent = this;
        axios
            .get(`${this.props.PURCHASE_MEAL_API_URL}/${this.props.purchaseID}`)
            .then(function (res) {
                curComponent.setState({
                    data: res.data.result.result,
                })
            })
            .catch(function (error) {
                console.log(error);
            })
    }

    render() {
        if(!this.state.loaded) {
            return <Typography variant="body1" style={{ margin: '30px 0' }} > Loading Purchase ID Meals </Typography>
        }
        return (
            <div style={{ margin: "30px 0" }}>
                <Paper style={
                {   maxWidth: 'max-content',
                    padding: '2px 4px',
                    display: 'flex',
                    alignItems: 'center',}
                }>
                    <Typography variant="body1"> Purchase Id: {this.props.purchaseID} </Typography>
                </Paper>

                <MaterialTable
                    title="Purchase Id Meals"
                    columns={[
                        {   title: 'Delivery First Name',
                            field: 'delivery_first_name',
                        },
                        {   title: 'Delivery Last Name',
                            field: 'delivery_last_name',
                        },
                        {   title: 'Delivery Phone',
                            field: 'delivery_phone',
                        },
                        { title: 'Delivery Address', field: 'delivery_address'},
                        { title: 'Delivery Address Unit', field: 'delivery_address_unit'},
                        { title: 'Delivery City', field: 'delivery_city'},
                        {   title: 'Delivery ZIP',
                            field: 'delivery_zip',
                        },
                        { title: 'Meal Plan Description', field: 'meal_plan_desc'},
                        { title: 'Saturday', field: 'Saturday' },
                        { title: 'Delivery Day', field: 'delivery_day'},
                        { title: 'Meal Plan Selection', field: 'meal_selection'},
                    ]}
                    data={this.state.data}
                    style={{ margin: "10px 0" }}
                />
            </div>
        );
    }
};

export default PurchaseIdMeals;