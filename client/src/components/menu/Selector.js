import React, {Component, Fragment} from "react";

export default class Selector extends Component {
  constructor(props) {
    super(props);
    this.state = {
      purchases: this.props.purchases,
      currentPurchase: this.props.purchases[0]
    };
  }
  ChangePurchase = event => {
    this.setState({currentPurchase: this.state.purchases[event.target.value]});
    this.props.ChangeCurrentPurchase(this.state.currentPurchase);
  };
  render() {
    return (
      <Fragment>
        <select onChange={this.ChangePurchase}>
          {this.state.purchases.map((option, key) => (
            <option key={key} value={key}>
              {option.name}
            </option>
          ))}
        </select>
      </Fragment>
    );
  }
}
