import { request } from "./httpRequest";

const signup = async (account) => {
  const res = await request.post("partner/auth/register", account);
  return res;
};

const login = async (email, password) => {
  const res = await request.post("partner/auth/login", {
    email,
    password,
  });
  return res;
};

const getUser = async () => {
  const res = await request.get("customers/get_own_data");
  return res.data;
};

const verifyEmail = async (token) => {
  const res = await request.get("partner/auth/verify-host-email", {
    params: { token },
  });
  return res.data;
};

const authService = { signup, login, getUser, verifyEmail };

export default authService;
