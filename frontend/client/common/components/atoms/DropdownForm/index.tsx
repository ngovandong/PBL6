import React from 'react'
import { Menu, MenuItem, Typography, Box } from '@mui/material'
import KeyboardArrowDownIcon from '@mui/icons-material/KeyboardArrowDown'
import AddIcon from '@mui/icons-material/Add'
import RemoveIcon from '@mui/icons-material/Remove'
import Input from '@mui/material/Input'

const DropdownForm = () => {
  const [anchorEl, setAnchorEl] = React.useState<null | HTMLElement>(null)

  const open = Boolean(anchorEl)

  const handleClick = (event: React.MouseEvent<HTMLElement>) => {
    setAnchorEl(event.currentTarget)
  }
  const handleClose = () => {
    setAnchorEl(null)
  }

  return (
    <React.Fragment>
      <Box onClick={handleClick}>
        <Box
          sx={{
            m: 2,
            display: 'flex',
            alignItems: 'center',
            textAlign: 'center',
            flexDirection: 'row',
            placeContent: 'center',
          }}
        >
          <Box>1 người | 1 phòng</Box>
          <Box>
            <KeyboardArrowDownIcon />
          </Box>
        </Box>
      </Box>
      <Menu
        anchorEl={anchorEl}
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
              zIndex: 0,
            },
          },
        }}
        transformOrigin={{ horizontal: 'left', vertical: 'top' }}
        anchorOrigin={{ horizontal: 'left', vertical: 'bottom' }}
      >
        <MenuItem>
          <Box
            sx={{
              display: 'flex',
              alignItems: 'center',
              textAlign: 'center',
              flexDirection: 'row',
              placeContent: 'center',
            }}
          >
            <Typography>Số người</Typography>
            <Box
              sx={{
                display: 'flex',
                alignItems: 'center',
                textAlign: 'center',
                flexDirection: 'row',
                placeContent: 'center',
              }}
            >
              <RemoveIcon />
              1
              <AddIcon />
            </Box>
          </Box>
        </MenuItem>
        <MenuItem>
          <Box>
            <Typography>Số phòng</Typography>
            <Input type='number' />
          </Box>
        </MenuItem>
      </Menu>
    </React.Fragment>
  )
}

export default DropdownForm
