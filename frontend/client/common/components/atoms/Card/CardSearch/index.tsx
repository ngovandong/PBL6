import Image from 'next/image'
import Link from 'next/link'

import styled from '@emotion/styled'
import { Box, IconButton, Tooltip, Typography } from '@mui/material'
import { StarPurple500Outlined, FavoriteOutlined } from '@mui/icons-material'
import { activeLinkColor, boxShadowCard, lightColor } from '@constants/styles'
import { DefaultButton } from '@components/atoms/Button/DefaultButton'
import { useRouter } from 'next/router'
import { ContentLink, TitleLink } from '@components/atoms/Heading'
import { isNumber, uniqueId } from 'lodash'
import { useSession } from 'next-auth/react'
import { userApi } from '@utils/api'
import { updateFavoriteHost } from 'common/context'

const FavoriteIcon = styled(FavoriteOutlined)(
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
  left: 1px;
  top: 1px;
  background: transparent;
`

const CardSearch = (props: any) => {
  const router = useRouter()
  const { data } = props
  const query = router.query

  return (
    <Box
      maxWidth='100%'
      maxHeight='250px'
      display='flex'
      width='880px'
      gap={2}
      sx={{
        mt: 2,
        p: 2,
        border: '1px solid #131C38',
        borderRadius: 4,
        boxShadow: boxShadowCard,
        '&:hover': {
          backgroundColor: 'rgba(0,0,0,0.02)',
          cursor: 'pointer',
        },
      }}
    >
      <Box position='relative'>
        <ButtonFavorite
          onClick={(event) =>
            props.handleFavoriteHost(data.id, props.favoritedId)
          }
        >
          <FavoriteIcon favorited={props.favorited} />
        </ButtonFavorite>
        <Image
          src={data?.avatarImage ?? '/images/no-image-available.png'}
          width={200}
          height={200}
          style={{ margin: 'auto' }}
          alt='Booking'
        />
      </Box>
      <Box
        sx={{
          flex: 1,
          mx: 1,
          position: 'relative',
          maxHeight: '100%',
        }}
      >
        <Box display='flex'>
          <Box display='block' width='75%'>
            <Link
              href={`/post/${data.id}?DateCheckin=${query.DateCheckin}&DateCheckout=${query.DateCheckout}&QuantityPerson=${query.QuantityPerson}`}
            >
              <TitleLink>{data.name}</TitleLink>
            </Link>
            <Box
              sx={{
                ml: 1,
                mt: 0,
                display: 'inline-flex',
                placeContent: 'center',
              }}
            >
              <Tooltip title='Đánh giá sao này do chỗ nghỉ cung cấp cho Booking.com và thường được quyết định bởi một tổ chức đánh giá chính thức hoặc một bên thứ ba khác.'>
                <span>
                  {isNumber(data?.ratingStar) &&
                    Array.from(Array(data?.ratingStar).keys()).map((item) => (
                      <StarPurple500Outlined
                        color='warning'
                        key={data.id + '_' + uniqueId()}
                        sx={{ position: 'relative', top: '3px' }}
                      />
                    ))}
                </span>
              </Tooltip>
            </Box>
          </Box>
          <Box sx={{ ml: 'auto', display: 'flex' }}>
            <Typography sx={{ mt: 1, mx: 1 }}>{`${
              data?.quantityFeedBack || 0
            } đánh giá`}</Typography>
            <Box
              py={1}
              height='fit-content'
              bgcolor={activeLinkColor}
              color={lightColor}
              borderRadius={'6px'}
              width={38}
              textAlign='center'
            >
              {data?.ratingFeedBack || 0}
            </Box>
          </Box>
        </Box>
        <div>
          <Link
            href={`/post/${data.id}?DateCheckin=${query.DateCheckin}&DateCheckout=${query.DateCheckout}&QuantityPerson=${query.QuantityPerson}`}
          >
            <ContentLink>{`${data?.address}, ${data?.province}, ${data?.country}`}</ContentLink>
          </Link>
        </div>
        <Box width={'100%'} display='flex'>
          <Box
            sx={{
              maxWidth: '70%',
              borderLeft: '2px solid rgba(0,0,0,0.09)',
              pl: 2,
              mt: 2,
              mr: 1,
            }}
          >
            <Typography
              sx={{
                overflow: 'hidden',
                textOverflow: 'ellipsis',
                display: '-webkit-box',
                '-webkit-line-clamp': '6',
                '-webkit-box-orient': 'vertical',
                fontSize: 14,
              }}
            >
              {data?.description}
            </Typography>
          </Box>

          <Box ml='auto' mt='auto' width='max-content' textAlign='right'>
            <Typography sx={{ fontSize: 14, color: 'gray' }}>
              Giá thấp nhất chỉ từ
            </Typography>
            <Typography color='error' sx={{ fontSize: 18, fontWeight: 700 }}>
              {data.accommodationSearches?.length > 0 &&
                Math.min(
                  ...data.accommodationSearches?.map((o: any) => o.price)
                ).toLocaleString('it-IT', {
                  style: 'currency',
                  currency: 'VND',
                })}
            </Typography>
            <DefaultButton
              color='primary'
              sx={{ mt: 1 }}
              onClick={() =>
                router.push(
                  `/post/${data.id}?DateCheckin=${query.DateCheckin}&DateCheckout=${query.DateCheckout}&QuantityPerson=${query.QuantityPerson}`
                )
              }
            >
              Xem chi tiết
            </DefaultButton>
          </Box>
        </Box>
      </Box>
    </Box>
  )
}

export default CardSearch
