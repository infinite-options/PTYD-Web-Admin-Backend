import React, { Component } from "react";
import {Row, Col, Container, Card, CardDeck} from "react-bootstrap";
import {Grid, Cell} from "react-mdl";
import Slider from "react-slick";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import "../App.css"

export default class QuoteCarousel extends Component {

  render() {
    var settings = {
      dots: false,
      fade: true,
    //   centerMode: true,
      infinite: true,
      slidesToShow: 1,
      slidesToScroll: 1,
      autoplay: true,
      autoplaySpeed: 3500,
      arrows: false,
      pauseOnHover: false
    };
    return (
      <div>
        <div>
          <Slider {...settings}
          >
            <div>
                <div style={{padding: "0 200px"}}>
                    <h3 className='font1' style={{lineHeight: "50px"}}>
                    "PTYD is so good and we love it so much, it feels like part of
                    our family! It's so thrilling to fill our fridge every week
                    with tasty surprises!"
                    </h3>
                </div>
            </div>

            <div>
                <div style={{padding: "0 140px"}}>
                    <h3 className='font1' style={{lineHeight: "50px", marginBottom:"0", paddingBottom:"0"}}>
                    "As someone who loves to relax on the weekend...</h3>
                    <h3 className='font1' style={{lineHeight: "50px", marginTop:"0", paddingTop:"0"}}>
                    I am so thankful that I found Prep."
                    </h3>
                </div>
            </div>

            <div>
                <div style={{padding: "0 200px"}}>
                    <h3 className='font1' style={{lineHeight: "50px"}}>
                    "A passionate company that offers healthy, nutritionist-designed meals that are as convenient as they are delicious."
                    </h3>
                </div>
            </div>
            
          </Slider>
        </div>
      </div>
    );
  }
}