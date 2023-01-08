import { useEffect, useState } from "react";
import orderService from "../../api-service/orderService";
import { PendingBookingRow } from "./BookingRow";
import { toast } from "react-toastify";
import { useSelector } from "react-redux";
import { selectActiveHost } from "../../app/store/hostSlice";
import LoadingWrapper from "../../components/LoadingWrapper";

function PendingBooking() {
  const [bookings, setBookings] = useState([]);
  const hosts = useSelector(selectActiveHost);
  const [isLoading, setIsLoading] = useState(true);
  const [forceUpdate, setForceUpdate] = useState(false);
  const handleReload = () => {
    setForceUpdate((pre) => !pre);
  };
  const fetchData = async () => {
    for (const host of hosts) {
      const res = await orderService
        .getPendingBooking(host.id)
        .catch((error) => toast.error(error));
      setBookings((pre) => [...pre, ...res.data]);
      setIsLoading(false);
    }
  };
  useEffect(() => {
    fetchData();
  }, [hosts, forceUpdate]);
  return (
    <div className="booking-table">
      {bookings.map((b) => (
        <PendingBookingRow key={b.id} booking={b} handleReload={handleReload} />
      ))}
      <LoadingWrapper open={isLoading} />
    </div>
  );
}

export default PendingBooking;
