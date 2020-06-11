import React, { useEffect, useState } from 'react';
import { CurrentUser } from '../components/CurrentUser';

export const CustomerPage = (props) => {
  const [userName, setUserName] = useState('');
  useEffect(() => {
    setUserName(props.match.params.name);
  }, []);
  return (
    <div>
      <CurrentUser currentUser={userName} />
      <h2>This is the customer page</h2>
    </div>
  );
};
