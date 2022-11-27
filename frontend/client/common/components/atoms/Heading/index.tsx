import { activeLinkColor } from '@constants/styles'
import styled from '@emotion/styled'
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
      fontSize='24px'
      fontWeight='700'
      sx={{ ...sx }}
    >
      {title}
    </Typography>
  )
}

export const TitlePost = styled(Typography)`
  font-size: 18px;
  font-weight: 500;
`
export const ButtonDelete = styled(Typography)`
  font-size: 18px;
  font-weight: 700;
  color: ${activeLinkColor};
  cursor: pointer;
  :hover {
    color: rgb(0, 113, 194, 0.7);
  }
`
export const TitleFilter = styled(Typography)`
  font-size: 16px;
  font-weight: 500;
`

export const TitleLink = styled('a')`
  font-size: 24px;
  font-weight: 500;
  :hover {
    color: rgba(26, 37, 66, 0.8);
  }
`

export const ContentLink = styled('a')`
  font-size: 16px;
  font-weight: 400;
  color: ${activeLinkColor};
  :hover {
    color: rgba(26, 37, 66, 0.8);
  }
`
