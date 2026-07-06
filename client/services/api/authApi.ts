import axios from "axios";

const authApi = axios.create({
  baseURL: process.env.NEXT_PUBLIC_API_URL,
  withCredentials: true,
  headers: {
    "Content-Type": "application/json",
  },
});

export default authApi;

/**
 * Separate axios instance for only auth
 * Login, register that which request don't use the access token
 * 
 * Why because if we use the same axios instance for auth if it returns the 401 error, it will try to refresh the access token
 * if the refresh token is expired, it will return 401 error again and it will create an infinite loop
 */
