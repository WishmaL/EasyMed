import React, { useState, useEffect } from 'react';
import Form from 'react-bootstrap/Form';
import { Button, Container } from 'react-bootstrap';
import axios from 'axios';

export const Login = () => {
  const [name, setName] = useState('');
  const [password, setPassword] = useState('');
  const [IsLoggedIn, setIsLoggedIn] = useState(false);

  const submitHandler = (e) => {
    e.preventDefault()
    const data_ = {
      name: name,
      password: password,
    };
    axios
      .post('/customers/getCustomer/', data_)
      .then(function (response) {
        console.log(response.data);
        if (!response.data.length) {
          // alert('Username or Password is incorrect! Try again');
          console.log('Username or Password is incorrect! Try again')
        } else if (
          response.data[0].name === name &&
          response.data[0].password === password
        ) {
          // alert('userlogged-In');
          window.location = `/Customerpage/${name}`;
        }
      })
      .catch(function (error) {
        console.log('Error occured! ', error);
      });
  };

  return (
    <div>
      <Container>
        <h2 className="text-center">Let's Login</h2>
        <Form onSubmit={submitHandler}>
          <Form.Group controlId="formBasicEmail">
            <Form.Label>Email address</Form.Label>
            <Form.Control
              type="text"
              placeholder="Enter email"
              value={name}
              onChange={(e) => setName(e.target.value)}
            />
            <Form.Text className="text-muted">
              We'll never share your email with anyone else.
            </Form.Text>
          </Form.Group>

          <Form.Group controlId="formBasicPassword">
            <Form.Label>Password</Form.Label>
            <Form.Control
              type="password"
              placeholder="Password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
            />
          </Form.Group>
          <Form.Group controlId="formBasicCheckbox">
            <Form.Check type="checkbox" label="Check me out" />
          </Form.Group>
          <div className="text-center">
            <Button variant="primary" type="submit" >
              Login
            </Button>
          </div>
        </Form>
      </Container>
    </div>
  );
};
