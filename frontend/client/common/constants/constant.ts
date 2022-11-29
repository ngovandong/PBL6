export const LOCAL_STORAGE = {
  idUser: 'idUser',
  accessToken: 'accessToken',
}

export const INFOR_MESSAGE = {
  UPDATED_SUCCESSFULLY: 'Cập nhật thông tin thành công!',
}

export const ERROR_MESSAGE = {
  COMMON_ERROR: 'Đã có lỗi xảy ra. Vui lòng thử lại!',
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
    message: 'Trường bắt buộc nhập.',
  },
  {
    label: 'Tên',
    id: 'givenName',
    required: true,
    message: 'Trường bắt buộc nhập.',
  },
  {
    label: 'Email',
    id: 'email',
    disabled: true,
  },
  {
    label: 'Số điện thoại',
    id: 'phoneNumber',
    rules: {
      pattern: {
        value: /([\+84|84|0]+(3|5|7|8|9|1[2|6|8|9]))+([0-9]{8})\b/,
      },
    },
    message: 'Số điện thoại không hợp lệ.',
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
    message: 'Trường bắt buộc nhập.',
  },
  {
    label: 'Mật khẩu mới',
    id: 'newPassword',
    required: true,
    message: 'Trường bắt buộc nhập.',
  },
]
