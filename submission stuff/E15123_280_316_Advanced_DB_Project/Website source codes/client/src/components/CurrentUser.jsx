import React from 'react';
import Navbar from 'react-bootstrap/Navbar';

export const CurrentUser = ({currentUser}) => {
  return (
    <div>
      <Navbar className="justify-content-end">
        <Navbar.Text>
          Signed in as: <a href="#login">{currentUser}</a>
        </Navbar.Text>
      </Navbar>
    </div>
  );
};
