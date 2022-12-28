import { useEffect, useRef, useState } from "react";
import { Outlet, useParams } from "react-router-dom";
import SignalRService from "../../../api-service/signalRService";
import NotificationNavbar from "../../../components/NotificationNavbar";
import NotificationSound from "../../../sound/notification-sound.mp3";

function NotificationTab() {
  const audioPlayer = useRef(null);
  const { id } = useParams();
  const { events, stop } = new SignalRService(id);
  const [reload, setReload] = useState(false);

  function playAudio() {
    audioPlayer.current.play();
  }

  useEffect(() => {
    events((data) => {
      playAudio();
      setReload((pre) => !pre);
    });

    return stop;
  }, []);
  useEffect(() => {
    document.title = "Thông báo";
  }, []);
  return (
    <div className="notification-page">
      <audio
        ref={audioPlayer}
        src={NotificationSound}
        style={{ display: "none" }}
      />
      <div style={{ paddingTop: "20px", paddingLeft: "20px" }}>
        <NotificationNavbar />
      </div>
      <Outlet context={[reload]} />
    </div>
  );
}

export default NotificationTab;
