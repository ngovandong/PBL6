import Image from 'next/image'
import Link from 'next/link'

import styled from '@emotion/styled'
import { Box, Tooltip, Typography } from '@mui/material'
import { StarPurple500Outlined } from '@mui/icons-material'
import {
  activeLinkColor,
  boxShadowCard,
  lightColor,
  primaryColor,
} from '@constants/styles'
import { DefaultButton } from '@components/atoms/Button/DefaultButton'
import { useRouter } from 'next/router'
import { ContentLink, TitleLink } from '@components/atoms/Heading'

const CardSearch = (props: any) => {
  const router = useRouter()

  return (
    <Box
      maxWidth='100%'
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
      <Image
        src={
          'https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'
        }
        width={200}
        height={200}
        style={{ margin: 'auto' }}
        alt="Booking"
      />
      <Box sx={{ flex: 1, mx: 1, position: 'relative' }}>
        <Box display='flex'>
          <Box display='block' width='75%'>
            <Link href='/'>
              <TitleLink>
                Koi Resort & Spa Hoi An Koi Resort & Spa Hoi An
              </TitleLink>
            </Link>
            <Box sx={{ ml: 1, mt: 'auto', display: 'inline-block' }}>
              <Tooltip title='Đánh giá sao này do chỗ nghỉ cung cấp cho Booking.com và thường được quyết định bởi một tổ chức đánh giá khách sạn chính thức hoặc một bên thứ ba khác.'>
                <span>
                  {Array.from(Array(5).keys()).map((item) => (
                    <StarPurple500Outlined color='warning' key='1' />
                  ))}
                </span>
              </Tooltip>
            </Box>
          </Box>
          <Box sx={{ ml: 'auto', display: 'flex' }}>
            <Typography sx={{ mt: 1, mx: 1 }}>125 đánh giá</Typography>
            <Box
              p={1}
              height='fit-content'
              bgcolor={activeLinkColor}
              color={lightColor}
              borderRadius={'6px'}
            >
              8,7
            </Box>
          </Box>
        </Box>
        <div>
          <Link href='/'>
            <ContentLink>Cửa Đại, Hội An</ContentLink>
          </Link>
        </div>
        <Box display='flex'>
          <Box
            sx={{
              width: '60%',
              borderLeft: '2px solid rgba(0,0,0,0.09)',
              pl: 2,
              mt: 1,
              fontSize: 14,
            }}
          >
            Phòng 2 Giường Đơn Nhìn Ra Hồ Bơi 2 giường đơn Miễn Phí hủy phòng •
            Không cần thanh toán trước Bạn có thể hủy sau, nên hãy đặt ngay hôm
            nay để có giá tốt. Chỉ còn 1 phòng với giá này trên trang của chúng
            tôi
          </Box>
          <Box ml='auto' mt='auto' width='max-content' textAlign='right'>
            <Typography color='error' sx={{ fontSize: 18, fontWeight: 700 }}>
              VND 443.040
            </Typography>
            <Typography sx={{ fontSize: 14, color: 'gray' }}>
              Đã bao gồm thuế và phí
            </Typography>
            <DefaultButton
              color='primary'
              sx={{ mt: 1 }}
              onClick={() => router.push('/')}
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
