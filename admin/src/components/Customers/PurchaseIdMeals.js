import React from 'react';
import axios from 'axios';
import { Typography } from "@material-ui/core";
import MaterialTable from 'material-table';
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
    root: {
        margin: '15px 0',
    },
    
    title: {
        color: '#469b47',
    },

  });

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
        if(this.props.purchaseID === '') {
            curComponent.setState({
                loaded: true,
            })
        } else {
            axios
                .get(`${this.props.PURCHASE_MEAL_API_URL}/${this.props.purchaseID}`)
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
            return <Typography variant="body1" style={{ margin: '15px 0' }} > Loading Weekly Meal Selections </Typography>
        }
        const { classes } = this.props;
        return (
            <div className={classes.root}>
                <MaterialTable
                    title="Weekly Meal Selections"
                    columns={[
                        {   title: 'Meal Plan Description',
                            field: 'meal_plan_desc',
                        },
                        {   title: 'Saturday',
                            field: 'Saturday',
                        },
                        {   title: 'Delivery Day',
                            field: 'delivery_day',
                        },
                        {   title: 'Meal Plan Selection',
                            field: 'meal_name',
                        },
                    ]}
                    data={this.state.data}
                    options={{
                        cellStyle: {
                            lineHeight: 1.2,
                            padding: 5,
                        },
                        headerStyle: {
                            lineHeight: 1.2,
                            padding: 5,
                        },
                        pageSize: 5,
                        pageSizeOptions: [5,15,25],
                    }}
                    components={{
                        Toolbar: props => (
                            <div style={{
                                padding: '10px 0 0 15px'
                            }}>
                                <Typography variant="h5" className={classes.title}>
                                   {props.title}
                                </Typography>
                            </div>
                        ),
                    }}
                />
            </div>
        );
    }
};

export default withStyles(styles,{withTheme:true})(PurchaseIdMeals);