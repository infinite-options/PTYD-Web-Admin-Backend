import React, { Component } from "react";
import { Card, Accordion } from "react-bootstrap";

class Question extends Component {
  render() {
    return (
      <div>
        <Accordion defaultActiveKey="0">
          <Card>
            <Accordion.Toggle as={Card.Header} eventKey="0">
              {this.props.question}
            </Accordion.Toggle>
            <Accordion.Collapse eventKey="0">
              <Card.Body>{this.props.answer}</Card.Body>
            </Accordion.Collapse>
          </Card>
        </Accordion>
      </div>
    );
  }
}

export default Question;
