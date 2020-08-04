import React from 'react';
import axios from 'axios';
import { Typography } from "@material-ui/core";
import MaterialTable from 'material-table';

class AllPayments extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            loaded: false,
            data: [],
            view: [],
        }
    }

    componentDidMount() {
        let curComponent = this;
        if(this.props.userID === '' || this.props.userID === this.props.noUser) {
            curComponent.setState({
                loaded: true,
            })
        } else {
            axios
            .get(`${this.props.ALLPAYMENTS_API_URL}/${this.props.userID}`)
            .then(function (res) {
                curComponent.setState({
                    loaded: true,
                    data: res.data.result.result,
                }, () => {
                    curComponent.filterData();
                })
            })
            .catch(function (error) {
                console.log(error);
            })
        }
    }

    componentDidUpdate(prevProps) {
        if(this.props.userID !== prevProps.userID) {
            if(this.props.userID !== this.props.noUser) {
                this.loadData();
            }
        } else {
            if(this.props.purchaseID !== prevProps.purchaseID) {
                this.filterData();
            }
        }
    }

    loadData = () => {
        let curComponent = this;
        axios
            .get(`${this.props.ALLPAYMENTS_API_URL}/${this.props.userID}`)
            .then(function (res) {
                curComponent.setState({
                    loaded: true,
                    data: res.data.result.result,
                }, () => {
                    curComponent.filterData();
                })
            })
            .catch(function (error) {
                console.log(error);
            })
    }

    filterData = () => {
        let filteredView = this.state.data.filter(payment => (payment.purchase_id === this.props.purchaseID))
        this.setState({
            view: filteredView,
        })
    }

    render() {
        if(!this.state.loaded) {
            return <Typography variant="body1" style={{ margin: '15px 0' }} > Loading All payments </Typography>
        }
        return (
            <div style={{ margin: "15px 0" }}>
                <MaterialTable
                    title="All Payments"
                    columns={[
                        {   title: 'Payment Id',
                            field: 'payment_id'
                        },
                        {   title: 'Meal Plan Description',
                            field: 'meal_plan_desc'
                        },
                        {   title: 'Recurring',
                            field: 'recurring'
                        },
                        {   title: 'Amount due',
                            field: 'amount_due'
                        },
                        {   title: 'Amount paid',
                            field: 'amount_paid'
                        },
                        {   title: 'Payment time stamp',
                            field: 'payment_time_stamp'
                        },
                        {   title: 'Pay type',
                            field: 'payment_type'
                        },
                        {   title: 'Addon',
                            field: 'isAddon'
                        },
                        {   title: 'Last Payment',
                            field: 'previous_payment'
                        },
                    ]}
                    data={this.state.view}
                    options={{
                        cellStyle: {
                            lineHeight: 1.2,
                            padding: 5,
                        },
                        headerStyle: {
                            lineHeight: 1.2,
                            padding: 5,
                        },
                        maxBodyHeight: 120,
                        pageSize: 3,
                        pageSizeOptions: [3],
                    }}
                    components={{
                        Toolbar: props => (
                            <div style={{
                                padding: '10px 0 0 15px'
                            }}>
                                <Typography variant="h6"> {props.title} </Typography>
                            </div>
                        ),
                    }}
                />
            </div>
        )
    }

}

export default AllPayments;