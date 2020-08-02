import React from "react";
import axios from "axios";
import { Typography } from "@material-ui/core";
import MaterialTable from 'material-table';

class LatestActivity extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            loaded: false,
            data: [],
        };
    }

    componentDidMount() {
        let curComponent = this;
        axios
            .get(`${this.props.LATESTACTIVITY_API_URL}/${this.props.searchID}`)
            .then(function (res) {
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
        if(this.props.searchID !== prevProps.searchID) {
            this.fetchData();
        }
    }

    fetchData = () => {
        let curComponent = this;
        axios
            .get(`${this.props.LATESTACTIVITY_API_URL}/${this.props.searchID}`)
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
            return <Typography variant="body1" style={{ margin: '30px 0' }} > Loading Latest Activity </Typography>
        }
        return (
            <div style={{ margin: '30px 0' }}>
                <MaterialTable
                    title="Latest Activity"
                    columns={[
                        {   title: 'Email',
                            field: 'user_email'
                        },
                        {   title: 'Phone',
                            field: 'phone_number'
                        },
                        {   title: 'Purchase ID',
                            field: 'purchase_id'
                        },
                        {   title: 'Purchase Status',
                            field: 'purchase_status'
                        },
                        {   title: 'Meal Plan ID',
                            field: 'meal_plan_id'
                        },
                        {   title: 'Delivery First Name',
                            field: 'delivery_first_name'
                        },
                        {   title: 'Delivery Last Name',
                            field: 'delivery_last_name'
                        },
                        {   title: 'Delivery Phone',
                            field: 'delivery_phone'
                        },
                        {   title: 'Meal Plan Description',
                            field: 'meal_plan_desc'
                        },
                        {   title: 'Payment ID',
                            field: 'payment_id'
                        },
                        {   title: 'Recurring',
                            field: 'recurring'
                        },
                        {   title: 'Coupon',
                            field: 'coupon_id'
                        },
                        {   title: 'Amount Due',
                            field: 'amount_due'
                        },
                        {   title: 'Amount Paid',
                            field: 'amount_paid'
                        },
                        {   title: 'Time Paid',
                            field: 'payment_time_stamp'
                        },
                        {   title: 'Credit Card',
                            field: 'cc_num'
                        }
                    ]}
                    data={this.state.data}
                    onRowClick={(event,row) => {
                        this.props.selectPurchaseId(row.purchase_id);
                    }}
                    options={{
                        pageSize: 3,
                        pageSizeOptions: [3,6,9],
                    }}
                />
            </div>
        )
    }
}

export default LatestActivity;