import axios from "axios";
import { API_V1_URL } from "../Constants";
import { getCredentials } from "../services/AuthenticationForApiService";

class CompanyApi {
  retrieveAllCompanies(name, sort) {
    return axios.get(`${API_V1_URL}/companies/?name=${name}&sort=${sort}`, {
      headers: getCredentials(),
    });
  }
}

export default new CompanyApi();
