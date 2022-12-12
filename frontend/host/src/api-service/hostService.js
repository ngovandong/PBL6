import { request } from "./httpRequest";
import store from "../app/store";

const getVenderId = () => {
  return store.getState().auth.account.id;
};
const createHost = async (hostName) => {
  const res = await request.post("partner/host/add-host", {
    venderId: getVenderId(),
    hostName,
  });
  return res;
};

const updateHost = async (host) => {
  const res = await request.put("partner/host/update-all", host);
  return res;
};

const getHost = async (id) => {
  const res = await request.get(`partner/host/${id}`);
  return res;
};

const getListHost = async () => {
  const res = await request.get(`partner/host/vender/${getVenderId()}`);
  return res;
};

const deleteHost = async (id) => {
  return await request.delete(`partner/host/${id}`);
};

const hostService = {
  createHost,
  updateHost,
  getHost,
  getListHost,
  deleteHost,
};

export default hostService;
