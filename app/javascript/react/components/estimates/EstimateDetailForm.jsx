import { Container } from 'react-bootstrap';
import React from 'react';
import FormInput from '../FormInput';

const EstimateDetailForm = ({recordKey, estimateDetails, setEstimateDetailData}) => {
  let estimateDetail = estimateDetails.find((e) => e.key === recordKey);
  const {
    key,
    job,
    units,
    time,
    rate,
    cost,
    margin_multiple,
    estimate_category,
    unit_of_measure
  } = estimateDetail;

  const onChange = (event) => {
    estimateDetail = { ...estimateDetail, [event.target.name]: event.target.value }
    setEstimateDetailData([...estimateDetails.map(e => e.key === estimateDetail.key ? estimateDetail : e)])
  }

  return (
    <Container className='estimate-detail'>
      <FormInput type='input' placeholder='Job name' name='job' value={job} onChange={onChange}/>
      <FormInput type='input' placeholder='Number of units' name='units' value={units} onChange={onChange}/>
      <FormInput type='input' placeholder='Time required' name='time' value={time} onChange={onChange}/>
      <FormInput type='input' placeholder='Rate' name='rate' value={rate} onChange={onChange}/>
      <FormInput type='input' placeholder='Cost per unit' name='cost' value={cost} onChange={onChange}/>
      <FormInput type='input' placeholder='Margin multiple' name='margin_multiple' value={margin_multiple} onChange={onChange}/>
      <FormInput type='input' placeholder='Estimate category' name='estimate_category' value={estimate_category} onChange={onChange}/>
      <FormInput type='input' placeholder='Unit of measure' name='unit_of_measure' value={unit_of_measure} onChange={onChange}/>
    </Container>
  );
}

export default EstimateDetailForm;
