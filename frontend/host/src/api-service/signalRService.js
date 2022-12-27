import * as signalR from "@microsoft/signalr";
class SignalRService {
  constructor(venderId) {
    this.connection = new signalR.HubConnectionBuilder()
      .withUrl(
        `${process.env.REACT_APP_SIGNALR_URL}/Hub/VenderHub?venderId=${venderId}`,
        {
          skipNegotiation: true,
          transport: signalR.HttpTransportType.WebSockets,
        }
      )
      .withAutomaticReconnect()
      .configureLogging(signalR.LogLevel.Information)
      .build();
    this.connection.start().catch((err) => console.log(err));
    this.events = (onMessageReceived) => {
      this.connection.on("messageReceived", (username, message) => {
        onMessageReceived(username, message);
      });
    };
  }
  newMessage = (messages) => {
    this.connection
      .send("newMessage", "foo", messages)
      .then((x) => console.log("sent"));
  };
}
export default SignalRService;
