import { useRouter } from 'next/router'
import { isEmpty } from 'lodash'

import { AppBar, Container, Toolbar, Typography, Box } from '@mui/material'
import FlightTakeoffIcon from '@mui/icons-material/FlightTakeoff'
import { DefaultButton } from '../Button/DefaultButton'
import { borderRadiusLarge } from '@constants/styles'

import UserMenu from '../UserMenu'
import { useUser } from 'common/context'
import { memo, useEffect } from 'react'
import { NotAuthHeader } from './NotAuthHeader'
import AuthHeader from './AuthHeader'

export const Header = () => {
  const router = useRouter()
  const [user, setUser] = useUser()

  if (router.pathname !== '/sign-in')
    return isEmpty(user) ? <NotAuthHeader /> : <AuthHeader user={user} />
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
                display: { xs: 'none', md: 'flex' },
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
