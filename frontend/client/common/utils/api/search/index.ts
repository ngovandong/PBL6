import api from '../axios'

export const getAddress = (body: any) =>
  api.get('search/suggest-location-search', { params: { ...body } })

export const searchHotel = (body: any) =>
  api.get('search/host-search', { params: { ...body } })

export const searchHotelProvince = (body: any) =>
  api.get('search/host-view', { params: { ...body } })
