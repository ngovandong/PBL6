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

const orderService = { getCurrentBooking, getHistoryBooking, getCancelBooking };

export default orderService;