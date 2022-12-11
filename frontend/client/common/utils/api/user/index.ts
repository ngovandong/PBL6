import api from '../axios'

export const getUserInfor = (userId: string) =>
  api.get(`/user/${userId}/user-info`)

export const editUser = (body: any) =>
  api.put(`/user/change-user-info`, JSON.stringify(body))

export const changePassword = (havePassword: boolean, body: any) => {
  if (havePassword) {
    return api.patch('/user/change-password', JSON.stringify(body))
  } else {
    return api.patch('/user/set-password', JSON.stringify(body))
  }
}
