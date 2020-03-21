import React, { Component } from "react";
import { Table } from "react-bootstrap";

export default class Mealtable extends Component {
  render() {
    return (
      <div>
        <Table striped bordered hover>
          <thead>
            <tr>
              <th>#</th>
              <th>Subscription</th>
              <th>Meal Name</th>
              <th>Qty</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td>Wkly Spcl 1</td>
              <td>{this.props.mealname1}</td>
              <td></td>
            </tr>
            <tr>
              <td>2</td>
              <td>Wkly Spcl 2</td>
              <td>{this.props.mealname2}</td>
              <td></td>
            </tr>
            <tr>
              <td>3</td>
              <td>Wkly Spcl 3</td>
              <td>{this.props.mealname3}</td>
              <td></td>
            </tr>
            <tr>
              <td>4</td>
              <td>Seas Fav 1</td>
              <td>{this.props.mealname4}</td>
              <td></td>
            </tr>
            <tr>
              <td>5</td>
              <td>Seas Fav 2</td>
              <td>{this.props.mealname5}</td>
              <td></td>
            </tr>
            <tr>
              <td>6</td>
              <td>Seas Fav 3</td>
              <td>{this.props.mealname6}</td>
              <td></td>
            </tr>
          </tbody>
        </Table>
      </div>
    );
  }
}
