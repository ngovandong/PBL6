import React, { useContext, useState, useMemo, useEffect } from 'react'
import Head from 'next/head'
import { AppProps } from 'next/app'
import { ThemeProvider } from '@mui/material/styles'
import CssBaseline from '@mui/material/CssBaseline'
import { CacheProvider, EmotionCache } from '@emotion/react'
import theme from 'common/constants/theme'
import createEmotionCache from 'common/utils/createEmotionCache'
import { Session } from 'next-auth'
import { SessionProvider } from 'next-auth/react'

import 'react-dates/initialize'
import 'react-dates/lib/css/_datepicker.css'
import 'react-toastify/dist/ReactToastify.css'

import 'public/styles/globals.scss'
import UserContext, { UserProvider } from 'common/context'
import { LOCAL_STORAGE } from '@constants/constant'
import { ToastContainer } from 'react-toastify'

// Client-side cache, shared for the whole session of the user in the browser.
const clientSideEmotionCache = createEmotionCache()

interface MyAppProps extends AppProps<{ session: Session }> {
  emotionCache?: EmotionCache
}

export default function MyApp(props: MyAppProps) {
  const { Component, emotionCache = clientSideEmotionCache, pageProps } = props
  const [user, setUser] = useState({})
  const value = useMemo(() => ({ user, setUser }), [user])
  useEffect(() => {
    const username = JSON.parse(
      localStorage.getItem(LOCAL_STORAGE.user) || '{}'
    )
    if (username) setUser(username)
  }, [])
  return (
    <SessionProvider session={pageProps.session}>
      <CacheProvider value={emotionCache}>
        <Head>
          <meta name='viewport' content='initial-scale=1, width=device-width' />
        </Head>
        <ThemeProvider theme={theme}>
          {/* CssBaseline kickstart an elegant, consistent, and simple baseline to build upon. */}
          <CssBaseline />
          <UserProvider value={value}>
            <Component {...pageProps} />
            <ToastContainer
              position='top-right'
              autoClose={8000}
              hideProgressBar={false}
              newestOnTop={false}
              draggable={false}
              pauseOnVisibilityChange
              closeOnClick
              pauseOnHover
            />
          </UserProvider>
        </ThemeProvider>
      </CacheProvider>
    </SessionProvider>
  )
}
