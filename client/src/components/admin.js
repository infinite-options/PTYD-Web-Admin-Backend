import React, { useState, useEffect } from "react";
import ReactDOM from "react-dom";


import Container from "react-bootstrap/Button";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import Nav from "react-bootstrap/Nav";
import Dropdown from "react-bootstrap/Dropdown";
import DropdownButton from "react-bootstrap/DropdownButton";
import Card from "react-bootstrap/Card";

function SignUp (props)  {

    const [username, setUsername] = useState("");
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const [firstname, setFirstName] = useState("");
    const [lastname, setLastName] = useState("");

    async function getCustomerInfo() {
        const res = await fetch(props.API_URL + 'accounts');
        const api = await res.json();
        const customerInfo = api.result;
        return customerInfo;
    }

    function test() {

        getCustomerInfo()
        .then(res => {
            console.log(res);
            let stuff = (
                <>
                    
                    <Row className="justify-content-center" > 
                        { res.map( user => 
                            <>
        
                                <Card md={3} style={{ color: 'black', margin: '15px' }} >

                                    <Card.Body>
                                        <Card.Title> { user.user_uid } </Card.Title>
                                        <DropdownButton id="dropdown-basic-button" title={ user.user_name }>
                                            <Dropdown.Item> { user.first_name } </Dropdown.Item>
                                            <Dropdown.Item> { user.last_name } </Dropdown.Item>
                                            <Dropdown.Item> { user.user_email } </Dropdown.Item>
                                            <Dropdown.Item> { user.phone_number } </Dropdown.Item>
                                            <Dropdown.Item> { user.user_address } </Dropdown.Item>
                                        </DropdownButton>
                                    </Card.Body>
                                    
                                </Card>
                            </>
                        ) }
                    </Row>

                </>
            );
            ReactDOM.render(
                stuff, 
                document.getElementById('admin-control')
            );
        })
        .catch(err => console.log(err));
        
    }

    return (
        <main Style="margin-top:-80px;">
            <div class="container text-center" Style="margin-top:-40px;">
                <h1>Administer Controls</h1>

                <Row>
                    <Col md={3} >
                        <Nav defaultActiveKey="/home" className="flex-column justify-content-center">
                            <Nav.Link dsiabled> Admin Home </Nav.Link>
                            <hr />
                            <Nav.Link > Meals Offered Weekly</Nav.Link>
                            <hr />
                            <Nav.Link > Meal Ingredients Needed </Nav.Link>
                            <hr />
                            <Nav.Link > Meal Statistics </Nav.Link>
                            <hr />
                            <Nav.Link onClick={ test } > Customer Information </Nav.Link>
                        </Nav>
                    </Col>

                    <Col md={9} >
                        <Container className="justify-content-center bg-dark">

                            <div id="admin-control">

                            </div>
                            
                        </Container>
                    </Col>

                </Row>
            </div>
        </main>
    );
};

export default SignUp;
