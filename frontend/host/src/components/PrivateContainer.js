import { useEffect } from "react";
import { useDispatch } from "react-redux";
import { Outlet } from "react-router-dom";
import { getListHost } from "../app/store/hostSlice";
import PrivateRoute from "../utils/PrivateRoute";
import Footer from "./Footer";
import NavBar from "./NavBar";

function PrivateContainer() {
  const dispatch = useDispatch();
  useEffect(() => {
    dispatch(getListHost());
  });
  return (
    <PrivateRoute>
      <NavBar showLinks={true} />
      <div className="full-height-container">
        <div className="full-width">
          <div className="main-container">
            <Outlet />
          </div>
        </div>
        <Footer />
      </div>
    </PrivateRoute>
  );
}

export default PrivateContainer;
