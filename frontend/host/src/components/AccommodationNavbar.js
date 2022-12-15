import { Button } from "@mui/material";
import { useState } from "react";
import { NavLink } from "react-router-dom";
import NewAccommodationModal from "../pages/accomodation/newAccommodationModal";

function AccommodationNavbar() {
  const [openModal, setOpenModal] = useState(false);

  return (
    <div className="accommodation-nabar">
      {openModal && (
        <NewAccommodationModal
          handleClose={() => setOpenModal(false)}
          open={openModal}
        />
      )}
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
        <Button onClick={() => setOpenModal(true)} variant="contained">
          Tạo chỗ ở mới
        </Button>
      </div>
    </div>
  );
}

export default AccommodationNavbar;
