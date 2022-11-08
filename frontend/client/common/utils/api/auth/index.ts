import api from '../axios'

export const loginGoogle = (body: { idToken: string }) =>
  api.post('/auth/login-with-google', body)
