import { NavLink } from "react-router-dom";

function LeftNav() {
  return (
    <div className="left-nav">
      <NavLink
        className={({ isActive }) =>
          isActive ? "left-link active" : "left-link"
        }
        to="notification"
      >
        Thông Báo
      </NavLink>
      <NavLink
        className={({ isActive }) =>
          isActive ? "left-link active" : "left-link"
        }
        to="info"
      >
        Thông tin chỗ ở
      </NavLink>
      <NavLink
        className={({ isActive }) =>
          isActive ? "left-link active" : "left-link"
        }
        to="room"
      >
        Quản lý phòng
      </NavLink>

      <NavLink
        className={({ isActive }) =>
          isActive ? "left-link active" : "left-link"
        }
        to="revenue"
      >
        Đặt phòng & Thu nhập
      </NavLink>
    </div>
  );
}

export default LeftNav;
