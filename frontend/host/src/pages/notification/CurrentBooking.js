import { useEffect, useState } from "react";
import orderService from "../../api-service/orderService";
import { CurrentBookingRow } from "./BookingRow";
import { toast } from "react-toastify";
import { useSelector } from "react-redux";
import { selectActiveHost } from "../../app/store/hostSlice";
import LoadingWrapper from "../../components/LoadingWrapper";

function CurrentBooking() {
  const [bookings, setBookings] = useState([]);
  const hosts = useSelector(selectActiveHost);
  const [forceUpdate, setForceUpdate] = useState(false);
  const [isLoading, setIsLoading] = useState(true);
  const handleReload = () => {
    setForceUpdate((pre) => !pre);
  };
  const fetchData = async () => {
    for (const host of hosts) {
      const res = await orderService
        .getCurrentBooking(host.id)
        .catch((error) => toast.error(error));
      setBookings((pre) => [...pre, ...res.data]);
      setIsLoading(false);
    }
  };
  useEffect(() => {
    fetchData();
  }, [hosts,forceUpdate]);
  return (
    <div className="booking-table">
      {bookings.length !== 0 &&
        bookings.map((b) => (
          <CurrentBookingRow
            key={b.id}
            booking={b}
            handleReload={handleReload}
          />
        ))}
        <LoadingWrapper open={isLoading} />
    </div>
  );
}

export default CurrentBooking;
