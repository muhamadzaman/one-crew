import { API_V1_URL } from "../Constants";
import { get, post, patch, remove } from './helper/api-functions'

export async function getEstimates(jobId) {
  try {
    return await get(`${API_V1_URL}/jobs/${jobId}/estimates`);
  } catch (error) {
    console.log(error.response);
    throw(error.response);
  }
}

export async function getEstimate(jobId, estimateId) {
  try {
    return await get(`${API_V1_URL}/jobs/${jobId}/estimates/${estimateId}`);
  } catch (error) {
    console.log(error.response);
    throw(error.response);
  }
}

export async function saveEstimate(jobId, formData) {
  try {
    return await post(`${API_V1_URL}/jobs/${jobId}/estimates`, formData);
  } catch (error) {
    console.log(error.response);
    throw(error)
  }
}

export async function updateEstimate(jobId, estimateId, formData) {
  try {
    return await patch(`${API_V1_URL}/jobs/${jobId}/estimates/${estimateId}`, formData);
  } catch (error) {
    console.log(error.response);
    throw(error)
  }
}

export async function deleteEstimate(jobId, estimateId) {
  if (window.confirm('Are You sure!')){
    try {
      return await remove(`${API_V1_URL}/jobs/${jobId}/estimates/${estimateId}`);
    } catch (error) {
      console.log(error.response);
      throw(error)
    }
  }
}
