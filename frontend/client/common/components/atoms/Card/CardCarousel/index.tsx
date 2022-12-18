import Image from 'next/image'
import Link from 'next/link'
import moment from 'moment'

import { borderRadius } from '@constants/styles'
import { Paper, Typography } from '@mui/material'
import Grid from '@mui/material/Grid'
import { Box, width } from '@mui/system'

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
      <Link
        href={`/search?SearchText=${title}&SearchType=location&DateCheckin=${
          moment().toISOString().split('T')[0]
        }&DateCheckout=${
          moment().add(1, 'days').toISOString().split('T')[0]
        }&QuantityPerson=1`}
      >
        <a>
          <Image
            src={src ?? '/images/no-image-available.png'}
            alt={title}
            width={props?.size || 300}
            height={props?.size || 300}
            style={{ borderRadius: borderRadius }}
          />
          <Box>
            <Typography variant='h6'>{title}</Typography>
            <Typography variant='body2' sx={{ color: ' rgb(115, 115, 115)' }}>
              {description ?? ''}
            </Typography>
          </Box>
        </a>
      </Link>
    </Grid>
  )
}

export default CardCarousel
