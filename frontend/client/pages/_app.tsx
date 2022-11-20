import React from 'react'
import Head from 'next/head'
import App, { AppContext, AppProps } from 'next/app'
import { ThemeProvider } from '@mui/material/styles'
import CssBaseline from '@mui/material/CssBaseline'
import { CacheProvider, EmotionCache } from '@emotion/react'
import theme from 'common/constants/theme'
import createEmotionCache from 'common/utils/createEmotionCache'
import { Session } from 'next-auth'
import { getSession, SessionProvider } from 'next-auth/react'

import MainProvider from 'common/context'
import { ToastContainer } from 'react-toastify'
import { registerLicense } from '@syncfusion/ej2-base'

import DefaultLayout from '@components/templates/layout/DefaultLayout'

import 'public/styles/globals.scss'

registerLicense(process.env.NEXT_PUBLIC_SYNCFUSION_LICENSE || '')

// Client-side cache, shared for the whole session of the user in the browser.
const clientSideEmotionCache = createEmotionCache()

interface MyAppProps extends AppProps<{ session: Session }> {
  emotionCache?: EmotionCache
  session: Session
}

export default function MyApp(props: MyAppProps) {
  const {
    Component,
    emotionCache = clientSideEmotionCache,
    pageProps,
    session,
  } = props
  return (
    <SessionProvider
      session={session}
      refetchInterval={0}
      refetchOnWindowFocus={false}
    >
      <CacheProvider value={emotionCache}>
        <Head>
          <meta name='viewport' content='initial-scale=1, width=device-width' />
        </Head>
        <ThemeProvider theme={theme}>
          {/* CssBaseline kickstart an elegant, consistent, and simple baseline to build upon. */}
          <CssBaseline />
          <MainProvider session={session}>
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

MyApp.getInitialProps = async (context: AppContext) => {
  const appProps = await App.getInitialProps(context)
  const session = await getSession(context.ctx)

  return {
    ...appProps,
    session,
  }
}
