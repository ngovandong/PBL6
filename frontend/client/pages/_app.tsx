import '@styles/globals.scss'
import type { AppProps } from 'next/app'
import 'react-dates/initialize'
import 'react-dates/lib/css/_datepicker.css'

function MyApp({ Component, pageProps }: AppProps) {
  return <Component {...pageProps} />
}

export default MyApp
