import { validateEmail } from '@utils/helpers'

export const LOCAL_STORAGE = {
  idUser: 'idUser',
  accessToken: 'accessToken',
}

export const INFOR_MESSAGE = {
  UPDATED_SUCCESSFULLY: 'Cập nhật thông tin thành công!',
  BOOKING_SUCCESSFULLY: 'Đặt phòng thành công!',
}

export const ERROR_MESSAGE = {
  COMMON_ERROR: 'Đã có lỗi xảy ra. Vui lòng thử lại!',
  OLD_PASSWORD_ERROR: 'Mật khẩu không chính xác.',
  NEW_PASSWORD_ERROR:
    'Mật khẩu có chứa ít nhất tám ký tự, trong đó có ít nhất một số và bao gồm cả chữ hoa và chữ thường.',
  INVALID_EMAIL_ERROR: 'Email không hợp lệ.',
  BOOKING_ERROR: 'Đặt phòng không thành công. Vui lòng thử lại!',
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
    type: 'password',
  },
  {
    label: 'Mật khẩu mới',
    id: 'newPassword',
    required: true,
    message: 'Trường bắt buộc nhập.',
    type: 'password',
  },
]

export const ORDER_FORM = [
  {
    label: 'Họ',
    id: 'userLastName',
    required: true,
    message: 'Trường bắt buộc nhập.',
    type: 'text',
    defaultValue: 'familyName',
  },
  {
    label: 'Tên',
    id: 'userFirstName',
    required: true,
    message: 'Trường bắt buộc nhập.',
    type: 'text',
    defaultValue: 'givenName',
  },
  {
    label: 'Email',
    id: 'userEmail',
    required: true,
    message: 'Trường bắt buộc nhập.',
    type: 'text',
    rules: {
      // validate: {
      //   checkEmail: (v: string) => validateEmail(v) || ERROR_MESSAGE.INVALID_EMAIL_ERROR
      // },
    },
    defaultValue: 'email',
  },
  {
    label: 'Ghi chú',
    id: 'note',
    required: false,
    message: 'Trường bắt buộc nhập.',
    type: 'text',
  },
]

export const AMENITIES = [
  {
    label: 'Wi-Fi miễn phí',
    code: 'wifi',
    icon: 'fas fa-wifi',
  },
  { label: 'Nhà hàng', code: 'restaurant', icon: 'fas fa-utensils-alt' },
  {
    label: 'Quầy bar',
    code: 'bar',
    icon: 'fas fa-glass-martini-alt',
  },
  { label: 'Dịch vụ phòng', code: 'room_service', icon: 'fas fa-washer' },
  {
    label: 'Lễ tân 24 giờ',
    code: 'reception24h',
    icon: 'fas fa-history',
  },
  { label: 'Phòng xông hơi', code: 'sauna', icon: 'fas fa-hot-tub' },
  { label: 'Trung tâm thể dục', code: 'gym', icon: 'fas fa-dumbbell' },
  { label: 'Sân vườn', code: 'garden', icon: 'fas fa-umbrella-beach' },
  {
    label: 'Sân thượng/ hiên',
    code: 'terrace',
    icon: 'far fa-window-frame-open',
  },
  {
    label: 'Phòng không hút thuốc',
    code: 'non_smoking_room',
    icon: 'fas fa-smoking-ban',
  },
  { label: 'Xe đưa đón sân bay', code: 'airport_shuttle', icon: 'fas fa-bus' },
  { label: 'Phòng gia đình', code: 'family_room', icon: 'fas fa-users' },
  {
    label: 'Trung tâm Spa & chăm sóc sức khoe',
    code: 'spa',
    icon: 'fas fa-hot-tub',
  },
  {
    label: 'Bồn tắm nóng/bể sục (jacuzzi)',
    code: 'jacuzzi',
    icon: 'fas fa-hot-tub',
  },
  { label: 'Điều hòa nhiệt độ', code: 'ac', icon: 'fas fa-air-conditioner' },
  { label: 'Hồ bơi', code: 'swimming_pool', icon: 'fas fa-swimming-pool' },
  { label: 'Bãi biển', code: 'beach', icon: 'fas fa-umbrella-beach' },
]

export const BED_TYPE = [
  { label: '1 giường đơn', code: '1s', icon: ['fas fa-bed'] },
  {
    label: '1 giường đơn, 1 giuờng đôi',
    code: '1s1d',
    icon: ['fas fa-bed', 'fas fa-bed-alt'],
  },
  { label: '2 giuờng đơn', code: '2d', icon: ['fas fa-bed', 'fas fa-bed'] },
]
