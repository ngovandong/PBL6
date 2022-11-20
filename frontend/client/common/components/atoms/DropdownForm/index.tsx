import React, { forwardRef } from 'react'
import {
  Menu,
  MenuItem,
  Typography,
  Box,
  styled,
  IconButton,
} from '@mui/material'
import KeyboardArrowDownIcon from '@mui/icons-material/KeyboardArrowDown'
import AddIcon from '@mui/icons-material/Add'
import RemoveIcon from '@mui/icons-material/Remove'

const CustomMenuItem = styled('li')({
  padding: '4px 10px',
})

const DropdownForm = forwardRef<any, any>((props, ref) => {
  const [anchorEl, setAnchorEl] = React.useState<null | HTMLElement>(null)
  const [formValue, setFormValue] = React.useState<number[]>([
    props?.value[0] || 1,
    props?.value[1] || 1,
  ])
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
            display: 'flex',
            alignItems: 'center',
            textAlign: 'center',
            flexDirection: 'row',
            placeContent: 'center',
            ml: 1,
            mr: 2,
          }}
        >
          <Box minWidth='fit-content' display='flex' alignItems='center'>
            <p>{formValue[0]} người</p>
            <Box px={1}>-</Box>
            <p>{formValue[1]} phòng</p>
          </Box>
        </Box>
      </Box>
      <Menu
        anchorEl={anchorEl}
        open={open}
        onClose={handleClose}
        PaperProps={{
          elevation: 0,
          sx: {
            overflow: 'visible',
            pt: 0,
            borderRadius: 2,
            marginTop: '5px',
            filter: 'drop-shadow(0px 2px 8px rgba(0,0,0,0.32))',
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
        <CustomMenuItem>
          <Box
            sx={{
              display: 'flex',
              alignItems: 'center',
              textAlign: 'center',
              flexDirection: 'row',
              placeContent: 'center',
            }}
          >
            <Box width={80}>
              <Typography>Số người</Typography>
            </Box>
            <Box
              sx={{
                display: 'flex',
                alignItems: 'center',
                textAlign: 'center',
                flexDirection: 'row',
                justifyContent: 'flex-end',
                width: '120px',
              }}
            >
              <IconButton
                sx={{ p: '4px' }}
                onClick={() => {
                  props.onChange([formValue[0] - 1 || 1, formValue[1]])
                  setFormValue([formValue[0] - 1 || 1, formValue[1]])
                }}
              >
                <RemoveIcon />
              </IconButton>
              <Box sx={{ width: 20 }}>{formValue[0]}</Box>
              <IconButton
                sx={{ p: '4px' }}
                onClick={() => {
                  props.onChange([formValue[0] + 1, formValue[1]])
                  setFormValue([formValue[0] + 1 || 1, formValue[1]])
                }}
              >
                <AddIcon />
              </IconButton>
            </Box>
          </Box>
        </CustomMenuItem>
        <CustomMenuItem>
          <Box
            sx={{
              display: 'flex',
              alignItems: 'center',
              textAlign: 'center',
              flexDirection: 'row',
              placeContent: 'center',
            }}
          >
            <Box width={80}>
              <Typography>Số phòng</Typography>
            </Box>
            <Box
              sx={{
                display: 'flex',
                alignItems: 'center',
                textAlign: 'center',
                flexDirection: 'row',
                placeContent: 'flex-end',
                width: '120px',
              }}
            >
              <IconButton
                sx={{ p: '4px' }}
                onClick={() => {
                  props.onChange([formValue[0], formValue[1] - 1 || 1])
                  setFormValue([formValue[0], formValue[1] - 1 || 1])
                }}
              >
                <RemoveIcon />
              </IconButton>
              <Box sx={{ width: 20 }}>{formValue[1]}</Box>
              <IconButton
                sx={{ p: '4px' }}
                onClick={() => {
                  props.onChange([formValue[0], formValue[1] + 1])
                  setFormValue([formValue[0], formValue[1] + 1])
                }}
              >
                <AddIcon />
              </IconButton>
            </Box>
          </Box>
        </CustomMenuItem>
      </Menu>
    </React.Fragment>
  )
})

export default DropdownForm
