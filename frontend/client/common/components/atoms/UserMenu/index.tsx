import { useContext, useState } from 'react'
import {
  IconButton,
  Avatar,
  Box,
  Typography,
  MenuItem,
  Divider,
  ListItemIcon,
  Menu,
} from '@mui/material'
import Logout from '@mui/icons-material/Logout'
import MenuIcon from '@mui/icons-material/Menu'
import PersonIcon from '@mui/icons-material/Person'
import CardTravelIcon from '@mui/icons-material/CardTravel'
import FavoriteBorderIcon from '@mui/icons-material/FavoriteBorder'
import { borderRadiusLarge } from '@constants/styles'
import { signOut, useSession } from 'next-auth/react'
import { MainContext, useUser } from 'common/context'
import Link from 'next/link'
import styled from '@emotion/styled'
import { useRouter } from 'next/router'

const NavLink = styled.a`
  display: flex;
  flex-direction: row;
  align-items: center;
`

const MenuContainer = ({ anchorEl, open, handleClose, signOut }: any) => (
  <Menu
    anchorEl={anchorEl}
    id='account-menu'
    open={open}
    onClose={handleClose}
    PaperProps={{
      elevation: 0,
      sx: {
        overflow: 'visible',
        filter: 'drop-shadow(0px 2px 8px rgba(0,0,0,0.32))',
        mt: 1.5,
        '& .MuiAvatar-root': {
          width: 32,
          height: 32,
          ml: -0.5,
          mr: 1,
        },
        '&:before': {
          content: '""',
          display: 'block',
          position: 'absolute',
          top: 0,
          right: 14,
          width: 10,
          height: 10,
          bgcolor: 'background.paper',
          transform: 'translateY(-50%) rotate(45deg)',
          zIndex: 0,
        },
      },
    }}
    transformOrigin={{ horizontal: 'right', vertical: 'top' }}
    anchorOrigin={{ horizontal: 'right', vertical: 'bottom' }}
  >
    <MenuItem>
      <Link href='/profile'>
        <NavLink>
          <PersonIcon sx={{ mr: 2 }} /> <span>Quản lý tài khoản</span>
        </NavLink>
      </Link>
    </MenuItem>
    <MenuItem>
      <Link href='/order-management'>
        <NavLink>
          <CardTravelIcon sx={{ mr: 2 }} /> Đặt chỗ & Chuyến đi
        </NavLink>
      </Link>
    </MenuItem>
    {/* <MenuItem>
      <Link href='/my-favorite'>
        <NavLink>
          <FavoriteBorderIcon sx={{ mr: 2 }} /> Danh sách đã lưu
        </NavLink>
      </Link>
    </MenuItem> */}
    <Divider />
    <MenuItem onClick={signOut}>
      <Logout sx={{ mr: 2 }} />
      Đăng xuất
    </MenuItem>
  </Menu>
)

const UserMenu = ({ userName, src }: { userName: string; src: string }) => {
  const router = useRouter()
  const { state, setState } = useContext(MainContext)
  const [anchorEl, setAnchorEl] = useState<null | HTMLElement>(null)
  const open = Boolean(anchorEl)
  const handleClick = (event: React.MouseEvent<HTMLElement>) => {
    setAnchorEl(event.currentTarget)
  }
  const handleClose = () => {
    setAnchorEl(null)
  }

  const handleSignOut = () => {
    setState({ ...state, user: {} })
    signOut({redirect: false})
    router.replace('/')
  }

  return (
    <Box
      sx={{
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        p: '5px 10px 0',
        cursor: 'pointer',
        ml: 2,
        border: '1px solid rgba(0,0,0, 0.1)',
        borderRadius: `${borderRadiusLarge}`,
      }}
    >
      <Box onClick={handleClick} display='flex'>
        <Avatar
          sx={{ width: 32, height: 32, mt: '-5px' }}
          src={src || ''}
        ></Avatar>
        <MenuIcon sx={{ ml: 1, fontSize: 22 }} />
      </Box>
      <MenuContainer
        anchorEl={anchorEl}
        handleClose={handleClose}
        open={open}
        signOut={handleSignOut}
      />
    </Box>
  )
}

export default UserMenu
