import React, { Component } from "react";

export default class UnknownSession extends Component {
  render() {
    return (
      <div class="container text-center">
        <h1>Error: Invalid Login Session</h1>
        <div>We couldnt verify that you are the user currently logged in. Please log out and log back in.</div>
      </div>
    );
  }
}
