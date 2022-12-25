import {
  createContext,
  useContext,
  useCallback,
  useReducer,
  memo,
  useEffect,
  useState,
} from 'react'
import * as signalR from '@microsoft/signalr'
import { LOCAL_STORAGE } from '@constants/constant'
import { userApi } from '@utils/api'

interface IMainState {
  user: any
  favoriteHosts: any[]
}

interface IMainContext {
  state: IMainState
  setState: React.Dispatch<IMainState>
}

export const MainContext = createContext<IMainContext>({
  state: {
    user: {},
    favoriteHosts: [],
  },
  setState: (value: any) => {},
})

export const updateFavoriteHost = (id: string): any => {
  return new Promise((resolve) => {
    userApi
      .getFavoriteHosts(id)
      .then((response) => {
        resolve(response.data)
      })
      .catch((error) => {
        console.log(error)
        resolve([])
      })
  })
}

const MainProvider = ({
  children,
  session,
}: {
  children: any
  session: any
}) => {
  const [connection, setConnection] = useState<signalR.HubConnection | null>(
    null
  )
  const getFavoriteHost = (): any => {
    return new Promise((resolve) => {
      userApi
        .getFavoriteHosts(session?.user?.id as string)
        .then((response) => {
          setState({ ...state, favoriteHosts: response.data ?? [] })
          resolve(response.data ?? [])
        })
        .catch((error) => {
          console.log(error)
          resolve([])
        })
    })
  }

  const [state, setState] = useReducer(
    (prev: IMainState, current: IMainState) => ({ ...prev, ...current }),
    {
      user: session?.user || {},
      favoriteHosts: [],
    }
  )
  useEffect(() => {
    setState({ ...state, user: session?.user })
    session?.accessToken &&
      localStorage.setItem(
        LOCAL_STORAGE.accessToken,
        session?.accessToken || ''
      )
    if (session?.user?.id) {
      getFavoriteHost()
    }
  }, [])

  useEffect(() => {
    if (session) {
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

      setConnection(newConnection)
      newConnection
        .start()
        .then((res) => {
          console.log('Connection started')
        })
        .catch((error) => {
          console.log(error)
        })
    }
  }, [session])

  return (
    <MainContext.Provider value={{ state, setState }}>
      {children}
    </MainContext.Provider>
  )
}

export const MainConsumer = MainContext.Consumer
export default memo(MainProvider)
