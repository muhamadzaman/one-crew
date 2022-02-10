import axios from "axios";
import { API_V1_URL } from "../Constants";
import { getCredentials, getUserId } from "../services/AuthenticationForApiService";

export async function getCurrentUser() {
  try {
    let res = await axios.get(`${API_V1_URL}/users/${getUserId()}`, {
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
