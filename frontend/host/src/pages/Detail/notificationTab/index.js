import { useEffect } from "react";
import { Outlet } from "react-router-dom";
import NotificationNavbar from "../../../components/NotìicationNavbar";

function NotificationTab() {
  useEffect(() => {
    document.title = "Thông báo";
  }, []);
  return (
    <div className="notification-page">
      <div style={{ paddingTop: "20px", paddingLeft: "20px" }}>
        <NotificationNavbar />
      </div>
      <Outlet />
    </div>
  );
}

export default NotificationTab;
