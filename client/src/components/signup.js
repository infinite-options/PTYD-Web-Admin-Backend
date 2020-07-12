import React, {useState, Fragment} from "react";

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
  const [loading, setLoading] = useState(false);

  function sendForm(e) {
    e.preventDefault();
    if (email !== confirmEmail) {
      setErro("Email mismatch");
      return;
    }
    if (password !== confirmPassword) {
      setErro("Password mismatch.");
      return;
    }
    setLoading(true);
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
          setLoading(false);
          window.location.reload(false);
        }
      })
      .catch(err => {
        if (err.response !== undefined) {
          setErro(err.response.data.result);
          //window.location.reload(false);
        } else if (typeof err === "string") {
          setErro(err);
        }
        setLoading(false);
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
    <Fragment>
      {loading && (
        <div className='d-flex justify-content-center'>
          <div className='loading'>
            <div className='spinner-border' role='status'>
              <span className='sr-only'>Loading...</span>
            </div>
          </div>
        </div>
      )}
      <main Style={"" + (loading ? "opacity: 0.5" : "")}>
        <Row className='justify-content-md-center'>
          <Col></Col>
          <Col md={10}>
            <Row className='justify-content-md-center'>
              <h1 style={{color: "#6e6565"}}>SIGN UP</h1>
            </Row>
            {erro != null && (
              <Row className='justify-content-md-center'>
                <Col></Col>
                <Col sm={8}>
                  <h6>
                    <span class='icon has-text-danger'>
                      <i className='fa fa-info-circle'></i>
                    </span>
                    <span className='has-text-info'>{erro}</span>
                  </h6>
                </Col>
                <Col></Col>
              </Row>
            )}
            <Row className='font2'>
              <Container
                className='container fluid bg-white'
                style={{
                  textAlign: "left",
                  fontWeight: "bold",
                  color: "#494949",
                  cursor: "default",
                  border: "none",
                  padding: "10px"
                }}
              >
                <Form>
                  <Form.Row>
                    <Form.Group as={Col} controlId='formGridFirstName'>
                      <Form.Label>First Name</Form.Label>
                      <Form.Control
                        value={firstname}
                        onChange={e => setFirstName(e.target.value)}
                        placeholder='First'
                      />
                      {!firstname ? (
                        <span className='required-red'>
                          First Name is required
                        </span>
                      ) : (
                        ""
                      )}
                    </Form.Group>

                    <Form.Group as={Col} controlId='formGridLastName'>
                      <Form.Label>Last Name</Form.Label>
                      <Form.Control
                        value={lastname}
                        onChange={e => setLastName(e.target.value)}
                        placeholder='Last'
                      />
                      {!lastname ? (
                        <span className='required-red'>
                          Last Name is required
                        </span>
                      ) : (
                        ""
                      )}
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
                      {!email ? (
                        <span className='required-red'>Email is required</span>
                      ) : (
                        ""
                      )}
                    </Form.Group>

                    <Form.Group as={Col} controlId='formGridEmailConfirm'>
                      <Form.Label>Confirm Email</Form.Label>
                      <Form.Control
                        type='email'
                        value={confirmEmail}
                        onChange={e => setConfirmEmail(e.target.value)}
                        placeholder='Confirm Email'
                      />
                      {confirmEmail !== email ? (
                        <span className='required-red'>
                          Confirm email does not match
                        </span>
                      ) : (
                        ""
                      )}
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
                      {!password ? (
                        <span className='required-red'>
                          Password is required
                        </span>
                      ) : (
                        ""
                      )}
                    </Form.Group>
                    <Form.Group as={Col} controlId='formGridPasswordConfirm'>
                      <Form.Label>Confirm Password</Form.Label>
                      <Form.Control
                        type='password'
                        value={confirmPassword}
                        onChange={e => setConfirmPassword(e.target.value)}
                        placeholder='Confirm Password'
                      />
                      {confirmPassword !== password ? (
                        <span className='required-red'>
                          Confirm password does not match
                        </span>
                      ) : (
                        ""
                      )}
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
                      {phoneNumber.length !== 10 ? (
                        <span className='required-red'>
                          Phone Number must be 10 digits
                        </span>
                      ) : (
                        ""
                      )}
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
                  <Form.Group style={{textAlign: "center"}}>
                    <Form.Label>Terms of Service</Form.Label>
                    <Form.Control as='textarea' size='sm' rows='4' disabled>
                      Add Terms of Service to signup.js - Lorem ipsum dolor sit
                      amet, consectetur adipiscing elit. Curabitur ultrices
                      ligula in venenatis iaculis. Nunc et rutrum nisl. Aliquam
                      libero ligula, tempus sit amet libero vel, tincidunt
                      iaculis odio. Aliquam sed ipsum nulla. Nulla accumsan, est
                      a sodales cursus, lacus elit fermentum dui, ac ullamcorper
                      tortor nisi eget massa. Suspendisse eu massa varius,
                      feugiat augue vitae, venenatis libero. Aliquam varius
                      ligula turpis, non elementum mauris mattis id. Vestibulum
                      ultrices quam iaculis justo porttitor tempor. Pellentesque
                      fringilla tempus nisi sit amet facilisis. Donec sed
                      interdum tellus, non interdum massa. Donec lectus ex,
                      varius vitae tincidunt in, pulvinar nec ipsum.
                      Pellentesque habitant morbi tristique senectus et netus et
                      malesuada fames ac turpis egestas. Nam scelerisque massa
                      gravida sollicitudin rutrum.
                    </Form.Control>
                  </Form.Group>
                  <Form.Group
                    id='formGridServiceTerms'
                    style={{fontWeight: "normal"}}
                  >
                    <Form.Check
                      type='checkbox'
                      label='&nbsp;Agree to Prep To Your Door Terms of Service'
                      style={{textAlign: "left"}}
                    ></Form.Check>
                  </Form.Group>
                  <Form.Group
                    id='formGridCheckbox'
                    style={{fontWeight: "normal"}}
                  >
                    <Form.Check
                      id='weeklyUpdateCheck'
                      value={weeklyUpdates}
                      onChange={e => {
                        if (
                          document.getElementById("weeklyUpdateCheck")
                            .checked === true
                        ) {
                          setWeeklyUpdates("TRUE");
                        } else {
                          setWeeklyUpdates("FALSE");
                        }
                      }}
                      type='checkbox'
                      label='&nbsp;Sign me up for weekly Prep To Your Door updates!'
                      style={{textAlign: "left"}}
                    />
                    {/*
                                      <Form.Control
                                          value={weeklyUpdates}
                                          onChange={e => setWeeklyUpdates(e.target.value)}
                                      />
                                      */}
                  </Form.Group>

                  <div style={{textAlign: "center"}}>
                    <Button
                      onClick={sendForm}
                      variant='success'
                      type='submit'
                      style={{width: "100%"}}
                    >
                      Sign Up
                    </Button>
                  </div>

                  <hr />
                  &nbsp;
                  <div className='text-center'>
                    <p style={{fontWeight: "bold", color: "#494949"}}>
                      Already have an account?
                    </p>
                    <a href='/login'>
                      <strong style={{color: "#469b47", textDecoration:"underline"}}>Login Here</strong>
                    </a>
                  </div>
                </Form>
              </Container>
              &nbsp;
            </Row>
          </Col>
          <Col></Col>
        </Row>
      </main>
    </Fragment>
  );
}

export default SignUp;
