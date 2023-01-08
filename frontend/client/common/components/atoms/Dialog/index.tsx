import * as React from 'react'
import Button from '@mui/material/Button'
import { styled } from '@mui/material/styles'
import Dialog from '@mui/material/Dialog'
import DialogTitle from '@mui/material/DialogTitle'
import DialogContent from '@mui/material/DialogContent'
import DialogActions from '@mui/material/DialogActions'
import IconButton from '@mui/material/IconButton'
import CloseIcon from '@mui/icons-material/Close'
import Typography from '@mui/material/Typography'
import { DefaultButton } from '../Button/DefaultButton'
import { Box } from '@mui/material'

const BootstrapDialog = styled(Dialog)(({ theme }) => ({
  '& .MuiDialogContent-root': {
    padding: theme.spacing(2),
  },
  '& .MuiDialogActions-root': {
    padding: theme.spacing(1),
  },
}))

export interface DialogTitleProps {
  id: string
  children?: React.ReactNode
  onClose: () => void
}

function BootstrapDialogTitle(props: DialogTitleProps) {
  const { children, onClose, ...other } = props

  return (
    <DialogTitle sx={{ m: 0, p: 2 }} {...other}>
      {children}
      {onClose ? (
        <IconButton
          aria-label='close'
          onClick={onClose}
          sx={{
            position: 'absolute',
            right: 8,
            top: 8,
            color: (theme) => theme.palette.grey[500],
          }}
        >
          <CloseIcon />
        </IconButton>
      ) : null}
    </DialogTitle>
  )
}

export default function DefaultDialog(props: {
  open: boolean
  handleClose: () => void
  title?: string
  children?: React.ReactNode
  isConfirm?: boolean
  width?: number | string
  onConfirm?: (value: any) => void
}) {
  return (
    <div>
      <BootstrapDialog
        onClose={props.handleClose}
        open={props.open}
        sx={{
          '.mui-style-14xq91u-MuiPaper-root-MuiDialog-paper': {
            minWidth: props?.width ?? 800,
          },
        }}
      >
        <BootstrapDialogTitle
          id='customized-dialog-title'
          onClose={props.handleClose}
        >
          {props?.title || 'Ready Booking'}
        </BootstrapDialogTitle>
        <DialogContent dividers>
          <Box>{props?.children}</Box>
        </DialogContent>
        <DialogActions>
          <Box my={1} mr={1}>
            <DefaultButton onClick={props.handleClose}>Thoát</DefaultButton>
          </Box>

          {props?.isConfirm && (
            <Box my={1} mr={1}>
              <DefaultButton color='primary' onClick={props.onConfirm}>
                Xác nhận
              </DefaultButton>
            </Box>
          )}
        </DialogActions>
      </BootstrapDialog>
    </div>
  )
}
