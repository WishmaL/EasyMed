import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import Form from 'react-bootstrap/Form';
import { Button, Container } from 'react-bootstrap';
import axios from 'axios';

export const Login = () => {
  const [name, setName] = useState('');
  const [password, setPassword] = useState('');
  // const [contactNo, setContactNo] = useState('');
  // const [deliveryAdd, setDeliveryAdd] = useState('');
  // // const [name, setName] = useState('');
  // const [nic, setNic] = useState('');
  // const [age, setAge] = useState('');

  // const [userInfo, setUserInfo] = useState({
  //   age: '',
  //   contact_no: '',
  //   delivery_address: '',
  //   id: '',
  //   name: '',
  //   nic: '',
  //   password: '',
  // });

  const submitHandler = (e) => {
    e.preventDefault();
    const data_ = {
      name: name,
      password: password,
    };
    axios
      .post('/customers/getCustomer/', data_)
      .then(function (response) {
        // console.log(response.data[0]);

        if (!response.data.length) {
          // alert('Username or Password is incorrect! Try again');
          console.log('Username or Password is incorrect! Try again');
        } else if (
          response.data[0].name === name &&
          response.data[0].password === password
        ) {
          // setAge(response.data[0].age);
          // console.log(response.data[0].id);
          // clickHandler();
          window.location = `/Customerpage/${response.data[0].id}`;

          // window.location = <Link to=/CustomerPage/" />;
        }
      })
      .then(() => {
        // window.location = `/Customerpage/${userInfo}`;
      })
      .catch(function (error) {
        console.log('Error occured! ', error);
      });
    // console.log(age);
    // console.log('the data ', userInfo);
  };

  // const clickHandler = () => {
  //   window.location = `/Customerpage/${userInfo}`;
  //   console.log('data', userInfo);
  // };

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
            <Button variant="primary" type="submit">
              Login
            </Button>
          </div>
        </Form>
      </Container>
    </div>
  );
};
