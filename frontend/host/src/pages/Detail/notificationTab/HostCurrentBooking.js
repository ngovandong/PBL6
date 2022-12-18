import { useEffect, useState } from "react";
import orderService from "../../../api-service/orderService";
import { CurrentBookingRow } from "../../notification/BookingRow";
import { toast } from "react-toastify";
import { useParams } from "react-router-dom";

function HostCurrentBooking() {
  const [bookings, setBookings] = useState([]);
  const { id } = useParams();
  const [forceUpdate, setForceUpdate] = useState(false);
  const handleReload = () => {
    setForceUpdate((pre) => !pre);
  };
  const fetchData = async () => {
    const res = await orderService
      .getCurrentBooking(id)
      .catch((error) => toast.error(error));
    setBookings(res.data);
  };
  useEffect(() => {
    fetchData();
  }, [forceUpdate]);
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
    </div>
  );
}

export default HostCurrentBooking;
