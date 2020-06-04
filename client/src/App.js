import React, {useEffect, useState, Fragment} from "react";
import {Layout, Header, Navigation, Drawer, Content} from "react-mdl";
import {Link} from "react-router-dom";

import "./App.css";
import Main from "./components/main";

import Nav from "react-bootstrap/Nav";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Col from "react-bootstrap/Col";
import NavDropdown from "react-bootstrap/NavDropdown";
import "bootstrap/dist/css/bootstrap.min.css";
import Cookies from "js-cookie";

import logo from "./img/LOGO-homepage.png";

const App = props => {
  const [isAuthenticated, userHasAuthenticated] = useState(false);
  const [isAuthenticating, setIsAuthenticating] = useState(true);
  const [first_name, setFirstname] = useState(null);
  const [user_uid, setUser_uid] = useState(null);

  useEffect(() => {
    onLoad();
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
    <div className='demo-big-content'>
      <Layout>
        <Header
          className='header-color'
          title={
            <span>
              <span style={{color: "#ddd"}}>Area / </span>
              <strong>The Title</strong>
            </span>
          }
          scroll
        >
          <Nav
            className='navbar fixed-top justify-content-center font2'
            style={{minHeight: "140px", backgroundColor: "white"}}
            activeKey='/home'
          >
            <div style={{textAlign: "center"}}>
              <a className='navbar-brand' href='/'>
                <img src={logo} alt='Logo' className='logo'></img>
              </a>
              <div class='logo-austin-houston'>
                <p className='font9'>AUSTIN &</p>
                <p className='font9'>HOUSTON</p>  
              </div>
            </div>

            <Nav.Item style={{marginTop: "30px"}}>
              <Nav.Link style={{color: "black"}} href='/selectmealplan'>
                SUBSCRIBE
              </Nav.Link>
            </Nav.Item>
            <NavDropdown
              title='MENU'
              id='nav-dropdown'
              style={{marginTop: "30px", color: "black"}}
            >
              {isAuthenticated && (
                <Fragment>
                  <NavDropdown.Item href='/menuthisweek'>
                    THIS WEEK
                  </NavDropdown.Item>
                  <NavDropdown.Item href='/menunextweek'>
                    NEXT WEEK
                  </NavDropdown.Item>
                  {searchCookie4UserID(document.cookie) != "null" && (
                    <NavDropdown.Item href='/mealschedule'>
                      MEAL SCHEDULE
                    </NavDropdown.Item>
                  )}
                </Fragment>
              )}
            </NavDropdown>

            <Nav.Item style={{marginTop: "30px"}}>
              <Nav.Link style={{color: "black"}} href='/findus'>
                FIND US
              </Nav.Link>
            </Nav.Item>
            <Nav.Item style={{marginTop: "30px"}}>
              <Nav.Link style={{color: "black"}} href='/giftcards'>
                GIFT CARDS
              </Nav.Link>
            </Nav.Item>
            <NavDropdown
              title='ABOUT'
              id='nav-dropdown'
              style={{marginTop: "30px", color: "black"}}
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
            <Nav.Item style={{marginTop: "30px"}}>
              <Nav.Link style={{color: "black"}} href='/get100'>
                GET $100
              </Nav.Link>
            </Nav.Item>

            <div className='' style={{paddingTop: "66px"}}>
              {searchCookie4Login("loginStatus") !== null ? (
                <div>
                  <a href='/logout'>
                    <Button
                      id='logoutButton'
                      variant='success'
                      size='sm'
                      onClick={() => {
                        document.cookie = "loginStatus=; path=/";
                        window.location.reload(false);
                      }}
                    >
                      Log Out
                    </Button>
                  </a>
                  <p
                    id='loginStatus'
                    style={{
                      fontSize: "20px",
                      textAlign: "right",
                      color: "black"
                    }}
                  >
                    <span className='font-weight-bold'>Hello </span>
                    <span>{searchCookie4Login("loginStatus")}</span>
                    <span className='font-weight-bold'>!</span>
                  </p>
                </div>
              ) : (
                <>
                  <a href='/login'>
                    <Button
                      id='loginButton'
                      variant='success'
                      size='sm'
                      onClick={() => window.location.reload(false)}
                    >
                      Login
                    </Button>
                  </a>
                  <p
                    id='loginStatus'
                    style={{
                      fontSize: "12px",
                      textAlign: "right",
                      color: "black"
                    }}
                  >
                    {searchCookie4Login("loginStatus")}
                  </p>
                </>
              )}
            </div>
          </Nav>
        </Header>

        <Drawer
          style={{backgroundColor: "#493f3f"}}
          className='header-color-background'
          title={
            <Link style={{fontFamily: "Kalam", color: "white"}} to='/'>
              Prep To Your Door
            </Link>
          }
        >
          <Navigation>
            <a href='/selectmealplan'>SUBSCRIBE</a>
            <a href='/menuthisweek'>MENU</a>
            <a href='/findus'>FIND US</a>
            <a href='/giftcards'>GIFT CARDS</a>
            <NavDropdown
              title='ABOUT'
              id='nav-dropdown'
              style={{marginLeft: "-10px", color: "black"}}
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
            <a href='/get100'>GET $100</a>
            <div className='sideNavLogin'>
              {searchCookie4Login("loginStatus") !== null ? (
                <div>
                  <a href='/logout'>
                    <Button
                      id='logoutButton'
                      variant='success'
                      size='sm'
                      onClick={() => {
                        document.cookie = "loginStatus=; path=/";
                        window.location.reload(false);
                      }}
                    >
                      Log Out
                    </Button>
                  </a>
                  <p
                    id='loginStatus'
                    style={{
                      fontSize: "20px",
                      textAlign: "right",
                      color: "black"
                    }}
                  >
                    {searchCookie4Login("loginStatus")}
                  </p>
                </div>
              ) : (
                <>
                  <a href='/login'>
                    <Button
                      id='loginButton'
                      variant='success'
                      size='sm'
                      onClick={() => window.location.reload(false)}
                    >
                      Login
                    </Button>
                  </a>
                  <p
                    id='loginStatus'
                    Style='font-size:12px; text-align:right; color:black;'
                  >
                    {searchCookie4Login("loginStatus")}
                  </p>
                </>
              )}
            </div>
          </Navigation>
        </Drawer>

        <Content style={{paddingTop: "140px"}}>
          <div className='page-content' />
          <Main
            appProps={{
              isAuthenticated,
              userHasAuthenticated,
              first_name,
              user_uid
            }}
          />
        </Content>

        <hr></hr>

        <footer className='container font2'>
          <div className='row'>
            <div className='col'>
              <div style={{textAlign: "center"}}>
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
                <Nav.Link style={{color: "green"}} disabled>
                  Order
                </Nav.Link>
                <Nav.Link style={{color: "black"}} href='/'>
                  Menu
                </Nav.Link>
                <Nav.Link style={{color: "black"}} href='/'>
                  Plans
                </Nav.Link>
                <Nav.Link style={{color: "black"}} href='/'>
                  How it Works
                </Nav.Link>
                <Nav.Link style={{color: "black"}} href='/'>
                  Delivery Area
                </Nav.Link>
              </Nav>
            </div>

            <div className='col'>
              <Nav defaultActiveKey='/' className='flex-column'>
                <Nav.Link style={{color: "green"}} disabled>
                  Company
                </Nav.Link>
                <Nav.Link style={{color: "black"}} href='/'>
                  Blog
                </Nav.Link>
                <Nav.Link style={{color: "black"}} href='/'>
                  Our Service
                </Nav.Link>
                <Nav.Link style={{color: "black"}} href='/'>
                  Our Team
                </Nav.Link>
                <Nav.Link style={{color: "black"}} href='/'>
                  Jobs
                </Nav.Link>
                <Nav.Link style={{color: "black"}} href='/'>
                  Employee Portal
                </Nav.Link>
              </Nav>
            </div>

            <div className='col'>
              <Nav defaultActiveKey='/' className='flex-column'>
                <Nav.Link style={{color: "green"}} disabled>
                  Questions & Contact
                </Nav.Link>
                <Nav.Link style={{color: "black"}} href='/'>
                  FAQs
                </Nav.Link>
                <Nav.Link style={{color: "black"}} href='/'>
                  512-522-9294
                </Nav.Link>
                <Nav.Link style={{color: "black"}} href='/'>
                  info@preptoyourdoor.com
                </Nav.Link>
              </Nav>
            </div>

            <div className='col-md-4 flex-column'>
              <Nav defaultActiveKey='/'>
                <Nav.Link style={{color: "green"}} disabled>
                  Follow Us:
                </Nav.Link>
              </Nav>
              <Nav defaultActiveKey='/'>
                <a
                  href='https://www.facebook.com/preptoyourdoor'
                  target='_blank'
                  rel='noopener noreferrer'
                >
                  <i
                    className='fa fa-facebook-f fa-2x socialBranchLogo'
                    style={{color: "grey"}}
                  ></i>
                </a>
                <a
                  href='https://twitter.com/preptoyourdoor'
                  target='_blank'
                  rel='noopener noreferrer'
                >
                  <i
                    className='fa fa-twitter fa-2x socialBranchLogo'
                    style={{color: "grey"}}
                  ></i>
                </a>

                <a
                  href='https://www.instagram.com/preptoyourdoor/'
                  target='_blank'
                  rel='noopener noreferrer'
                >
                  <i
                    className='fa fa-instagram fa-2x socialBranchLogo'
                    style={{color: "grey"}}
                  ></i>
                </a>
              </Nav>
              <Nav defaultActiveKey='/'>
                <Nav.Link style={{color: "green"}} disabled>
                  Join Our Mailing List
                </Nav.Link>
                <p> </p>
                <p
                  style={{
                    fontSize: "12px",
                    paddingTop: "25px",
                    marginLeft: "-25px"
                  }}
                >
                  & Never Miss an Update
                </p>
                <p> </p>
                <p style={{fontSize: "12px", paddingLeft: "15px"}}>
                  Email Address:
                </p>
                <Form style={{paddingLeft: "10px"}}>
                  <Form.Row>
                    <Form.Group as={Col} controlId='formGridEmail'>
                      <Form.Control type='email' placeholder='Enter Email' />
                    </Form.Group>

                    <Form.Group as={Col} controlId='formEmailSubmit'>
                      <Button variant='primary' type='submit'>
                        Submit
                      </Button>
                    </Form.Group>
                  </Form.Row>
                </Form>
              </Nav>
            </div>
          </div>
        </footer>
      </Layout>
    </div>
  );

  return stuff;
};

export default App;
