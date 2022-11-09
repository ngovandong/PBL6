import {
  borderRadiusButton,
  boxShadow,
  primaryColor,
  secondaryColor,
  lightColor,
} from '@constants/styles'
import { Button, ButtonProps, styled } from '@mui/material'

const ButtonContainer = styled(Button)(({ color }) => ({
  backgroundColor: `${
    color === 'primary'
      ? primaryColor
      : color === 'secondary'
      ? secondaryColor
      : lightColor
  }`,
  borderTop: '1.6px solid rgba(0,0,0,0.8)',
  borderBottom: '1.6px solid rgba(0,0,0,0.8)',
  borderLeft: '1.6px solid rgba(0,0,0,0.8)',
  borderRight: '1.6px solid rgba(0,0,0,0.8)',
  borderRadius: `${borderRadiusButton}`,
  color: `${color === 'primary' ? '#FFFFFF' : '#131C38'}`,
  textDecoration: 'none',
  textTransform: 'none',
  fontSize: '16px',
  fontWeight: 500,
  padding: '20px 16px',
  lineHeight: 0,

  '&:hover': {
    backgroundColor: `${
      color === 'primary'
        ? primaryColor
        : color === 'secondary'
        ? secondaryColor
        : lightColor
    }`,
    boxShadow: `${boxShadow}`,
  },

  '&:disabled': {
    backgroundColor: `${
      color === 'primary'
        ? primaryColor
        : color === 'secondary'
        ? secondaryColor
        : lightColor
    }`,
    opacity: 0.5,
  },
}))

export const DefaultButton = (props: ButtonProps) => {
  return (
    <ButtonContainer
      color={props.color}
      sx={props.sx}
      disabled={props.disabled}
      onClick={props.onClick}
      type={props.type}
    >
      {props.children}
    </ButtonContainer>
  )
}
