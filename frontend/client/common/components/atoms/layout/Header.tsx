import {
  AppBar,
  Container,
  Toolbar,
  Typography,
  Box,
  Button,
  Tooltip,
  Menu,
  MenuItem,
  IconButton,
  Avatar,
} from '@mui/material'
import FlightTakeoffIcon from '@mui/icons-material/FlightTakeoff'
import Link from 'next/link'

export const Header = () => {
  return (
    <AppBar position="sticky" style={{boxShadow: 'unset', borderBottom: '1px solid #F7F7F7'}} >
      <Container maxWidth='lg'>
        <Toolbar
          disableGutters
          sx={{ display: 'flex', justifyContent: 'space-between' }}
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
              minWidth: '400px',
            }}
          >
            <Link href='/'>
              <a>
                <Typography>Đăng ký host</Typography>
              </a>
            </Link>
            <Link href='/'>
              <a>
                <Typography>Đăng nhập</Typography>
              </a>
            </Link>
            <Link href='/'>
              <a>
                <Typography>Tạo tài khoản</Typography>
              </a>
            </Link>
          </Box>
        </Toolbar>
      </Container>
    </AppBar>
  )
}
