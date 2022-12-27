import { Backdrop } from "@mui/material";
import { BeatLoader } from "react-spinners";

function LoadingWrapper({ open }) {
  return (
    <Backdrop
      sx={{
        bgcolor: "transparent",
        zIndex: (theme) => theme.zIndex.drawer + 1,
      }}
      open={open}
    >
      <BeatLoader color="#1468a2" />
    </Backdrop>
  );
}

LoadingWrapper.defaultProps = {
  open: true,
};

export default LoadingWrapper;
