import Image from 'next/image'
import Link from 'next/link'

import styled from '@emotion/styled'
import { Typography, Grid, Tooltip, IconButton } from '@mui/material'
import { Box } from '@mui/system'
import { activeLinkColor, borderRadius, lightColor } from '@constants/styles'

import LocationOnIcon from '@mui/icons-material/LocationOn'
import PaidIcon from '@mui/icons-material/Paid'
import FavoriteOutlinedIcon from '@mui/icons-material/FavoriteOutlined'
import { isNumber, uniqueId } from 'lodash'
import { StarPurple500Outlined } from '@mui/icons-material'
import moment from 'moment'
import { useSession } from 'next-auth/react'
import { useEffect, useState } from 'react'
import { userApi } from '@utils/api'

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
  favorited: boolean
  userId: boolean
  updateFavoriteHosts?: () => void
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
  (props) => `
  display: block;
  stroke: #ffffff;
  overflow: visible;
  fill: ${props.className === 'actived' ? '#FF385C' : 'rgba(0, 0, 0, 0.5)'}
`
)

const ButtonFavorite = styled(IconButton)`
  border-width: 1px;
  border-style: solid;
  border: none;
  transition: transform 0.25s ease;
  position: absolute;
  z-index: 20;
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
  favorited,
  userId,
  updateFavoriteHosts,
}: ICard) => {
  const [favorite, setFavorite] = useState<boolean>(favorited)

  const onFavoriteHost = () => {
    if (userId) {
      userApi
        .postFavoritedHosts({
          userId: 'b0fdd010-9a45-4210-126b-08dac0df9d93',
          hostId: '388a2e04-1f9a-41ba-c80a-08dac2d18101',
        })
        .then((res) => {
          console.log(res.data)
        })
        .catch((error) => {
          console.log(error)
        })
    }
  }

  return (
    <Grid item xs={3}>
      <CardContainer>
        <ButtonFavorite onClick={onFavoriteHost}>
          <FavoriteIcon className={favorite ? 'actived' : 'inactived'} />
        </ButtonFavorite>
        <Link
          href={`/post/${id}?SearchText=${province}&DateCheckin=${
            moment().toISOString().split('T')[0]
          }&DateCheckout=${
            moment().add(1, 'days').toISOString().split('T')[0]
          }&QuantityPerson=1`}
        >
          <a>
            <div>
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
                          <StarPurple500Outlined
                            color='warning'
                            key={uniqueId()}
                          />
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
                {priceStandard && (
                  <Box>
                    <CardTitle>
                      <PaidIcon />
                      Giá thấp nhất chỉ từ -{' '}
                      {priceStandard?.toLocaleString('it-IT', {
                        style: 'currency',
                        currency: 'VND',
                      })}
                    </CardTitle>
                  </Box>
                )}
              </Box>
            </div>
          </a>
        </Link>
      </CardContainer>
    </Grid>
  )
}

export default CardItem
