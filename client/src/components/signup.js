import React, {useState} from "react";

import Container from "react-bootstrap/Button";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/Button";
import axios from "axios";

function SignUp(props) {
  const [email, setEmail] = useState("");
  const [confirmEmail, setConfirmEmail] = useState("");
  const [phoneNumber, setPhoneNumber] = useState("");
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [firstname, setFirstName] = useState("");
  const [lastname, setLastName] = useState("");
  // const [address, setAddress] = useState("");
  // const [addressUnit, setAddressUnit] = useState("");
  // const [city, setCity] = useState("");
  // const [zip, setZip] = useState("");
  // const [userState, setUserState] = useState("");
  const [referral, setReferral] = useState("Website");
  const [weeklyUpdates, setWeeklyUpdates] = useState("FALSE");
  const [erro, setErro] = useState(null);

  function sendForm(e) {
    e.preventDefault();
    if (email !== confirmEmail) {
      return {code: 470, result: "Email mismatch."};
    }

    if (password !== confirmPassword) {
      return {code: 471, result: "Password mismatch."};
    }
    var data = {
      FirstName: firstname,
      LastName: lastname,
      Email: email,
      PhoneNumber: phoneNumber,
      Password: password,
      //          Address: address,
      //          AddressUnit: addressUnit,
      //          City: city,
      //          Zip: zip,
      //          State: userState,
      Referral: referral,
      WeeklyUpdates: weeklyUpdates
    };
    // const res = await fetch(props.API_URL, {
    //   //must check the props.API_URL if this page's parent doesn't pass prop.API_URL to its child
    //   method: "POST",
    //   mode: "no-cors",
    //   headers: {
    //     Accept: "application/json",
    //     "Content-Type": "application/json"
    //   },
    //   body: JSON.stringify(data)
    // });

    axios
      .post(props.API_URL, data)
      .then(res => {
        if (res.status === 200) {
          // if success
          // if (res.data !== undefined && res.data !== null) {// if success
          //   // this should not be here. this will allows login without add username and password in database
          //   document.cookie = `logigit nStatus: Hello ${res.data.first_name}! , user_uid: ${res.data.user_uid}  , `;
          // }

          // props.history.push("/selectmealplan"); //this should be disable and waiting until email has been confirmed

          // window.location.reload(false);
          props.history.push("/signupwaiting");
          window.location.reload(false);
        }
      })
      .catch(err => {
        if (err.response !== undefined) {
          setErro(err.response.data.result);
          //window.location.reload(false);
        } else {
          console.log(`Error without response. Error's code is: ${err.status}`);
        }
      });
  }

  //   function handleSubmit(event) {
  //     event.preventDefault();
  //   }

  //   function handleSignup(response) {
  //     alert(response);
  //     if (response.code == 281) {
  //       document.cookie =
  //         " loginStatus: Hello " +
  //         response.first_name +
  //         "! , " +
  //         " user_uid: " +
  //         response.user_uid +
  //         " , ";

  //       // NOT WORKING
  //       // redirect & reload page for buttons and login status
  //       props.history.push("/selectmealplan");
  //       window.location.reload(false);
  //     } else {
  //       // DISPLAY ERROR MSG
  //       //      props.history.push('/signup');
  //       window.location.reload(false);
  //     }
  //   }

  //   const sending = () =>
  //     sendForm()
  //       .then(mes => handleSignup(mes))
  //       .catch(err => console.log(err));

  return (
    <main Style='margin-top:-80px;'>
      <Row>
        <Col></Col>
        <Col sm={8}>
          <Row className='justify-content-md-center'>
            <h3>Sign Up</h3>
          </Row>
          {erro != null && (
            <Row className='justify-content-md-center'>
              <Col></Col>
              <Col sm={8}>
                <h6>
                  <span class='icon has-text-danger'>
                    <i className='fa fa-info-circle'></i>
                  </span>
                  <span class='has-text-info'>{erro}</span>
                </h6>
              </Col>
              <Col></Col>
            </Row>
          )}
          <Row className='justify-content-md-center'>
            <Container className='container fluid justify-content-center bg-success'>
              <Form>
                <Form.Row>
                  <Form.Group as={Col} controlId='formGridFirstName'>
                    <Form.Label>First Name</Form.Label>
                    <Form.Control
                      value={firstname}
                      onChange={e => setFirstName(e.target.value)}
                      placeholder='First'
                    />
                  </Form.Group>

                  <Form.Group as={Col} controlId='formGridLastName'>
                    <Form.Label>Last Name</Form.Label>
                    <Form.Control
                      value={lastname}
                      onChange={e => setLastName(e.target.value)}
                      placeholder='Last'
                    />
                  </Form.Group>
                </Form.Row>
                <Form.Row>
                  <Form.Group as={Col} controlId='formGridEmail'>
                    <Form.Label>Email</Form.Label>
                    <Form.Control
                      type='email'
                      value={email}
                      onChange={e => {
                        setEmail(e.target.value);
                        setErro(null);
                      }}
                      placeholder='Enter Email'
                    />
                  </Form.Group>

                  <Form.Group as={Col} controlId='formGridEmailConfirm'>
                    <Form.Label>Confirm Email</Form.Label>
                    <Form.Control
                      type='email'
                      value={confirmEmail}
                      onChange={e => setConfirmEmail(e.target.value)}
                      placeholder='Confirm Email'
                    />
                  </Form.Group>
                </Form.Row>
                <Form.Row>
                  <Form.Group as={Col} controlId='formGridPassword'>
                    <Form.Label>Password</Form.Label>
                    <Form.Control
                      type='password'
                      value={password}
                      onChange={e => setPassword(e.target.value)}
                      placeholder='Enter Password'
                    />
                  </Form.Group>
                  <Form.Group as={Col} controlId='formGridPasswordConfirm'>
                    <Form.Label>Confirm Password</Form.Label>
                    <Form.Control
                      type='password'
                      value={confirmPassword}
                      onChange={e => setConfirmPassword(e.target.value)}
                      placeholder='Confirm Password'
                    />
                  </Form.Group>
                </Form.Row>

                <Form.Row>
                  <Form.Group as={Col} controlId='formGridPhoneNumber'>
                    <Form.Label>Phone Number</Form.Label>
                    <Form.Control
                      value={phoneNumber}
                      onChange={e => setPhoneNumber(e.target.value)}
                      placeholder='Enter Phone Number'
                    />
                  </Form.Group>

                  <Form.Group as={Col} controlId='formGridReferral'>
                    <Form.Label>Referral</Form.Label>
                    <Form.Control
                      as='select'
                      value={referral}
                      onChange={e => setReferral(e.target.value)}
                    >
                      <option>Website</option>
                      <option>Social Media</option>
                      <option>Friend</option>
                      <option>Event</option>
                    </Form.Control>
                  </Form.Group>
                </Form.Row>
                <Form.Group>
                  <Form.Label>Terms of Service</Form.Label>
                  <Form.Control as='textarea' size='sm' rows='4' disabled>
                    Add Terms of Service to signup.js - Lorem ipsum dolor sit
                    amet, consectetur adipiscing elit. Curabitur ultrices ligula
                    in venenatis iaculis. Nunc et rutrum nisl. Aliquam libero
                    ligula, tempus sit amet libero vel, tincidunt iaculis odio.
                    Aliquam sed ipsum nulla. Nulla accumsan, est a sodales
                    cursus, lacus elit fermentum dui, ac ullamcorper tortor nisi
                    eget massa. Suspendisse eu massa varius, feugiat augue
                    vitae, venenatis libero. Aliquam varius ligula turpis, non
                    elementum mauris mattis id. Vestibulum ultrices quam iaculis
                    justo porttitor tempor. Pellentesque fringilla tempus nisi
                    sit amet facilisis. Donec sed interdum tellus, non interdum
                    massa. Donec lectus ex, varius vitae tincidunt in, pulvinar
                    nec ipsum. Pellentesque habitant morbi tristique senectus et
                    netus et malesuada fames ac turpis egestas. Nam scelerisque
                    massa gravida sollicitudin rutrum.
                  </Form.Control>
                </Form.Group>
                <Form.Group id='formGridServiceTerms'>
                  <Form.Check
                    type='checkbox'
                    label='Agree To Prep To Your Door Terms Of Service.'
                  />
                </Form.Group>
                <Form.Group id='formGridCheckbox'>
                  <Form.Check
                    id='weeklyUpdateCheck'
                    value={weeklyUpdates}
                    onChange={e => {
                      if (
                        document.getElementById("weeklyUpdateCheck").checked ===
                        true
                      ) {
                        setWeeklyUpdates("TRUE");
                      } else {
                        setWeeklyUpdates("FALSE");
                      }
                    }}
                    type='checkbox'
                    label='Sign Me Up For Weekly Prep To Your Door Updates!'
                  />
                  {/*
                                      <Form.Control
                                          value={weeklyUpdates}
                                          onChange={e => setWeeklyUpdates(e.target.value)}
                                      />
                                      */}
                </Form.Group>

                <Button
                  onClick={sendForm}
                  variant='dark'
                  type='submit'
                  size='lg'
                >
                  Submit
                </Button>
              </Form>
            </Container>
          </Row>
        </Col>
        <Col></Col>
      </Row>
    </main>
  );
}

export default SignUp;
