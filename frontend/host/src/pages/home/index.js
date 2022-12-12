import { useEffect } from "react";
import { useDispatch } from "react-redux";
import { getListHost } from "../../app/store/hostSlice";
import ActiveAccommodation from "../accomodation/ActiveAccommodation";
import InprogressAccommodation from "../accomodation/InprogressAccommodation";

function Home() {
  const dispatch = useDispatch();
  useEffect(() => {
    dispatch(getListHost());
    document.title = "Trang chủ";
  }, []);
  return (
    <div>
      <InprogressAccommodation />
      <ActiveAccommodation />
    </div>
  );
}

export default Home;
