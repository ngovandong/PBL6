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
  placeId: string | null
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

export interface IDataCreateOrder {
  dateCheckin: string
  dateCheckout: string
  hostId: string
  userEmail: string
  userFirstName: string
  userLastName: string
  userId: string | any
  note: string
  isPrePayment: boolean
  bookingDetails: any
}

// bookingDetails : [
//   {
//     "quantity": string | number,
//     "bedInfo": string,
//     "accommodationId": string,
//   }
// ]

export interface BookingDetailItem {
  id: string
  bookingCode: string
  dateCheckin: string
  dateCheckout: string
  hostId: string
  hostName: string
  avatarImage: string
  province: string
  userEmail: string
  userFirstName: string
  userLastName: string
  userId: string
  vatFee: number
  totalPrice: number
  isPrePayment: boolean
  note: string
  bookingDetailDtos: []
  hasPayment: boolean
  requirePayment: boolean
}

export enum BOOKING_STATUS {
  PENDING = 'PENDING',
  CONFIRMED = 'CONFIRMED',
  COMPLETED = 'COMPLETED',
  CANCELED = 'CANCELED',
}
