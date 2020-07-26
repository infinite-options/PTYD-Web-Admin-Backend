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

    componentDidUpdate(prevProps) {
        if(this.props.purchaseID !== prevProps.purchaseID) {
            this.filterData();
        }
    }

    filterData = () => {
        let filteredView = this.state.data.filter(payment => (payment.purchase_id === this.props.purchaseID))
        this.setState({
            view: filteredView,
        })
    }

    render() {
        if(!this.state.loaded) {
            return <Typography variant="body1" style={{ margin: '30px 0' }} > Loading All payments </Typography>
        }
        return (
            <div style={{ margin: "30px 0" }}>
                <MaterialTable
                    title="All Payments"
                    columns={[
                        { title: 'Payment Id', field: 'payment_id'},
                        { title: 'Recurring', field: 'recurring'},
                        { title: 'Amount due', field: 'amount_due'},
                        { title: 'Amount paid', field: 'amount_paid'},
                        { title: 'Payment time stamp', field: 'payment_time_stamp'},
                        { title: 'Pay type', field: 'payment_type'},
                    ]}
                    data={this.state.view}
                />
            </div>
        )
    }

}

export default AllPayments;