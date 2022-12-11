import { primaryColor } from '@constants/styles'
import { styled, InputBase, InputBaseProps } from '@mui/material'
import { alpha } from '@mui/system'

const Input = styled(InputBase)(({ theme }) => ({
  marginTop: '5px',
  backgroundColor: theme.palette.mode === 'light' ? '#fcfcfb' : '#2b2b2b',
  border: '1px solid #ced4da',
  borderRadius: 8,
  '& .MuiInputBase-input': {
    position: 'relative',
    fontSize: 16,
    width: '100%',
    padding: '10px 12px',
    marginTop: 0,
    transition: theme.transitions.create([
      'border-color',
      'background-color',
      'box-shadow',
    ]),
    // Use the system font instead of the default Roboto font.
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
  },
  '&:focus-within': {
    boxShadow: `${alpha(primaryColor, 0.8)} 0 0 0 0.05rem`,
    borderColor: '#ced4da',
  },
  '& .MuiInputAdornment-root': {
    width: 52,
  },
}))

export const InputField = (props: InputBaseProps) => {
  return <Input id='email' size='small' {...props} />
}
