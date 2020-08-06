import React from 'react';
import axios from 'axios';
import { Button, Paper, Typography, TextField } from "@material-ui/core";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
    root: {
      
    },
    
    sectionHead: {
        marginTop: '12px'
    },

    noteArea: {
        minHeight: '80px',
        padding: '15px',
        marginRight: '15px'
    },

    noteInput: {
        width: '100%',
        minHeight: '80px',
    }

  });

class Delivery extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            loaded: false,
            data: [],
            currentNote: '',
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
            <div style={{ margin: "5px 0" }}>
                <Typography variant="h5"> Delivery Info </Typography>
                {this.deliveryInfo()}
            </div>
        );
    }

    deliveryInfo = () => {
        const { classes } = this.props;
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
        <div className={classes.root}>
            <Typography variant="h6"> Contact Information </Typography>
            <Typography variant="body1"> Name: {deliveryData.delivery_first_name} {deliveryData.delivery_last_name} </Typography>
            <Typography variant="body1"> Phone: {deliveryData.delivery_phone} </Typography>
            <Typography variant="h6" className={classes.sectionHead}> Address </Typography>
            <Typography variant="body1"> {deliveryData.delivery_address}  {deliveryData.delivery_address_unit} </Typography>
            <Typography variant="body1"> {deliveryData.delivery_city} {deliveryData.delivery_state} {deliveryData.delivery_zip} </Typography>
            <Typography variant="h6" className={classes.sectionHead}> Instructions </Typography>
            <Typography variant="body1"> {deliveryData.delivery_instructions} </Typography>
            <Typography variant="h6" className={classes.sectionHead}> Notes </Typography>
            <Paper className={classes.noteArea}>
                <TextField
                    multiline
                    value={this.state.currentNote}
                    onChange={(event) => {
                        this.setState({
                            currentNote: event.target.value,
                        })
                    }}
                    className={classes.noteInput}
                />
                <Button> Save </Button>
                <Button
                onClick={(event) => {
                    this.setState({
                        currentNote: '',
                    })
                }}>
                    Clear
                </Button>
            </Paper>
        </div>
        )
    }
};

export default withStyles(styles,{withTheme:true})(Delivery);