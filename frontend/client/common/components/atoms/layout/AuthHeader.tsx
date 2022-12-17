import { memo } from 'react'
import { useRouter } from 'next/router'
import { isEmpty } from 'lodash'
import { ParsedUrlQuery } from 'querystring'

import UserMenu from '../UserMenu'
import { MainFilter } from '@components/molecules/filter'
import { AppBar, Container, Toolbar, Typography, Box } from '@mui/material'
import { DefaultButton } from '../Button/DefaultButton'
import FlightTakeoffIcon from '@mui/icons-material/FlightTakeoff'
import { borderRadiusLarge } from '@constants/styles'

export const AuthHeader = ({
  user,
  searchQuery,
}: {
  user: any
  searchQuery: ParsedUrlQuery
}) => {
  const router = useRouter()

  return (
    <AppBar
      position='sticky'
      style={{
        boxShadow: 'unset',
        borderBottom: '1px solid #F7F7F7',
        padding: '0',
      }}
    >
      <Container sx={{ minWidth: '1380px', px: 0 }}>
        <Toolbar
          disableGutters
          sx={{
            display: 'flex',
          }}
        >
          <Box
            sx={{
              display: 'flex',
              alignItems: 'center',
              mr: 2,
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
                mr: 1,
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
          <MainFilter searchQuery={searchQuery} />
          <Box
            sx={{
              display: 'flex',
              justifyContent: 'space-between',
              flexDirection: 'row',
              marginLeft: 'auto',
            }}
          >
            <DefaultButton
              color='primary'
              sx={{ borderRadius: borderRadiusLarge }}
              onClick={() => router.push(process.env.NEXT_PUCLIC_HOST || '/')}
            >
              Đăng chỗ nghỉ
            </DefaultButton>
            {!isEmpty(user) ? (
              <UserMenu
                userName={user?.givenName || user?.email || ''}
                src={user?.avatarImageUrl || ''}
              />
            ) : (
              <>
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
              </>
            )}
          </Box>
        </Toolbar>
      </Container>
    </AppBar>
  )
}

export default memo(AuthHeader)
