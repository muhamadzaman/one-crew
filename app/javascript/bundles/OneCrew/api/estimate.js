import axios from "axios";
import { API_V1_URL } from "../Constants";
import { getCredentials } from "../services/AuthenticationForApiService";

export async function getEstimates(jobId) {
  try {
    let res = await axios.get(`${API_V1_URL}/jobs/${jobId}/estimates`, {
      headers: {
        ...getCredentials(),
        Accept: 'application/json'
      }
    });
    return res.data;
  } catch (error) {
    console.log(error.response);
    throw(error.response);
  }
}

export async function getEstimate(jobId, estimateId) {
  try {
    let res = await axios.get(`${API_V1_URL}/jobs/${jobId}/estimates/${estimateId}`, {
      headers: {
        ...getCredentials(),
        Accept: 'application/json'
      }
    });
    return res.data;
  } catch (error) {
    console.log(error.response);
    throw(error.response);
  }
}

export async function saveEstimate(jobId, formData) {
  try {
    let res = await axios.post(`${API_V1_URL}/jobs/${jobId}/estimates`, formData, {
      headers: {
        ...getCredentials(),
        Accept: 'application/json',
        'Content-Type': 'application/json'
      }
    });
    return res.data;
  } catch (error) {
    console.log(error.response)
    throw(error)
  }
}

export async function updateEstimate(jobId, estimateId, formData) {
  try {
    let res = await axios.patch(`${API_V1_URL}/jobs/${jobId}/estimates/${estimateId}`, formData, {
      headers: {
        ...getCredentials(),
        Accept: 'application/json',
        'Content-Type': 'application/json'
      }
    });
    return res.data;
  } catch (error) {
    console.log(error.response)
    throw(error)
  }
}

export async function deleteEstimate(jobId, estimateId) {
  if (window.confirm('Are You sure!')){
    try {
      let res = await axios.delete(`${API_V1_URL}/jobs/${jobId}/estimates/${estimateId}`, {
        headers: {
          ...getCredentials(),
          Accept: 'application/json'
        }
      });
      return res.data;
    } catch (error) {
      console.log(error.response)
      throw(error)
    }
  }
}
