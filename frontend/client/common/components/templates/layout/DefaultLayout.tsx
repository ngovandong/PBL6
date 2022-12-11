import { Box } from '@mui/material'
import { Footer } from 'common/components/atoms/layout/Footer'
import { Header } from 'common/components/atoms/layout/Header'

import { useRouter } from 'next/router'

const DefaultLayout = ({ searchQuery, children }: any) => {
  const route = useRouter()
  return (
    <div>
      <Header searchQuery={searchQuery}/>
      <Box
        sx={{
          margin: '30px auto',
          maxWidth: '1300px',
          minHeight: 'calc(100vh - 220px)',
        }}
      >
        {children}
      </Box>
      {route.pathname !== '/sign-in' && <Footer />}
    </div>
  )
}

export default DefaultLayout
