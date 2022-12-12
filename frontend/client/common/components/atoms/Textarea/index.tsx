import { primaryColor } from '@constants/styles'
import {
  styled,
  InputBase,
  InputBaseProps,
  TextareaAutosizeProps,
} from '@mui/material'
import { alpha } from '@mui/system'

const Input = styled('textarea')(({ theme }) => ({
  marginTop: '5px',
  backgroundColor: theme.palette.mode === 'light' ? '#fcfcfb' : '#2b2b2b',
  border: '1px solid #ced4da',
  borderRadius: 8,
  position: 'relative',
  fontSize: 16,
  width: '100%',
  padding: '10px 12px',
  transition: theme.transitions.create([
    'border-color',
    'background-color',
    'box-shadow',
  ]),
  fontFamily: [
    '-apple-system',
    'BlinkMacSystemFont',
    '"Segoe UI"',
    'Roboto',
    '"Helvetica Neue"',
    'Arial',
    'sans-serif',
    '"Apple Color Emoji"',
    '"Segoe UI Emoji"',
    '"Segoe UI Symbol"',
  ].join(','),
  '&:focus': {
    boxShadow: `${alpha(primaryColor, 0.8)} 0 0 0 0.05rem`,
    borderColor: '#ced4da',
    outline: 0,
  },
  '& .MuiInputAdornment-root': {
    width: 52,
  },
}))

export const TextArea = (props: any) => {
  return <Input {...props} />
}
