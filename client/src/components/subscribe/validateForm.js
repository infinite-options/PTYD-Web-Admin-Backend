import React, {Component, Fragment} from "react";

import {Button, Form, Row, Col, Container} from "react-bootstrap";
import TruckIcon from "../../img/prepTruckIcon.png";

import crypto from "crypto";
import Cookies from "js-cookie";


function ValidateForm() {


    return(
        <Form>
            <Form.Row>
            <Form.Group as={Col} controlId='formGridFirstName'>
                <Form.Label>
                First Name
                <span className='required-red'>
                    {" "}
                    <b>*</b>
                </span>
                </Form.Label>
                <Form.Control
                placeholder='Enter First Name'
                value={this.state.purchase.delivery_first_name}
                name='delivery_first_name'
                onChange={this.handleChange}
                />
            </Form.Group>

            <Form.Group as={Col} controlId='formGridLastName'>
                <Form.Label>
                Last Name
                <span className='required-red'>
                    {" "}
                    <b>*</b>
                </span>
                </Form.Label>
                <Form.Control
                placeholder='Enter Last Name'
                value={this.state.purchase.delivery_last_name}
                name='delivery_last_name'
                onChange={this.handleChange}
                />
            </Form.Group>
            </Form.Row>

            <Form.Group controlId='formGridNotes'>
            <Form.Label>
                Delivery Notes
                <span className='required-red'>
                {" "}
                <b>*</b>
                </span>
            </Form.Label>
            <Form.Control
                placeholder='Enter Notes or N/A (e.g. Gate Code, Special Instructions)'
                value={this.state.purchase.delivery_instructions}
                name='delivery_instructions'
                onChange={this.handleChange}
            />
            </Form.Group>

            <Form.Row>
            <Form.Group as={Col} controlId='formGridEmail'>
                <Form.Label>
                Email
                <span className='required-red'>
                    {" "}
                    <b>*</b>
                </span>
                </Form.Label>
                <Form.Control
                type='email'
                placeholder='Enter Email'
                value={this.state.purchase.delivery_email}
                name='delivery_email'
                onChange={this.handleChange}
                />
            </Form.Group>

            <Form.Group as={Col} controlId='formGridPhoneNumber'>
                <Form.Label>
                Phone Number
                <span className='required-red'>
                    {" "}
                    <b>*</b>
                </span>
                </Form.Label>
                <Form.Control
                placeholder='1234567890'
                value={this.state.purchase.delivery_phone}
                name='delivery_phone'
                onChange={this.handleChange}
                />
            </Form.Group>
            </Form.Row>

            <Form.Row>
            <Form.Group as={Col} controlId='formGridAddress'>
                <Form.Label>
                Address
                <span className='required-red'>
                    {" "}
                    <b>*</b>
                </span>
                </Form.Label>
                <Form.Control
                placeholder='1234 Main St'
                value={this.state.purchase.delivery_address}
                name='delivery_address'
                onChange={this.handleChange}
                />
            </Form.Group>

            <Form.Group as={Col} controlId='formGridAptNum'>
                <Form.Label>
                Apartment/Unit <b>(optional)</b>
                </Form.Label>
                <Form.Control
                placeholder='Apartment, studio, or floor'
                value={this.state.purchase.delivery_address_unit}
                name='delivery_address_unit'
                onChange={this.handleChange}
                />
            </Form.Group>
            </Form.Row>

            <Form.Row>
            <Form.Group as={Col} controlId='formGridCity'>
                <Form.Label>
                City
                <span className='required-red'>
                    {" "}
                    <b>*</b>
                </span>
                </Form.Label>
                <Form.Control
                placeholder='Prep City'
                value={this.state.purchase.delivery_city}
                name='delivery_city'
                onChange={this.handleChange}
                />
            </Form.Group>

            <Form.Group as={Col} controlId='formGridState'>
                <Form.Label>
                State
                <span className='required-red'>
                    {" "}
                    <b>*</b>
                </span>
                </Form.Label>
                <Form.Control
                as='select'
                value={this.state.purchase.delivery_state}
                name='delivery_state'
                onChange={this.handleChange}
                >
                <option>Choose...</option>
                <option>TX</option>
                </Form.Control>
            </Form.Group>

            <Form.Group as={Col} controlId='formGridZip'>
                <Form.Label>
                Zip
                <span className='required-red'>
                    {" "}
                    <b>*</b>
                </span>
                </Form.Label>
                <Form.Control
                placeholder='12345'
                value={this.state.purchase.delivery_zip}
                name='delivery_zip'
                onChange={this.handleChange}
                />
            </Form.Group>
            </Form.Row>

            <Form.Group
            as={Col}
            md={6}
            Style='margin-left:-15px;'
            controlId='formGridCountry'
            >
            <Form.Label>
                Country
                <span className='required-red'>
                {" "}
                <b>*</b>
                </span>
            </Form.Label>
            <Form.Control
                as='select'
                value={this.state.purchase.delivery_region}
                name='delivery_region'
                onChange={this.handleChange}
            >
                <option>Choose...</option>
                <option>US</option>
            </Form.Control>
            </Form.Group>

            <Form.Group id='formGridCheckbox'>
            <Form.Check
                id='isGift'
                type='checkbox'
                label='This is a Gift'
                value={this.state.gift}
                onChange={this.handleGiftChange}
            />
            </Form.Group>

            <h5>Billing Information</h5>

            <Form.Row>
            <Form.Group as={Col} md={6} controlId='formGridCardNumber'>
                <Form.Label>
                Credit Card Number
                <span className='required-red'>
                    {" "}
                    <b>*</b>
                </span>
                </Form.Label>
                <Form.Control
                placeholder='Enter Card Number'
                value={this.state.purchase.cc_num}
                name='cc_num'
                onChange={this.handleChange}
                />
            </Form.Group>
            </Form.Row>

            <Form.Row>
            <Form.Group as={Col} md={3} controlId='formGridCardCvc'>
                <Form.Label>
                CVC
                <span className='required-red'>
                    {" "}
                    <b>*</b>
                </span>
                </Form.Label>
                <Form.Control
                placeholder='123'
                value={this.state.purchase.cc_cvv}
                name='cc_cvv'
                onChange={this.handleChange}
                />
            </Form.Group>

            <Form.Group as={Col} md={3} controlId='formGridCardMonth'>
                <Form.Label>
                Month
                <span className='required-red'>
                    {" "}
                    <b>*</b>
                </span>
                </Form.Label>
                <Form.Control
                as='select'
                value={this.state.purchase.cc_exp_month}
                name='cc_exp_month'
                onChange={this.handleChange}
                >
                <option>Choose...</option>
                <option>01</option>
                <option>02</option>
                <option>03</option>
                <option>04</option>
                <option>05</option>
                <option>06</option>
                <option>07</option>
                <option>08</option>
                <option>09</option>
                <option>10</option>
                <option>11</option>
                <option>12</option>
                </Form.Control>
            </Form.Group>

            <Form.Group as={Col} md={3} controlId='formGridCardYear'>
                <Form.Label>
                Year
                <span className='required-red'>
                    {" "}
                    <b>*</b>
                </span>
                </Form.Label>
                <Form.Control
                as='select'
                value={this.state.purchase.cc_exp_year}
                name='cc_exp_year'
                onChange={this.handleChange}
                >
                <option>Choose...</option>
                <option>2020</option>
                <option>2021</option>
                <option>2022</option>
                <option>2023</option>
                <option>2024</option>
                <option>2025</option>
                <option>2026</option>
                <option>2027</option>
                <option>2028</option>
                <option>2029</option>
                </Form.Control>
            </Form.Group>
            </Form.Row>

            <Form.Row>
            <Form.Group as={Col} md={4} controlId='formGridBillingZip'>
                <Form.Label>
                Postal Code
                <span className='required-red'>
                    {" "}
                    <b>*</b>
                </span>
                </Form.Label>
                <Form.Control
                placeholder='12345'
                value={this.state.purchase.billing_zip}
                name='billing_zip'
                onChange={this.handleChange}
                />
            </Form.Group>

            <Form.Group as={Col} controlId='formGridBillingCountry'>
                <Form.Label>
                Country
                <span className='required-red'>
                    {" "}
                    <b>*</b>
                </span>
                </Form.Label>
                <Form.Control as='select'>
                <option>Choose...</option>
                <option>US</option>
                </Form.Control>
            </Form.Group>
            </Form.Row>

            <Form.Row>
            <Form.Group as={Col} md={3} controlId='formGridPassword'>
                <Form.Label>
                Password
                <span className='required-red'>
                    {" "}
                    <b>*</b>
                </span>
                </Form.Label>
                <Form.Control
                type='password'
                placeholder={
                    !this.state.password_salt
                    ? "Social Media Account"
                    : "Enter Password"
                }
                value={this.state.password}
                name='password'
                onChange={this.handlePwChange}
                disabled={!this.state.password_salt ? true : false}
                />
            </Form.Group>
            </Form.Row>

            <Button
            onClick={this.checkout}
            variant='success'
            type='submit'
            disabled={this.validateForm()}
            >
            Checkout
            </Button>
        </Form>
    );
}

export default ValidateForm;