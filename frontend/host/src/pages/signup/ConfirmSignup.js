import { Backdrop, CircularProgress } from "@mui/material";
import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useNavigate, useParams } from "react-router-dom";
import { selectAccount, verifyEmail } from "../../app/store/authSlice";

function ConfirmSignup() {
  const dispatch = useDispatch();
  const account = useSelector(selectAccount);
  const { code } = useParams();
  const navigate = useNavigate();

  useEffect(() => {
    dispatch(verifyEmail(code));
  }, []);

  useEffect(() => {
    if (account) {
      navigate("/");
    }
  }, [account]);
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
