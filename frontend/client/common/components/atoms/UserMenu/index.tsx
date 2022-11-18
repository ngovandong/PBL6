import { useState } from 'react'
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
import { borderRadiusLarge } from '@constants/styles'
import { signOut, useSession } from 'next-auth/react'
import { useUser } from 'common/context'

const MenuContainer = ({ anchorEl, open, handleClose, signOut }) => (
  <Menu
    anchorEl={anchorEl}
    id='account-menu'
    open={open}
    onClose={handleClose}
    // onClick={handleClose}
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
      <Avatar /> Tài khoản
    </MenuItem>
    <MenuItem>
      <Avatar /> Đã lưu
    </MenuItem>
    <Divider />
    <MenuItem onClick={signOut}>
      <ListItemIcon>
        <Logout fontSize='small' />
      </ListItemIcon>
      Đăng xuất
    </MenuItem>
  </Menu>
)

const UserMenu = ({ userName, src }: { userName: string; src: string }) => {
  const { status } = useSession()
  const [user, setUser] = useUser()
  const [anchorEl, setAnchorEl] = useState<null | HTMLElement>(null)
  const open = Boolean(anchorEl)
  const handleClick = (event: React.MouseEvent<HTMLElement>) => {
    setAnchorEl(event.currentTarget)
  }
  const handleClose = () => {
    setAnchorEl(null)
  }

  const handleSignOut = () => {
    setUser({})
    localStorage.clear()
    if (status === 'authenticated') {
      signOut()
    }
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
        <Avatar sx={{ width: 32, height: 32, mt: '-5px' }} src={src}></Avatar>
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
