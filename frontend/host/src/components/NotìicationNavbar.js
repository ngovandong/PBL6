import { useState } from "react";
import { NavLink } from "react-router-dom";

function NotificationNavbar() {

  return (
    <div className="accommodation-nabar">
      <div className="link-container">
        <NavLink
          className={({ isActive }) => (isActive ? "link active" : "link")}
          to="current"
        >
          Đơn đặt mới
        </NavLink>
        <NavLink
          className={({ isActive }) => (isActive ? "link active" : "link")}
          to="canceled"
        >
          Đơn bị hủy
        </NavLink>
        <NavLink
          className={({ isActive }) => (isActive ? "link active" : "link")}
          to="history"
        >
         Lịch sử đặt phòng
        </NavLink>
      </div>
    </div>
  );
}

export default NotificationNavbar;
