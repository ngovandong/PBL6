import { createContext, useContext, useCallback, useReducer, memo } from 'react'
import { Session } from 'next-auth'

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
  session: Session
}) => {
  const [state, setState] = useReducer(
    (prev: IMainState, current: IMainState) => ({ ...prev, ...current }),
    {
      user: session?.user || {},
    }
  )
  // useEffect(() => {
  //   const idUser = localStorage.getItem(LOCAL_STORAGE.idUser)
  //   if (idUser) {
  //     getUserInfor(idUser)
  //       .then((response) => {
  //         if (response.data?.email) {
  //           setState({
  //             user: response.data,
  //             isLoadingInit: false,
  //             isLogged: true,
  //           })
  //         }
  //       })
  //       .catch(() => {
  //         setState({ user: {}, isLoadingInit: false, isLogged: false })
  //         toastError('Đã có lỗi xảy ra. Vui lòng thử lại!')
  //       })
  //   }
  // }, [])

  return (
    <MainContext.Provider value={{ state, setState }}>
      {children}
    </MainContext.Provider>
  )
}

export const MainConsumer = MainContext.Consumer
export default memo(MainProvider)
