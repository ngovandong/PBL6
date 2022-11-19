import api from '../axios'

export const getUserInfor = (userId: string) =>
  api.get(`/user/${userId}/user-info`)
