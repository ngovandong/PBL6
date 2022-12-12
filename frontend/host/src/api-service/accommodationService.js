import { request } from "./httpRequest";

const createAccommodation = async (ac) => {
  return await request.post("partner/accommodation/add", ac);
};
const getAccommodationsOfHost = async (hostId) => {
  return await request.get(`partner/accommodation/host/${hostId}`);
};
const getAccommodation = async (id) => {
  return await request.get(`partner/accommodation/${id}`);
};
const UpdateAccommodation = async (ac) => {
  return await request.put("partner/accommodation/update", ac);
};
const deleteAccomodation = async (id) => {
  return await request.delete(``);
};
const createPriceDate = async (data) => {
  return await request.post("partner/accommodation/add-price-date", data);
};
const changePriceDate = async (data) => {
  return await request.patch("partner/accommodation/change-price-date", data);
};
const deletePriceDate = async (id) => {
  return await request.delete(`partner/accommodation/remove-price-date/${id}`);
};

const accommodationService = {
  createAccommodation,
  getAccommodationsOfHost,
  getAccommodation,
  UpdateAccommodation,
  createPriceDate,
  changePriceDate,
  deletePriceDate,
};

export default accommodationService;
