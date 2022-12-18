import { request } from "./httpRequest";

const getCurrentBooking = async (id) => {
  return await request.get(`partner/booking/current-booking/${id}`);
};

const getHistoryBooking = async (id) => {
  return await request.get(`partner/booking/history-booking/${id}`);
};

const getCancelBooking = async (id) => {
  return await request.get(`partner/booking/cancel-booking/${id}`);
};

const completeBooking = async (id) => {
  return await request.post(`partner/booking/complete-booking/${id}`);
};

const orderService = {
  getCurrentBooking,
  getHistoryBooking,
  getCancelBooking,
  completeBooking,
};

export default orderService;
