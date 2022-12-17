import { useEffect, useState } from "react";
import orderService from "../../api-service/orderService";
import { HistoryBookingRow } from "./BookingRow";
import { toast } from "react-toastify";
import { useSelector } from "react-redux";
import { selectActiveHost } from "../../app/store/hostSlice";

function CanceledBooking() {
  const [bookings, setBookings] = useState([]);
  const hosts = useSelector(selectActiveHost);
  const fetchData = async () => {
    for (const host of hosts) {
      const res = await orderService
        .getCancelBooking(host.id)
        .catch((error) => toast.error(error));
      setBookings((pre) => [...pre, ...res.data]);
    }
  };
  useEffect(() => {
    fetchData();
  }, [hosts]);
  return (
    <div className="booking-table">
      {bookings.length !== 0 &&
        bookings.map((b) => <HistoryBookingRow key={b.id} booking={b} />)}
    </div>
  );
}

export default CanceledBooking;
