import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import authService from "../../api-service/authService";

export const login = createAsyncThunk(
  "auth/login",
  async (user, { rejectWithValue }) => {
    const { email, password } = user;
    try {
      const res = await authService.login(email, password);
      if (res.data) {
        if (res.data.accessToken) {
          return res.data;
        } else {
          return rejectWithValue("Invalid");
        }
      } else {
        return rejectWithValue(res.response.data.error);
      }
    } catch (error) {
      console.log(error);
      if (error.response.data?.error) {
        return rejectWithValue(error.response.data.error);
      } else {
        return rejectWithValue("Login Fail");
      }
    }
  }
);
export const signup = createAsyncThunk(
  "auth/signup",
  async (account, { rejectWithValue }) => {
    try {
      const res = await authService.signup(account);
      if (res.data) {
        return res.data;
      } else {
        if (res.response.data) {
          return rejectWithValue(res.response.data.error);
        } else {
          rejectWithValue("Sign up fail");
        }
      }
    } catch (error) {
      console.log(error);
      if (error.response.data) {
        return rejectWithValue(error.response.data.error);
      } else {
        return rejectWithValue("Sign up Fail");
      }
    }
  }
);

export const getUser = createAsyncThunk("auth/getUser", async () => {
  const res = await authService.getUser();
  return res;
});

export const verifyEmail = createAsyncThunk(
  "auth/verifyEmail",
  async (code) => {
    const res = await authService.verifyEmail(code);
    return res;
  }
);

let accountString = null;
try {
  accountString = JSON.parse(localStorage.getItem("account"));
} catch {}

const initialState = {
  user: null,
  account: accountString,
  verifyEmail: "",
};

const userSlice = createSlice({
  name: "auth",
  initialState,
  reducers: {
    setAccount: (state, action) => {
      state.account = action.payload;
      localStorage.setItem("account", JSON.stringify(action.payload));
    },
    logout: (state) => {
      state.account = null;
      state.user = null;
      localStorage.setItem("account", null);
    },
  },
  extraReducers(builder) {
    builder
      .addCase(login.fulfilled, (state, action) => {
        state.account = action.payload;
        localStorage.setItem("account", JSON.stringify(action.payload));
      })
      .addCase(signup.fulfilled, (state, action) => {
        state.verifyEmail = action.payload.email;
      })
      .addCase(getUser.fulfilled, (state, action) => {
        state.user = action.payload;
      })
      .addCase(verifyEmail.fulfilled, (state, action) => {
        state.user = action.payload;
        localStorage.setItem("account", JSON.stringify(action.payload));
      });
  },
});

export const selectUser = (state) => state.auth.user;
export const selectAccount = (state) => state.auth.account;
export const selectAccessToken = (state) => state.auth.account.accessToken;
export const selectVerifyEmail = (state) => state.auth.verifyEmail;

export const { logout, setAccount, setVerifyEmail } = userSlice.actions;
export default userSlice.reducer;
