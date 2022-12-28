import { useEffect, useState } from "react";
import orderService from "../../../api-service/orderService";
import { CurrentBookingRow } from "../../notification/BookingRow";
import { toast } from "react-toastify";
import { useOutletContext, useParams } from "react-router-dom";
import LoadingWrapper from "../../../components/LoadingWrapper";

function HostCurrentBooking() {
  const [bookings, setBookings] = useState([]);
  const [reload] = useOutletContext();
  const { id } = useParams();
  const [forceUpdate, setForceUpdate] = useState(false);
  const [isLoading, setIsLoading] = useState(true);
  const handleReload = () => {
    setForceUpdate((pre) => !pre);
  };
  const fetchData = async () => {
    const res = await orderService
      .getCurrentBooking(id)
      .catch((error) => toast.error(error));
    setIsLoading(false);
    setBookings(res.data);
  };
  useEffect(() => {
    fetchData();
  }, [forceUpdate, reload]);
  return (
    <div className="booking-table">
      {bookings.map((b) => (
        <CurrentBookingRow key={b.id} booking={b} handleReload={handleReload} />
      ))}
      <LoadingWrapper open={isLoading} />
    </div>
  );
}

export default HostCurrentBooking;
