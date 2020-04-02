import React, { useState, useEffect } from "react";

import Container from "react-bootstrap/Button";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/Button";

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
    const [referral, setReferral] = useState("Social Media");
    const [weeklyUpdates, setWeeklyUpdates] = useState("FALSE");

    async function sendForm() {
        if (email != confirmEmail) {
            return "email mismatch";
        }

        if (password != confirmPassword) {
            return "password mismatch";
        }

        fetch(props.API_URL, {
          method: 'POST',
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
        })

        return "success";
    }

    const sending = () => sendForm().then(mes => console.log(mes)).catch(err => console.log(err))

    return (
        <main Style="margin-top:-80px;">
            <div class="container text-center" Style="margin-top:-40px;">
                <h1>Sign Up</h1>
            <div class="row">
                <Col></Col>

                <Container className="justify-content-center bg-success">
                    <Row>
                        <Col size={6} >               
                            <Form >
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

                                <Form.Group  controlId="formGridEmail">
                                <Form.Label>Email</Form.Label>
                                <Form.Control type="email" 
                                    value={email}
                                    onChange={e => setEmail(e.target.value)}
                                    placeholder="Enter Email" />
                                </Form.Group>

                                <Form.Group  controlId="formGridEmailConfirm">
                                <Form.Label>Confirm Email</Form.Label>
                                <Form.Control type="email"
                                    value={confirmEmail}
                                    onChange={e => setConfirmEmail(e.target.value)}
                                    placeholder="Confirm Email" />
                                </Form.Group>

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

                                <Form.Group controlId="formGridPasswordConfirm">
                                <Form.Label>Confirm Password</Form.Label>
                                <Form.Control type="password"
                                    value={confirmPassword}
                                    onChange={e => setConfirmPassword(e.target.value)}
                                    placeholder="Confirm Password" />
                                </Form.Group>
                                <Form.Group as={Col} controlId="formGridReferral">
                                    <Form.Label>Referral</Form.Label>
                                    <Form.Control as="select" value={referral} onChange={e => setReferral(e.target.value)}>
                                        <option>Social Media</option>
                                        <option>Website</option>
                                        <option>Friend</option>
                                        <option>Event</option>
                                    </Form.Control>
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

                                <Form.Group id="formGridServiceTerms">
                                    <Form.Check type="checkbox" label="Agree To Prep To Your Door Terms Of Service." />
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
