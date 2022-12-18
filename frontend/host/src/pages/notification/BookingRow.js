import ArrowRightIcon from "@mui/icons-material/ArrowRight";
import { Button, IconButton } from "@mui/material";
import { useState } from "react";
import { toast } from "react-toastify";
import orderService from "../../api-service/orderService";
export function CurrentBookingRow({ booking, handleReload }) {
  const [showDetail, setShowDetail] = useState(false);
  let roomString = "";
  for (let i = 0; i < booking.bookingDetailDtos.length; i++) {
    roomString += booking.bookingDetailDtos[i].accommodationName;
    if (i < booking.bookingDetailDtos.length - 1) {
      roomString += ", ";
    }
  }

  const handleComplete = async (e) => {
    e.stopPropagation();
    try {
      await orderService.completeBooking(booking.id);
      toast.success("Hoàn thành đơn hàng");
      handleReload();
    } catch (error) {
      toast.error("Cập nhật thất bại");
    }
  };
  return (
    <div>
      <div
        className={showDetail ? "booking-row active-row" : "booking-row"}
        onClick={() => {
          setShowDetail((pre) => !pre);
        }}
      >
        <div className="start-column">
          <IconButton>
            <ArrowRightIcon />
          </IconButton>
        </div>
        <div className="code-column">
          <p>Mã đặt phòng:</p>
          <span>{booking.bookingCode.slice(0, 10)}</span>
        </div>
        <div className="customer-column">
          <p>
            Tên khách hàng: {booking.userFirstName} {booking.userLastName}
          </p>
          <p>Phương thức thanh toán: Thanh toán tiền mặt</p>
          <p>Email: {booking.userEmail}</p>
        </div>
        <div className="time-column">
          <p>Thời gian ở:</p>
          <p>
            Từ <strong>{booking.dateCheckin.slice(0, 10)}</strong>
          </p>
          <p>
            Đến <strong>{booking.dateCheckin.slice(0, 10)}</strong>
          </p>
        </div>
        <div className="room-column">
          <p>Chỗ ở: {booking.hostName}</p>
          <p>Phòng: {roomString}</p>
        </div>
        <div className="button-column">
          <Button onClick={(e) => handleComplete(e)}>Hoàn thành</Button>
        </div>
      </div>
      {showDetail && <div className="booking-detail">booking detail</div>}
    </div>
  );
}

export function HistoryBookingRow({ booking }) {
  const [showDetail, setShowDetail] = useState(false);
  let roomString = "";
  for (let i = 0; i < booking.bookingDetailDtos.length; i++) {
    roomString += booking.bookingDetailDtos[i].accommodationName;
    if (i < booking.bookingDetailDtos.length - 1) {
      roomString += ", ";
    }
  }
  return (
    <div>
      <div
        className={showDetail ? "booking-row active-row" : "booking-row"}
        onClick={() => {
          setShowDetail((pre) => !pre);
        }}
      >
        <div className="start-column">
          <IconButton>
            <ArrowRightIcon />
          </IconButton>
        </div>
        <div className="code-column">
          <p>Mã đặt phòng:</p>
          <span>{booking.bookingCode.slice(0, 10)}</span>
        </div>
        <div className="customer-column">
          <p>
            Tên khách hàng: {booking.userFirstName} {booking.userLastName}
          </p>
          <p>Phương thức thanh toán: Thanh toán tiền mặt</p>
          <p>Email: {booking.userEmail}</p>
        </div>
        <div className="time-column">
          <p>Thời gian ở:</p>
          <p>
            Từ <strong>{booking.dateCheckin.slice(0, 10)}</strong>
          </p>
          <p>
            Đến <strong>{booking.dateCheckin.slice(0, 10)}</strong>
          </p>
        </div>
        <div className="room-column">
          <p>Chỗ ở: {booking.hostName}</p>
          <p>Phòng: {roomString}</p>
        </div>
      </div>
      {showDetail && <div className="booking-detail">booking detail</div>}
    </div>
  );
}
