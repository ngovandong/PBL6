import { useForm, Resolver, Controller } from 'react-hook-form';

import { Box, Button, Divider, FormControlLabel, Typography } from '@mui/material'
import styled from '@emotion/styled'
import RangeSlider from '@components/atoms/Slider'
import CheckBoxGroup from '../checkboxGroup'
import { activeLinkColor } from '@constants/styles'

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

type FormValues = {
  price: number[];
  stars: string[];
};

const LeftFilter = (props: any) => {

  const { register, handleSubmit, formState: { errors } , control} = useForm<FormValues>({
    defaultValues: {
      price: [100000, 6000000],
      stars: [],
    },
  });
  const onSubmit = handleSubmit((data) => console.log(data));

  return (
    <Box sx={{ borderRadius: 2, mr: 3, my: 2, p: 2, bgcolor: '#F0F2F5' }}>
      <form onSubmit={onSubmit}>
        <Box display='flex'>
          <Title>Bộ lọc</Title>
          <ButtonDelete ml='auto' onClick={(event) => {onSubmit()}}>Áp dụng</ButtonDelete>
        </Box>
        <Divider sx={{ my: 1 }} />
        <Box mt={1}>
          <TitleFilter>Mức giá</TitleFilter>
          <Controller
            name="price"
            control={control}
            render={({ field }) => <RangeSlider {...field}/>}
          />
        </Box>
        <Divider sx={{ my: 1 }} />
        <Box>
          <TitleFilter>Xếp hạng sao</TitleFilter>
          <Controller
            name="stars"
            control={control}
            render={({ field }) => <CheckBoxGroup options={startFilter} {...field}/>}
          />
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
      </form>
    </Box>
  )
}

export default LeftFilter
