import { LOCAL_STORAGE } from '@constants/constant'
import { createContext, useState, useContext } from 'react'

interface IUserContext {
  user: {}
  setUser: (value: any) => void
}

const UserContext = createContext<IUserContext>({
  user: {},
  setUser: () => {},
})

export const UserProvider = UserContext.Provider
export const UserConsumer = UserContext.Consumer
export const useUserContext = () => useContext(UserContext)

export default UserContext
