import { useEffect } from "react";
import { Outlet } from "react-router-dom";
import AccommodationNavbar from "../../components/AccommodationNavbar";

function Accommodation() {
  useEffect(() =>
    {
        document.title = "Chỗ ở"
    }, [])
  return (
    <div>
      <AccommodationNavbar />
      <Outlet />
    </div>
  );
}

export default Accommodation;
