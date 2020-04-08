import React, { useState, useEffect } from "react";

import Container from "react-bootstrap/Button";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/Button";
import OverlayTrigger from "react-bootstrap/OverlayTrigger";
import Tooltip from "react-bootstrap/Tooltip";

export default function SocialSignUp (props)  {

    const [email, setEmail] = useState("");
    const [confirmEmail, setConfirmEmail] = useState("");
    const [firstname, setFirstName] = useState("");
    const [lastname, setLastName] = useState("");
    const [phoneNumber, setPhoneNumber] = useState("");
    const [weeklyUpdates, setWeeklyUpdates] = useState("FALSE");
    const [referral, setReferral] = useState("Social Media");
    const [socialMedia, setSocialMedia] = useState("")
    const [accessToken, setAccessToken] = useState("")
    const [refreshToken, setRefreshToken] = useState("")

    useEffect(() => { 
        console.log(props.location.state)
        typeof props.location.state === "undefined" ? console.log("undefined") :  ( typeof props.location.state.email === "undefined" ? console.log("undefined") : setEmail(props.location.state.email) )
        typeof props.location.state === "undefined" ? console.log("undefined") :  ( typeof props.location.state.social === "undefined" ? console.log("undefined") : setSocialMedia(props.location.state.social) )
        typeof props.location.state === "undefined" ? console.log("undefined") :  ( typeof props.location.state.accessToken === "undefined" ? console.log("undefined") : setAccessToken(props.location.state.accessToken) )
        typeof props.location.state === "undefined" ? console.log("undefined") :  ( typeof props.location.state.refreshToken === "undefined" ? console.log("undefined") : setRefreshToken(props.location.state.refreshToken) )
    }, []);

    async function sendForm() {
        if (email != confirmEmail) {
            return "email mismatch";
        }

        let b = JSON.stringify({
            FirstName: firstname,
            LastName: lastname,
            Email: email,
            PhoneNumber: phoneNumber,
            Referral: referral,
            WeeklyUpdates: weeklyUpdates,
            SocialMedia: socialMedia,
            AccessToken: accessToken,
            RefreshToken: refreshToken
        })

        fetch(props.API_URL, {
            mode: 'no-cors',
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
            },
            body: b
        })

        return "success";
    }

    const sending = () => sendForm().then(mes => console.log(mes)).catch(err => console.log(err))

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
