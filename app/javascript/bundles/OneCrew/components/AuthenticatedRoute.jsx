import React, { Component } from "react";
import { Route, Redirect } from "react-router-dom";
import { isUserLoggedIn } from "../services/AuthenticationForApiService.js";

class AuthenticatedRoute extends Component {
  render() {
    if (isUserLoggedIn()) {
      return <Route {...this.props} />
    } else {
      return <Redirect to="/login" />
    }
  }
}

export default AuthenticatedRoute;
