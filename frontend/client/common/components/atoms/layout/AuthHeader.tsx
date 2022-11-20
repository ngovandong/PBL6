import { memo } from 'react'
import { useRouter } from 'next/router'
import { isEmpty } from 'lodash'

import UserMenu from '../UserMenu'
import { MainFilter } from '@components/molecules/filter'

import { AppBar, Container, Toolbar, Typography, Box } from '@mui/material'
import FlightTakeoffIcon from '@mui/icons-material/FlightTakeoff'
import { DefaultButton } from '../Button/DefaultButton'
import { borderRadiusLarge } from '@constants/styles'

export const AuthHeader = ({ user }: any) => {
  const router = useRouter()

  return (
    <AppBar
      position='sticky'
      style={{ boxShadow: 'unset', borderBottom: '1px solid #F7F7F7' }}
    >
      <Container sx={{ minWidth: '1330px' }}>
        <Toolbar
          disableGutters
          sx={{
            display: 'flex',
            justifyContent: 'space-between',
          }}
        >
          <Box
            sx={{
              display: 'flex',
              alignItems: 'center',
              mr: 0,
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
                mr: 2,
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
          <MainFilter />
          <Box
            sx={{
              display: 'flex',
              justifyContent: 'space-between',
              flexDirection: 'row',
            }}
          >
            <DefaultButton
              color='primary'
              sx={{ borderRadius: borderRadiusLarge }}
            >
              Đăng chỗ nghỉ
            </DefaultButton>
            {!isEmpty(user) ? (
              <UserMenu
                userName={user?.givenName || user?.email || ''}
                src={user?.avatarImageUrl || ''}
              />
            ) : (
              <Box>
                <DefaultButton
                  onClick={() => router.push('/sign-in')}
                  sx={{ borderRadius: borderRadiusLarge, ml: 3 }}
                >
                  Đăng ký
                </DefaultButton>
                <DefaultButton
                  onClick={() => router.push('/sign-in')}
                  sx={{ borderRadius: borderRadiusLarge, ml: 3 }}
                >
                  Đăng nhập
                </DefaultButton>
              </Box>
            )}
          </Box>
        </Toolbar>
      </Container>
    </AppBar>
  )
}

export default memo(AuthHeader)
