import Badge from "@mui/material/Badge";
import MailIcon from "@mui/icons-material/Mail";
import { useDispatch, useSelector } from "react-redux";
import { deactivateHost, selectActiveHost } from "../../app/store/hostSlice";

function ActiveAccommodation() {
  const listHost = useSelector(selectActiveHost);

  return (
    <div className="accommodation-container">
      <h2>Các chỗ nghỉ đang hoạt động</h2>
      {listHost.length !== 0 && (
        <div className="accommodation-table">
          <table>
            <thead>
              <tr>
                <th>Tên</th>
                <th>Địa chỉ</th>
                <th>Khách đến/đi trong hôm nay & ngày mai</th>
                <th>Tin nhắn của khách</th>
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
      )}
    </div>
  );
}

export default ActiveAccommodation;

function TableRow({ host }) {
  const dispatch = useDispatch();
  const handlePause = () => {
    dispatch(deactivateHost(host.id));
  };
  return (
    <tr>
      <td style={{ width: "20%" }}>{host.name}</td>
      <td style={{ width: "25%" }}>{host.address}</td>
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
      <td style={{ width: "7%" }}>
        <a
          href={`/detail/${host.id}`}
          alt=""
          target="_blank"
          className="btn-link"
          rel="noreferrer"
        >
          Xem
        </a>
      </td>
      <td style={{ width: "13%" }}>
        {" "}
        <span className="btn-link pause" onClick={handlePause}>
          Tạm ngừng
        </span>
      </td>
    </tr>
  );
}
