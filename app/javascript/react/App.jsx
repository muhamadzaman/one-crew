import React, { useState, useEffect } from 'react';
import Dashboard from './components/Dashboard'
import { isUserLoggedIn } from './services/AuthenticationForApiService.js';
import 'bootstrap/dist/css/bootstrap.css';
import './App.css';

const App = () => {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  useEffect(() => {
    setIsLoggedIn(isUserLoggedIn());
  }, [])

  return (
    <div>
      <Dashboard isUserLoggedIn={isLoggedIn} setIsUserLoggedIn={setIsLoggedIn} />
    </div>
  )
};

export default App;
