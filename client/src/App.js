import React, {useEffect, useState, Fragment} from "react";
// import {Header, Content, Grid, Cell} from "react-mdl";
import {Button, Navbar, Col} from "react-bootstrap";
// import {Navigation, Drawer,Layout, Row,  } from "react-mdl";
// import {Link} from "react-router-dom";

import "./App.css";
// import "bootstrap/dist/css/bootstrap.min.css";

import Main from "./components/main";

import Nav from "react-bootstrap/Nav";
// import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import NavDropdown from "react-bootstrap/NavDropdown";
import Cookies from "js-cookie";

import logo from "./img/LOGO-homepage.png";

//using react google analystic
import ReactGA from "react-ga";
//using facebook pixel https://www.npmjs.com/package/react-fb-pixel
import ReactPixel from "react-facebook-pixel";

const App = props => {
  const [isAuthenticated, userHasAuthenticated] = useState(false);
  const [isAuthenticating, setIsAuthenticating] = useState(true);
  const [first_name, setFirstname] = useState(null);
  const [user_uid, setUser_uid] = useState(null);

  useEffect(() => {
    onLoad();
    ReactGA.initialize("UA-173037172-1");
    ReactGA.pageview(window.location.pathname + window.location.search);

    //facebook pixel goes here
    ReactPixel.init("342011940130879");
    ReactPixel.pageView();
    // eslint-disable-next-line
  }, []);

  function onLoad() {
    try {
      if (!isAuthenticated && searchCookie4Login("loginStatus") !== null) {
        userHasAuthenticated(true);
        let first = searchCookie4Login("loginStatus");
        setFirstname(first);
        if (searchCookie4UserID("loginStatus") !== null) {
          let uid = searchCookie4UserID("loginStatus");
          setUser_uid(uid);
        }
      } else if (
        !isAuthenticated &&
        searchCookie4Login("loginStatus") === null
      ) {
        document.cookie = `loginStatus=; path=/`;
        console.log("First time? Resetting document cookie");
      }
    } catch (err) {
      console.log(err);
      // if (err !== "No current user") {
      //   alert(e);
      // }
    }
    setIsAuthenticating(false);
  }
  const getCookieAttrHelper = (cname, type) => {
    const values = Cookies.get(cname);
    if (values === "" || values === undefined) {
      return null;
    } else {
      for (let val of values.split(",")) {
        let [n, v] = val.split(":");
        if (n === type) {
          return v;
        }
      }
      return null;
    }
  };
  function searchCookie4Login(cname) {
    // pass cookie name to look for user's first name
    return getCookieAttrHelper(cname, "first_name");
  }

  function searchCookie4UserID(cname) {
    //// pass cookie name to look for user's id
    return getCookieAttrHelper(cname, "user_uid");
  }

  let stuff = !isAuthenticating && (
    <div>
      <div className='row justify-content-center text-nowrap'>
        <Navbar collapseOnSelect expand='lg'>
          <Navbar.Brand href='/'>
            {/* <div className="navigation-logo-container"> */}
            <a className='navbar-brand' href='/'>
              <img src={logo} alt='Logo' className='logo' />
            </a>
            <div className='logo-austin-houston'>
              <p className='font9'>AUSTIN &</p>
              <p className='font9'>HOUSTON</p>
            </div>
            {/* </div> */}
          </Navbar.Brand>

          <Navbar.Toggle
            aria-controls='responsive-navbar-nav'
            // class="justify-content-md-end"
          />
          <Navbar.Collapse id='responsive-navbar-nav'>
            <Nav
              // className="mr-auto"
              // className="navbar fixed-top justify-content-center font2 navigation-container"
              activeKey='/home'
            >
              <Nav.Item className='navigation-link'>
                <Nav.Link className='black-link' href='/selectmealplan'>
                  SUBSCRIBE
                </Nav.Link>
              </Nav.Item>

              <NavDropdown
                className='navigation-link black-link'
                title='MENU'
                id='nav-dropdown'
              >
                <NavDropdown.Item href='/menuthisweek'>
                  THIS WEEK
                </NavDropdown.Item>
                <NavDropdown.Item href='/menunextweek'>
                  NEXT WEEK
                </NavDropdown.Item>
                {isAuthenticated && (
                  <Fragment>
                    {/* <NavDropdown.Item href='/menuthisweek'>
                      THIS WEEK
                    </NavDropdown.Item>
                    <NavDropdown.Item href='/menunextweek'>
                      NEXT WEEK
                    </NavDropdown.Item> */}
                    {searchCookie4UserID(document.cookie) !== "null" && (
                      <NavDropdown.Item href='/mealschedule'>
                        MEAL SCHEDULE
                      </NavDropdown.Item>
                    )}
                  </Fragment>
                )}
              </NavDropdown>

              <Nav.Item className='navigation-link'>
                <Nav.Link className='black-link' href='/findus'>
                  FIND US
                </Nav.Link>
              </Nav.Item>

              <Nav.Item className='navigation-link'>
                <Nav.Link className='black-link' href='/giftcards'>
                  GIFT CARDS
                </Nav.Link>
              </Nav.Item>

              <NavDropdown
                className='navigation-link black-link'
                title='ABOUT'
                id='nav-dropdown'
              >
                <NavDropdown.Item href='/howitworks'>
                  HOW IT WORKS
                </NavDropdown.Item>
                <NavDropdown.Item href='/ourstory'>OUR STORY</NavDropdown.Item>
                <NavDropdown.Item href='/faq'>FAQ</NavDropdown.Item>
                <NavDropdown.Item
                  href='https://www.messenger.com/t/preptoyourdoor'
                  target='_blank'
                >
                  CONTACT
                </NavDropdown.Item>
                <NavDropdown.Item href='/jobs'>JOBS</NavDropdown.Item>
              </NavDropdown>

              <div className='navigation-start'>
                {searchCookie4Login("loginStatus") !== null ? (
                  <div>
                    <p id='loginStatus' className='login-hello'>
                      <span>Hello, </span>
                      <span>{searchCookie4Login("loginStatus")}</span>
                      <span>!</span>
                    </p>
                    <a
                      href='/logout'
                      id='logoutButton'
                      onClick={() => {
                        document.cookie = "loginStatus=; path=/";
                        window.location.reload(false);
                      }}
                    >
                      <u>Log Out</u>
                    </a>
                  </div>
                ) : (
                  <div>
                    <div>
                      <a
                        href='/selectmealplan'
                        className='top-btn1 top-btn1-primary font5'
                      >
                        Get Started
                      </a>
                    </div>
                    <a
                      href='/login'
                      id='loginButton'
                      onClick={() => window.location.reload(false)}
                    >
                      <u>Login</u>
                    </a>
                    {/* <p
                      id='loginStatus'
                      style={{
                        fontSize: "12px",
                        textAlign: "right",
                        color: "black"
                      }}
                    >
                      {searchCookie4Login("loginStatus")}
                    </p> */}
                  </div>
                )}
              </div>
            </Nav>
          </Navbar.Collapse>
        </Navbar>
      </div>

      <div className='row justify-content-center'>
        {/* <Content className="content-container"> */}
        {/* <div className="page-content" /> */}

        <Main
          appProps={{
            isAuthenticated,
            userHasAuthenticated,
            first_name,
            user_uid
          }}
        />
        {/* </Content> */}
      </div>

      <div className='row justify-content-md-center'>
        <footer className=' font2'>
          <div className='row footer-container'>
            <div className='col'>
              <div className='center-content'>
                <a className='navbar-brand' href='/'>
                  <img src={logo} alt='Logo' className='logo'></img>
                </a>
                <div className='logo-austin-houston'>
                  <p className='font9'>AUSTIN &</p>
                  <p className='font9'>HOUSTON</p>
                </div>
              </div>
            </div>

            <div className='col'>
              <Nav defaultActiveKey='/' className='flex-column'>
                <Nav.Link id='green' disabled>
                  Order
                </Nav.Link>
                <Nav.Link
                  id='footer-margin-padding'
                  className='black-grey'
                  href='/'
                >
                  Menu
                </Nav.Link>
                <Nav.Link
                  id='footer-margin-padding'
                  className='black-grey'
                  href='/'
                >
                  Plans
                </Nav.Link>
                <Nav.Link
                  id='footer-margin-padding'
                  className='black-grey'
                  href='/'
                >
                  How it Works
                </Nav.Link>
                <Nav.Link
                  id='footer-margin-padding'
                  className='black-grey'
                  href='/'
                >
                  Delivery Area
                </Nav.Link>
              </Nav>
            </div>

            <div className='col-2'>
              <Nav defaultActiveKey='/' className='flex-column'>
                <Nav.Link id='green' disabled>
                  Company
                </Nav.Link>
                <Nav.Link
                  id='footer-margin-padding'
                  className='black-grey'
                  href='/'
                >
                  Blog
                </Nav.Link>
                <Nav.Link
                  id='footer-margin-padding'
                  className='black-grey'
                  href='/'
                >
                  Our Service
                </Nav.Link>
                <Nav.Link
                  id='footer-margin-padding'
                  className='black-grey'
                  href='/'
                >
                  Our Team
                </Nav.Link>
                <Nav.Link
                  id='footer-margin-padding'
                  className='black-grey'
                  href='/'
                >
                  Jobs
                </Nav.Link>
                <Nav.Link
                  id='footer-margin-padding'
                  className='black-grey'
                  href='/'
                >
                  Employee Portal
                </Nav.Link>
              </Nav>
            </div>

            <div className='col'>
              <Nav defaultActiveKey='/' className='flex-column'>
                <Nav.Link id='green' disabled>
                  Questions & Contact
                </Nav.Link>
                <Nav.Link
                  id='footer-margin-padding'
                  className='black-grey'
                  href='/'
                >
                  FAQs
                </Nav.Link>
                <Nav.Link
                  id='footer-margin-padding'
                  className='black-grey'
                  href='/'
                >
                  512-522-9294
                </Nav.Link>
                <Nav.Link
                  id='footer-margin-padding'
                  className='black-grey'
                  href='/'
                >
                  info@preptoyourdoor.com
                </Nav.Link>
                <Nav.Link id='footer-margin-padding' disabled>
                  &#8203;
                </Nav.Link>
                <Nav.Link
                  disabled
                  id='footer-margin-padding'
                  className='font1'
                  href='/'
                >
                  Made with{" "}
                  <span role='img' aria-label=''>
                    {" "}
                    🧡
                  </span>{" "}
                  in Austin, TX
                </Nav.Link>
                <Nav.Link
                  disabled
                  id='footer-margin-padding'
                  className='font1'
                  href='/'
                >
                  © Prep To Your Door
                </Nav.Link>
              </Nav>
            </div>

            <div className='col-md-3 flex-column'>
              <Nav defaultActiveKey='/'>
                <Nav.Link id='green' disabled>
                  Follow Us:
                </Nav.Link>
              </Nav>
              <Nav className='footer-socials-container' defaultActiveKey='/'>
                <a
                  href='https://www.facebook.com/preptoyourdoor'
                  target='_blank'
                  rel='noopener noreferrer'
                >
                  <i
                    id='social-icon'
                    className='fa fa-facebook-f fa-2x socialBranchLogo'
                  />
                </a>
                <a
                  href='https://twitter.com/preptoyourdoor'
                  target='_blank'
                  rel='noopener noreferrer'
                >
                  <i
                    id='social-icon'
                    className='fa fa-twitter fa-2x socialBranchLogo'
                  />
                </a>

                <a
                  href='https://www.instagram.com/preptoyourdoor/'
                  target='_blank'
                  rel='noopener noreferrer'
                >
                  <i
                    id='social-icon'
                    className='fa fa-instagram fa-2x socialBranchLogo'
                  />
                </a>
              </Nav>
              <Nav className='mailing-list-spacing' defaultActiveKey='/'>
                <Nav.Link id='green' disabled>
                  Join Our Mailing List
                </Nav.Link>
                <p id='black-grey' className='never-miss-update-text'>
                  & Never miss an update
                </p>
                <Form className='email-section'>
                  <Form.Row>
                    <Form.Group as={Col} controlId='formGridEmail'>
                      <Form.Control type='email' placeholder='Enter Email' />
                    </Form.Group>

                    <Form.Group as={Col} controlId='formEmailSubmit'>
                      <Button className='btn btn-success font2'>
                        Subscribe
                      </Button>
                    </Form.Group>
                  </Form.Row>
                </Form>
              </Nav>
            </div>
          </div>
        </footer>
      </div>
    </div>
  );

  return stuff;
};

export default App;
