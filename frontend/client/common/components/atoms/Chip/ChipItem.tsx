import { secondaryColor } from '@constants/styles'
import { Chip, ChipProps, styled } from '@mui/material'

const ChipWrapper = styled(Chip)((props) => ({
  fontSize: '14px',
  backgroundColor: `${props.variant === 'filled' ? secondaryColor : '#f7f7f7'}`,
}))

const ChipItem = (props: ChipProps) => {
  return (
    <ChipWrapper
      icon={props.icon}
      label={props.label}
      variant={props.variant}
      onClick={props.onClick}
    />
  )
}

export default ChipItem
