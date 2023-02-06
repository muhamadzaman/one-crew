import { Container, Table, Stack, Button } from 'react-bootstrap';
import React, { useEffect, useState, Fragment } from 'react';
import { getEstimate, deleteEstimate } from '../../api/estimate';
import { Link, useParams } from 'react-router-dom';
import EstimateDetail from './EstimateDetail';
import groupBy from '../../utils/groupBy'
import { canEdit } from '../../services/AuthenticationForApiService';
import history from '../../history.js';

const EstimateDetails = () => {
  const { jobId, estimateId } = useParams();
  const [estimateData, setEstimateData] = useState({
    name: '',
    description: '',
    estimate_details: [{}],
    job: {
      name: '',
      address: ''
    }
  });

  const { id, name, description, job, estimate_details, user } = estimateData;

  const grouped_details = estimate_details.length > 0 ? groupBy(estimate_details, 'estimate_category') : {};
  const categories = Object.keys(grouped_details);

  useEffect(async () => {
    let estimate = await getEstimate(jobId, estimateId);
    setEstimateData(estimate);
  }, [getEstimate, jobId, estimateId])

  const removeEstimate = () => {
    deleteEstimate(jobId, estimateId)
      .then(() => {
        history.push(`/jobs/${jobId}/estimates`);
      })
      .catch((error) => {
        setNameError(error.response.data.error.fields['name']);
      });
  }

  return (
    <Stack gap={3}>
      <Container className='mt-3'>
        <Stack direction='horizontal' gap={3}>
          <div className='ms-auto'>
          </div>
        </Stack>
      </Container>

      <Container>
        <Table striped bordered hover>
          <thead>
            <tr>
            <td colSpan={7}>
              <div className='estimate-head'>
                <div>
                  <p><strong> Estimate for</strong></p>
                  <p>{job?.name}</p>
                  <p>{job?.address}</p>
                </div>
                <div>
                <p><strong>{name}</strong></p>
                <p>Job Number: {id}</p>
                </div>
              </div>
            </td>
            </tr>
            <tr>
              <th>Job</th>
              <th>Units</th>
              <th>Time</th>
              <th>Rate</th>
              <th>Cost</th>
              <th>Margin multiple</th>
              <th>Bid</th>
            </tr>
          </thead>
          <tbody>
            {
              categories.length > 0 &&
              categories.map(category => (
                <Fragment key={category}>
                  <tr><td colSpan={7}><strong>{category}</strong></td></tr>
                  {grouped_details[category].map(e => (
                    <EstimateDetail key={e.id} detail={e}/>
                  ))}
                </Fragment>
              ))
            }
          </tbody>
        </Table>
        { canEdit(user?.id, 'contractor') &&
          <Button variant='danger' type='button' onClick={() => removeEstimate()}>
            Delete
          </Button>
        }
        {'  '}
        { canEdit(user?.id, 'contractor') && <Link to={`/jobs/${jobId}/estimates/${estimateId}/edit`}>Edit</Link>  } {'  '}
        <Link to={`/jobs/${jobId}/estimates`}>Go Back</Link> {'  '}
      </Container>
    </Stack>
  );
}

export default EstimateDetails;
