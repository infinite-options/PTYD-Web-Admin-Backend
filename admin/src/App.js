import React from "react";
import "./App.css";
import Main from "./components/main";
import { Nav } from "react-bootstrap";
// import styled from "styled-components";
import { Container, Navbar, NavDropdown } from "react-bootstrap";
import { Header } from "react-mdl";
import Button from "muicss/lib/react/button";
import Badge from "@material-ui/core/Badge";
import MailIcon from "@material-ui/icons/Mail";

// const Styles = styled.div`
//   navbar {
//     background-color: #222;
//   }
//   .navbar-brand .navbar-nav .nav-link {
//     color: #bbb;
//     &:hover {
//       color: withTheme;
//     }
//   }
// `;
function App() {
  return (
    <div>
      {/* <Container>
        <Styles>
          <Navbar expand="lg">
            <Navbar.Brand href="/">Prep To Your Door</Navbar.Brand>
            <Navbar.Toggle aria-controls="basic-navbar-nav" />
            <Navbar.Collapse id="basic-navbar-nav">
              <Nav className="ml-auto">
                <Nav.Item>
                  <Nav.Link href="/">Home</Nav.Link>
                </Nav.Item>
                <Nav.Item>
                  <Nav.Link href="/about">About</Nav.Link>
                </Nav.Item>
                <Nav.Item>
                  <Nav.Link href="/contact">Contact</Nav.Link>
                </Nav.Item>{" "}
              </Nav>
            </Navbar.Collapse>
          </Navbar>
          <Main />
        </Styles>
      </Container> */}

      {/* <Container>
        <Header>
          <Nav
            className="navbar fixed-top justify-content-center"
            Style="min-height:140px; background-color:white;"
            activeKey="/home"
          >
            <div Style="margin-top:-25px">
              <a className="navbar-brand" href="/">
                <img
                  src="https://static.wixstatic.com/media/db4706_fb464984e3094a629a8bfb5297ca38c7~mv2.png/v1/fill/w_110,h_81,al_c,q_90/LOGO%2012_19_18%20.webp"
                  width="88"
                  height="65"
                  alt=""
                ></img>
              </a>
              <p
                className="font_9"
                Style="font-size:11px; line-height:0.8em; text-align:center; letter-spacing:0.25em; font-size:11px; color:#E38B19; font-weight:bold;"
              >
                AUSTIN, TX
              </p>
            </div>

            <Nav.Item Style="margin-top:30px">
              <Nav.Link Style="color:black" href="/customerProfile">
                customer profile
              </Nav.Link>
            </Nav.Item>

            <Nav.Item Style="margin-top:30px">
              <Nav.Link Style="color:black" href="/userMap">
                user map
              </Nav.Link>
            </Nav.Item>
            <Nav.Item Style="margin-top:30px">
              <Nav.Link Style="color:black" href="/">
                track orders
              </Nav.Link>
            </Nav.Item>

            <Nav.Item Style="margin-top:30px;">
              <Nav.Link Style="color:black" href="/editCreateMeal">
                edit/create meals
              </Nav.Link>
            </Nav.Item>
            <Nav.Item Style="margin-top:30px;">
              <Nav.Link Style="color:black" href="/createMenu">
                create menus
              </Nav.Link>
            </Nav.Item>

            <div style={{ padding: "30px 0 0 60px " }}>
              <a href="/">
                <Button variant="raised">Login</Button>
              </a>
            </div>
          </Nav>
        </Header> */}
      <Navbar collapseOnSelect expand="xl" bg="dark" variant="dark">
        <Navbar.Brand href="/">Prep To Your Door</Navbar.Brand>
        <Navbar.Toggle aria-controls="responsive-navbar-nav" />
        <Navbar.Collapse id="responsive-navbar-nav">
          <Nav className="mr-auto" style={{ marginLeft: "3%" }}>
            <NavDropdown title="Do It Yourself" id="collasible-nav-dropdown">
              <NavDropdown.Item href="/createMenu">
                Create Menus
              </NavDropdown.Item>
              <NavDropdown.Item href="/editMealDesc">
                Edit Meals
              </NavDropdown.Item>
              <NavDropdown.Item href="/createMeal">
                Create Meals
              </NavDropdown.Item>
              <NavDropdown.Item href="/editMeal">
                Edit Meal Recipes
              </NavDropdown.Item>
            </NavDropdown>
            &nbsp;&nbsp;&nbsp;
            <Nav.Link href="/">Settings</Nav.Link>&nbsp;&nbsp;&nbsp;
            <Nav.Link href="/orders">Orders</Nav.Link>&nbsp;&nbsp;&nbsp;
            <Nav.Link href="/customers">Customers</Nav.Link>&nbsp;&nbsp;&nbsp;
            <Nav.Link>
              <Badge
                // badgeContent={42}
                color="secondary"
                anchorOrigin={{
                  vertical: "top",
                  horizontal: "right",
                }}
              ></Badge>
            </Nav.Link>
          </Nav>
          <Nav>
            <Nav.Link href="/">Profile</Nav.Link>&nbsp;&nbsp;&nbsp;
            <Nav.Link eventKey={2} href="/">
              Log Out
            </Nav.Link>
          </Nav>
        </Navbar.Collapse>
      </Navbar>
      <Main />
      {/* </Container> */}
    </div>
  );
}
export default App;
