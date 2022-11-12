import { useEffect } from "react";
import ActiveAccommodation from "../accomodation/ActiveAccommodation";
import InprogressAccommodation from "../accomodation/InprogressAccommodation";

function Home() {
  useEffect(() => {
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
