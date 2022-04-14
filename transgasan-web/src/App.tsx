import React from 'react';
import Login from './components/login/Login';
import Header from './components/header/Header';

const App: React.FC = () => {
  return (
  <div className="App">
    <Header />
    <Login />
  </div>
  );
}

export default App;
