import { useEffect } from "react";
import { useSelector } from "react-redux";
import { Outlet } from "react-router-dom";
import { selectIsLoading } from "../../app/store/hostSlice";
import AccommodationNavbar from "../../components/AccommodationNavbar";
import LoadingWrapper from "../../components/LoadingWrapper";

function Accommodation() {
  const isLoading = useSelector(selectIsLoading);
  useEffect(() => {
    document.title = "Chỗ ở";
  }, []);
  return (
    <div>
      <AccommodationNavbar />
      <Outlet />
      <LoadingWrapper open={isLoading} />
    </div>
  );
}

export default Accommodation;
