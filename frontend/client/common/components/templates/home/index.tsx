import styled from '@emotion/styled'
import { Box } from '@mui/material'

import { Title } from '@components/atoms/Heading'
import CardContainer from '@components/molecules/card/CardContainer'
import ChipContainer from '@components/molecules/chips/ChipContainer'
import { DefaultButton } from '@components/atoms/Button/DefaultButton'
import SliderCards from '@components/molecules/silder'
import { ICardItem } from '@utils/types'
import { useEffect, useRef, useState } from 'react'
import { searchApi } from '@utils/api'
import { useRouter } from 'next/router'
import moment from 'moment'

const ButtonWrapper = styled('div')(() => ({
  width: 'fit-content',
  margin: '20px auto',
}))

const HomeTemplate = (props: {
  hotels: ICardItem[] | null
  province: string
}) => {
  const [hotels, setHotels] = useState<ICardItem[] | null>(props.hotels)
  const ref = useRef<{ selectedProvince: string }>(null)
  const router = useRouter()

  const updateHotels = async () => {
    if (ref.current) {
      try {
        const res = await searchApi.searchHotelProvince({
          province: ref.current.selectedProvince,
        })
        setHotels(res.data)
      } catch (error) {}
    }
  }

  return (
    <>
      <Box mt={4}>
        <Title
          title='Top những điểm du lịch nổi bật nhất'
          align='center'
          sx={{ marginBottom: '16px' }}
        />
        <SliderCards />
      </Box>
      <Box mt={4}>
        <Title title='Những chỗ nghỉ khuyến nghị dành cho bạn' align='center' />
        <ChipContainer
          province={props.province}
          ref={ref}
          updateHotels={updateHotels}
        />
        <Box display='flex' flexDirection='column'>
          <CardContainer hotels={hotels} province={props.province} />
          <ButtonWrapper>
            <DefaultButton
              onClick={() => {
                router.push(
                  `/search?SearchText=${
                    ref?.current?.selectedProvince ?? props.province
                  }&SearchType=location&DateCheckin=${
                    moment().toISOString().split('T')[0]
                  }&DateCheckout=${
                    moment().add(1, 'days').toISOString().split('T')[0]
                  }&QuantityPerson=1`
                )
              }}
            >
              Xem thêm chỗ nghỉ
            </DefaultButton>
          </ButtonWrapper>
        </Box>
      </Box>
    </>
  )
}

export default HomeTemplate
