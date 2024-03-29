import { primaryColor } from './styles'
import { createTheme } from '@mui/material/styles'

const theme = createTheme({
  palette: {
    primary: {
      // Purple and green play nicely together.
      // main: '#1468a2',
      main: '#fff',
    },
    background: {
      default: '#fff',
    },
    text: {
      primary: primaryColor,
    },
  },
})

export default theme
