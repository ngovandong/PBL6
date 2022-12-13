import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import { toast } from "react-toastify";
import store from ".";
import hostService from "../../api-service/hostService";

const firstStep = (addingHost) => {
  const { ratingStar, hostType, area, description, name } = addingHost;
  return ratingStar && hostType && area && description && name;
};
const twoStep = (addingHost) => {
  const { province, address, postalCode } = addingHost;
  return province && address && postalCode;
};
const threeStep = (addingHost) => {
  const { outstandingUtilities, utilities } = addingHost;
  return outstandingUtilities.length && utilities.length;
};
const fourStep = (addingHost) => {
  const { images, avatarImage } = addingHost;
  if (!images || images?.length < 3) throw new Error("Cần ít nhất 3 ảnh");
  return avatarImage;
};

const handleStep = async (rejectWithValue, getState, stepfunc) => {
  try {
    const addingHost = getState().host.addingHost;
    if (stepfunc(addingHost)) {
      const res = await hostService.updateHost(addingHost);
      return res.data;
    } else {
      toast.error("Vui lòng điền đầy đủ thông tin");
    }
    return rejectWithValue();
  } catch (error) {
    if (error.message) {
      toast.error(error.message);
    } else if (error.response?.data?.error) {
      toast.error(error.response.data.error);
    } else {
      toast.error("Cập nhật fail");
    }
    return rejectWithValue();
  }
};

export const updateHost = createAsyncThunk(
  "auth/updateHost",
  async (_, { rejectWithValue, getState }) => {
    const activeStep = getState().host.activeStep;
    switch (activeStep) {
      case 0:
        return handleStep(rejectWithValue, getState, firstStep);
      case 1:
        return handleStep(rejectWithValue, getState, twoStep);
      case 2:
        return handleStep(rejectWithValue, getState, threeStep);
      case 3:
        return handleStep(rejectWithValue, getState, fourStep);
      default:
        break;
    }
  }
);

export const createHost = createAsyncThunk(
  "auth/createHost",
  async (hostName, { rejectWithValue }) => {
    try {
      const res = await hostService.createHost(hostName);
      if (res.data) {
        return res.data;
      } else {
        if (res.response.data) {
          toast.error(res.response.data.error);
          return rejectWithValue();
        }
        throw new Error();
      }
    } catch (error) {
      console.log(error);
      if (error.response.data) {
        toast.error(error.response.data.error);
      } else {
        toast.error("get host Fail");
      }
      return rejectWithValue();
    }
  }
);

export const getAddingHost = createAsyncThunk(
  "auth/getAddingHost",
  async (id, { rejectWithValue }) => {
    try {
      const res = await hostService.getHost(id);
      if (res.data) {
        return res.data;
      } else {
        if (res.response.data) {
          toast.error(res.response.data.error);
          return rejectWithValue();
        }
        throw new Error();
      }
    } catch (error) {
      if (error.response.data) {
        toast.error(error.response.data.error);
      } else {
        toast.error("get host Fail");
      }
      return rejectWithValue();
    }
  }
);

export const getListHost = createAsyncThunk(
  "auth/getListHost",
  async (_, { rejectWithValue }) => {
    try {
      const res = await hostService.getListHost();
      if (res.data) {
        return res.data;
      } else {
        if (res.response.data) {
          toast.error(res.response.data.error);
          return rejectWithValue();
        }
        throw new Error();
      }
    } catch (error) {
      if (error.response.data) {
        toast.error(error.response.data.error);
      } else {
        toast.error("get host Fail");
      }
      return rejectWithValue();
    }
  }
);

export const deleteHost = createAsyncThunk(
  "auth/deleteHost",
  async (id, { rejectWithValue }) => {
    try {
      await hostService.activateHost(id);
      toast.success("Xóa thành công");
      return id;
    } catch (error) {
      if (error.response.data) {
        toast.error(error.response.data.error);
      } else {
        toast.error("Delete Fail");
      }
      return rejectWithValue();
    }
  }
);
export const deactivateHost = createAsyncThunk(
  "auth/deactivateHost",
  async (id, { rejectWithValue }) => {
    try {
      await hostService.deactivateHost(id);
      toast.success("Đã tạm ngưng");
      return id;
    } catch (error) {
      if (error.response.data) {
        toast.error(error.response.data.error);
      } else {
        toast.error("Đã xảy ra lỗi");
      }
      return rejectWithValue();
    }
  }
);
export const activateHost = createAsyncThunk(
  "auth/activateHost",
  async (id, { rejectWithValue }) => {
    try {
      await hostService.activateHost(id);
      toast.success("Cập nhật thành công");
      return id;
    } catch (error) {
      if (error.response.data) {
        toast.error(error.response.data.error);
      } else {
        toast.error("Đã xảy ra lỗi");
      }
      return rejectWithValue();
    }
  }
);

const initialState = {
  addingHost: null,
  activeStep: 0,
  listHost: [],
};

const hostSlice = createSlice({
  name: "host",
  initialState,
  reducers: {
    setAddingHost: (state, action) => {
      state.addingHost = action.payload;
    },
    nextStep: (state) => {
      state.activeStep += 1;
    },
    previousStep: (state) => {
      state.activeStep -= 1;
    },
    handleDone: (state) => {
      state.activeStep = 0;
    },
  },
  extraReducers(builder) {
    builder
      .addCase(createHost.fulfilled, (state, action) => {
        state.addingHost = action.payload;
      })
      .addCase(updateHost.fulfilled, (state, action) => {
        state.addingHost = action.payload;
        if (state.activeStep === 3) {
          state.activeStep = 0;
        } else {
          state.activeStep += 1;
        }
      })
      .addCase(getListHost.fulfilled, (state, action) => {
        state.listHost = action.payload;
      })
      .addCase(deleteHost.fulfilled, (state, action) => {
        state.listHost = state.listHost.filter((h) => h.id !== action.payload);
      })
      .addCase(deactivateHost.fulfilled, (state, action) => {
        state.listHost = state.listHost.map((h) => {
          if (h.id !== action.payload) {
            return h;
          } else {
            return { ...h, isActive: false };
          }
        });
      })
      .addCase(activateHost.fulfilled, (state, action) => {
        state.listHost = state.listHost.map((h) => {
          if (h.id !== action.payload) {
            return h;
          } else {
            return { ...h, isActive: true };
          }
        });
      })
      .addCase(getAddingHost.fulfilled, (state, action) => {
        state.addingHost = action.payload;
      });
  },
});

export const selectAddingHost = (state) => state.host.addingHost;
export const selectActiveStep = (state) => state.host.activeStep;
export const selectUnfinishHost = (state) =>
  state.host.listHost.filter((h) => h.isApproved === false);
export const selectActiveHost = (state) =>
  state.host.listHost.filter(
    (h) => h.isApproved === true && h.isActive === true
  );
export const selectDeactiveHost = (state) =>
  state.host.listHost.filter(
    (h) => h.isApproved === true && h.isActive === false
  );

export const handleUpdateAddingHost = (field, value) => {
  store.dispatch(
    setAddingHost({ ...store.getState().host.addingHost, [field]: value })
  );
};

export const { setAddingHost, nextStep, previousStep, handleDone } =
  hostSlice.actions;
export default hostSlice.reducer;
