import React from "react";
import axios from "axios";
import { Typography } from "@material-ui/core";

class AllPayments extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            loaded: false
        }
    }

    componentDidMount() {
        axios
            .get()
    }

    render() {
        if(!this.state.loaded) {
            return <Typography variant="body1"> Loading All Payments </Typography>
        }
        return (
            <div></div>
        )
    }
}

export default AllPayments;