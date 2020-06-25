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
      <div className="slider-arrow">
        <div
          className="arrow-btn prev"
          onClick={() => this.slider.slickPrev()}
        >
          <img src={PREV} style={{height: "40px", width: "40px"}}/>
        </div>
        <div
          className="arrow-btn next"
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
      slidesToShow: 4,
      slidesToScroll: 1,
      autoplay: true,
      autoplaySpeed: 3000,
      pauseOnHover: true,
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
              <div className='menu-carousel-img-container'>
                <img
                  className='menu-carousel-img'
                  src={SLIDE1}
                  alt='slide1'
                />
                <div className="content">
                  <div className="text font1">Cobb Salad</div>
                </div>
              </div>
            </div>
            
            <div>
              <div className='menu-carousel-img-container'>
                <img
                  className='menu-carousel-img'
                  src={SLIDE1}
                  alt='slide1'
                />
                <div className="content">
                  <div className="text font1">Cobb Salad</div>
                </div>
              </div>
            </div>

            <div>
              <div className='menu-carousel-img-container'>
                <img
                  className='menu-carousel-img'
                  src={SLIDE1}
                  alt='slide1'
                />
                <div className="content">
                  <div className="text font1">Cobb Salad</div>
                </div>
              </div>
            </div>

            <div>
              <div className='menu-carousel-img-container'>
                <img
                  className='menu-carousel-img'
                  src={SLIDE1}
                  alt='slide1'
                />
                <div className="content">
                  <div className="text font1">Cobb Salad</div>
                </div>
              </div>
            </div>

            <div>
              <div className='menu-carousel-img-container'>
                <img
                  className='menu-carousel-img'
                  src={SLIDE1}
                  alt='slide1'
                />
                <div className="content">
                  <div className="text font1">Cobb Salad</div>
                </div>
              </div>
            </div>

            <div>
              <div className='menu-carousel-img-container'>
                <img
                  className='menu-carousel-img'
                  src={SLIDE1}
                  alt='slide1'
                />
                <div className="content">
                  <div className="text font1">Cobb Salad</div>
                </div>
              </div>
            </div>

            <div>
              <div className='menu-carousel-img-container'>
                <img
                  className='menu-carousel-img'
                  src={SLIDE1}
                  alt='slide1'
                />
                <div className="content">
                  <div className="text font1">Cobb Salad</div>
                </div>
              </div>
            </div>

            <div>
              <div className='menu-carousel-img-container'>
                <img
                  className='menu-carousel-img'
                  src={SLIDE1}
                  alt='slide1'
                />
                <div className="content">
                  <div className="text font1">Cobb Salad</div>
                </div>
              </div>
            </div>

          </Slider>
        </div>
      </div>
    );
  }
}