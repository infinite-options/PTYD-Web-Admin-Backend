import React, {Component, Fragment} from "react";

export default class Selector extends Component {
  constructor(props) {
    super(props);
    this.state = {
      purchases: this.props.purchases
    };
  }
  componentDidUpdate = prevProps => {
    // we need it here because we did not wait till server feed back its parent
    if (prevProps.purchases.length !== this.state.purchases.length) {
      this.setState({purchases: this.props.purchases});
      this.setState({currentPurchase: this.props.purchases[0]});
    }
  };
  ChangePurchase = event => {
    this.setState({currentPurchase: this.state.purchases[event.target.value]});
    this.props.ChangeCurrentPurchase(this.state.purchases[event.target.value]);
  };
  render() {
    return (
      <Fragment>
        <select onChange={this.ChangePurchase} className='select'>
          {this.state.purchases.map((purchase, key) => (
            <option key={key} value={key}>
              {purchase.meal_plan_desc}
            </option>
          ))}
        </select>
      </Fragment>
    );
  }
}
