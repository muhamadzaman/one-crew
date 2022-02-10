import axios from "axios";
import { API_V1_URL } from "../Constants";
import { getCredentials } from "../services/AuthenticationForApiService";

export async function getJobs() {
  try {
    let res = await axios.get(`${API_V1_URL}/jobs`, {
      headers: {
        ...getCredentials(),
        Accept: 'application/json'
      }
    });
    return res.data;
  } catch (error) {
    console.log(error.response)
  }
}

export async function saveJob(formData) {
  try {
    let res = await axios.post(`${API_V1_URL}/jobs`, formData, {
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
