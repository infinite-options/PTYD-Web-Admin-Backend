import React from "react";
import "./App.css";
import Main from "./components/main";

function App() {
  return (
    <div className="sidenav">
      <div className="sidenav-space">
        <nav className="sidenav-dark">
          <div className="sidenav-menu nav">
            <div className="menu">Admin</div>
            <a className="link" href="/">
              {/* <div className="icon-title">
                <i className="fas fa-home"></i>
              </div> */}
              Main
            </a>
          </div>
        </nav>
      </div>
      <Main />
    </div>
  );
}

export default App;
