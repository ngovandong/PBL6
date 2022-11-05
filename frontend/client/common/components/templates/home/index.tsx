import styled from '@emotion/styled'
import { Box } from '@mui/material'

import { Title } from '@components/atoms/Heading'
import CardContainer from '@components/molecules/card/CardContainer'
import ChipContainer from '@components/molecules/chips/ChipContainer'
import { DefaultButton } from '@components/atoms/Button/DefaultButton'
import SliderCards from '@components/molecules/silder'

const ButtonWrapper = styled('div')(() => ({
  width: 'fit-content',
  margin: '20px auto',
}))

const HomeTemplate = () => {
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
        <ChipContainer />
        <Box display='flex' flexDirection='column'>
          <CardContainer />
          <ButtonWrapper>
            <DefaultButton>Xem thêm chỗ nghỉ</DefaultButton>
          </ButtonWrapper>
        </Box>
      </Box>
    </>
  )
}

export default HomeTemplate
