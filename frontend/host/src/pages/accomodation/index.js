import { Outlet } from "react-router-dom";
import AccommodationNavbar from "../../components/AccommodationNavbar";

function Accommodation() {
  return (
    <div>
      <AccommodationNavbar />
      <Outlet />
    </div>
  );
}

export default Accommodation;
