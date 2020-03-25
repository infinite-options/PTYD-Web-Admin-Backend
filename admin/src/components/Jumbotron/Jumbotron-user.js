import React, { Component } from "react";
import { Jumbotron as Jumbo, Container } from "react-bootstrap";
import styled from "styled-components";
import PTYDBanner from "../../assets/yellow.jpg";
const Styles = styled.div`
  .jumbo {
    background: url(${PTYDBanner}) no-repeat fixed bottom;
    background-size: contain;
    color: #ccc;
    height: 200px;
    position: relative;
    z-index: -2;
  }

  .overlay {
    background-color: #000;
    opacity: 0.6;
    position: absolute;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    z-index: -1;
  }
`;
class JumbotronUser extends Component {
  render() {
    return (
      <Styles>
        <Jumbo fluid className="jumbo">
          <div className="overlay"></div>
          <Container>
            <center>
              <h1 style={{ color: "white" }}>
                {" "}
                Prep To Your Door User Map Page
              </h1>
            </center>
          </Container>
        </Jumbo>
      </Styles>
    );
  }
}
export default JumbotronUser;
