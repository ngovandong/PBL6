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
import { userApi } from '@utils/api'
import { useSession } from 'next-auth/react'
import { reloadSession } from '@utils/helpers'
import { MainContext, updateFavoriteHost } from 'common/context'
import { useContext } from 'react'

interface ICard {
  id: string
  src: string
  title: string
  province: string
  ratingStar?: number
  country?: string
  hostType?: string
  ratingFeedback?: number
  priceStandard?: number
  favorited?: boolean
  favoritedId?: string
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
  favorited,
  favoritedId,
}: ICard) => {
  const { data: session }: any = useSession()
  const { state, setState } = useContext(MainContext)
  const handleFavoriteHost = async () => {
    if (session) {
      try {
        if (!favorited) {
          const response = await userApi.postFavoriteHost({
            userId: session?.user?.id,
            hostId: id,
          })
        } else {
          if (typeof favoritedId == 'string') {
            const response = await userApi.deleteFavoriteHost(favoritedId)
          }
        }
        const newArr = await updateFavoriteHost(session?.user?.id as string)
        setState({
          ...state,
          favoriteHosts: newArr,
        })
      } catch (error) {
        console.log(error)
      }
    }
  }

  return (
    <Grid item xs={3}>
      <CardContainer>
        <ButtonFavorite onClick={(event) => handleFavoriteHost()}>
          <FavoriteIcon favorited={favorited} />
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
              <CardImage
                src={src ?? '/images/no-image-available.png'}
                alt={title}
                width={300}
                height={240}
              />
              <Box>
                <Grid container justifyContent='space-between'>
                  <Grid
                    sm={8}
                    item
                    sx={{ textOverflow: 'ellipsis', overflow: 'hidden' }}
                  >
                    <Tooltip title={title}>
                      <Typography fontWeight={700} fontSize={18} noWrap>
                        {title}
                      </Typography>
                    </Tooltip>
                  </Grid>
                  <Grid
                    item
                    sx={{
                      mt: 'auto',
                      display: 'flex',
                      justifyContent: 'space-between',
                      alignItems: 'center',
                    }}
                  >
                    <Tooltip title='Đánh giá sao này do chỗ nghỉ cung cấp và thường được quyết định bởi một tổ chức đánh giá chính thức hoặc một bên thứ ba khác.'>
                      <span>
                        {isNumber(ratingStar) &&
                          Array.from(Array(ratingStar).keys()).map((item) => (
                            <StarPurple500Outlined color='warning' key='1' />
                          ))}
                      </span>
                    </Tooltip>
                  </Grid>
                </Grid>
                {country && (
                  <Box>
                    <CardTitle>
                      <LocationOnIcon />
                      {province} - {country}
                    </CardTitle>
                  </Box>
                )}
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
