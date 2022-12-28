import { useEffect } from "react";
import { Outlet } from "react-router-dom";
import NotificationNavbar from "../../components/NotificationNavbar";

function Notification() {
  useEffect(() => {
    document.title = "Thông báo";
  }, []);
  return (
    <div className="notification-page">
      <NotificationNavbar />
      <Outlet />
    </div>
  );
}

export default Notification;
