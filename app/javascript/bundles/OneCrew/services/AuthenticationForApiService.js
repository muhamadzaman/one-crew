import axios from "axios";
import { APP_URL } from "../Constants";

export const AUTHENTICATED_USER_SESSION = "authenticatedUser";

export function authenticate(email, password) {
  const data = {
    email: email,
    password: password,
  };
  return axios.post(`${APP_URL}/auth/sign_in`, data);
}

export function registerSuccessfulLogin(email, token, client, uid, userId) {
  sessionStorage.setItem(AUTHENTICATED_USER_SESSION, email);
  sessionStorage.setItem("jwt", token);
  sessionStorage.setItem("client", client);
  sessionStorage.setItem("uid", uid);
  sessionStorage.setItem("userId", userId);
}

export function logout() {
  sessionStorage.removeItem(AUTHENTICATED_USER_SESSION);
  sessionStorage.removeItem("jwt");
  sessionStorage.removeItem("client");
  sessionStorage.removeItem("uid");
  sessionStorage.removeItem("userId");
}

export function isUserLoggedIn() {
  let uid = sessionStorage.getItem("uid");
  if (uid === null) {
    uid = "";
  }
  if (uid.length > 0) return true;
  return false;
}

export function getCredentials() {
  return {
    "access-token": sessionStorage.getItem("jwt"),
    uid: sessionStorage.getItem("uid"),
    client: sessionStorage.getItem("client"),
  };
}

export function getUserId() {
  return sessionStorage.getItem("userId");
}
