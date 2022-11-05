import { Title } from '@components/atoms/Heading'
import ChipContainer from '@components/molecules/chips/ChipContainer'
import CardBlock from '@components/organisms/card/CardBlock'
import { Box } from '@mui/material'

const HomeTemplate = () => {
  return (
    <Box>
      <Title
        title='Khám phá những chỗ nghỉ nổi bật khuyến nghị cho bạn'
        align='center'
      />
      <ChipContainer />
      <CardBlock />
    </Box>
  )
}

export default HomeTemplate
