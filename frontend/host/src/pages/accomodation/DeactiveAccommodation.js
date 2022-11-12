import Button from "@mui/material/Button";
import ViewAgenda from "@mui/icons-material/ViewAgenda";
import Badge from "@mui/material/Badge";
import MailIcon from "@mui/icons-material/Mail";
import { useSelector } from "react-redux";
import { selectDeactiveHost } from "../../app/store/hostSlice";

function DeactiveAccommodation() {
  const listHost = useSelector(selectDeactiveHost);
  return (
    <div className="accommodation-container">
      <h2>Các chỗ nghỉ đã nhưng hoạt động</h2>
      <div className="accommodation-table">
        <table>
          <thead>
            <tr>
              <th>Tên</th>
              <th>Địa chỉ</th>
              <th>Tin nhắn từ Booking.com</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            {listHost.map((h) => (
              <TableRow key={h.id} host={h} />
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}

export default DeactiveAccommodation;

function TableRow({ host }) {
  return (
    <tr>
      <td style={{ width: "30%" }}>{host.name}</td>
      <td style={{ width: "30%" }}>{host.address}</td>
      <td style={{ width: "20%" }}>
        <Badge badgeContent={2} color="primary">
          <MailIcon color="action" />
        </Badge>
      </td>
      <td style={{ width: "20%" }}>
        <td style={{ width: "10%" }}>
          <Button variant="outlined"> Kích hoạt lại</Button>
        </td>
      </td>
    </tr>
  );
}
