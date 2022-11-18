import { Box } from '@mui/material'
import { Footer } from 'common/components/atoms/layout/Footer'
import { Header } from 'common/components/atoms/layout/Header'

import { useRouter } from 'next/router'

const DefaultLayout = ({ user, children }: any) => {
  const route = useRouter()
  return (
    <div>
      <Header user={user} />
      <Box sx={{ margin: '30px auto', maxWidth: '1300px' }}>{children}</Box>
      {route.pathname !== '/sign-in' && <Footer />}
    </div>
  )
}

export default DefaultLayout
