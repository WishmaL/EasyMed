import React from 'react';
import {
  Container,
  Row,
  Col,
  ListGroup,
  Form,
  Button,
  Card,
} from 'react-bootstrap';

function ShowMedi() {
  return (
    <div>
      <Container>
        <Card style={{ width: '18rem' }}>
          <Card.Header>Order Summary</Card.Header>
          <ListGroup variant="flush">
            <ListGroup.Item>Cras justo odio</ListGroup.Item>
            {/* <ListGroup.Item>Dapibus ac facilisis in</ListGroup.Item>
            <ListGroup.Item>Vestibulum at eros</ListGroup.Item> */}
          </ListGroup>
        </Card>
      </Container>
    </div>
  );
}

export default ShowMedi;
