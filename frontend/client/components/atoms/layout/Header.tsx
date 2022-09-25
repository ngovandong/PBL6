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
import Link from 'next/link'

const pages = ['Products', 'Pricing', 'Blog']
const settings = ['Profile', 'Account', 'Dashboard', 'Logout']

export const Header = () => {
  return (
    <AppBar position='sticky'>
      <Container maxWidth='xl'>
        <Toolbar
          disableGutters
          sx={{ display: 'flex', justifyContent: 'space-between' }}
        >
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
            LOGO
          </Typography>
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
