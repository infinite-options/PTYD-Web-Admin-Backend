import React, { useState, useEffect } from "react";

import Container from "react-bootstrap/Button";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/Button";

function SocialSignUp (props)  {

    const [username, setUsername] = useState("");
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

    useEffect(() => { 
        console.log(props) 
        typeof props.location.state === "undefined" ? console.log("undefined") :  ( typeof props.location.state.email === "undefined" ? console.log("undefined") : setEmail(props.location.state.email) )
        //props.location.state.email == undefined ? console.log("empty") : console.log(props.location.state.email)
    }, []);

    async function sendForm() {
        if (email != confirmEmail) {
            return "email mismatch";
        }

        if (password != confirmPassword) {
            return "password mismatch";
        }

        fetch(props.API_URL, {
          method: '[OPTIONS, POST]',
          mode: 'cors',
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            Username: username,
            FirstName: firstname,
            LastName: lastname,
            Email: email,
            PhoneNumber: phoneNumber,
            Password: password,
            Address: address,
            AddressUnit: addressUnit,
            City: city,
            Zip: zip,
            State: userState,
            Referral: referral,
            WeeklyUpdates: weeklyUpdates,
          })
        })

        return "success";
    }

    const sending = () => sendForm().then(mes => console.log(mes)).catch(err => console.log(err))

    async function addSocial() {

        fetch(props.API_URL, {
          method: 'POST',
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            user_email: "swoog@ucsc.edu",
            user_social: "google"
          })
        })

        return "success";
    }

    const socializing = () => addSocial().then(mes => console.log(mes)).catch(err => console.log(err))

    return (
        <main Style="margin-top:-80px;">
            <div class="container text-center" Style="margin-top:-40px;">
                <h1>Social Media Sign Up</h1>
            <div class="row">
                <Col></Col>

                <Container className="justify-content-center bg-success">
                    <Row>
                        <Col size={6} >               
                            <Form >
                                <Form.Group  controlId="formGridUsername">
                                <Form.Label>Username</Form.Label>
                                <Form.Control 
                                    value={username}
                                    onChange={e => setUsername(e.target.value)}
                                    placeholder="Enter Username" />
                                </Form.Group>

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

                                <Form.Row>
                                    <Form.Group as={Col} sm={9} controlId="formGridAddress">
                                        <Form.Label>Address</Form.Label>
                                        <Form.Control
                                            value={address}
                                            onChange={e => setAddress(e.target.value)}
                                            placeholder="1234 Main St" />
                                    </Form.Group>

                                    <Form.Group as={Col} controlId="formGridAddressUnit">
                                        <Form.Label>Unit</Form.Label>
                                        <Form.Control
                                            value={addressUnit}
                                            onChange={e => setAddressUnit(e.target.value)}
                                            placeholder="" />
                                    </Form.Group>
                                </Form.Row>
                                

                                <Form.Row>
                                    <Form.Group as={Col} controlId="formGridCity">
                                    <Form.Label>City</Form.Label>
                                    <Form.Control 
                                        value={city}
                                        onChange={e => setCity(e.target.value)}
                                        />
                                    </Form.Group>

                                    <Form.Group as={Col} controlId="formGridState">
                                    <Form.Label>State</Form.Label>
                                    <Form.Control as="select" value={userState} onChange={e => setUserState(e.target.value)}>
                                        <option>Choose...</option>
                                        <option>TX</option>
                                    </Form.Control>
                                    </Form.Group>

                                    <Form.Group as={Col} controlId="formGridZip">
                                    <Form.Label>Zip</Form.Label>
                                    <Form.Control
                                        value={zip}
                                        onChange={e => setZip(e.target.value)}
                                    />
                                    </Form.Group>
                                </Form.Row>

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
                                                console.log(document.getElementById("weeklyUpdateCheck").checked)
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

                                <Button onClick={ socializing } variant="dark" type="submit">
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

export default SocialSignUp;
