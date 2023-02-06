import React from 'react';
import { Router, Route, Switch } from 'react-router-dom';
import AuthenticatedRoute from './AuthenticatedRoute.jsx';
import LoginComponent from './auth/Login.jsx';
import ErrorComponent from './Error.jsx';
import HeaderComponent from './Header.jsx';
import SignUp from './auth/SignUp';
import JobsList from './jobs/JobsList';
import CreateJob from './jobs/CreateJob';
import Estimates from './estimates/Estimates';
import CreateEstimate from './estimates/CreateEstimate';
import EstimateDetails from './estimates/EstimateDetails';
import EditEstimate from './estimates/EditEstimate';
import history from '../history.js';

const Dashboard = ({isUserLoggedIn, setIsUserLoggedIn}) => {

  return (
    <div className='AgCloudApp'>
      <Router history={history}>
        <>
          <HeaderComponent isUserLoggedIn={isUserLoggedIn} setIsUserLoggedIn={setIsUserLoggedIn} />
          <Switch>
            <AuthenticatedRoute exact path='/' component={JobsList} />
            <AuthenticatedRoute exact path='/create-job' component={CreateJob} />
            <AuthenticatedRoute exact path='/jobs/:jobId/estimates' component={Estimates} />
            <AuthenticatedRoute exact path='/jobs/:jobId/estimates/new' component={CreateEstimate} />
            <AuthenticatedRoute exact path='/jobs/:jobId/estimates/:estimateId' component={EstimateDetails} />
            <AuthenticatedRoute exact path='/jobs/:jobId/estimates/:estimateId/edit' component={EditEstimate} />
            <Route path='/login' component={() => <LoginComponent setIsUserLoggedIn={setIsUserLoggedIn} />} />
            <Route path='/signup' component={SignUp} />
            <Route component={ErrorComponent} />
          </Switch>
        </>
      </Router>
    </div>
  );
}

export default Dashboard;
