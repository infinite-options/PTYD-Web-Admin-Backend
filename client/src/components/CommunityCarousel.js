import React, { Component } from "react";
import {Row, Col, Container, Card, CardDeck} from "react-bootstrap";
import {Grid, Cell} from "react-mdl";
import Slider from "react-slick";
// import "bootstrap/dist/css/bootstrap.min.css";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import "../App.css"

// import SLIDE1 from "../img/slide1-cobb-salad.png"
import NEXT from "../img/right_arrow-512.svg"
import PREV from "../img/left_arrow-512.svg"
import HUMAN1 from "../img/human1.png";
import HUMAN2 from "../img/human2.png";
import HUMAN3 from "../img/human3.png";

export default class CommunityCarousel extends Component {

  renderArrows = () => {
    return (
      <div className="slider-arrow">
        <div
          className="arrow-btn2 prev"
          onClick={() => this.slider.slickPrev()}
        >
          <img src={PREV} style={{height: "40px", width: "40px"}}/>
        </div>
        <div
          className="arrow-btn2 next"
          onClick={() => this.slider.slickNext()}
        >
          <img src={NEXT}
          style={{height: "40px", width: "40px"}}
          />
        </div>
      </div>
    );
  };

  render() {
    var settings = {
      dots: true,
      infinite: true,
      slidesToShow: 3,
      slidesToScroll: 3,
      autoplay: false,
      arrows: false,
    };
    return (
      <div>
        <div>
        {this.renderArrows()}
          <Slider {...settings}
            ref= {c => (this.slider = c)}
          >
        
            <div>
                <Card className='p-3' style={{height: "360px", margin: "10px"}}>
                <Card.Body>
                    <Card.Title>
                    Healthy, delicious, and delivered to your door at an
                    affordable price. Hard to beat. As a bonus, the jars are
                    eco-friendly. I can't wait to see PTYD expand.
                    </Card.Title>
                </Card.Body>
                <Card.Footer className='d-flex justify-content-center'>
                    <Cell col={3}>
                    <img
                        style={{
                        borderRadius: "50%",
                        marginTop: "15px"
                        }}
                        src={HUMAN1}
                        alt='Avatar'
                    ></img>
                    </Cell>
                    <Cell col={7}>
                    <h5 className='font2' style={{marginBottom:"0"}}>Veronica</h5>
                    <p>UX Designer</p>
                    </Cell>
                </Card.Footer>
                </Card>
            </div>

            <div>
                <Card className='p-3' style={{height: "360px", margin: "10px"}}>
                <Card.Body>
                    <Card.Title>
                    Best meal prep service we've ever used. The food is fresh,
                    organic, dairy and meat free. When you love food as much as my
                    husband and I do, you appreciate having consistent meals
                    throughout the week that are the definition of clean.
                    </Card.Title>
                </Card.Body>
                <Card.Footer className='d-flex justify-content-center'>
                    <Cell col={3}>
                    <img
                        style={{
                        borderRadius: "50%",
                        marginTop: "15px"
                        }}
                        src={HUMAN2}
                        alt='Avatar'
                    ></img>
                    </Cell>
                    <Cell col={7}>
                    <h5 className='font2' style={{marginBottom:"0"}}>Luke</h5>
                    <p>Tech</p>
                    </Cell>
                </Card.Footer>
                </Card>
            </div>

            <div>
                <Card className='p-3' style={{height: "360px", margin: "10px"}}>
                <Card.Body>
                    <Card.Title>
                    These meals are delicious, healthy, and make life SO easy and
                    enjoyable! The team is great with customer service if I ever
                    have any questions. I don't think I've ever had a meal I
                    didn't like!
                    </Card.Title>
                </Card.Body>
                <Card.Footer className='d-flex justify-content-center'>
                    <Cell col={3}>
                    <img
                        style={{
                        borderRadius: "50%",
                        marginTop: "15px"
                        }}
                        src={HUMAN3}
                        alt='Avatar'
                    ></img>
                    </Cell>
                    <Cell col={7}>
                    <h5 className='font2' style={{marginBottom:"0"}}>Courtney</h5>
                    <p>Fitness Designer</p>
                    </Cell>
                </Card.Footer>
                </Card>
            </div>

            <div>
                <Card className='p-3' style={{height: "360px", margin: "10px"}}>
                <Card.Body>
                    <Card.Title>
                    Healthy, delicious, and delivered to your door at an
                    affordable price. Hard to beat. As a bonus, the jars are
                    eco-friendly. I can't wait to see PTYD expand.
                    </Card.Title>
                </Card.Body>
                <Card.Footer className='d-flex justify-content-center'>
                    <Cell col={3}>
                    <img
                        style={{
                        borderRadius: "50%",
                        marginTop: "15px"
                        }}
                        src={HUMAN1}
                        alt='Avatar'
                    ></img>
                    </Cell>
                    <Cell col={7}>
                    <h5 className='font2' style={{marginBottom:"0"}}>Veronica</h5>
                    <p>UX Designer</p>
                    </Cell>
                </Card.Footer>
                </Card>
            </div>

            <div>
                <Card className='p-3' style={{height: "360px", margin: "10px"}}>
                <Card.Body>
                    <Card.Title>
                    Best meal prep service we've ever used. The food is fresh,
                    organic, dairy and meat free. When you love food as much as my
                    husband and I do, you appreciate having consistent meals
                    throughout the week that are the definition of clean.
                    </Card.Title>
                </Card.Body>
                <Card.Footer className='d-flex justify-content-center'>
                    <Cell col={3}>
                    <img
                        style={{
                        borderRadius: "50%",
                        marginTop: "15px"
                        }}
                        src={HUMAN2}
                        alt='Avatar'
                    ></img>
                    </Cell>
                    <Cell col={7}>
                    <h5 className='font2' style={{marginBottom:"0"}}>Luke</h5>
                    <p>Tech</p>
                    </Cell>
                </Card.Footer>
                </Card>
            </div>

            <div>
                <Card className='p-3' style={{height: "360px", margin: "10px"}}>
                <Card.Body>
                    <Card.Title>
                    These meals are delicious, healthy, and make life SO easy and
                    enjoyable! The team is great with customer service if I ever
                    have any questions. I don't think I've ever had a meal I
                    didn't like!
                    </Card.Title>
                </Card.Body>
                <Card.Footer className='d-flex justify-content-center'>
                    <Cell col={3}>
                    <img
                        style={{
                        borderRadius: "50%",
                        marginTop: "15px"
                        }}
                        src={HUMAN3}
                        alt='Avatar'
                    ></img>
                    </Cell>
                    <Cell col={7}>
                    <h5 className='font2' style={{marginBottom:"0"}}>Courtney</h5>
                    <p>Fitness Designer</p>
                    </Cell>
                </Card.Footer>
                </Card>
            </div>

            <div>
                <Card className='p-3' style={{height: "360px", margin: "10px"}}>
                <Card.Body>
                    <Card.Title>
                    Healthy, delicious, and delivered to your door at an
                    affordable price. Hard to beat. As a bonus, the jars are
                    eco-friendly. I can't wait to see PTYD expand.
                    </Card.Title>
                </Card.Body>
                <Card.Footer className='d-flex justify-content-center'>
                    <Cell col={3}>
                    <img
                        style={{
                        borderRadius: "50%",
                        marginTop: "15px"
                        }}
                        src={HUMAN1}
                        alt='Avatar'
                    ></img>
                    </Cell>
                    <Cell col={7}>
                    <h5 className='font2' style={{marginBottom:"0"}}>Veronica</h5>
                    <p>UX Designer</p>
                    </Cell>
                </Card.Footer>
                </Card>
            </div>

            <div>
                <Card className='p-3' style={{height: "360px", margin: "10px"}}>
                <Card.Body>
                    <Card.Title>
                    Best meal prep service we've ever used. The food is fresh,
                    organic, dairy and meat free. When you love food as much as my
                    husband and I do, you appreciate having consistent meals
                    throughout the week that are the definition of clean.
                    </Card.Title>
                </Card.Body>
                <Card.Footer className='d-flex justify-content-center'>
                    <Cell col={3}>
                    <img
                        style={{
                        borderRadius: "50%",
                        marginTop: "15px"
                        }}
                        src={HUMAN2}
                        alt='Avatar'
                    ></img>
                    </Cell>
                    <Cell col={7}>
                    <h5 className='font2' style={{marginBottom:"0"}}>Luke</h5>
                    <p>Tech</p>
                    </Cell>
                </Card.Footer>
                </Card>
            </div>

            <div>
                <Card className='p-3' style={{height: "360px", margin: "10px"}}>
                <Card.Body>
                    <Card.Title>
                    These meals are delicious, healthy, and make life SO easy and
                    enjoyable! The team is great with customer service if I ever
                    have any questions. I don't think I've ever had a meal I
                    didn't like!
                    </Card.Title>
                </Card.Body>
                <Card.Footer className='d-flex justify-content-center'>
                    <Cell col={3}>
                    <img
                        style={{
                        borderRadius: "50%",
                        marginTop: "15px"
                        }}
                        src={HUMAN3}
                        alt='Avatar'
                    ></img>
                    </Cell>
                    <Cell col={7}>
                    <h5 className='font2' style={{marginBottom:"0"}}>Courtney</h5>
                    <p>Fitness Designer</p>
                    </Cell>
                </Card.Footer>
                </Card>
            </div>

          </Slider>
        </div>
      </div>
    );
  }
}