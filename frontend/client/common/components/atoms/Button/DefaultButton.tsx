import { borderRadiusButton, boxShadow } from '@constants/styles'
import { Button, ButtonProps, styled, Typography } from '@mui/material'

const ButtonContainer = styled(Button)(({ color }) => ({
  background: `${color === 'primary' ? '#FE843D' : '#D7E3F5'}`,
  border: '1px solid #F7F7F7',
  borderRadius: `${borderRadiusButton}`,
  color: `${color === 'primary' ? '#FFFFFF' : '#131C38'}`,
  textDecoration: 'none',
  textTransform: 'none',
  fontSize: '16px',
  fontWeight: 500,
  padding: '20px 16px',
  lineHeight: 0,

  '&:hover': {
    background: `${color === 'primary' ? ' #FE843D' : '#D7E3F5'}`,
    boxShadow: `${boxShadow}`,
  },

  '&:disabled': {
    background: `${color === 'primary' ? ' #FE843D' : '#D7E3F5'}`,
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
    >
      {props.children}
    </ButtonContainer>
  )
}
