import { Container, Table, Stack } from 'react-bootstrap';
import React, { useEffect, useState } from 'react';
import { getJobs } from '../../api/job';
import { Link } from 'react-router-dom';

const JobsList = () => {
  const [jobsData, setJobsData] = useState([]);

  useEffect(async ()=> {
    let jobs = await getJobs();
    setJobsData(jobs);
  }, [getJobs])

    return (
      <Stack gap={3}>
        <Container className='mt-3'>
          <Stack direction='horizontal' gap={3}>
            <div>Total Jobs: { jobsData.length }</div>
            <div className='ms-auto'>
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
                <th>Address</th>
                <th>Description</th>
                <th>By user</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              {jobsData.map((job) => {
                let { id, name, address, description, user: { email}} = job;
                return <tr key={id}>
                  <td>{id}</td>
                  <td>{name}</td>
                  <td>{address}</td>
                  <td>{description}</td>
                  <td>{email}</td>
                  <td><Link to={`/jobs/${id}/estimates`}>See Estimates</Link></td>
                </tr>
              })}
            </tbody>
          </Table>
        </Container>
      </Stack>
    );
}

export default JobsList;
