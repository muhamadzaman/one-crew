import { API_V1_URL } from "../Constants";
import { get, post } from './helper/api-functions'

export async function getJobs() {
  try {
    return await get(`${API_V1_URL}/jobs`);
  } catch (error) {
    console.log(error.response)
  }
}

export async function saveJob(formData) {
  try {
    return await post(`${API_V1_URL}/jobs`, formData);
  } catch (error) {
    console.log(error.response)
    throw(error)
  }
}
