import Button from "@mui/material/Button";
import ViewAgenda from "@mui/icons-material/ViewAgenda";
import Badge from "@mui/material/Badge";
import MailIcon from "@mui/icons-material/Mail";

function ActiveAccommodation() {
  return (
    <div className="accommodation-container">
      <h2>Các chỗ nghỉ đang hoạt động</h2>
      <div className="accommodation-table">
        <table>
          <tr>
            <th>Tên</th>
            <th>Địa chỉ</th>
            <th>Trạng thái</th>
            <th>Khách đến/đi trong hôm nay & ngày mai</th>
            <th>Tin nhắn của khách</th>
            <th>Tin nhắn từ Booking.com</th>
            <th></th>
          </tr>
          <tbody>
            <TableRow progress={25} />
            <TableRow progress={50} />
            <TableRow progress={35} />
            <TableRow progress={75} />
          </tbody>
        </table>
      </div>
    </div>
  );
}

export default ActiveAccommodation;

function TableRow({ progress }) {
  return (
    <tr>
      <td style={{ width: "20%" }}>Alfreds Hotel</td>
      <td style={{ width: "20%" }}>Germany</td>
      <td style={{ width: "10%" }}>Working</td>
      <td style={{ width: "20%"}} >
        <Badge badgeContent={progress} style={{marginLeft:"30px"}} color="primary" />
        <Badge badgeContent={progress} style={{marginLeft:"30px"}}  color="success" />
      </td>
      <td style={{ width: "10%" }}>
        <Badge badgeContent={progress} color="primary">
          <MailIcon color="action" />
        </Badge>
      </td>
      <td style={{ width: "10%" }}>
        <Badge badgeContent={progress} color="primary">
          <MailIcon color="action" />
        </Badge>
      </td>
      <td style={{ width: "10%" }}>
        <Button variant="outlined" startIcon={<ViewAgenda />}>
          Xem
        </Button>
      </td>
    </tr>
  );
}
