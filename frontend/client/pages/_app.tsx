import React, { useContext } from 'react'
import Head from 'next/head'
import App, { AppContext, AppProps } from 'next/app'
import { ThemeProvider } from '@mui/material/styles'
import CssBaseline from '@mui/material/CssBaseline'
import { CacheProvider, EmotionCache } from '@emotion/react'
import theme from 'common/constants/theme'
import createEmotionCache from 'common/utils/createEmotionCache'
import { Session } from 'next-auth'
import { SessionProvider, getSession } from 'next-auth/react'

import 'react-dates/initialize'
import 'react-dates/lib/css/_datepicker.css'
import 'react-toastify/dist/ReactToastify.css'

import MainProvider, { MainContext } from 'common/context'
import { ToastContainer } from 'react-toastify'

import 'public/styles/globals.scss'
import DefaultLayout from '@components/templates/layout/DefaultLayout'
import { isEmpty } from 'lodash'
import { LOCAL_STORAGE } from '@constants/constant'

// Client-side cache, shared for the whole session of the user in the browser.
const clientSideEmotionCache = createEmotionCache()

interface MyAppProps extends AppProps<{ session: Session }> {
  emotionCache?: EmotionCache
}

export default function MyApp(props: MyAppProps) {
  const { Component, emotionCache = clientSideEmotionCache, pageProps } = props
  const { state } = useContext(MainContext)

  return (
    <SessionProvider session={pageProps.session}>
      <CacheProvider value={emotionCache}>
        <Head>
          <meta name='viewport' content='initial-scale=1, width=device-width' />
        </Head>
        <ThemeProvider theme={theme}>
          {/* CssBaseline kickstart an elegant, consistent, and simple baseline to build upon. */}
          <CssBaseline />
          <MainProvider>
            <DefaultLayout>
              <Component {...pageProps} />
            </DefaultLayout>
            <ToastContainer
              position='top-right'
              autoClose={8000}
              hideProgressBar={false}
              newestOnTop={false}
              draggable={false}
              closeOnClick
              pauseOnHover
            />
          </MainProvider>
        </ThemeProvider>
      </CacheProvider>
    </SessionProvider>
  )
}

// MyApp.getInitialProps = async (context: AppContext) => {
//   const ctx = App.getInitialProps(context)
//   const session = await getSession(context.ctx)
//   return { ...ctx, session }
// }
