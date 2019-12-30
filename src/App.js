import React from "react";
import "./App.css";
import Main from "./components/main";

import { Layout, Header, Drawer, Navigation, Content } from "react-mdl";

function App() {
  return (
    <div style={{ height: "300px", position: "relative" }}>
      <Layout fixedHeader>
        <Header
          title={
            <span>
              <span style={{ color: "#ddd" }}>Area / </span>
              <strong>The Title</strong>
            </span>
          }
        >
          <Navigation>
            <a href="/">Link</a>
            <a href="/">Link</a>
            <a href="/">Link</a>
            <a href="/">Link</a>
          </Navigation>
        </Header>
        <Drawer title="Title">
          <Navigation>
            <a href="/">Link</a>
            <a href="/">Link</a>
            <a href="/">Link</a>
            <a href="/">Link</a>
          </Navigation>
        </Drawer>
        <Content>
          <Main />
        </Content>
      </Layout>
    </div>
  );
}

export default App;
