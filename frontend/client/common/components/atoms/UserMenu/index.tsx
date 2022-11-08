import { IconButton, Avatar, Box, Typography } from '@mui/material'

const UserMenu = ({ userName, src }: { userName: string; src: string }) => {
  return (
    <Box sx={{ display: 'flex', alignItems: 'center', textAlign: 'center' }}>
      <IconButton
        //   onClick={handleClick}
        size='small'
        sx={{ ml: 2 }}
      >
        <Avatar sx={{ width: 32, height: 32 }}></Avatar>
      </IconButton>
      <Box m={1}>
        <Typography fontSize={14}>{userName}</Typography>
      </Box>
    </Box>
  )
}

export default UserMenu
