import React, { useState, useEffect } from "react";

import Container from "react-bootstrap/Button";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/Button";
import OverlayTrigger from "react-bootstrap/OverlayTrigger";
import Tooltip from "react-bootstrap/Tooltip";

function SignUp (props)  {

    const [email, setEmail] = useState("");
    const [confirmEmail, setConfirmEmail] = useState("");
    const [phoneNumber, setPhoneNumber] = useState("");
    const [password, setPassword] = useState("");
    const [confirmPassword, setConfirmPassword] = useState("");
    const [firstname, setFirstName] = useState("");
    const [lastname, setLastName] = useState("");
    const [address, setAddress] = useState("");
    const [addressUnit, setAddressUnit] = useState("");
    const [city, setCity] = useState("");
    const [zip, setZip] = useState("");
    const [userState, setUserState] = useState("");
    const [referral, setReferral] = useState("Website");
    const [weeklyUpdates, setWeeklyUpdates] = useState("FALSE");

    const [emailTaken, setEmailTaken] = useState(false);

    async function sendForm() {
        if (email != confirmEmail) {
            return {'code': 470, 'result': "Email mismatch."};
        }

        if (password != confirmPassword) {
            return {'code': 471, 'result': "Password mismatch."};
        }

        const res = await fetch(props.API_URL, {
          method: 'POST',
          mode: 'no-cors',
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
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
            WeeklyUpdates: weeklyUpdates,
          })
        });

        const response = await res.json();
        console.log("response.code");
        console.log(response.code);

        return response;
    }

    function handleSubmit(event) {
      event.preventDefault();
    }

    function handleSignup (response) {
      console.log(response);
      if (response.code == 281) {
        document.cookie = " loginStatus: Hello " + response.first_name + "! , " + " user_uid: " + response.user_uid + " , ";

        // NOT WORKING
        // redirect & reload page for buttons and login status
        props.history.push('/');
        window.location.reload(false);
      }
      else {
        // DISPLAY ERROR MSG
//      props.history.push('/signup');
        window.location.reload(false);
      }
    }

    const sending = () => sendForm().then(mes => handleSignup(mes)).catch(err => console.log(err))

    // Handling Available Emails 
    async function checkEmail(user) {
        const res = await fetch(props.CHECK_EMAIL_API_URL + '/' + user);
        const api = await res.json();
        const names = api.result;
        return names;
    }

    const handleEmail = (user) => {
        console.log(user)
        checkEmail(user)
        .then( res => {
            console.log('res', res)
            setEmailTaken(res) }) //res.length > 0 ? ( res[0]['user_name'] == user ? setUsernameTaken(true) : setUsernameTaken(false) ) : setUsernameTaken(false) )
        .catch( err => console.log(err) )
    }

    return (
        <main Style="margin-top:-80px;">
            <div class="container text-center" Style="margin-top:-40px;">
                <h1>Sign Up</h1>
            <div class="row">
                <Col></Col>

                <Container className="justify-content-center bg-success">
                    <Row>
                        <Col size={6} >               
                            <Form onSubmit={handleSubmit}>
                                <Form.Row>
                                    <Form.Group as={Col} controlId="formGridFirstName">
                                    <Form.Label>First Name</Form.Label>
                                    <Form.Control 
                                        value={firstname}
                                        onChange={e => setFirstName(e.target.value)}
                                        placeholder="First" />
                                    </Form.Group>

                                    <Form.Group as={Col} controlId="formGridLastName">
                                    <Form.Label>Last Name</Form.Label>
                                    <Form.Control 
                                        value={lastname}
                                        onChange={e => setLastName(e.target.value)}
                                        placeholder="Last" />
                                    </Form.Group>
                                </Form.Row>

                                <OverlayTrigger 
                                    placement="right"
                                    delay={{ show: 250, hide: 400 }}
                                    overlay={
                                        <Tooltip >
                                            { emailTaken ? <p>Email Taken!</p> : <p>Email is Available!</p> }
                                        </Tooltip>
                                    }
                                >
                                    <Form.Group  controlId="formGridEmail">
                                        <Form.Label>Email</Form.Label>
                                        <Form.Control type="email" 
                                            value={email}
                                            onChange={e => {
                                                setEmail(e.target.value)
                                                handleEmail(e.target.value)
                                            }}
                                            placeholder="Enter Email" />
                                    </Form.Group>
                                </OverlayTrigger>

                                <OverlayTrigger 
                                    placement="right"
                                    delay={{ show: 250, hide: 400 }}
                                    overlay={
                                        <Tooltip >
                                            { email == confirmEmail ? <p>Emails Match!</p> : <p>Mismatched Emails!</p> }
                                        </Tooltip>
                                    }
                                >
                                    <Form.Group  controlId="formGridEmailConfirm">
                                        <Form.Label>Confirm Email</Form.Label>
                                        <Form.Control type="email"
                                            value={confirmEmail}
                                            onChange={e => setConfirmEmail(e.target.value)}
                                            placeholder="Confirm Email" 
                                        />
                                    </Form.Group>
                                </OverlayTrigger>

                                <Form.Group  controlId="formGridPhoneNumber">
                                <Form.Label>Phone Number</Form.Label>
                                <Form.Control
                                    value={phoneNumber}
                                    onChange={e => setPhoneNumber(e.target.value)}
                                    placeholder="Enter Phone Number" />
                                </Form.Group>

                                <Form.Group controlId="formGridPassword">
                                <Form.Label>Password</Form.Label>
                                <Form.Control type="password" 
                                    value={password}
                                    onChange={e => setPassword(e.target.value)}
                                    placeholder="Enter Password" />
                                </Form.Group>

                                <OverlayTrigger 
                                    placement="right"
                                    delay={{ show: 250, hide: 400 }}
                                    overlay={
                                        <Tooltip >
                                            { password == confirmPassword ? <p>Passwords Match!</p> : <p>Mismatched Passwords!</p> }
                                        </Tooltip>
                                    }
                                >
                                    <Form.Group controlId="formGridPasswordConfirm">
                                        <Form.Label>Confirm Password</Form.Label>
                                        <Form.Control type="password"
                                            value={confirmPassword}
                                            onChange={e => setConfirmPassword(e.target.value)}
                                            placeholder="Confirm Password" />
                                    </Form.Group>
                                </OverlayTrigger>

                                <Form.Group as={Col} controlId="formGridReferral">
                                    <Form.Label>Referral</Form.Label>
                                    <Form.Control as="select" value={referral} onChange={e => setReferral(e.target.value)}>
                                        <option>Website</option>
                                        <option>Social Media</option>
                                        <option>Friend</option>
                                        <option>Event</option>
                                    </Form.Control>
                                </Form.Group>

                                <Form.Group>
                                  <Form.Label>Terms of Service</Form.Label>
                                  <Form.Control
                                    as="textarea"
                                    size="sm"
                                    rows="4"
                                    disabled
                                  >
                                    Add Terms of Service to signup.js - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultrices ligula in venenatis iaculis. Nunc et rutrum nisl. Aliquam libero ligula, tempus sit amet libero vel, tincidunt iaculis odio. Aliquam sed ipsum nulla. Nulla accumsan, est a sodales cursus, lacus elit fermentum dui, ac ullamcorper tortor nisi eget massa. Suspendisse eu massa varius, feugiat augue vitae, venenatis libero. Aliquam varius ligula turpis, non elementum mauris mattis id. Vestibulum ultrices quam iaculis justo porttitor tempor. Pellentesque fringilla tempus nisi sit amet facilisis. Donec sed interdum tellus, non interdum massa. Donec lectus ex, varius vitae tincidunt in, pulvinar nec ipsum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam scelerisque massa gravida sollicitudin rutrum.
                                  </Form.Control>
                                </Form.Group>
                                <Form.Group id="formGridServiceTerms">
                                    <Form.Check type="checkbox" label="Agree To Prep To Your Door Terms Of Service." />
                                </Form.Group>
                                <Form.Group id="formGridCheckbox">
                                    <Form.Check 
                                        id="weeklyUpdateCheck"
                                        value={ weeklyUpdates } 
                                        onChange={ e => { 
                                            if(document.getElementById("weeklyUpdateCheck").checked == true) {
                                                setWeeklyUpdates("TRUE")
                                            }
                                            else {
                                                setWeeklyUpdates("FALSE")
                                            }
                                        } } 
                                        type="checkbox" 
                                        label="Sign Me Up For Weekly Prep To Your Door Updates!"
                                    />
                                    {/*
                                    <Form.Control
                                        value={weeklyUpdates}
                                        onChange={e => setWeeklyUpdates(e.target.value)}
                                    />
                                    */}
                                </Form.Group>

                                <Button onClick={ sending } variant="dark" type="submit">
                                    Submit
                                </Button>
                                </Form>
                            </Col>
                        </Row>
                    </Container>

                    <Col></Col>
                </div>
            </div>
        </main>
    );
};

export default SignUp;
