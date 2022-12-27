import { useEffect } from "react";
import { useSelector } from "react-redux";
import { selectIsLoading } from "../../app/store/hostSlice";
import LoadingWrapper from "../../components/LoadingWrapper";
import ActiveAccommodation from "../accomodation/ActiveAccommodation";
import InprogressAccommodation from "../accomodation/InprogressAccommodation";

function Home() {
  const isLoading = useSelector(selectIsLoading);
  useEffect(() => {
    document.title = "Trang chủ";
  }, []);
  return !isLoading ? (
    <div>
      <InprogressAccommodation />
      <ActiveAccommodation />
    </div>
  ) : (
    <LoadingWrapper />
  );
}

export default Home;
