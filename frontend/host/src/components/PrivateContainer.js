import { Outlet } from "react-router-dom";
import PrivateRoute from "../utils/PrivateRoute";
import Footer from "./Footer";
import NavBar from "./NavBar";

function PrivateContainer() {
  return (
    <PrivateRoute>
      <NavBar />
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
