import Image from 'next/image'
import Link from 'next/link'

import styled from '@emotion/styled'
import { borderRadius, boxShadow, padding } from '@constants/styles'
import { Typography, Grid, Tooltip } from '@mui/material'
import { Box } from '@mui/system'

import LocationOnIcon from '@mui/icons-material/LocationOn'
import PaidIcon from '@mui/icons-material/Paid'

interface ICard {
  src: string
  title: string
}

const CardContainer = styled('div')`
  width: 300px;
  background-color: #fff;
  border-radius: ${borderRadius};
  box-shadow: ${boxShadow};
`

const CardImage = styled(Image)`
  border-radius: ${borderRadius};
`

const CardTitle = styled('p')`
  display: flex;
  align-items: center;
  font-weight: 400;
  font-size: 14px;
  line-height: 17px;
  margin: 5px 0;
  svg {
    margin-right: 10px;
    height: 20px;
    width: 20px;
  }
`

const CardItem = ({ src, title }: ICard) => {
  return (
    <Grid item xs={3}>
      <CardContainer>
        <Link href={''}>
          <a>
            <div>
              <CardImage src={src} alt={title} width={300} height={240} />
              <Box>
                <Box>
                  <Tooltip
                    title='
                    Căn hộ LuxHomes Saigon – Vinhomes Central Park (LuxHomes Saigon - Vinhomes Central Park)'
                  >
                    <Typography
                      fontWeight={700}
                      textOverflow='ellipsis'
                      overflow='hidden'
                      fontSize={18}
                      noWrap
                    >
                      Căn hộ LuxHomes Saigon – Vinhomes Central Park (LuxHomes
                      Saigon - Vinhomes Central Park)
                    </Typography>
                  </Tooltip>
                  <CardTitle>
                    <LocationOnIcon />
                    Hà Nội
                  </CardTitle>
                </Box>
                <Box>
                  <CardTitle>
                    <PaidIcon />
                    VNĐ 3000000
                  </CardTitle>
                </Box>
              </Box>
            </div>
          </a>
        </Link>
      </CardContainer>
    </Grid>
  )
}

export default CardItem
