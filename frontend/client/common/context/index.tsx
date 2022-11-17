import { LOCAL_STORAGE } from '@constants/constant'
import { authApi } from '@utils/api'
import {
  createContext,
  useState,
  useContext,
  useCallback,
  useEffect,
  useReducer,
  memo,
} from 'react'

interface IMainState {
  user: {}
}

interface IMainContext {
  state: IMainState
  setState: React.Dispatch<IMainState>
}

export const MainContext = createContext<IMainContext>({
  state: {user: {}},
  setState: () => void
})

const useUser = () => {

}

const MainProvider = ({ children }: any) => {
  const [state, setState] = useReducer(
    (prev: IMainState, current: IMainState) => ({ ...prev, ...current }),
    { user: {} }
  )

  useEffect(() => {
    if (localStorage.getItem(LOCAL_STORAGE.user)) {
      const accessToken = localStorage.getItem(LOCAL_STORAGE.user);
      const user = authApi.
    }
    
  }, [])

  return <MainContext.Provider value={{state, setState}}>{children}</MainContext.Provider>
}

export const MainConsumer = MainContext.Consumer
export default memo(MainProvider)
