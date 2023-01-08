import * as signalR from "@microsoft/signalr";
class SignalRService {
  constructor(hostId) {
    this.connection = new signalR.HubConnectionBuilder()
      .withUrl(
        `${process.env.REACT_APP_SIGNALR_URL}/Hub/HostHub?hostId=${hostId}`,
        // `${process.env.REACT_APP_SIGNALR_URL}/Hub/UserHub?userId=b0fdd010-9a45-4210-126b-08dac0df9d93`,
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
      this.connection.on("order-notification", (data) => {
        onMessageReceived(data);
      });
    };
  }
  newMessage = (messages) => {
    this.connection
      .send("newMessage", "foo", messages)
      .then((x) => console.log("sent"));
  };
  stop = () => {
    this.connection.stop();
    this.connection = null;
  };
}
export default SignalRService;
