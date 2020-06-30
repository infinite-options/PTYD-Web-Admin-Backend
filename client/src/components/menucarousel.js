import React, { Component } from "react";
import axios from "axios";
// import WeeklyMenu from "./menu/weeklymenu";

import Slider from "react-slick";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import "../App.css"

import COBB_SALAD from "../img/HB_cobbsalad_forweb4_edited.jpg"
import GREEK_SALAD from "../img/HB_greeksalad_forweb2_edited.jpg"
import BUFFALO_CAULIFLOWER from "../img/HB_buffalocauliflower_forweb_edited.jpg"
import CACAO_OATS from "../img/HB_cacaooats_sqaure.jpg"
import BUDDHA_BOWL from "../img/HB_buddhabowl_forweb1_edited.jpg"
import THAI_CURRY from "../img/HB_thaicurry_forweb_new_edited.jpg"
import BBQ_JACKFRUIT from "../img/HB_BBQjackfruit_forweb_edited.jpg"
import RAINBOW_SALAD from "../img/HB_rainbowsalad_square_forweb.jpg"
import VEGGIE_SOUP from "../img/HB_vegsoup_forweb_new_edited.jpg"
import LASAGNA from "../img/HB_lasagna_forweb_edited.jpg"
import BIBIMBAP from "../img/HB_bibimbap_square_Forweb.jpg"
import GARDENERS_PIE from "../img/HB_gardenerspie_forweb2_edited.jpg"
import CAESAR_SALAD from "../img/HB_caesarsalad_square_forweb.jpg"
import LENTIL_SALAD from "../img/HB_lentilsalad3_edited.jpg"
import TEMPEH_POTATOES from "../img/HB_tempehpotatoes_square_forweb.jpg"

import NEXT from "../img/right_arrow-512.svg"
import PREV from "../img/left_arrow-512.svg"

export default class MenuCarousel extends Component {
  // constructor(props) {
  //   super(props);
  //   this.state = {
  //     // currentWeek: null,
  //     // dates: null,
  //     meals: {
  //       Seasonal: { Category: null, Menu: [] },
  //       Weekly: { Category: null, Menu: [] },
  //       Smoothies: { Category: null, Menu: [] },
  //       Addons: { Category: null, Menu: [] },
  //       Misc: { Category: null, Menu: [] }


  //     }
  //   };
  // }
  renderArrows = () => {
    return (
      <div className="slider-arrow">
        <div
          className="arrow-btn prev"
          onClick={() => this.slider.slickPrev()}
        >
          <img src={PREV} style={{ height: "40px", width: "40px" }} />
        </div>
        <div
          className="arrow-btn next"
          onClick={() => this.slider.slickNext()}
        >
          <img src={NEXT}
            style={{ height: "40px", width: "40px" }}
          />
        </div>
      </div>
    );
  };

  // async componentDidMount() {
    
  // }

  render() {
    var settings = {
      dots: false,
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

        {this.renderArrows()}

        <Slider {...settings}
          ref={c => (this.slider = c)}
        >

          <div>
            <div className='menu-carousel-img-container'>
              <img
                className='menu-carousel-img img-fluid'
                src={COBB_SALAD}
                alt='cobb_salad'
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
                src={GREEK_SALAD}
                alt='greek_salad'
              />
              <div className="content">
                <div className="text font1">Greek Salad</div>
              </div>
            </div>
          </div>

          <div>
            <div className='menu-carousel-img-container'>
              <img
                className='menu-carousel-img'
                src={BUFFALO_CAULIFLOWER}
                alt='buffalo_cauliflower'
              />
              <div className="content">
                <div className="text font1">Buffalo Cauliflower Bowl</div>
              </div>
            </div>
          </div>

          <div>
            <div className='menu-carousel-img-container'>
              <img
                className='menu-carousel-img'
                src={CACAO_OATS}
                alt='cacao_oats'
              />
              <div className="content">
                <div className="text font1">Cacao Oats with Hazelnut Butter</div>
              </div>
            </div>
          </div>

          <div>
            <div className='menu-carousel-img-container'>
              <img
                className='menu-carousel-img'
                src={BUDDHA_BOWL}
                alt='buddha_bowl'
              />
              <div className="content">
                <div className="text font1">Buddha Bowl</div>
              </div>
            </div>
          </div>

          <div>
            <div className='menu-carousel-img-container'>
              <img
                className='menu-carousel-img'
                src={THAI_CURRY}
                alt='thai_curry'
              />
              <div className="content">
                <div className="text font1">Thai Green Curry</div>
              </div>
            </div>
          </div>

          <div>
            <div className='menu-carousel-img-container'>
              <img
                className='menu-carousel-img'
                src={BBQ_JACKFRUIT}
                alt='bbq_jackfruit'
              />
              <div className="content">
                <div className="text font1">BBQ Pulled Jackfruit</div>
              </div>
            </div>
          </div>

          <div>
            <div className='menu-carousel-img-container'>
              <img
                className='menu-carousel-img'
                src={RAINBOW_SALAD}
                alt='rainbow_salad'
              />
              <div className="content">
                <div className="text font1">Rainbow Salad</div>
              </div>
            </div>
          </div>

          <div>
            <div className='menu-carousel-img-container'>
              <img
                className='menu-carousel-img'
                src={VEGGIE_SOUP}
                alt='veggie_soup'
              />
              <div className="content">
                <div className="text font1">Veggie Medley Soup</div>
              </div>
            </div>
          </div>

          <div>
            <div className='menu-carousel-img-container'>
              <img
                className='menu-carousel-img'
                src={LASAGNA}
                alt='lasagna'
              />
              <div className="content">
                <div className="text font1">Tempeh Bolognese Lasagna</div>
              </div>
            </div>
          </div>

          <div>
            <div className='menu-carousel-img-container'>
              <img
                className='menu-carousel-img'
                src={BIBIMBAP}
                alt='bibimbap'
              />
              <div className="content">
                <div className="text font1">Bibimbap</div>
              </div>
            </div>
          </div>

          <div>
            <div className='menu-carousel-img-container'>
              <img
                className='menu-carousel-img'
                src={GARDENERS_PIE}
                alt='gardeners_pie'
              />
              <div className="content">
                <div className="text font1">Gardener's Pie</div>
              </div>
            </div>
          </div>

          <div>
            <div className='menu-carousel-img-container'>
              <img
                className='menu-carousel-img'
                src={CAESAR_SALAD}
                alt='caesar_salad'
              />
              <div className="content">
                <div className="text font1">Caesar Salad</div>
              </div>
            </div>
          </div>

          <div>
            <div className='menu-carousel-img-container'>
              <img
                className='menu-carousel-img'
                src={LENTIL_SALAD}
                alt='lentil_salad'
              />
              <div className="content">
                <div className="text font1">Walnut Lentil Taco Salad</div>
              </div>
            </div>
          </div>

          <div>
            <div className='menu-carousel-img-container'>
              <img
                className='menu-carousel-img'
                src={TEMPEH_POTATOES}
                alt='tempeh_potatoes'
              />
              <div className="content">
                <div className="text font1">Tempeh & Cabbage Mashers</div>
              </div>
            </div>
          </div>

        </Slider>

      </div>
    );
  }
}