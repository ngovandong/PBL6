import { useEffect } from "react";

function Message() {
  useEffect(() => {
    document.title = "Tin nhắn";
  }, []);
  return <div>Message</div>;
}

export default Message;
