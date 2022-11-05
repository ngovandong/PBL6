import { Box, styled } from '@mui/material'

import { DefaultButton } from '@components/atoms/Button/DefaultButton'
import CardContainer from '@components/molecules/card/CardContainer'

const ButtonWrapper = styled('div')(() => ({
  width: 'fit-content',
  margin: '20px auto',
}))

const CardBlock = () => {
  return (
    <Box display='flex' flexDirection='column'>
      <CardContainer />
      <ButtonWrapper>
        <DefaultButton>Xem thêm chỗ nghỉ</DefaultButton>
      </ButtonWrapper>
    </Box>
  )
}

export default CardBlock
