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

interface IMainState {
  user: any
}

interface IMainContext {
  state: IMainState
  setState: React.Dispatch<IMainState>
}

export const MainContext = createContext<IMainContext>({
  state: {
    user: {},
  },
  setState: (value: any) => {},
})

export const useUser = () => {
  const { state, setState } = useContext(MainContext)

  const setUser = useCallback(
    (user: any) => {
      setState({ ...state, user: user })
    },
    [setState]
  )

  return [state.user, setUser]
}

const MainProvider = ({
  children,
  session,
}: {
  children: any
  session: any
}) => {
  const [state, setState] = useReducer(
    (prev: IMainState, current: IMainState) => ({ ...prev, ...current }),
    {
      user: session?.user || {},
    }
  )
  useEffect(() => {
    setState({ ...state, user: session?.user || {} })
    session?.accessToken &&
      localStorage.setItem(
        LOCAL_STORAGE.accessToken,
        session?.accessToken || ''
      )
  }, [session])

  return (
    <MainContext.Provider value={{ state, setState }}>
      {children}
    </MainContext.Provider>
  )
}

export const MainConsumer = MainContext.Consumer
export default memo(MainProvider)
