import { useRouter } from 'next/router'
import { memo, useContext } from 'react'
import { useSession } from 'next-auth/react'
import { ParsedUrlQuery } from 'querystring'

import { AppBar, Container, Toolbar, Typography, Box } from '@mui/material'
import FlightTakeoffIcon from '@mui/icons-material/FlightTakeoff'
import AuthHeader from './AuthHeader'


export const Header = ({searchQuery}: {searchQuery: ParsedUrlQuery}) => {
  const router = useRouter()

  const {data: session} = useSession()

  if (router.pathname !== '/sign-in') return <AuthHeader user={session?.user || {}} searchQuery={searchQuery}/>
  return (
    <AppBar
      position='sticky'
      style={{ boxShadow: 'unset', borderBottom: '1px solid #F7F7F7' }}
    >
      <Container maxWidth='lg'>
        <Toolbar disableGutters>
          <Box
            sx={{
              display: 'flex',
              alignItems: 'center',
              margin: 'auto',
            }}
          >
            <FlightTakeoffIcon
              sx={{ display: { xs: 'none', md: 'flex' }, mr: 1 }}
            />
            <Typography
              variant='h6'
              noWrap
              component='a'
              href='/'
              sx={{
                display: { md: 'flex' },
                fontFamily: 'monospace',
                fontWeight: 700,
                letterSpacing: '.3rem',
                color: 'inherit',
                textDecoration: 'none',
              }}
            >
              ReadyBooking
            </Typography>
          </Box>
        </Toolbar>
      </Container>
    </AppBar>
  )
}

export default memo(Header)
