import {
  createContext,
  useContext,
  useCallback,
  useReducer,
  memo,
  useEffect,
} from 'react'
import { Session } from 'next-auth'
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
  const getFavoriteHost = (): any => {
    return new Promise((resolve) => {
      userApi
        .getFavoriteHosts(session?.user?.id as string)
        .then((response) => {
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
    if (session?.user?.id) {
      const arr = getFavoriteHost()
      setState({ ...state, user: session?.user, favoriteHosts: arr })
      session?.accessToken &&
        localStorage.setItem(
          LOCAL_STORAGE.accessToken,
          session?.accessToken || ''
        )
    }
  }, [])

  return (
    <MainContext.Provider value={{ state, setState }}>
      {children}
    </MainContext.Provider>
  )
}

export const MainConsumer = MainContext.Consumer
export default memo(MainProvider)
