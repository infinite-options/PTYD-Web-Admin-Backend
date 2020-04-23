import React, {useEffect, useState} from "react";
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

const App = props => {
  const [isAuthenticated, userHasAuthenticated] = useState(false);
  const [isAuthenticating, setIsAuthenticating] = useState(true);

  useEffect(() => {
    onLoad();
    // eslint-disable-next-line
  }, []);

  async function onLoad() {
    try {
      if (searchCookie4UserID(document.cookie).includes("100-")) {
        userHasAuthenticated(true);
      } else if (!document.cookie.includes("loginStatus")) {
        document.cookie = " loginStatus: Sign In , user_uid: null , ";
        console.log("First time? Resetting document cookie");
      }
    } catch (e) {
      console.log("No user?");
      if (e !== "No current user") {
        alert(e);
      }
    }

    setIsAuthenticating(false);
  }

  function searchCookie4Login(str) {
    let arr = str.split(" ");
    let i = arr.indexOf("loginStatus:");
    return arr[i + 1] + " " + arr[i + 2];
  }

  function searchCookie4UserID(str) {
    let arr = str.split(" ");
    let i = arr.indexOf("user_uid:");
    return arr[i + 1];
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
            <div style={{marginTop: "-25px"}}>
              <a className='navbar-brand' href='/'>
                <img
                  src='https://static.wixstatic.com/media/db4706_fb464984e3094a629a8bfb5297ca38c7~mv2.png/v1/fill/w_110,h_81,al_c,q_90/LOGO%2012_19_18%20.webp'
                  width='88'
                  height='65'
                  alt=''
                ></img>
              </a>
              <p
                className='font_9'
                style={{
                  fontSize: "11px",
                  lineHeight: "0.8em",
                  textAlign: "center",
                  letterSpacing: "0.25em",
                  fontSize: "11px",
                  color: "#E38B19",
                  fontWeight: "bold"
                }}
              >
                AUSTIN, TX
              </p>
            </div>

            <Nav.Item style={{marginTop: "30px"}}>
              <Nav.Link style={{color: "black"}} href='/selectmealplan'>
                SUBSCRIBE
              </Nav.Link>
            </Nav.Item>
            {isAuthenticated && (
              <NavDropdown
                title='MENU'
                id='nav-dropdown'
                style={{marginTop: "30px", color: "black"}}
              >
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
              </NavDropdown>
            )}

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
              {searchCookie4Login(document.cookie).split(" ")[0] === "Hello" ? (
                <div>
                  <a href='/logout'>
                    <Button
                      id='logoutButton'
                      variant='success'
                      size='sm'
                      onClick={() => {
                        document.cookie =
                          " loginStatus: Sign In , user_uid: null , ";
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
                    {searchCookie4Login(document.cookie)}
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
                    {searchCookie4Login(document.cookie)}
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
              {searchCookie4Login(document.cookie).split(" ")[0] === "Hello" ? (
                <div>
                  <a href='/logout'>
                    <Button
                      id='logoutButton'
                      variant='success'
                      size='sm'
                      onClick={() => {
                        document.cookie =
                          " loginStatus: Sign In , user_uid: null , ";
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
                    {searchCookie4Login(document.cookie)}
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
                    {searchCookie4Login(document.cookie)}
                  </p>
                </>
              )}
            </div>
          </Navigation>
        </Drawer>

        <Content Style='padding-top:140px'>
          <div className='page-content' />
          <Main appProps={{isAuthenticated, userHasAuthenticated}} />
        </Content>

        <hr></hr>

        <footer className='container text-center font2'>
          <div className='row'>
            <div className='col'>
              <div Style='margin-top:-10px'>
                <a className='navbar-brand' href='/'>
                  <img
                    src='https://static.wixstatic.com/media/db4706_fb464984e3094a629a8bfb5297ca38c7~mv2.png/v1/fill/w_110,h_81,al_c,q_90/LOGO%2012_19_18%20.webp'
                    width='80'
                    height='60'
                    alt=''
                  ></img>
                </a>
                <p
                  className='font_9'
                  Style='font-size:11px; line-height:0.8em; text-align:center; letter-spacing:0.25em; font-size:11px; color:#E38B19; font-weight:bold;'
                >
                  AUSTIN, TX
                </p>
              </div>
            </div>

            <div className='col'>
              <Nav defaultActiveKey='/' className='flex-column'>
                <Nav.Link Style='color:green' disabled>
                  Order
                </Nav.Link>
                <Nav.Link Style='color:black' href='/'>
                  Menu
                </Nav.Link>
                <Nav.Link Style='color:black' href='/'>
                  Plans
                </Nav.Link>
                <Nav.Link Style='color:black' href='/'>
                  How it Works
                </Nav.Link>
                <Nav.Link Style='color:black' href='/'>
                  Delivery Area
                </Nav.Link>
              </Nav>
            </div>

            <div className='col'>
              <Nav defaultActiveKey='/' className='flex-column'>
                <Nav.Link Style='color:green' disabled>
                  Company
                </Nav.Link>
                <Nav.Link Style='color:black' href='/'>
                  Blog
                </Nav.Link>
                <Nav.Link Style='color:black' href='/'>
                  Our Service
                </Nav.Link>
                <Nav.Link Style='color:black' href='/'>
                  Our Team
                </Nav.Link>
                <Nav.Link Style='color:black' href='/'>
                  Jobs
                </Nav.Link>
                <Nav.Link Style='color:black' href='/'>
                  Employee Portal
                </Nav.Link>
              </Nav>
            </div>

            <div className='col'>
              <Nav defaultActiveKey='/' className='flex-column'>
                <Nav.Link Style='color:green' disabled>
                  Questions & Contact
                </Nav.Link>
                <Nav.Link Style='color:black' href='/'>
                  FAQs
                </Nav.Link>
                <Nav.Link Style='color:black' href='/'>
                  512-522-9294
                </Nav.Link>
                <Nav.Link Style='color:black' href='/'>
                  info@preptoyourdoor.com
                </Nav.Link>
              </Nav>
            </div>

            <div className='col-md-4 flex-column'>
              <Nav defaultActiveKey='/'>
                <Nav.Link Style='color:green' disabled>
                  Follow Us:
                </Nav.Link>
              </Nav>
              <Nav defaultActiveKey='/'>
                <a
                  href='https://www.facebook.com/preptoyourdoor'
                  target='_blank'
                  rel='noopener noreferrer'
                >
                  <img
                    id='i3fogh650imageimageimage'
                    alt='Grey Facebook Icon'
                    data-type='image'
                    itemProp='image'
                    Style='width: 41px; height: 41px; object-fit: cover;'
                    src='https://static.wixstatic.com/media/d3470ec8ca26475da4b228f0199b5d3d.png/v1/fill/w_51,h_51,al_c,q_95/d3470ec8ca26475da4b228f0199b5d3d.webp'
                  ></img>
                </a>
                <a
                  href='https://twitter.com/preptoyourdoor'
                  target='_blank'
                  rel='noopener noreferrer'
                >
                  <img
                    id='i3fogh651imageimageimage'
                    alt='Grey Twitter Icon'
                    data-type='image'
                    itemProp='image'
                    Style='width: 41px; height: 41px; object-fit: cover;'
                    src='https://static.wixstatic.com/media/7177d158c36d432b93f51e54f80e2f3c.png/v1/fill/w_51,h_51,al_c,q_95/7177d158c36d432b93f51e54f80e2f3c.webp'
                  ></img>
                </a>

                <a
                  href='https://www.instagram.com/preptoyourdoor/'
                  target='_blank'
                  rel='noopener noreferrer'
                >
                  <img
                    id='i3fogh652imageimageimage'
                    alt='Grey Instagram Icon'
                    data-type='image'
                    itemProp='image'
                    Style='width: 41px; height: 41px; object-fit: cover;'
                    src='https://static.wixstatic.com/media/d7ffe259c9e54f59837481b3dd0130eb.png/v1/fill/w_51,h_51,al_c,q_95/d7ffe259c9e54f59837481b3dd0130eb.webp'
                  ></img>
                </a>
              </Nav>
              <Nav defaultActiveKey='/'>
                <Nav.Link Style='color:green' disabled>
                  Join Our Mailing List
                </Nav.Link>
                <p> </p>
                <p Style='font-size:12px; padding-top:25px; margin-left:-25px;'>
                  & Never Miss an Update
                </p>
                <p> </p>
                <p Style='font-size:12px; padding-left:15px;'>Email Address:</p>
                <Form Style='padding-left:10px;'>
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
