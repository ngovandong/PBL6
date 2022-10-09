import { Button } from "@mui/material";
import { NavLink } from "react-router-dom";

function AccommodationNavbar() {
  const handleClick = () => {
    window.open("/newaccommodation");
  };
  return (
    <div className="accommodation-nabar">
      <div className="link-container">
        <NavLink
          className={({ isActive }) => (isActive ? "link active" : "link")}
          to="unfinished"
        >
          Chưa hoàn chỉnh
        </NavLink>
        <NavLink
          className={({ isActive }) => (isActive ? "link active" : "link")}
          to="active"
        >
          Đang hoạt động
        </NavLink>
        <NavLink
          className={({ isActive }) => (isActive ? "link active" : "link")}
          to="deactivated"
        >
          Đã nhưng hoạt động
        </NavLink>
      </div>
      <div>
        <Button
          onClick={handleClick}
          variant="contained"
        >
          Tạo chỗ ở mới
        </Button>
      </div>
    </div>
  );
}

export default AccommodationNavbar;
