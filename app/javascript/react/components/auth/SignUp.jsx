import React, { Component } from 'react';
import axios from 'axios';
import { APP_URL } from '../../Constants';
import { Form, Button, Container } from 'react-bootstrap';
import { registerSuccessfulLogin } from '../../services/AuthenticationForApiService.js';
import FormInput from '../FormInput';
class SignUp extends Component {
  constructor(props) {
    super(props);
    this.state = {
      name: '',
      email: '',
      password: '',
      confirmPassword: '',
      hasFailed: false,
      showSuccessMessage: false,
      emailError: '',
    };
    this.signUp = this.signUp.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange = (event) => {
    this.setState({
      [event.target.name]: event.target.value,
    });
  };

  signUp = (e) => {
    const data = {
      email: this.state.email,
      name: this.state.name,
      password: this.state.password,
      password_confirmation: this.state.confirmPassword,
    };

    axios
      .post(APP_URL + '/auth', data)
      .then((response) => {
        registerSuccessfulLogin(
          response.headers['uid'],
          response.headers['access-token'],
          response.headers['client'],
          response.headers['uid'],
          response.data.data.id
        );
        this.props.history.push('/');
      })
      .catch((error) => {
        this.setState({
          hasFailed: false,
          emailError: error.response.data.errors['email'],
          passwordError: error.response.data.errors['password'],
          confirmPasswordError:
            error.response.data.errors['password_confirmation'],
        });
      });
  };

  render() {
    const { name, email, emailError, password, passwordError, confirmPassword, confirmPasswordError } = this.state;

    return (
      <Container>
        <Form>
          <FormInput type={'email'} label={'Email address'} placeholder={'Email address'} name={'email'} value={email} onChange={this.handleChange} error={emailError} />
          <FormInput type={'text'} label={'Name'} placeholder={'Name'} name={'name'} value={name} onChange={this.handleChange}/>
          <FormInput type={'password'} label={'Password'} placeholder={'Password'} name={'password'} value={password} onChange={this.handleChange} error={passwordError} />
          <FormInput type={'password'} label={'Password'} placeholder={'Password'} name={'confirmPassword'} value={confirmPassword} onChange={this.handleChange} error={confirmPasswordError} />
          <Button variant='primary' type='button' onClick={this.signUp}>
            Signup
          </Button>
        </Form>
      </Container>
    );
  }
}

export default SignUp;
