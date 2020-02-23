import React, { useState, useEffect } from "react";

import Container from "react-bootstrap/Button";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/Button";

function SignUp (props)  {

    const [username, setUsername] = useState("");
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const [firstname, setFirstName] = useState("");
    const [lastname, setLastName] = useState("");

    async function sendForm() {
        window.open(props.API_URL + "/" + username + "/" + password + "/" + email + "/" + firstname + "/" + lastname);
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
                                <Form.Control type="email" placeholder="Confirm Email" />
                                </Form.Group>

                                <Form.Group  controlId="formGridPhoneNumber">
                                <Form.Label>Phone Number</Form.Label>
                                <Form.Control placeholder="Enter Phone Number" />
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
                                <Form.Control type="password" placeholder="Confirm Password" />
                                </Form.Group>

                                <Form.Row>
                                    <Form.Group as={Col} sm={9} controlId="formGridAddress">
                                        <Form.Label>Address</Form.Label>
                                        <Form.Control placeholder="1234 Main St" />
                                    </Form.Group>

                                    <Form.Group as={Col} controlId="formGridAddressUnit">
                                        <Form.Label>Unit</Form.Label>
                                        <Form.Control placeholder="" />
                                    </Form.Group>
                                </Form.Row>
                                

                                <Form.Row>
                                    <Form.Group as={Col} controlId="formGridCity">
                                    <Form.Label>City</Form.Label>
                                    <Form.Control />
                                    </Form.Group>

                                    <Form.Group as={Col} controlId="formGridState">
                                    <Form.Label>State</Form.Label>
                                    <Form.Control as="select">
                                        <option>Choose...</option>
                                        <option>Texas</option>
                                    </Form.Control>
                                    </Form.Group>

                                    <Form.Group as={Col} controlId="formGridZip">
                                    <Form.Label>Zip</Form.Label>
                                    <Form.Control />
                                    </Form.Group>
                                </Form.Row>

                                <Form.Group as={Col} controlId="formGridReferral">
                                    <Form.Label>Referral</Form.Label>
                                    <Form.Control as="select">
                                        <option>Social Media</option>
                                        <option>Website</option>
                                        <option>Friend</option>
                                        <option>Event</option>
                                    </Form.Control>
                                </Form.Group>

                                <Form.Group id="formGridCheckbox">
                                    <Form.Check type="checkbox" label="Sign Me Up For Weekly Prep To Your Door Updates!" />
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
