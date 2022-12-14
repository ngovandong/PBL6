import {
  borderRadiusButton,
  boxShadow,
  primaryColor,
  secondaryColor,
  lightColor,
} from '@constants/styles'
import { Button, ButtonProps, CircularProgress, styled } from '@mui/material'

const ButtonContainer = styled(Button)(({ color }) => ({
  backgroundColor: `${
    color === 'primary'
      ? primaryColor
      : color === 'secondary'
      ? secondaryColor
      : lightColor
  }`,
  outline: '1px solid rgba(0,0,0,0.8)',
  border: '1.6px solid rgba(0,0,0,0.8)',
  // borderLeft: '1px solid rgba(0,0,0,0.8)',
  // borderRight: '1px solid rgba(0,0,0,0.8)',
  borderRadius: `${borderRadiusButton}`,
  color: `${color === 'primary' ? '#FFFFFF' : '#131C38'}`,
  textDecoration: 'none',
  textTransform: 'none',
  fontSize: '16px',
  fontWeight: 500,
  padding: '20px 16px',
  lineHeight: 0,
  width: 'auto',

  '&:hover': {
    backgroundColor: `${
      color === 'primary'
        ? primaryColor
        : color === 'secondary'
        ? secondaryColor
        : lightColor
    }`,
    boxShadow: `${boxShadow}`,
    outline: '1px solid rgba(0,0,0,0.8)',
  },

  '&:disabled': {
    backgroundColor: `${
      lightColor
    }`,
    outline: '1px solid rgba(0,0,0,0.8)',
    color: `${
      color === 'primary'
        ? primaryColor
        : color === 'secondary'
        ? secondaryColor
        : lightColor
    }`,
    opacity: 0.5,
  },
  
}))

export const DefaultButton = (props: ButtonProps & {loading?: boolean}) => {
  return (
    <ButtonContainer
      color={props.color}
      sx={props.sx}
      disabled={props.disabled}
      onClick={props.onClick}
      type={props.type}
      endIcon={props.loading ? <CircularProgress color="inherit" size='12px' /> : <></>}
    >
      {props.children}
    </ButtonContainer>
  )
}
