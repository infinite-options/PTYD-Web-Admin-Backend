import React from "react";
import {Breadcrumbs, Link, Typography} from "@material-ui/core";

class Customers_v2 extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            userList: [],
            user: '',
            purchase: '',
        }
    }

    componentDidMount() {
    }

    render() {
        return (
            <div style={{ padding: "10px 20px" }} >
                <Breadcrumbs aria-label="breadcrumb" style={{ marginBottom: "10px" }}>
                    <Link color="inherit">Admin Site</Link>
                    <Typography color="textPrimary">Customers</Typography>
                </Breadcrumbs>
                New Customers Page
            </div>
        )
    }
}

export default  Customers_v2;