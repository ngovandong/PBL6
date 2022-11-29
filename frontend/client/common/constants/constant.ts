export const LOCAL_STORAGE = {
  idUser: 'idUser',
  accessToken: 'accessToken',
}

export const EDIT_USER_LABEL = [
  'familyName',
  'givenName',
  'email',
  'phoneNumber',
  'address',
  'country',
  'avatarImageUrl',
  'id',
]

export const EDIT_USER_FORM = [
  {
    label: 'Họ',
    id: 'familyName',
    required: true,
    message: 'Trường bắt buộc nhập.'
  },
  {
    label: 'Tên',
    id: 'givenName',
    required: true,
    message: 'Trường bắt buộc nhập.'
  },
  {
    label: 'Email',
    id: 'email',
  },
  {
    label: 'Số điện thoại',
    id: 'phoneNumber',
  },
  {
    label: 'Địa chỉ',
    id: 'address',
  },
  {
    label: 'Quốc tịch',
    id: 'country',
  },
]


export const EDIT_PASSWORD_FORM = [
  {
    label: 'Mật khẩu hiện tại',
    id: 'oldPassword',
    required: true,
    message: 'Trường bắt buộc nhập.'
  },
  {
    label: 'Mật khẩu mới',
    id: 'newPassword',
    required: true,
    message: 'Trường bắt buộc nhập.'
  },
]
