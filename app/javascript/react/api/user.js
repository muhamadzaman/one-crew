import { API_V1_URL } from "../Constants";
import { getUserId } from "../services/AuthenticationForApiService";
import { get } from './helper/api-functions'

export async function getCurrentUser() {
  try {
    return await get(`${API_V1_URL}/users/${getUserId()}`);
  } catch (error) {
    console.log(error.response)
  }
}
