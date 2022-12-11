import { configureStore } from "@reduxjs/toolkit";
import authReducer from "./authSlice";
import hostReducer from "./hostSlice";
export default configureStore({
  reducer: {
    auth: authReducer,
    host: hostReducer,
  },
});
