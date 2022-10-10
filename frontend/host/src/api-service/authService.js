import { request } from "./httpRequest";

const login = async (username, password) => {
  const res = await request.post("api/token", {
    username,
    password,
  });
  return res.data;
};

const getUser = async () => {
  const res = await request.get("customers/get_own_data");
  return res.data;
};

const verifyEmail = async (code) => {
  const res = await request.get("verify_email", { params: { code } });
  return res.data;
};

const authService = { login, getUser, verifyEmail };

export default authService;
