import { Typography, SxProps, Theme } from '@mui/material'

export const Title = ({
  title,
  align,
  sx,
}: {
  title: string
  align?: 'right' | 'left' | 'inherit' | 'center' | 'justify'
  sx?: SxProps<Theme>
}) => {
  return (
    <Typography
      align={align || 'left'}
      fontSize='28px'
      fontWeight='700'
      marginBottom='32px'
      sx={{ ...sx }}
    >
      {title}
    </Typography>
  )
}
