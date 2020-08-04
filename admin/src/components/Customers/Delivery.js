import React from 'react';
import axios from 'axios';
import { Typography } from "@material-ui/core";
import MaterialTable from 'material-table';

class Delivery extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            loaded: false,
            data: [],
        }
    }

    componentDidMount() {
        let curComponent = this;
        if(this.props.purchaseID === '') {
            curComponent.setState({
                loaded: true,
            })
        } else {
            axios
                .get(`${this.props.DELIVERY_API_URL}/${this.props.purchaseID}`)
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
    }

    componentDidUpdate(prevProps) {
        if(this.props.purchaseID !== prevProps.purchaseID) {
            this.fetchData();
        }
    }

    fetchData = () => {
        let curComponent = this;
        axios
            .get(`${this.props.DELIVERY_API_URL}/${this.props.purchaseID}`)
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
            return <Typography variant="h6"> Loading Delivery Info </Typography>
        }
        return (
            <div style={{ margin: "15px 0" }}>
                {/* <MaterialTable
                    title="Delivery Information"
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
                        {   title: 'Delivery Address',
                            field: 'delivery_address',
                        },
                        {   title: 'Delivery Address Unit',
                            field: 'delivery_address_unit',
                        },
                        {   title: 'Delivery City',
                            field: 'delivery_city',
                        },
                        {   title: 'Delivery ZIP',
                            field: 'delivery_zip',
                        },
                        {
                            title: 'Delivery Instructions',
                            field: 'delivery_instructions',
                        },
                    ]}
                    data={this.state.data}
                    options={{
                        tableLayout: 'auto',
                        pageSize: 1,
                        pageSizeOptions: [1,3],
                    }}
                    style={{ margin: "10px 0" }}
                /> */}
                <Typography variant="h5"> Delivery Info </Typography>
                {this.deliveryInfo()}
            </div>
        );
    }

    deliveryInfo = () => {
        if(this.props.purchaseID === '') {
            return (
                <Typography variant="body1"> Select Purchase to see delivery information </Typography>
            )
        }
        let deliveryData = this.state.data[0];
        if(!deliveryData) {
            return ( <Typography variant="body1"> No Delivery Information </Typography> );
        }
        return (
        <div>
            <Typography variant="h6"> Contact Information </Typography>
            <Typography variant="body1"> Name: {deliveryData.delivery_first_name} {deliveryData.delivery_last_name} </Typography>
            <Typography variant="body1"> Phone: {deliveryData.delivery_first_phone} </Typography>
            <Typography variant="h6"> Address </Typography>
            <Typography variant="body1"> {deliveryData.delivery_address}  {deliveryData.delivery_address_unit} </Typography>
            <Typography variant="body1"> {deliveryData.delivery_city} {deliveryData.delivery_state} {deliveryData.delivery_zip} </Typography>
            <Typography variant="h6"> Instructions </Typography>
            <Typography variant="body1"> {deliveryData.delivery_instructions} </Typography>
        </div>
        )
    }
};

export default Delivery;