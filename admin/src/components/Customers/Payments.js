import React from "react";
import axios from "axios";
import { Typography, Paper, InputBase } from "@material-ui/core";
import SearchIcon from "@material-ui/icons/Search";

class Payments extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            loaded: false,
            data: [],
            value: '',
            paymentID: '',
        }
    }

    componentDidMount() {
        let curComponent = this;
        axios
            .get(`${this.props.PURCHASE_API_URL}/${this.props.searchID}`)
            .then(function (res) {
                curComponent.setState({
                    loaded: true,
                    data: res.data.result,
                },() => {
                    console.log('purchases',curComponent.state.data)
                })
            })
            .catch(function (error) {
                console.log(error);
            })
    }

    componentDidUpdate(prevProps) {
        if(this.props.searchID !== prevProps.searchID) {
            this.fetchData();
            this.setState({
                value: '',
                paymentID: '',
            })
        }
    }

    fetchData = () => {
        let curComponent = this;
        axios
            .get(`${this.props.PURCHASE_API_URL}/${this.props.searchID}`)
            .then(function (res) {
                curComponent.setState({
                    data: res.data.result,
                },() => {
                    console.log('purchases',curComponent.state.data)
                })
            })
            .catch(function (error) {
                console.log(error);
            })
    }

    onChange = (event) => {
        this.setState({
            value: event.target.value
        })
    }

    onKeyPress = (event) => {
        if(event.keyCode === 13) {
            this.setState({
                paymentID: this.state.value
            })
        }
    }

    render () {
        if(!this.state.loaded) {
            return <Typography variant="body1"> Loading Purchases </Typography>
        }
        if (!this.state.data || this.state.data.length === 0) {
            return <Typography variant="body1"> No Payments </Typography>
        }

        let curIndex = this.state.data.findIndex((elt) => elt.purchase_id === this.state.paymentID);
        let subscriptionData = this.state.data[curIndex]
        return (
            <div>
                <Typography variant="h5"> {this.state.data[0].delivery_first_name} {this.state.data[0].delivery_last_name} </Typography>
                <Paper style={
                {   width: "80%",
                    padding: '2px 4px',
                    display: 'flex',
                    alignItems: 'center',}
                }>
                    <SearchIcon style={{ padding: '10'}}/>
                    <InputBase
                        placeholder="Enter the Purchase ID"
                        value={this.state.value}
                        onChange={this.onChange}
                        onKeyDown={this.onKeyPress}
                    />
                </Paper>
                {curIndex === -1 && (
                    <Typography variant="body1"> Enter a valid Purchase ID </Typography>
                )}
                {curIndex > -1 &&(
                    <div>
                        <Typography variant="h6"> Subscription Details </Typography>
                        <Typography variant="body1"> Subscription: {subscriptionData.meal_plan_desc} </Typography>
                        <Typography variant="body1"> Payment plan: {subscriptionData.payment_frequency} </Typography>
                        <Typography variant="body1"> Paid weeks remaining: {subscriptionData.paid_weeks_remaining} </Typography>
                        <Typography variant="body1"> Next Charge: ${subscriptionData.amount_due_before_addon} </Typography>
                        <Typography variant="body1"> Next Charge Date: {subscriptionData.next_charge_date} </Typography>
                        <Typography variant="body1"> Next Addon Charge: ${subscriptionData.total_charge} </Typography>
                        <Typography variant="body1"> Next Addon Charge Date: {subscriptionData.next_addon_charge_date} </Typography>
                        <Typography variant="body1"> Coupons: {subscriptionData.coupon_id ? subscriptionData.coupon_id : 'None'} </Typography>
                        <Typography variant="h6"> Credit Card Details </Typography>
                        <Typography variant="body1"> Credit Card: {subscriptionData.cc_num} </Typography>
                        <Typography variant="body1"> Expiration Date: {subscriptionData.cc_exp_date} </Typography>
                        <Typography variant="body1"> CVV: {subscriptionData.cc_cvv} </Typography>
                        <Typography variant="h6"> Delivery Details </Typography>
                        <Typography variant="body1"> Address: {subscriptionData.delivery_address} </Typography>
                        <Typography variant="body1"> Unit: {subscriptionData.delivery_address_unit} </Typography>
                        <Typography variant="body1"> {subscriptionData.delivery_city} {subscriptionData.delivery_state} {subscriptionData.delivery_zip} </Typography>
                        <Typography variant="body1"> Instructions: {subscriptionData.delivery_instructions} </Typography>
                    </div>
                )}
            </div>
        );
    }
}

/*function CustomerInfo(props) {
  const [subscribed, setSubscribed] = useState(false);
  const [mondayAvailable, setMondayAvailable] = useState(false);
  const [purchaseAll, setPurchaseAll] = useState([]);
  const [nextAddonCharge, setNextAddonCharge] = useState(0);

  useEffect(() => {
    fetchData();
  }, [props.searchID]);

  const fetchData = async () => {
    const res = await axios.get(`${props.PURCHASE_API_URL}/${props.searchID}`);
    const purchasesApi = res.data;
    console.log(purchasesApi, "api");

    if (purchasesApi.result.length !== 0) {
      // currPur = purchasesApi.result[0];
      // purchaseId = purchasesApi.result[0].purchase_id;
      setSubscribed(true);
      setMondayAvailable(purchasesApi.result[0].monday_available);
      setPurchaseAll(purchasesApi.result);
      setNextAddonCharge(purchasesApi.result[0].total_charge);
    }
  };

  let subscription_selection = purchaseAll[0];
  if (subscription_selection == null) {
    return <div></div>;
  }
  return (
    <Grid>
      <Cell col={3}>
        {" "}
        <Grid>
          <Cell col={8}>
            <Typography variant="h4">
              Hi, {subscription_selection.delivery_first_name}
              {/!* <th colSpan="2">{this.subscription_dropdown()}</th> *!/}
            </Typography>
          </Cell>
          <div>
            <h4>Subscription Details</h4>
            <p>My Subscription: {subscription_selection.meal_plan_desc}</p>
            <p>Payment Plan: {subscription_selection.payment_frequency}</p>
            <p>
              Paid Weeks Remaining:{" "}
              {subscription_selection.paid_weeks_remaining}
            </p>
            <p>
              Next Charge: ${subscription_selection.amount_due_before_addon}
            </p>
            <p>Next Charge Date: {subscription_selection.next_charge_date}</p>
            <p>Next Addon Charge: ${nextAddonCharge}</p>
            <p>
              Next Addon Charge Date:{" "}
              {subscription_selection.next_addon_charge_date}
            </p>
            <p>
              Coupons:{" "}
              {subscription_selection.coupon_id
                ? subscription_selection.coupon_id
                : "None"}
            </p>
            <h4>Credit Card Details</h4>{" "}
            <p>Credit Card: {subscription_selection.cc_num}</p>
            <p>Expiration Date: {subscription_selection.cc_exp_date}</p>
            <p>CVV: {subscription_selection.cc_cvv}</p>
            <h4>Delivery Details</h4>{" "}
            <p>Address: {subscription_selection.delivery_address}</p>
            <p>Unit: {subscription_selection.delivery_address_unit}</p>
            <p>
              City, State ZIP: {subscription_selection.delivery_city},{" "}
              {subscription_selection.delivery_state}{" "}
              {subscription_selection.delivery_zip}
            </p>
            <p>Instructions: {subscription_selection.delivery_instructions}</p>
          </div>
        </Grid>
      </Cell>{" "}
    </Grid>
  );
}*/


export default Payments;