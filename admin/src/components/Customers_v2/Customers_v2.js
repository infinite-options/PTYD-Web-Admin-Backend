import React from "react";
import axios from "axios";
import {Breadcrumbs, Link, MenuItem, Paper, Select, Typography} from "@material-ui/core";

import LatestActivity from "./LatestActivity_v2";
import PurchaseIdMeals from "./PurchaseIdMeals_v2";

class Customers2 extends React.Component {
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
                curComponent.setState({
                    userList: res.data.result.result
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
                    <PurchaseIdMeals
                        purchaseID={this.state.purchase}
                        PURCHASE_MEAL_API_URL={this.props.PURCHASE_MEAL_API_URL}
                    />
                    )}
                </div>
                )}
            </div>
        )
    }

    userListDropDwon = () => {
        return (
            <Paper style={{
                maxWidth: 'fit-content',
                maxWidth: '-moz-fit-content',
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

export default  Customers2;