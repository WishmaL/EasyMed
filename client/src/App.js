import React from 'react';
import { NavBar } from './components/NavBar';
import { Route, Switch } from 'react-router-dom';

import { Home } from './pages/Home';
import { Login } from './pages/Login';
function App() {
  return (
    <div className="App">
      {/* navbar displays for all the pages */}
      <NavBar />

      <Switch>
        <Route exact path="/" component={Home} />
        <Route exact path="/login" component={Login} />
      </Switch>
    </div>
  );
}

export default App;
