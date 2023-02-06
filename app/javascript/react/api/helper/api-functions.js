import axios from "axios";
import { getCredentials } from "../../services/AuthenticationForApiService";

export const get = async (url, isPublic = false) => {
  const credentials = isPublic ? {} : getCredentials();
  let res = await axios.get(url, {
    headers: {
      ...credentials,
      Accept: 'application/json'
    }
  });
  return res.data;
}

export const post = async (url, data, isPublic = false) => {
  const credentials = isPublic ? {} : getCredentials();
  let res = await axios.post(url, data, {
    headers: {
      ...credentials,
      Accept: 'application/json',
      'Content-Type': 'application/json'
    }
  });
  return res.data;
}

export const patch = async (url, data, isPublic = false) => {
  const credentials = isPublic ? {} : getCredentials();
  let res = await axios.patch(url, data, {
    headers: {
      ...credentials,
      Accept: 'application/json',
      'Content-Type': 'application/json'
    }
  });
  return res.data;
}

export const remove = async (url, isPublic = false) => {
  const credentials = isPublic ? {} : getCredentials();
  let res = await axios.delete(url, {
    headers: {
      ...credentials,
      Accept: 'application/json'
    }
  });
  return res.data;
}
