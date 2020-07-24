import React from 'react';
import axios from 'axios';
import { InputBase, Paper, Typography } from "@material-ui/core";
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
            return <Typography variant="body1" style={{ margin: '30px 30px' }} > Loading Purchase ID Meals </Typography>
        }
        return (
            <div style={{ margin: "30px 30px" }}>
                <Paper style={
                {   maxWidth: 'fit-content',
                    maxWidth: '-moz-fit-content',
                    padding: '2px 4px',
                    display: 'flex',
                    alignItems: 'center',}
                }>
                    <Typography variant="body1"> Purchase Id: {this.props.purchaseID} </Typography>
                </Paper>

                <MaterialTable
                    title="Purchase Id Meals"
                    columns={[
                        { title: 'Email', field: 'user_email'},
                        { title: 'Phone', field: 'phone_number'},
                        { title: 'Purchase ID', field: 'purchase_id'},
                        { title: 'Purchase Status', field: 'purchase_status'},
                        { title: 'Meal Plan ID', field: 'meal_plan_id'},
                        { title: 'Delivery First Name', field: 'delivery_first_name'},
                        { title: 'Delivery Last Name', field: 'delivery_last_name'},
                        { title: 'Delivery Phone', field: 'delivery_phone'},
                        { title: 'Meal Plan Description', field: 'meal_plan_desc'},
                        { title: 'Payment ID', field: 'payment_id'},
                        { title: 'Recurring', field: 'recurring'},
                        { title: 'Coupon', field: 'coupon_id'},
                        { title: 'Amount Due', field: 'amount_due'},
                        { title: 'Amount Paid', field: 'amount_paid'},
                        { title: 'Time Paid', field: 'payment_time_stamp'},
                        { title: 'Credit Card', field: 'cc_num'}
                    ]}
                    data={this.state.data}
                    style={{ margin: "10px 0" }}
                />
            </div>
        );
    }
};

export default PurchaseIdMeals;