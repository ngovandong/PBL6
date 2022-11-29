export interface IFilter {
  label: string
  value: string
}

export interface IUserProfile {
  accessToken?: string
  address?: string
  avatarImageUrl?: string
  birthDay?: string
  country?: string
  email?: string
  familyName?: string
  favoriteHostViews?: string
  gender?: string
  givenName?: string
  id?: string
  phoneNumber?: string | number
}
