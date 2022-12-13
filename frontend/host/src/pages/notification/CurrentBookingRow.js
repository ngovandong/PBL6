import ArrowRightIcon from "@mui/icons-material/ArrowRight";
import { IconButton } from "@mui/material";
import { useState } from "react";
function CurrentBookingRow({booking}) {
  const [showDetail, setShowDetail] = useState(false);
  let roomString = "";
  console.log(booking);
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
          <span>87hd34hg3434</span>
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

export default CurrentBookingRow;
