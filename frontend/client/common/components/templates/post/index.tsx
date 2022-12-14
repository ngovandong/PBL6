import { ContentLink, TitleLink } from '@components/atoms/Heading'
import { Divider, Grid, Tooltip, Typography } from '@mui/material'
import { Box } from '@mui/system'
import { StarPurple500Outlined, LocationOn, Remove } from '@mui/icons-material'
import ImageContainer from '@components/molecules/image'
import TableRoom from '@components/molecules/table'
import { activeLinkColor, lightColor } from '@constants/styles'
import { ProgressBarHorizontal } from '@components/atoms/Progress'
import { isNumber, uniqueId } from 'lodash'
import { AMENITIES } from '@constants/constant'

const PostDetailTemplate = ({ data }: any) => {
  return (
    <Box>
      <Box display='flex' flexDirection='column'>
        <Box display='flex' alignItems='center'>
          <TitleLink>{data.name}</TitleLink>
          <Box sx={{ ml: 1, mt: 'auto', display: 'inline-block' }}>
            <Tooltip title='Đánh giá sao này do chỗ nghỉ cung cấp và thường được quyết định bởi một tổ chức đánh giá chính thức hoặc một bên thứ ba khác.'>
              <span>
                {isNumber(data.ratingStar) &&
                  Array.from(Array(data.ratingStar).keys()).map((item) => (
                    <StarPurple500Outlined color='warning' key='1' />
                  ))}
              </span>
            </Tooltip>
          </Box>
        </Box>
        <Box display='flex' alignItems='center'>
          <ContentLink>
            <LocationOn sx={{ my: 'auto', mr: 1 }} />
          </ContentLink>
          <ContentLink>{`${data.address}, ${data.province}, ${data.country}`}</ContentLink>
        </Box>
        <ImageContainer
          images={data.images ?? '/images/no-image-available.png'}
          alt={data.name}
        />
      </Box>
      <Box width='80%' id='description'>
        <Box>
          <Typography fontSize={18} fontWeight='700' mb={1}>
            Mô tả
          </Typography>
          <Typography
            sx={{ fontSize: 16, whiteSpace: 'pre-wrap', lineHeight: 1.6 }}
          >
            {data.description}
          </Typography>
        </Box>
        <Box sx={{ my: 1 }}>
          <Typography fontSize={18} fontWeight='700' mb={1}>
            Dịch vụ chỗ nghỉ
          </Typography>
          <Box component='ul' py={0} my={0}>
            {data?.parkingLot && (
              <li>
                Bãi đỗ xe:{' '}
                {data?.parkingLotFee?.toLocaleString('it-IT', {
                  style: 'currency',
                  currency: 'VND',
                })}
              </li>
            )}
            {data?.breakfast && (
              <li>
                Phục vụ bữa sáng:{' '}
                {data?.breakfastFee?.toLocaleString('it-IT', {
                  style: 'currency',
                  currency: 'VND',
                })}
              </li>
            )}
          </Box>
        </Box>
        <Box sx={{ my: 1 }}>
          <Typography fontSize={18} fontWeight='700' mb={1}>
            Tiện nghi chỗ nghỉ
          </Typography>
          {data.utilities?.map((item: string) => {
            const element = AMENITIES.find(
              (element: any) => element.code === item
            )
            return (
              <Typography
                component='span'
                sx={{ px: 1 }}
                key={item + uniqueId()}
              >
                <i className={element?.icon} style={{ padding: '5px' }} />
                {element?.label}
              </Typography>
            )
          })}
        </Box>
        <Box sx={{ my: 1 }}>
          <Typography fontSize={18} fontWeight='700' mb={1}>
            Các tiện nghi được ưa chuộng nhất
          </Typography>
          {data.outstandingUtilities?.map((item: string) => {
            const element = AMENITIES.find(
              (element: any) => element.code === item
            )
            return (
              <Typography
                component='span'
                sx={{ px: 1 }}
                key={item + uniqueId()}
              >
                <i className={element?.icon} style={{ padding: '5px' }} />
                {element?.label}
              </Typography>
            )
          })}
        </Box>
      </Box>
      <Divider sx={{ my: 2 }} />
      <Box sx={{ my: 1 }}>
        <Box sx={{ my: 1 }}>
          <Typography fontSize={18} fontWeight='700'>
            Danh sách phòng trống
          </Typography>
        </Box>
        <Box sx={{ mt: 1, mb: 2 }}>
          <Typography fontSize={14} fontWeight={500} color='error'>
            <i>
              Thời gian check-in: {data?.timeCheckin || ''} - Thời gian
              check-out: {data?.timeCheckout || ''}
            </i>
          </Typography>
        </Box>
        <TableRoom data={data.accommodationSearches} hostId={data.id} />
      </Box>
      <Box sx={{ my: 2 }}>
        <Box sx={{ my: 1 }}>
          <Typography fontSize={18} fontWeight='700'>
            Đánh giá của khách hàng
          </Typography>
        </Box>
        <Box sx={{ ml: 'auto', display: 'flex', alignItems: 'center' }}>
          <Box
            p={1}
            height='fit-content'
            bgcolor={activeLinkColor}
            color={lightColor}
            borderRadius={'6px'}
          >
            {data.ratingFeedBack}
          </Box>
          <Remove sx={{ mx: 1, fontSize: 12 }} />
          <Typography>{data.quantityFeedBack} đánh giá</Typography>
          <Remove sx={{ mx: 1, fontSize: 12 }} />
          <Typography sx={{ fontWeight: 400, textTransform: 'none' }}>
            <ContentLink>Xem tất cả đánh giá</ContentLink>
          </Typography>
        </Box>
        <Box sx={{ my: 2 }}>
          <Typography fontSize={16} fontWeight='700'>
            Hạng mục đánh giá
          </Typography>
          <Grid container pt={1} columnSpacing={4} rowSpacing={1}>
            <Grid item sm={4}>
              <Box display='flex' justifyContent='space-between'>
                <Typography fontSize={14} fontWeight='400' mb={1}>
                  Nhân viên phục vụ
                </Typography>
                <Typography fontSize={14} fontWeight='400' mb={1}>
                  7.5
                </Typography>
              </Box>
              <ProgressBarHorizontal value={(7.5 * 100) / 10} />
            </Grid>
            <Grid item sm={4}>
              <Box display='flex' justifyContent='space-between'>
                <Typography fontSize={14} fontWeight='400' mb={1}>
                  Nhân viên phục vụ
                </Typography>
                <Typography fontSize={14} fontWeight='400' mb={1}>
                  7.5
                </Typography>
              </Box>
              <ProgressBarHorizontal value={(7.5 * 100) / 10} />
            </Grid>
          </Grid>
        </Box>
      </Box>
    </Box>
  )
}

export default PostDetailTemplate
