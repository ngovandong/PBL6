import { useRouter } from 'next/router'

import { AppBar, Container, Toolbar, Typography, Box } from '@mui/material'
import FlightTakeoffIcon from '@mui/icons-material/FlightTakeoff'
import { DefaultButton } from '../Button/DefaultButton'
import { borderRadiusLarge } from '@constants/styles'
import Link from 'next/link'

const url = process.env.NEXT_PUCLIC_HOST || '/'

export const NotAuthHeader = () => {
  const router = useRouter()
  return (
    <AppBar
      position='sticky'
      style={{ boxShadow: 'unset', borderBottom: '1px solid #F7F7F7' }}
    >
      <Container maxWidth='lg'>
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
          <Box
            sx={{
              display: 'flex',
              justifyContent: 'space-between',
              // minWidth: '400px',
            }}
          >
            <Link href={url} target='_blank'>
              <a href={url} target='_blank'>
                <DefaultButton
                  color='primary'
                  sx={{ borderRadius: borderRadiusLarge }}
                >
                  Đăng chỗ nghỉ
                </DefaultButton>
              </a>
            </Link>
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
        </Toolbar>
      </Container>
    </AppBar>
  )
}
