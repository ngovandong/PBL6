import ActiveAccommodation from "./ActiveAccommodation";
import InprogressAccommodation from "./InprogressAccommodation";

function Home() {
  return (
    <div className="full-width">
      <div className="home-page">
        <InprogressAccommodation />
        <ActiveAccommodation />
      </div>
    </div>
  );
}

export default Home;
