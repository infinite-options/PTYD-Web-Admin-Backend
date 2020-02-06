import React, { Component } from "react";
import FINDUS1 from "../img/findus1.png";
import { Grid, Cell } from "react-mdl";

class Selectmeal extends Component {
  render() {
    return (
      <section class="content-section">
        <div class="container">
          <center>
            <h3>SEASONAL FAVORITES</h3>
          </center>
          <Grid>
            <Cell col={4}>
              <Grid>
                <Cell col={5}>
                  <img class="img-fluid" src={FINDUS1} alt="" />
                </Cell>
                <Cell col={7}>
                  <p>WHITE BEAN KALE SOUP</p>

                  <div class="input-group">
                    <span class="input-group-btn">
                      <button
                        type="button"
                        class="btn btn-danger btn-number"
                        data-type="minus"
                        data-field="quant[2]"
                      >
                        <span class="glyphicon glyphicon-minus"></span>
                      </button>
                    </span>
                    <input
                      type="text"
                      name="quant[2]"
                      class="form-control input-number"
                      value="10"
                      min="1"
                      max="100"
                    />
                    <span class="input-group-btn">
                      <button
                        type="button"
                        class="btn btn-success btn-number"
                        data-type="plus"
                        data-field="quant[2]"
                      >
                        <span class="glyphicon glyphicon-plus"></span>
                      </button>
                    </span>
                  </div>
                </Cell>
              </Grid>
              <p>Ingredients: White Beans, Kale, Vegetable Broth</p>
              <p>Cal 500, Prot 27, Carb 41, Sug 5, Fib 9, Fat 29, Sat 5</p>
            </Cell>
            <Cell col={4}>
              <Grid>
                <Cell col={5}>
                  <img class="img-fluid" src={FINDUS1} alt="" />
                </Cell>
                <Cell col={7}>
                  <p>WHITE BEAN KALE SOUP</p>
                </Cell>
              </Grid>
              <p>Ingredients: White Beans, Kale, Vegetable Broth</p>
              <p>Cal 500, Prot 27, Carb 41, Sug 5, Fib 9, Fat 29, Sat 5</p>
            </Cell>
            <Cell col={4}>
              <Grid>
                <Cell col={5}>
                  <img class="img-fluid" src={FINDUS1} alt="" />
                </Cell>
                <Cell col={7}>
                  <p>WHITE BEAN KALE SOUP</p>
                </Cell>
              </Grid>
              <p>Ingredients: White Beans, Kale, Vegetable Broth</p>
              <p>Cal 500, Prot 27, Carb 41, Sug 5, Fib 9, Fat 29, Sat 5</p>
            </Cell>
          </Grid>
        </div>
      </section>
    );
  }
}

export default Selectmeal;
