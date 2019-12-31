import React, { Component } from "react";
import "./App.css";
import { Layout, Header, Navigation, Drawer, Content } from "react-mdl";
import Main from "./components/main";
import { Link } from "react-router-dom";

class App extends Component {
  static defaultProps = {
    icon: "fas fa-home"
  };

  render() {
    return (
      <div className="demo-big-content">
        <Layout>
          <Header
            className="header-color"
            title={
              <span>
                <span style={{ color: "#ddd" }}>Area / </span>
                <strong>The Title</strong>
              </span>
            }
            scroll
          >
            <Navigation>
              <a href="/">Link</a>
              <a href="/">Link</a>
              <a href="/">Link</a>
              <a href="/">Link</a>
            </Navigation>
          </Header>
          <Drawer
            style={{ backgroundColor: "#493f3f" }}
            className="header-color-background"
            title={
              <Link style={{ fontFamily: "Kalam", color: "white" }} to="/">
                Home
              </Link>
            }
          >
            <Navigation>
              <a href="/">Link</a>
              <a href="/">Link</a>
              <a href="/">Link</a>
              <a href="/">Link</a>
            </Navigation>
          </Drawer>
          <Content>
            <div className="page-content" />
            <Main />
          </Content>
        </Layout>
      </div>
    );
  }
}

export default App;
