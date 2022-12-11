import { useEffect } from "react";
import { useSelector } from "react-redux";
import { selectAddingHost } from "../../app/store/hostSlice";

function Notification() {
  const addingHost = useSelector(selectAddingHost);
  useEffect(() => {
    document.title = "Thông báo";
  }, []);
  return <div>{JSON.stringify(addingHost)}</div>;
}

export default Notification;
