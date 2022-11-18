import { CircularProgress } from '@mui/material'
import { LOCAL_STORAGE } from '@constants/constant'
import { getUserInfor } from '@utils/api/user'
import { toastError } from '@utils/notifications'

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
  user: any
  isLoadingInit: boolean
}

interface IMainContext {
  state: IMainState
  setState: React.Dispatch<IMainState>
}

export const MainContext = createContext<IMainContext>({
  state: {
    user: {},
    isLoadingInit: true,
  },
  setState: (value: any) => {},
})

export const useUser = () => {
  const { state, setState } = useContext(MainContext)

  const setUser = useCallback(
    (user: any) => {
      setState({ ...user })
    },
    [setState]
  )

  return [state.user, setUser]
}

const MainProvider = ({ children }: any) => {
  const [state, setState] = useReducer(
    (prev: IMainState, current: IMainState) => ({ ...prev, ...current }),
    { user: {}, isLoadingInit: false }
  )

  useEffect(() => {
    const idUser = localStorage.getItem(LOCAL_STORAGE.idUser)
    if (idUser) {
      getUserInfor(idUser)
        .then((response) => {
          if (response.data?.email) {
            setState({ user: response.data, isLoadingInit: false })
          }
        })
        .catch(() => {
          setState({ user: {}, isLoadingInit: false })
          toastError('Đã có lỗi xảy ra. Vui lòng thử lại!')
        })
    }
  }, [])

  return (
    <MainContext.Provider value={{ state, setState }}>
      {state.isLoadingInit ? <CircularProgress /> : children}
    </MainContext.Provider>
  )
}

export const MainConsumer = MainContext.Consumer
export default memo(MainProvider)
