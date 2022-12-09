import api from '../axios'

export const getUserInfor = (userId: string) =>
  api.get(`/user/${userId}/user-info`)

export const editUser = (body: any) => api.put(`/user/change-user-info`, JSON.stringify(body))
