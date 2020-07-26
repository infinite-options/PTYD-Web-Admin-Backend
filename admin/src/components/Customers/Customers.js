import React from "react";
import axios from "axios";
import {Breadcrumbs, InputLabel, Link, MenuItem, Paper, Select, Typography} from "@material-ui/core";

import LatestActivity from "./LatestActivity";
import PurchaseIdMeals from "./PurchaseIdMeals";
import AllPayments from "./AllPayments";

class Customers extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            userList: [],
            user: '',
            purchase: '',
        }
    }

    componentDidMount() {
        let curComponent = this;
        axios
            .get(`${this.props.ACCOUNTLIST_API_URL}`)
            .then(function(res) {
                let data = res.data.result.result;
                data.sort(function compareFunction(a,b) {
                    let result = (a.first_name).localeCompare(b.first_name);
                    if(result !== 0) {
                        return result;
                    }
                    result = (a.last_name).localeCompare(b.last_name);
                    return result;
                })
                curComponent.setState({
                    userList: data,
                })
            })
            .catch(function(error) {
                console.log(error);
            })
    }

    selectPurchaseId = (purchaseId) => {
        this.setState({
            purchase: purchaseId
        })
    }

    render() {
        return (
            <div style={{ padding: "10px 20px" }} >
                <Breadcrumbs aria-label="breadcrumb" style={{ marginBottom: "10px" }}>
                    <Link color="inherit">Admin Site</Link>
                    <Typography color="textPrimary">Customers</Typography>
                </Breadcrumbs>
                { this.userListDropDwon() }
                { this.state.user !== '' && (
                <div>
                    <LatestActivity
                        searchID={this.state.user}
                        LATESTACTIVITY_API_URL={this.props.LATESTACTIVITY_API_URL}
                        selectPurchaseId={this.selectPurchaseId}
                    />
                    {
                    this.state.purchase !== '' && (
                        <div>
                            <PurchaseIdMeals
                                purchaseID={this.state.purchase}
                                PURCHASE_MEAL_API_URL={this.props.PURCHASE_MEAL_API_URL}
                            />
                            <AllPayments
                                userID={this.state.user}
                                purchaseID={this.state.purchase}
                                ALLPAYMENTS_API_URL={this.props.ALLPAYMENTS_API_URL}
                            />
                        </div>
                    )}
                </div>
                )}
            </div>
        )
    }

    userListDropDwon = () => {
        return (
            <Paper style={{
                padding: '2px 4px',
                display: 'flex',
                alignItems: 'center',
            }}>
                <Typography variant='body1'> &nbsp;&nbsp;User&nbsp;&nbsp;&nbsp;&nbsp; </Typography>
                <Select
                    value={this.state.user}
                    onChange={(event) => {
                        this.setState({
                            user: event.target.value,
                            purchase: '',
                        })
                    }}
                    style={{
                        width: "100%",
                    }}
                >
                    <MenuItem value=""> Select a Customer </MenuItem>
                    {
                        this.state.userList.map(user => (
                            <MenuItem value={user.user_uid}> {user.first_name} {user.last_name} {user.user_uid} </MenuItem>
                        ))
                    }
                </Select>
            </Paper>
        )
    }
}

export default  Customers;