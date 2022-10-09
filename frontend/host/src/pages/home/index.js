import ActiveAccommodation from "../accomodation/ActiveAccommodation";
import InprogressAccommodation from "../accomodation/InprogressAccommodation";

function Home() {
  return (
    <div>
      <InprogressAccommodation />
      <ActiveAccommodation />
    </div>
  );
}

export default Home;
