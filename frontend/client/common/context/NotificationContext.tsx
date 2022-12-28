import React, {
  createContext,
  useContext,
  useRef,
  useEffect,
  useState,
} from 'react'
import * as signalR from '@microsoft/signalr'
import { toastSuccess } from '@utils/notifications'

interface INotification {
  notificationData: string[]
  setNotificationData: React.Dispatch<string[]>
  connection: signalR.HubConnection | null
  setConnection: React.Dispatch<signalR.HubConnection | null>
}

const NotificationContext = createContext<INotification>({
  notificationData: [],
  setNotificationData: (value: string[]) => {},
  connection: null,
  setConnection: (connection: signalR.HubConnection | null) => {},
})
export default NotificationContext

//create a provider of that context that will provide values
//which can be used by all the children conponents
export const NotificationProvider = ({
  children,
  session,
}: {
  children: any
  session: any
}) => {
  const [notificationData, setNotificationData] = useState<string[]>([])
  const [connection, setConnection] = useState<signalR.HubConnection | null>(
    null
  )

  useEffect(() => {
    if (session) {
      if (!connection) {
        console.log(session.user.id)
        const newConnection = new signalR.HubConnectionBuilder()
          .withUrl(
            `${process.env.NEXT_PUBLIC_SOCKET}/Hub/UserHub?userId=${session.user.id}`,
            {
              skipNegotiation: true,
              transport: signalR.HttpTransportType.WebSockets,
            }
          )
          .configureLogging(signalR.LogLevel.Information)
          .build()
        newConnection
          .start()
          .then((res) => {
            console.log('Connection started')
          })
          .catch((error) => {
            console.log(error)
          })
        newConnection?.on('payment-success', (data: any) => {
          console.log('listening')
          console.log(data)
          toastSuccess(
            'Đã thanh toán thành công cho đơn hàng mã ' + data?.bookingCode ??
              ''
          )
        })
        setConnection(newConnection)
      }
    }

    return () => {
      if (connection) {
        connection.stop()
      }
    }
  }, [])

  const receiveMessage = () => {
    connection?.on('payment-success', (data: any) => {
      console.log('listening')
      console.log(data)
      toastSuccess(
        'Đã thanh toán thành công cho đơn hàng mã ' + data?.bookingCode ?? ''
      )
    })
  }

  const disconnect = () => {
    connection?.stop()
  }

  return (
    <NotificationContext.Provider
      value={{
        notificationData,
        setNotificationData,
        connection,
        setConnection,
      }}
    >
      {children}
    </NotificationContext.Provider>
  )
}

//create a helper custom hook to used by other components who
//wish to use the context values
export const useNotificationContext = () => {
  const { notificationData, setNotificationData } =
    useContext(NotificationContext)
  return {
    notificationData,
    setNotificationData,
  }
}

export const useSocket = () => {
  const { connection, setConnection } = useContext(NotificationContext)
  return {
    connection,
    setConnection,
  }
}
