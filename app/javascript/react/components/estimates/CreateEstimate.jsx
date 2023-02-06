import { Form, Button, Container } from 'react-bootstrap';
import React, { useState } from 'react';
import history from '../../history.js';
import FormInput from '../FormInput';
import { saveEstimate } from '../../api/estimate';
import { useParams } from 'react-router-dom';
import EstimateDetailForm from './EstimateDetailForm.jsx';

const initialDetail = {
  key: 1,
  job: '',
  units: '',
  time: '',
  rate: '',
  cost: '',
  margin_multiple: '',
  estimate_category: '',
  unit_of_measure: ''
}

const CreateEstimate = (props) => {
  const { jobId } = useParams();

  const [estimateData, setEstimateData] = useState({
    name: '',
    description: '',
    estimate_details_attributes: [{}]
  });

  const [estimateDetailsData, setEstimateDetailData] = useState([
    initialDetail
  ]);

  const { name, description } = estimateData;

  const onChange = (event) => {
    setEstimateData({ ...estimateData, [event.target.name]: event.target.value })
  }

  const onSubmit = () => {
    saveEstimate(jobId, { ...estimateData, estimate_details_attributes: estimateDetailsData })
      .then((response) => {
        history.push(`/jobs/${jobId}/estimates/${response.id}`);
      })
      .catch((error) => {
        setNameError(error.response.data.error.fields['name']);
      });
  }

  const addDetail = () => {
    let count = estimateDetailsData.length;
    let detail = { ...initialDetail, key: count + 1 }
    setEstimateDetailData([...estimateDetailsData, detail])
  }

  return (
    <Container>
      <Form>
        <FormInput type='input' label='Name' placeholder='Enter name' name='name' value={name} onChange={onChange}/>
        <FormInput type='input' label='Description' placeholder='Description' name='description' value={description} onChange={onChange}/>
        <h4>Estimate Details</h4>
        {estimateDetailsData.map(detail =>(
          <>
            <EstimateDetailForm key={detail.key} recordKey={detail.key} estimateDetails={estimateDetailsData} setEstimateDetailData={setEstimateDetailData}></EstimateDetailForm>
          </>
        ))}
        <Button variant='primary' type='button' onClick={e=>onSubmit()}>
          Save
        </Button>
        {' '}
        <Button variant='primary' type='button' onClick={e=>addDetail()}>
          Add Detail
        </Button>
        {' '}
        <Button variant='primary' type='button' onClick={e=>(history.push(`/jobs/${jobId}/estimates`))}>
          Cancel
        </Button>
      </Form>
    </Container>
  );
}

export default CreateEstimate;
