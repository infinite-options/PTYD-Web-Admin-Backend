import React, { Component } from "react";
import "./App.css";
import { Layout, Header, Navigation, Drawer, Content } from "react-mdl";
import Main from "./components/main";
import { Link } from "react-router-dom";
import Nav from 'react-bootstrap/Nav';
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import Col from 'react-bootstrap/Col';
import 'bootstrap/dist/css/bootstrap.min.css';

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
                <span Style='color: "#ddd'>Area / </span>
                <strong>The Title</strong>
              </span>
            }
            scroll
          >
            <Nav
              className="navbar fixed-top justify-content-center"
              Style="min-height:145px; background-color:white;"
              activeKey="/home"
              onSelect={selectedKey => alert(`selected ${selectedKey}`)}
            >
              <div Style="margin-top:25px">
                <a class="navbar-brand" href="/">
                  <img src="https://static.wixstatic.com/media/db4706_fb464984e3094a629a8bfb5297ca38c7~mv2.png/v1/fill/w_110,h_81,al_c,q_90/LOGO%2012_19_18%20.webp" width="88" height="65" alt=""></img>
                </a>
                <p class="font_9" Style="font-size:11px; line-height:0.8em; text-align:center; letter-spacing:0.25em; font-size:11px; color:#E38B19; font-weight:bold;">AUSTIN, TX</p>
              </div>
              
              <Nav.Item Style="margin-top:90px">
                <Nav.Link Style="color:black" href="/selectmealplan">SUBSCRIBE</Nav.Link>
              </Nav.Item>
              <Nav.Item Style="margin-top:90px">
                <Nav.Link Style="color:black" href="/menuthisweek">MENU</Nav.Link>
              </Nav.Item>
              <Nav.Item Style="margin-top:90px">
                <Nav.Link Style="color:black" eventKey="link-2">FIND US</Nav.Link>
              </Nav.Item>
              <Nav.Item Style="margin-top:90px">
                <Nav.Link Style="color:black" eventKey="link-3">GIFT CARDS</Nav.Link>
              </Nav.Item>
              <Nav.Item Style="margin-top:90px">
                <Nav.Link Style="color:black" eventKey="link-4">ABOUT</Nav.Link>
              </Nav.Item>
              <Nav.Item Style="margin-top:90px;">
                <Nav.Link Style="color:black" eventKey="link-5">GET $100</Nav.Link>
              </Nav.Item>

              <div className="" Style="margin-top:70px">
                <Button variant="success" size="sm">GET STARTED</Button>
                <p Style="font-size:12px; text-align:right; color:black;">Sign In</p>
              </div>
            </Nav>
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

          <Content Style="padding-top:145px">
            <div className="page-content" />
            <Main />
          </Content>

          <hr></hr>

          <footer class="container text-center">
            <div class="row">
            <div class="col">
              <div Style="margin-top:-10px">
                <a class="navbar-brand" href="/">
                  <img src="https://static.wixstatic.com/media/db4706_fb464984e3094a629a8bfb5297ca38c7~mv2.png/v1/fill/w_110,h_81,al_c,q_90/LOGO%2012_19_18%20.webp" width="80" height="60" alt=""></img>
                </a>
                <p class="font_9" Style="font-size:11px; line-height:0.8em; text-align:center; letter-spacing:0.25em; font-size:11px; color:#E38B19; font-weight:bold;">AUSTIN, TX</p>
              </div>
            </div>

            <div class="col">
              <Nav defaultActiveKey="/" className="flex-column">
                <Nav.Link Style="color:green" disabled>Order</Nav.Link>
                <Nav.Link Style="color:black" href="/">Menu</Nav.Link>
                <Nav.Link Style="color:black" href="/">Plans</Nav.Link>
                <Nav.Link Style="color:black" href="/">How it Works</Nav.Link>
                <Nav.Link Style="color:black" href="/">Delivery Area</Nav.Link>
              </Nav>
            </div>

            <div class="col">
              <Nav defaultActiveKey="/" className="flex-column">
                <Nav.Link Style="color:green" disabled>Company</Nav.Link>
                <Nav.Link Style="color:black" href="/">Blog</Nav.Link>
                <Nav.Link Style="color:black" href="/">Our Service</Nav.Link>
                <Nav.Link Style="color:black" href="/">Our Team</Nav.Link>
                <Nav.Link Style="color:black" href="/">Jobs</Nav.Link>
                <Nav.Link Style="color:black" href="/">Employee Portal</Nav.Link>
              </Nav>
            </div>

            <div class="col">
              <Nav defaultActiveKey="/" className="flex-column">
                <Nav.Link Style="color:green" disabled>Questions & Contact</Nav.Link>
                <Nav.Link Style="color:black" href="/">FAQs</Nav.Link>
                <Nav.Link Style="color:black" href="/">512-522-9294</Nav.Link>
                <Nav.Link Style="color:black" href="/">info@preptoyourdoor.com</Nav.Link>
              </Nav>
            </div>

            <div class="col-md-4 flex-column">
              <Nav defaultActiveKey="/">
                <Nav.Link Style="color:green" disabled>Follow Us:</Nav.Link>
              </Nav>
              <Nav defaultActiveKey="/">
                <a href="/"><img id="i3fogh650imageimageimage" alt="Grey Facebook Icon" data-type="image" itemprop="image" Style="width: 41px; height: 41px; object-fit: cover;" src="https://static.wixstatic.com/media/d3470ec8ca26475da4b228f0199b5d3d.png/v1/fill/w_51,h_51,al_c,q_95/d3470ec8ca26475da4b228f0199b5d3d.webp"></img></a>
                <a href="/"><img id="i3fogh651imageimageimage" alt="Grey Twitter Icon" data-type="image" itemprop="image" Style="width: 41px; height: 41px; object-fit: cover;" src="https://static.wixstatic.com/media/7177d158c36d432b93f51e54f80e2f3c.png/v1/fill/w_51,h_51,al_c,q_95/7177d158c36d432b93f51e54f80e2f3c.webp"></img></a>
                <a href="/"><img id="i3fogh652imageimageimage" alt="Grey Instagram Icon" data-type="image" itemprop="image" Style="width: 41px; height: 41px; object-fit: cover;" src="https://static.wixstatic.com/media/d7ffe259c9e54f59837481b3dd0130eb.png/v1/fill/w_51,h_51,al_c,q_95/d7ffe259c9e54f59837481b3dd0130eb.webp"></img></a>
              </Nav>
              <Nav defaultActiveKey="/">
                <Nav.Link Style="color:green" disabled>Join Our Mailing List</Nav.Link>
                <p> </p>
                <p Style="font-size:12px; padding-top:25px; margin-left:-25px;">& Never Miss an Update</p>
                <p> </p>
                <p Style="font-size:12px; padding-left:15px;">Email Address:</p>
                <Form Style="padding-left:10px;">
                  <Form.Row>
                    <Form.Group as={Col} controlId="formGridEmail">
                      <Form.Control type="email" placeholder="Enter Email" />
                    </Form.Group>

                    <Form.Group as={Col} controlId="formEmailSubmit">
                      <Button variant="primary" type="submit">
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
  }
}

export default App;
