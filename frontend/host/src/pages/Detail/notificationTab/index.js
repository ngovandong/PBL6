import { useEffect, useState } from "react";
import { useSelector } from "react-redux";
import { Outlet, useParams } from "react-router-dom";
import SignalRService from "../../../api-service/signalRService";
import { selectAccount, selectUser } from "../../../app/store/authSlice";
import NotificationNavbar from "../../../components/NotìicationNavbar";

function NotificationTab() {
  // const { id } = useParams();
  const account = useSelector(selectAccount);
  const { newMessage, events } = new SignalRService(account.id);
  const [message, setMessage] = useState("initial value");
  useEffect(() => {
    events((_, message) => setMessage(message));
  }, []);
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
