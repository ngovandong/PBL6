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
  havePassword?: boolean
}

export interface IAddress {
  id: string
  placeName: string
  placeType: string
  address: string
}

export interface ISearchForm {
  SearchText: string
  SearchType: string
  DateCheckin?: string
  DateCheckout?: string
  QuantityPerson?: number
}

export interface ICardItem {
  id: string
  name: string
  ratingStar: number
  hostType: string
  country: string
  avatarImage: string
  ratingFeedBack: number
  priceStandard: number
}
