import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import { CurrentUser } from '../components/CurrentUser';
import moment from 'moment';

import {
  Container,
  Row,
  Col,
  ListGroup,
  Form,
  Button,
  Card,
} from 'react-bootstrap';
import axios from 'axios';
import ShowMedi from '../components/ShowMedi';

export const CustomerPage = (props) => {
  const [id, setId] = useState(props.match.params.id);
  const [userInfo, setUserInfo] = useState([]);

  const [IsOrdered, setIsOrdered] = useState(false);

  // const [orderId, setOrderId] = useState('');
  // var today = new Date();
  // var dd = String(today.getDate()).padStart(2, '0');
  // var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
  // var yyyy = today.getFullYear();

  // today = yyyy + '-' + mm + '-' + dd;
  const [date, setDate] = useState(moment(Date.now()).format('YYYY-MM-DD'));
  const [picURL, setPicURL] = useState('the url');

  const [orderId, setOrderId] = useState('');
  const [medication, setMedication] = useState('');
  const [amount, setAmount] = useState(0);

  const getPersonalInfo = () => {
    axios
      .get('/customers/getCustomerInfo/' + id)
      .then((res) => {
        // console.log(res.data[0]);
        setUserInfo(res.data[0]);
      })
      .catch((err) => {
        console.log(err);
      });
  };

  useEffect(() => {
    // getPersonalInfo();
  }, []);

  const clickOrderHandler = (e) => {
    // document.write(today);
    e.preventDefault();
    setIsOrdered(true);
    // let datee = moment(Date.now()).format('YYYY-MM-DD')
    // setDate(datee);

    // console.log(moment().format('L'))
    // setPicURL('the pic url');

    const data_ = {
      customerId: id,
      date: date,
      pic_url: picURL,
    };

    console.log(data_);
    axios
      .post('/orders_information/newOrdersInfo/', data_)
      .then(function (response) {
        // console.log(response.data.length);
        if (!response.data.length) {
          alert('Username or Password is incorrect! Try again');
        } else {
          console.log(response.data[0]);
        }
      })
      .catch(function (error) {
        console.log('Error occured! ', error);
      });
  };

  const clickHandler = (e) => {
    e.preventDefault();

    const data_ = {
      orders_informationId: orderId,
      medication: medication,
      amount: amount,
    };

    axios
      .post('/order_medicines/newOrderMedicine/', data_)
      .then(function (response) {
        console.log(response.data.length);
        if (!response.data.length) {
          alert('Error occured!!');
        } else {
          console.log(response.data[0]);
        }
      })
      .catch(function (error) {
        console.log('Error occured! ', error);
      });
  };

  // const isItOrdered = () => {};

  return (
    <div>
      <Container>
        <h2>Ordering page</h2>

        {/* <Row> */}
        <Col>
          <h3>Personal Information</h3>
          <ListGroup>
            <ListGroup.Item>Name: {userInfo.name}</ListGroup.Item>
            <ListGroup.Item>Age: {userInfo.age}</ListGroup.Item>
            <ListGroup.Item>
              Address: {userInfo.delivery_address}
            </ListGroup.Item>
            <ListGroup.Item>NIC: {userInfo.nic}</ListGroup.Item>
            <ListGroup.Item>Contact NO:{userInfo.contact_no}</ListGroup.Item>
          </ListGroup>
        </Col>
        <Col>
          <h3>Medication Description</h3>
          <Button
            variant="primary"
            onClick={clickOrderHandler}
            disabled={IsOrdered}
          >
            Add Order
          </Button>
          <Form>
            <Row>
              <Form.Group as={Col} controlId="formHorizontalEmail">
                <Form.Label column sm={4}>
                  Medication
                </Form.Label>
                <Col sm={10}>
                  <Form.Control
                    type="text"
                    placeholder="Med Name"
                    value={medication}
                    onChange={(e) => setMedication(e.target.value)}
                  />
                </Col>
              </Form.Group>

              <Form.Group as={Col} controlId="formHorizontalPassword">
                <Form.Label column sm={4}>
                  Amount
                </Form.Label>
                <Col sm={10}>
                  <Form.Control
                    type="text"
                    placeholder="Amount"
                    value={amount}
                    onChange={(e) => setAmount(e.target.value)}
                  />
                </Col>
              </Form.Group>

              <Form.Group as={Row}>
                <Col sm={{ span: 10, offset: 2 }}>
                  <Button
                    type="submit"
                    onClick={clickHandler}
                    disabled={!IsOrdered}
                  >
                    Add
                  </Button>
                </Col>
              </Form.Group>
            </Row>
          </Form>

          {/* following shows the medication */}
          {/* {IsOrdered ? <ShowMedi /> : null} */}
          {/* <ShowMedi /> */}
          {/* </ListGroup> */}
        </Col>
        {/* </Row> */}
      </Container>
    </div>
  );
};
