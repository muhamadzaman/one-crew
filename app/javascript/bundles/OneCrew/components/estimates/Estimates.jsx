import { Container, Table, Stack } from "react-bootstrap";
import React, { useEffect, useState } from "react";
import { getEstimates } from "../../api/estimate";
import { Link, useParams } from 'react-router-dom';

const Estimates = () => {
  const { jobId } = useParams();
  const [estimatesData, setEstimatesData] = useState([]);

  useEffect(async () => {
    let jobs = await getEstimates(jobId);
    setEstimatesData(jobs);
  }, [getEstimates, jobId])

    return (
      <Stack gap={3}>
        <Container className="mt-3">
          <Stack direction="horizontal" gap={3}>
            <div>Total Estimates: { estimatesData.length }</div>
            <div className="ms-auto">
            </div>
          </Stack>
        </Container>

        <Container>
          <Table striped bordered hover>
            <thead>
              <tr>
                <th>#</th>
                <th>
                  Name
                </th>
                <th>Description</th>
                <th>Total Cost</th>
                <th>By user</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              {estimatesData.map((job) => {
                let { id, name, total_cost, description, user: { email }} = job;
                return <tr key={id}>
                  <td>{id}</td>
                  <td>{name}</td>
                  <td>{description}</td>
                  <td>{total_cost}</td>
                  <td>{email}</td>
                  <td>
                    <Link to={`/jobs/${jobId}/estimates/${id}`}>Detail</Link> {' '}
                    <Link to={`/jobs/${jobId}/estimates/${id}/edit`}>Edit</Link>
                  </td>
                </tr>
              })}
            </tbody>
          </Table>
          <Link to={`/jobs/${jobId}/estimates/new`}>Create Estimate</Link> {' '}
          <Link to={'/jobs'}>jobs list</Link>
        </Container>
      </Stack>
    );
}

export default Estimates;
