import api from '../axios'

export const createBooking = (body: any) =>
  api.post(`/booking/create-booking`, JSON.stringify(body))

