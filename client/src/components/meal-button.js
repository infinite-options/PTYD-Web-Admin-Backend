import React, { Component } from "react";
import { Link } from "react-router-dom";

import {
  ButtonToolbar,
  Button,
  Modal,
  Form,
  FormControl
} from "react-bootstrap";

export default class MealButton extends Component {
  constructor(props) {
    super(props);
    console.log("testtest");
  }
  state = {
    count: 0,
    buttonS: false,
    buttonM: false,
    buttonSkip: false,
    buttonSelect: false,
    buttonSurprise: false,
    requestModal: false
  };

  changeButtonS = () => {
    this.setState({
      buttonS: true,
      buttonM: false,
      buttonSkip: false
    });

    this.button.disabled = this.button.enabled;
    this.button2.disabled = this.button2.enabled;
  };

  changeButtonM = () => {
    this.setState({
      buttonM: true,
      buttonS: false,
      buttonSkip: false
    });

    this.button.disabled = this.button.enabled;
    this.button2.disabled = this.button2.enabled;
  };

  changeButtonSkip = () => {
    this.setState({
      buttonM: false,
      buttonS: false,
      buttonSkip: true,

      buttonSurprise: false,
      buttonSelect: false
    });
    this.button.disabled = !this.button.disabled;
    this.button2.disabled = !this.button2.disabled;
  };

  changeButtonSelect = () => {
    this.setState({
      buttonSelect: true,
      buttonSurprise: false
    });
  };
  changeButtonSurprise = () => {
    this.setState({
      buttonSelect: false,
      buttonSurprise: true
    });
  };
  specialRequest = () => {
    this.setState({
      requestModal: !this.state.requestModal
    });
  };
  render() {
    const orange = {
      width: "80px",
      height: "80px",
      backgroundColor: "#cd790c",
      color: "white"
    };

    const hide = {
      width: "80px",
      height: "80px",
      backgroundColor: "white",
      color: "black"
    };
    const green = {
      width: "80px",
      height: "80px",
      backgroundColor: "#427c42",
      color: "white"
    };

    function SpecialRequestModal(props) {
      return (
        <Modal
          {...props}
          size="lg"
          aria-labelledby="contained-modal-title-vcenter"
          centered
        >
          <Modal.Header closeButton>
            <Modal.Title id="contained-modal-title-vcenter">
              Special Request
            </Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <Form.Group controlId="exampleForm.ControlTextarea1">
              <Form.Control as="textarea" rows="3" />
            </Form.Group>
          </Modal.Body>
          <Modal.Footer>
            <Button variant="primary" type="submit">
              Submit
            </Button>
            <Button onClick={props.onHide}>Close</Button>
          </Modal.Footer>
        </Modal>
      );
    }

    function SpecialRequestAnimation() {
      const [modalShow, setModalShow] = React.useState(false);

      return (
        <ButtonToolbar>
          <Button
            variant="outline-dark"
            style={{ width: "80px", height: "80px" }}
            onClick={() => setModalShow(true)}
          >
            Special Requests
          </Button>

          <SpecialRequestModal
            show={modalShow}
            onHide={() => setModalShow(false)}
          />
        </ButtonToolbar>
      );
    }

    return (
      <div>
        <ButtonToolbar>
          <div className="radio">
            <Button
              variant="outline-dark"
              onClick={this.changeButtonS}
              style={this.state.buttonS ? green : hide}
            >
              {this.props.day1}
              <br />
              {this.props.date1}
            </Button>
            &nbsp;
            <Button
              variant="outline-dark"
              onClick={this.changeButtonM}
              style={this.state.buttonM ? green : hide}
            >
              {this.props.day2}
              <br />
              {this.props.date2}
            </Button>
            &nbsp;
            <Button
              variant="outline-dark"
              onClick={this.changeButtonSkip}
              style={this.state.buttonSkip ? orange : hide}
            >
              Skip This Week
            </Button>
          </div>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          {/* <Link
            to={{
              pathname: "/select-meal"
            }}
          > */}
          <Button
            variant="outline-dark"
            ref={button => (this.button = button)}
            style={this.state.buttonSelect ? green : hide}
            onClick={this.changeButtonSelect}
          >
            Select Meal
          </Button>
          {/* </Link> */}
          &nbsp;
          <Button
            variant="outline-dark"
            ref={button => (this.button2 = button)}
            onClick={this.changeButtonSurprise}
            style={this.state.buttonSurprise ? green : hide}
          >
            Surprise Me!
          </Button>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <SpecialRequestAnimation />
          <div style={this.state.buttonSelect ? {} : { display: "none" }}>
            <Modal.Dialog>
              <Modal.Header closeButton>
                <Modal.Title>Modal title</Modal.Title>
              </Modal.Header>

              <Modal.Body>
                <p>Modal body text goes here.</p>
              </Modal.Body>

              <Modal.Footer>
                <Button variant="secondary">Close</Button>
                <Button variant="primary">Save changes</Button>
              </Modal.Footer>
            </Modal.Dialog>
          </div>
          <div style={this.state.buttonSurprise ? {} : { display: "none" }}>
            <Modal.Dialog>
              <Modal.Header closeButton>
                <Modal.Title>Mdddd</Modal.Title>
              </Modal.Header>

              <Modal.Body>
                <p>Modal body text goes here.</p>
              </Modal.Body>

              <Modal.Footer>
                <Button variant="secondary">Close</Button>
                <Button variant="primary">Save changes</Button>
              </Modal.Footer>
            </Modal.Dialog>
          </div>{" "}
        </ButtonToolbar>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </div>
    );
  }
}
