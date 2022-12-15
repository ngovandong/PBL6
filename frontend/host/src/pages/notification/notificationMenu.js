import { Menu } from "@mui/material";
import { useState } from "react";
import { useNavigate } from "react-router-dom";

const notifications = [1, 2, 3, 4];

function NotificationMenu({ open, handleClose,anchorEl }) {
  const navigate = useNavigate();
  const handleItemClick = () => {
    navigate("/notification");
  };
  return (
    <Menu
      id="basic-menu-notification"
      anchorEl={anchorEl}
      open={open}
      onClose={handleClose}
      MenuListProps={{
        "aria-labelledby": "basic-button-notification",
      }}
    >
      {notifications.map((n) => (
        <NotificationItem key={n} handleItemClick={handleItemClick} />
      ))}
    </Menu>
  );
}

export default NotificationMenu;

function NotificationItem({ handleItemClick }) {
  return (
    <div className="notification-menu" onClick={handleItemClick}>
      <h4>Đơn hàng mới</h4>
      <p>Ngô Văn Đông đã đặt phòng f345</p>
    </div>
  );
}
