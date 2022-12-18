import { useEffect, useState } from "react";
import orderService from "../../../api-service/orderService";
import { HistoryBookingRow } from "../../notification/BookingRow";
import { toast } from "react-toastify";
import { useParams } from "react-router-dom";
function HostHistoryBooking() {
  const [bookings, setBookings] = useState([]);
  const { id } = useParams();
  const fetchData = async () => {
    const res = await orderService
      .getHistoryBooking(id)
      .catch((error) => toast.error(error));
    setBookings(res.data);
  };
  useEffect(() => {
    fetchData();
  }, []);
  return (
    <div className="booking-table">
      {bookings.length !== 0 &&
        bookings.map((b) => <HistoryBookingRow key={b.id} booking={b} />)}
    </div>
  );
}

export default HostHistoryBooking;
