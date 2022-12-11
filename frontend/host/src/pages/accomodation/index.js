import { useEffect } from "react";
import { useDispatch } from "react-redux";
import { Outlet } from "react-router-dom";
import { getListHost } from "../../app/store/hostSlice";
import AccommodationNavbar from "../../components/AccommodationNavbar";

function Accommodation() {
  const dispatch = useDispatch();

  useEffect(() => {
    document.title = "Chỗ ở";
    dispatch(getListHost());
  }, []);
  return (
    <div>
      <AccommodationNavbar />
      <Outlet />
    </div>
  );
}

export default Accommodation;
