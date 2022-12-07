import Image from 'next/image'
import Link from 'next/link'

import styled from '@emotion/styled'
import { Typography, Grid, Tooltip, IconButton } from '@mui/material'
import { Box } from '@mui/system'
import { activeLinkColor, borderRadius, lightColor } from '@constants/styles'

import LocationOnIcon from '@mui/icons-material/LocationOn'
import PaidIcon from '@mui/icons-material/Paid'
import FavoriteOutlinedIcon from '@mui/icons-material/FavoriteOutlined'
import { isNumber } from 'lodash'
import { StarPurple500Outlined } from '@mui/icons-material'
import moment from 'moment'

interface ICard {
  id: string
  src: string
  title: string
  province: string
  ratingStar: number
  country: string
  hostType: string
  ratingFeedback: number
  priceStandard: number
}

const CardContainer = styled('div')`
  width: 300px;
  background-color: #fff;
  border-radius: ${borderRadius};
  position: relative;
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

const FavoriteIcon = styled(FavoriteOutlinedIcon)(
  (props: { favorited?: boolean }) => `
  display: block;
  stroke: #ffffff;
  overflow: visible;
  fill: ${props.favorited ? '#FF385C' : 'rgba(0, 0, 0, 0.5);'}
`
)

const ButtonFavorite = styled(IconButton)`
  border-width: 1px;
  border-style: solid;
  border: none;
  transition: transform 0.25s ease;
  position: absolute;
  z-index: 10;
  right: 8px;
  top: 5px;
  background: transparent;
`

const CardItem = ({
  id,
  src,
  title,
  province,
  country,
  priceStandard,
  ratingStar,
  ratingFeedback,
}: ICard) => {
  return (
    <Grid item xs={3}>
      <CardContainer>
        <Link
          href={`/post/${id}?SearchText=${province}&DateCheckin=${
            moment().toISOString().split('T')[0]
          }&DateCheckout=${
            moment().add(1, 'days').toISOString().split('T')[0]
          }&QuantityPerson=1`}
        >
          <a>
            <div>
              <ButtonFavorite>
                <FavoriteIcon />
              </ButtonFavorite>
              <CardImage src={src} alt={title} width={300} height={240} />
              <Box>
                <Box>
                  <Tooltip title={title}>
                    <Typography
                      fontWeight={700}
                      textOverflow='ellipsis'
                      overflow='hidden'
                      fontSize={18}
                      noWrap
                    >
                      {title}
                    </Typography>
                  </Tooltip>
                </Box>
                <Box
                  sx={{
                    mt: 'auto',
                    display: 'flex',
                    justifyContent: 'space-between',
                    alignItems: 'center',
                  }}
                >
                  <Tooltip title='Đánh giá sao này do chỗ nghỉ cung cấp cho Booking.com và thường được quyết định bởi một tổ chức đánh giá khách sạn chính thức hoặc một bên thứ ba khác.'>
                    <span>
                      {isNumber(ratingStar) &&
                        Array.from(Array(ratingStar).keys()).map((item) => (
                          <StarPurple500Outlined color='warning' key='1' />
                        ))}
                    </span>
                  </Tooltip>
                </Box>
                <Box>
                  <CardTitle>
                    <LocationOnIcon />
                    {province} - {country}
                  </CardTitle>
                </Box>
                <Box>
                  <CardTitle>
                    <PaidIcon />
                    Giá thấp nhất chỉ từ -{' '}
                    {priceStandard.toLocaleString('it-IT', {
                      style: 'currency',
                      currency: 'VND',
                    })}
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
