import { request } from "./httpRequest";
import store from "../app/store";

const getVenderId = () => {
  return store.getState().auth.account.id;
};

const getVenderInfo = async (venderId) => {
  const res = await request.get(`partner/vender/${getVenderId()}`, {});
  return res;
};

const updateVenderInfo = async (vender) => {
  return await request.put("partner/vender/update-info-vender", vender);
};

const profileService = { getVenderInfo,updateVenderInfo };

export default profileService;
