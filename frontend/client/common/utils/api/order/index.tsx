import api from '../axios'

export const createBooking = (body: any) =>
  api.post(`/booking/create-booking`, JSON.stringify(body))

export const getPendingBooking = (userId: string) =>
  api.get(`/booking/pending-booking/${userId}`)

export const getCurrentBooking = (userId: string) =>
  api.get(`/booking/current-booking/${userId}`)

export const getHistoryBooking = (userId: string) =>
  api.get(`/booking/history-booking/${userId}`)

export const getCancelBooking = (userId: string) =>
  api.get(`/booking/cancel-booking/${userId}`)

export const postCancelBooking = (bookingId: string) =>
  api.post(`/booking/cancel-booking/${bookingId}`)

export const getPaymentBooking = (bookingId: string) =>
  api.get(`/booking/payment-booking/${bookingId}`)
