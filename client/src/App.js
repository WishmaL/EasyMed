import React from 'react';
import { NavBar } from './components/NavBar';
import { Route, Switch } from 'react-router-dom';

import { Home } from './pages/Home';
import { Login } from './pages/Login';
import { CustomerPage } from './pages/CustomerPage';
function App() {
  return (
    <div className="App">
      {/* navbar displays for all the pages */}
      <NavBar />

      <Switch>
        <Route exact path="/CustomerPage/:name" component={CustomerPage} />
        <Route exact path="/" component={Home} />
        <Route exact path="/Login" component={Login} />
      </Switch>
    </div>
  );
}

export default App;
