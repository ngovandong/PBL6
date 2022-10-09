import CircleProgress from "../../components/CircleProgress";
import IconButton from "@mui/material/IconButton";
import DeleteIcon from "@mui/icons-material/Delete";

function InprogressAccommodation() {
  return (
    <div className="accommodation-container">
      <h2>Chỗ nghỉ đang trong quá trình đăng ký</h2>
      <div className="accommodation-table">
        <table>
          <tr>
            <th>Tên</th>
            <th>Địa chỉ</th>
            <th>Tiến trình</th>
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

export default InprogressAccommodation;

function TableRow({progress}) {
  return (
    <tr>
      <td style={{ width: "35%" }}>Alfreds Hotel</td>
      <td style={{ width: "35%" }}>Germany</td>
      <td style={{ width: "20%" }}>
        <CircleProgress value={progress} />
      </td>
      <td style={{ width: "10%" }}>
      <IconButton aria-label="delete" size="large">
        <DeleteIcon fontSize="inherit" />
      </IconButton>
      </td>
    </tr>
  );
}
