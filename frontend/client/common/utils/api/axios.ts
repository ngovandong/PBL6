import { LOCAL_STORAGE } from '@constants/constant'
import axios from 'axios'
import https from 'https'

const httpsAgent = new https.Agent({ rejectUnauthorized: false })

const api = axios.create({
  baseURL: process.env.NEXT_PUBLIC_API_URL,
  // timeout: 1000,
  headers: {
    'Content-Type': 'application/json',
  },
  httpsAgent: httpsAgent,
})

api.interceptors.request.use(
  async function (config) {
    // Do something before request is sent
    if (typeof window !== 'undefined') {
      const accessToken = window.localStorage.getItem(LOCAL_STORAGE.accessToken)
      if (accessToken) {
        config.headers!.Authorization = `Bearer ${accessToken}`
      }
    }
    config.transformRequest = [
      function (data, headers) {
        console.log(data)
        return data
      },
    ]

    return config
  },
  async function (error) {
    // Do something with request error
    return Promise.reject(error)
  }
)

// Add a response interceptor
api.interceptors.response.use(
  function (response) {
    // Any status code that lie within the range of 2xx cause this function to trigger
    // Do something with response data
    return response
  },
  function (error) {
    // Any status codes that falls outside the range of 2xx cause this function to trigger
    // Do something with response error
    return Promise.reject(error)
  }
)

export default api
