import { Footer } from '@components/atoms/layout/Footer'
import { Header } from '@components/atoms/layout/Header'
import { Box } from '@mui/material'

const DefaultLayout = ({ children }: any) => {
  return (
    <div>
      <Header></Header>
      {children}
      <Footer></Footer>
    </div>
  )
}

export default DefaultLayout
