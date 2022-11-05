import { Box } from '@mui/material'
import { Footer } from 'common/components/atoms/layout/Footer'
import { Header } from 'common/components/atoms/layout/Header'

const DefaultLayout = ({ children }: any) => {
  return (
    <div>
      <Header></Header>
      <Box sx={{ margin: 'auto', maxWidth: '1300px' }}>{children}</Box>
      <Footer></Footer>
    </div>
  )
}

export default DefaultLayout
