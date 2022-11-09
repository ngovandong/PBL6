import api from '../axios'

export const loginGoogle = (body: { idToken: string }) =>
  api.post('/auth/login-with-google', body)

export const loginEmail = (body: { email: string; password: string }) =>
  api.post('/auth/login-with-email', body)
