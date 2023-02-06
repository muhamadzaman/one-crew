import { Form, Button, Container } from 'react-bootstrap';
import React, { useState } from 'react';
import history from '../../history.js';
import FormInput from '../FormInput';
import { saveJob } from '../../api/job.js';

const CreateJob = (props) => {
  const [nameError, setNameError] = useState('');

  const [formData, setFormData] = useState({
    name: '',
    address: '',
    description: ''
  });

  const { name, address, description} = formData;

  const onChange = (event) => {
    setFormData({ ...formData, [event.target.name]: event.target.value })
  }

  const onSubmit = () => {
    saveJob(formData)
      .then((response) => {
        history.push('/');
      })
      .catch((error) => {
        setNameError(error.response.data.error.fields['name']);
      });
  }

  return (
    <Container>
      <Form>
        <FormInput type='input' label='Name' placeholder='Enter name' name='name' value={name} onChange={onChange} error={nameError} />
        <FormInput type='input' label='Address' placeholder='Address' name='address' value={address} onChange={onChange}/>
        <FormInput type='input' label='Description' placeholder='Description' name='description' value={description} onChange={onChange}/>
        <Button variant='primary' type='button' onClick={() => onSubmit()}>
          Save
        </Button>
      </Form>
    </Container>
  );
}

export default CreateJob;
