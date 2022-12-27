import { useEffect, useState } from "react";
import orderService from "../../../api-service/orderService";
import { HistoryBookingRow } from "../../notification/BookingRow";
import { toast } from "react-toastify";
import { useParams } from "react-router-dom";
import LoadingWrapper from "../../../components/LoadingWrapper";
function HostHistoryBooking() {
  const [bookings, setBookings] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  const { id } = useParams();
  const fetchData = async () => {
    const res = await orderService
      .getHistoryBooking(id)
      .catch((error) => toast.error(error));
    setBookings(res.data);
    setIsLoading(false);
  };
  useEffect(() => {
    fetchData();
  }, []);
  return (
    <div className="booking-table">
      {bookings.map((b) => (
        <HistoryBookingRow key={b.id} booking={b} />
      ))}
      <LoadingWrapper open={isLoading} />
    </div>
  );
}

export default HostHistoryBooking;
