import { Backdrop, CircularProgress } from "@mui/material";
import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useNavigate, useParams } from "react-router-dom";
import { selectToken, verifyEmail } from "../../app/store/authSlice";

function ConfirmSignup() {
  const dispatch = useDispatch();
  const token = useSelector(selectToken);
  const { code } = useParams();
  const navigate = useNavigate();

  useEffect(() => {
    dispatch(verifyEmail(code));
  }, []);

  useEffect(() => {
    if (token) {
      navigate("/");
    }
  }, [token]);
  return (
    <div>
      <Backdrop
        sx={{ color: "#fff", zIndex: (theme) => theme.zIndex.drawer + 1 }}
        open={true}
      >
        <CircularProgress color="inherit" />
      </Backdrop>
    </div>
  );
}

export default ConfirmSignup;
