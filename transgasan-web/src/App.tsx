import React from 'react';
import Login from './components/login/Login';
import Header from './components/header/Header';
import Dashboard from './components/Dashboard/Dashboard'; 
import { BrowserRouter, Route, Switch } from 'react-router-dom';

const App: React.FC = () => {
  
  return (
  <div className="App">
    <BrowserRouter>
      <Switch>
        <Route path="/Login">
          
          <Login />
    
        </Route>

        <Route path="/Dashboard">

          <Dashboard />
          
        </Route>
      </Switch>
    </BrowserRouter>

    
  </div>
  );
}

export default App;
