import { borderRadius, boxShadow, padding } from '@constants/styles'
import styled from '@emotion/styled'
import { Paper, Typography } from '@mui/material'
import Grid from '@mui/material/Grid'
import Tooltip from '@mui/material/Tooltip'
import { Box, width } from '@mui/system'
import Image from 'next/image'
import Link from 'next/link'

interface ICard {
  src: string
  title: string
}

const CardContainer = styled('div')`
  width: 300px;
  height: 400px;
  background-color: #f7f7f7;
  border-radius: ${borderRadius};
`

const CardContainerItem = styled('div')`
  padding: ${padding};
`

const ImageItem = styled(Image)`
  border-radius: ${borderRadius};
`

const CardItem = ({ src, title }: ICard) => {
  return (
    <Grid item xs={3}>
      <CardContainer>
        <CardContainerItem>
          <Link href={''}>
            <a>
              <ImageItem src={src} alt={title} width={300} height={300} />
              <Box>
                <Tooltip
                  title='
                    Căn hộ LuxHomes Saigon – Vinhomes Central Park (LuxHomes Saigon - Vinhomes Central Park)'
                >
                  <Typography
                    fontWeight={500}
                    textOverflow='ellipsis'
                    overflow='hidden'
                    noWrap
                  >
                    Căn hộ LuxHomes Saigon – Vinhomes Central Park (LuxHomes Saigon
                    - Vinhomes Central Park)
                  </Typography>
                </Tooltip>
                <Typography fontWeight={500}>Hà Nội</Typography>
              </Box>
              <Box>
                <Typography variant='body2' sx={{ color: 'rgb(115, 115, 115)' }}>
                  Giá mỗi đêm chỉ từ
                </Typography>
                <Typography
                  sx={{
                    color: 'rgb(225, 45, 45)',
                    fontWeight: '700',
                  }}
                >
                  VNĐ 3000000
                </Typography>
              </Box>
            </a>
          </Link>
        </CardContainerItem>
      </CardContainer>
    </Grid>
  )
}

export default CardItem
