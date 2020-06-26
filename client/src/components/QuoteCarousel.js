import React, { Component } from "react";
// import {Row, Col, Container, Card, CardDeck} from "react-bootstrap";
// import {Grid, Cell} from "react-mdl";
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
                <div className='quote-carousel-padding'>
                    <p className='quote-line-height quote-size'>
                    "PTYD is so good and we love it so much, it feels like part of
                    our family! It's so thrilling to fill our fridge every week
                    with tasty surprises!"
                    </p>
                </div>
            </div>

            <div>
                <div className='quote-carousel-padding2'>
                    <p className='quote-size' id='quote2'>
                        "As someone who loves to relax on the weekend...
                    </p>
                    <p className='quote-size' id='quote2'>
                        I am so thankful that I found Prep."
                    </p>
                </div>
            </div>

            <div>
                <div className='quote-carousel-padding'>
                    <p className='quote-line-height quote-size'>
                        "A passionate company that offers healthy, nutritionist-designed meals that are as convenient as they are delicious."
                    </p>
                </div>
            </div>
            
          </Slider>
        </div>
      </div>
    );
  }
}