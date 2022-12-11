import Badge from "@mui/material/Badge";
import MailIcon from "@mui/icons-material/Mail";
import { useSelector } from "react-redux";
import { selectActiveHost } from "../../app/store/hostSlice";

function ActiveAccommodation() {
  const listHost = useSelector(selectActiveHost);

  return (
    <div className="accommodation-container">
      <h2>Các chỗ nghỉ đang hoạt động</h2>
      <div className="accommodation-table">
        <table>
          <thead>
            <tr>
              <th>Tên</th>
              <th>Địa chỉ</th>
              <th>Khách đến/đi trong hôm nay & ngày mai</th>
              <th>Tin nhắn của khách</th>
              <th>Tin nhắn từ Booking.com</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            {listHost.map((h) => (
              <TableRow host={h} key={h.id} />
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}

export default ActiveAccommodation;

function TableRow({ host }) {
  return (
    <tr>
      <td style={{ width: "20%" }}>{host.name}</td>
      <td style={{ width: "20%" }}>{host.address}</td>
      <td style={{ width: "20%" }}>
        <Badge
          badgeContent={20}
          style={{ marginLeft: "30px" }}
          color="primary"
        />
        <Badge
          badgeContent={30}
          style={{ marginLeft: "30px" }}
          color="success"
        />
      </td>
      <td style={{ width: "15%" }}>
        <Badge badgeContent={10} color="primary">
          <MailIcon color="action" />
        </Badge>
      </td>
      <td style={{ width: "15%" }}>
        <Badge badgeContent={14} color="primary">
          <MailIcon color="action" />
        </Badge>
      </td>
      <td style={{ width: "10%" }}>
        <a
          href={`/detail/${host.id}`}
          alt=""
          target="blank"
          className="btn-link"
        >
          Xem
        </a>
      </td>
    </tr>
  );
}
