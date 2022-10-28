import { ThemeProvider } from '@mui/material'
import '@styles/globals.scss'
import theme from 'contansts/theme'
import type { AppProps } from 'next/app'
import 'react-dates/initialize'
import 'react-dates/lib/css/_datepicker.css'

function MyApp({ Component, pageProps }: AppProps) {
  return (
    <ThemeProvider theme={theme}>
      <Component {...pageProps} />
    </ThemeProvider>
  )
}

export default MyApp
