import { borderRadius } from '@constants/styles'
import { Paper, Typography } from '@mui/material'
import Grid from '@mui/material/Grid'
import { Box, width } from '@mui/system'
import Image from 'next/image'
import Link from 'next/link'

interface IRoundCard {
  src: string
  title: string
  description: string
  size?: number
}

const CardCarousel = (props: IRoundCard) => {
  const { src, title, description } = props
  return (
    <Grid item sx={{ height: 'fit-content' }}>
      <Link href={''}>
        <a>
          <Image
            src={src || ''}
            alt={title}
            width={props?.size || 300}
            height={props?.size || 300}
            style={{ borderRadius: borderRadius }}
          />
          <Box>
            <Typography variant='h6'>{title}</Typography>
            <Typography variant='body2' sx={{ color: ' rgb(115, 115, 115)' }}>
              {description}
            </Typography>
          </Box>
        </a>
      </Link>
    </Grid>
  )
}

export default CardCarousel
