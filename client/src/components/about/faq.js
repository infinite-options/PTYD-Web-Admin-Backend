import React, { Component } from "react";
import Question from "./question";
import { Card, Accordion } from "react-bootstrap";

class Faq extends Component {
  render() {
    return (
      <div class="container font2" style={{ color: "#196F3D" }}>
        <h3 class="container font2" style={{ color: "black" }}>
          Frequently Asked Questions
        </h3>
        <br />
        {/* <Question
          question="Which farms do you get your produce from?"
          answer="Luckily Texas is a big place with tons of organic and sustainable farms. Here’s a few of our favorites:"
        />{" "} */}

        <Accordion defaultActiveKey="0">
          <Card style={{ lineHeight: "35px", fontSize: "20px" }}>
            <Accordion.Toggle as={Card.Header} eventKey="0">
              Which farms do you get your produce from?
            </Accordion.Toggle>
            <Accordion.Collapse eventKey="0">
              <Card.Body style={{ color: "black" }}>
                Luckily Texas is a big place with tons of organic and
                sustainable farms. Here’s a few of our favorites:
                <br />
                <br />
                &bull; Johnson’s Backyard Garden (Austin) <br />
                &bull; La Flaca (Austin)
                <br />
                &bull; Agua Dolce (Austin)
                <br />
                &bull; Gundermann Acres (Houston) <br />
                &bull; Martinez Farms (Pleasanton)
                <br />
                &bull; Bouldin Food Forest (Rogers) <br />
                &bull; Tons more!
              </Card.Body>
            </Accordion.Collapse>
          </Card>
          <Card style={{ lineHeight: "35px", fontSize: "20px" }}>
            <Accordion.Toggle as={Card.Header} eventKey="1">
              How do I place an order?
            </Accordion.Toggle>
            <Accordion.Collapse eventKey="1">
              <Card.Body style={{ color: "black" }}>
                From the Plans button in the menu, pick a membership option that
                fits best with your lifestyle! You will automatically be placed
                on a subscription to receive weekly orders. You can cancel or
                hold deliveries anytime using the "Manage Existing Account"
                button at the top right corner
              </Card.Body>
            </Accordion.Collapse>
          </Card>
          <Card style={{ lineHeight: "35px", fontSize: "20px" }}>
            <Accordion.Toggle as={Card.Header} eventKey="2">
              What if I'm not home during the delivery times?
            </Accordion.Toggle>
            <Accordion.Collapse eventKey="2">
              <Card.Body style={{ color: "black" }}>
                On Sundays and Mondays (you can pick your preferred time) we
                deliver to work, gym or home to try to ensure someone can
                quickly place the food in the fridge. Make sure to email us at
                info@preptoyourdoor.com if you have special instructions. Many
                times, we will go into the home and stock the fridge for
                customers who cannot be home, but that is up to you and your
                comfort level.
                <br />
                <br />
                We deliver in a thermal bag that will keep cold to 30-90 minutes
                depending on the outside temperature. We leave the delivery on
                the porch, unless otherwise specified. While the contents of our
                food is all dairy and meat free, the time lapse could effect the
                lifespan of the meals. The sooner you can place in the fridge,
                the better :)
                <br />
                <br />
                If the delivery days are not conducive with your schedule, email
                us! If we have enough people requesting a different day, we can
                make adjustments as needed!
                <br /> <i>WE LOVE FEEDBACK!</i>
              </Card.Body>
            </Accordion.Collapse>
          </Card>
          <Card style={{ lineHeight: "35px", fontSize: "20px" }}>
            <Accordion.Toggle as={Card.Header} eventKey="3">
              Membership Holds or Cancelations
            </Accordion.Toggle>
            <Accordion.Collapse eventKey="3">
              <Card.Body style={{ color: "black" }}>
                ​If you're traveling or need a break, please go to "Manage
                Existing Account" button at the top right. Go to "Edit
                Subscription" then "Skip next renewal".
                <br />
                <br />
                <i>
                  {" "}
                  You can also change your desired amount of meals this way.
                  Every week, choose what works for you!
                </i>
                <br />
                <br /> Voila! Here's a video showing you how:
                <br />
                <iframe
                  width="560"
                  height="315"
                  src="https://www.youtube.com/embed/KPOaDphaiiQ"
                  frameborder="0"
                  allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                  allowfullscreen
                ></iframe>
              </Card.Body>
            </Accordion.Collapse>
          </Card>
          <Card style={{ lineHeight: "35px", fontSize: "20px" }}>
            <Accordion.Toggle as={Card.Header} eventKey="4">
              What are smoothie options?
            </Accordion.Toggle>
            <Accordion.Collapse eventKey="4">
              <Card.Body style={{ color: "black" }}>
                #1 The Original
                <br /> Kale (lots!), Banana, Blueberries, Apple, Orange,
                Chocolate Pea and Hemp Protein, Coconut Oil
                <br />
                <br />
                #3 Almond Butter
                <br /> Banana, Apple, Strawberry, Hemp Protein, Almond Butter,
                Dates, Goji Berries
                <br />
                <br />
                #5 Energizer
                <br /> Kale, Banana, Peanut Butter, Hemp Protein, Coffee,
                Blueberry, Chocolate Pea Protein
                <br />
                <br />
                ​ All have 15-23 g of protein. We prep them in Mason Jars with
                fresh fruit and hemp and pea protein with some stevia. THEY ARE
                KEPT FROZEN.
                <br />
                <br />
                Dump ingredients in the blender with your choice of 8 oz liquid
                (we like almond milk) Voila! A perfect meal replacement or
                post-workout snack ready in 60 seconds.
              </Card.Body>
            </Accordion.Collapse>
          </Card>
          <Card style={{ lineHeight: "35px", fontSize: "20px" }}>
            <Accordion.Toggle as={Card.Header} eventKey="5">
              Returns & Refunds
            </Accordion.Toggle>
            <Accordion.Collapse eventKey="5">
              <Card.Body style={{ color: "black" }}>
                We are committed to customer satisfaction and feedback. If you
                are unhappy with the product, you will receive a refund, no
                questions asked! Please contact us so we can refund you ASAP
                with some feedback for us to improve.
              </Card.Body>
            </Accordion.Collapse>
          </Card>
          <Card style={{ lineHeight: "35px", fontSize: "20px" }}>
            <Accordion.Toggle as={Card.Header} eventKey="6">
              You don't deliver in my area :(
            </Accordion.Toggle>
            <Accordion.Collapse eventKey="6">
              <Card.Body style={{ color: "black" }}>
                We are working as rapidly as possible to expand in the Greater
                Austin area, including Georgetown and San Marcos. Send us an
                message and let us know! Ask your buddies to sign up! Once we
                have a few customers in that area, we would be happy to schedule
                a special trip!
              </Card.Body>
            </Accordion.Collapse>
          </Card>
        </Accordion>
      </div>
    );
  }
}

export default Faq;
