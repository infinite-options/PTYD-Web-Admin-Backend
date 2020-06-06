import React, { Component } from "react";
import Slider from "react-slick";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import "../App.css"

import SLIDE1 from "../img/slide1-cobb-salad.png"
import NEXT from "../img/right_arrow-512.svg"
import PREV from "../img/left_arrow-512.svg"

export default class MenuCarousel extends Component {

  renderArrows = () => {
    return (
      <div className="slider-arrow" 
      // style={{position: "absolute", zIndex: "2"}}
      >
        <div
          className="arrow-btn prev"
          onClick={() => this.slider.slickPrev()}
        >
          {/* <Prev /> */}
          {/* &lt; */}
          <img src={PREV} style={{height: "40px", width: "40px"}}/>
        </div>
        <div
          className="arrow-btn next"
          onClick={() => this.slider.slickNext()}
        >
          {/* <Next /> */}
          {/* &gt; */}
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
      slidesToShow: 4,
      slidesToScroll: 1,
      autoplay: true,
      autoplaySpeed: 3000,
      pauseOnHover: true,
      arrows: false,
      // centerMode: true
      // nextArrow: <Next/>,
      // prevArrow: <Prev/>
    };
    return (
      <div>
        <div 
        style={{ 
          // position: "relative", 
        // marginTop: "2rem" 
      }}
        >
        {this.renderArrows()}
          <Slider {...settings}
            ref= {c => (this.slider = c)}
          >
            <div>
              <img
                className='menu-carousel-img'
                src={SLIDE1}
                alt='slide1'></img>
            </div>
            
            <div>
              <img
                className='menu-carousel-img'
                src={SLIDE1}
                alt='slide1'></img>
            </div>

            <div>
              <img
                className='menu-carousel-img'
                src={SLIDE1}
                alt='slide1'></img>
            </div>

            <div>
              <img
                className='menu-carousel-img'
                src={SLIDE1}
                alt='slide1'></img>
            </div>

            <div>
              <img
                className='menu-carousel-img'
                src={SLIDE1}
                alt='slide1'></img>
            </div>

            <div>
              <img
                className='menu-carousel-img'
                src={SLIDE1}
                alt='slide1'></img>
            </div>

            <div>
              <img
                className='menu-carousel-img'
                src={SLIDE1}
                alt='slide1'></img>
            </div>

            <div>
              <img
                className='menu-carousel-img'
                src={SLIDE1}
                alt='slide1'></img>
            </div>
          </Slider>
        </div>
      </div>
    );
  }
}