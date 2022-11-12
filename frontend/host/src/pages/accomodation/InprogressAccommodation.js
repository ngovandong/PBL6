import CircleProgress from "../../components/CircleProgress";
import { useDispatch, useSelector } from "react-redux";
import { deleteHost, selectUnfinishHost } from "../../app/store/hostSlice";
import hostService from "../../api-service/hostService";
import { toast } from "react-toastify";

function InprogressAccommodation() {
  const listHost = useSelector(selectUnfinishHost);
  return (
    <div className="accommodation-container">
      <h2>Chỗ nghỉ đang trong quá trình đăng ký</h2>
      <div className="accommodation-table">
        <table>
          <thead>
            <tr>
              <th>Tên</th>
              <th>Địa chỉ</th>
              <th>Tiến trình</th>
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

export default InprogressAccommodation;

function TableRow({ host }) {
  const dispatch = useDispatch();
  let progress = 0;
  if (host.ratingStar) progress += 25;
  if (host.address) progress += 25;
  if (host.utilities?.length) progress += 25;
  if (host.avatarImage) progress += 25;

  const handleDelete = async () => {
    dispatch(deleteHost(host.id));
  };

  return (
    <tr>
      <td style={{ width: "35%" }}>{host.name}</td>
      <td style={{ width: "35%" }}>{host.address}</td>
      <td style={{ width: "10%" }}>
        <CircleProgress value={progress} />
      </td>
      <td style={{ width: "10%" }}>
        <a
          href={`/newaccommodation/${host.id}`}
          className="btn-link"
          target="blank"
        >
          Hoàn thành
        </a>
      </td>
      <td style={{ width: "10%" }}>
        <span className="btn-link" onClick={handleDelete}>
          Xóa
        </span>
      </td>
    </tr>
  );
}
