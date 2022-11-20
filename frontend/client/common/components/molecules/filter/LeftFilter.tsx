import { activeLinkColor } from '@constants/styles'
import { Box, Divider, FormControlLabel, Typography } from '@mui/material'
import styled from '@emotion/styled'
import RangeSlider from '@components/atoms/Slider'
import CheckBoxGroup from '../checkboxGroup'
import { policyFilter, scoreFilter, startFilter } from '@constants/data'

const Title = styled(Typography)`
  font-size: 18px;
  font-weight: 500;
`
const ButtonDelete = styled(Typography)`
  font-size: 18px;
  font-weight: 700;
  color: ${activeLinkColor};
  cursor: pointer;
  :hover {
    color: rgb(0, 113, 194, 0.7);
  }
`

const TitleFilter = styled(Typography)`
  font-size: 16px;
  font-weight: 500;
`

const LeftFilter = (props: any) => {
  return (
    <Box sx={{ borderRadius: 2, mr: 3, my: 3, p: 2, bgcolor: '#F0F2F5' }}>
      <Box display='flex'>
        <Title>Bộ lọc</Title>
        <ButtonDelete ml='auto'>Áp dụng</ButtonDelete>
      </Box>
      <Divider sx={{ my: 1 }} />
      <Box mt={1}>
        <TitleFilter>Mức giá</TitleFilter>
        <RangeSlider />
      </Box>
      <Divider sx={{ my: 1 }} />
      <Box>
        <TitleFilter>Xếp hạng sao</TitleFilter>
        <CheckBoxGroup options={startFilter} />
      </Box>
      <Divider sx={{ mt: 1 }} />
      <Box>
        <TitleFilter>Đánh giá</TitleFilter>
        <CheckBoxGroup options={scoreFilter} />
      </Box>
      <Divider sx={{ my: 1 }} />
      <Box>
        <TitleFilter>Chính sách hủy đặt phòng</TitleFilter>
        <CheckBoxGroup options={policyFilter} />
      </Box>
      <Divider sx={{ my: 1 }} />
      <Box>
        <TitleFilter>Tiện ích, tiện nghi</TitleFilter>
        <CheckBoxGroup options={policyFilter} />
      </Box>
    </Box>
  )
}

export default LeftFilter
