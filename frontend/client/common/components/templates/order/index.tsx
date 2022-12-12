import { DefaultButton } from '@components/atoms/Button/DefaultButton'
import { InputField } from '@components/atoms/Input/InputField'
import { TextArea } from '@components/atoms/Textarea'
import { BED_TYPE, ORDER_FORM } from '@constants/constant'
import { primaryColor } from '@constants/styles'
import {
  Divider,
  Grid,
  InputLabel,
  TextareaAutosize,
  Typography,
} from '@mui/material'
import { Box } from '@mui/system'
import { uniqueId } from 'lodash'
import { ParsedUrlQuery } from 'querystring'
import { Controller, useForm } from 'react-hook-form'

export default function OrderTemplate({
  searchQuery,
  user,
}: {
  searchQuery: { [key: string]: any }
  user: any
}) {
  console.log(searchQuery)

  const {
    control,
    handleSubmit,
    formState: { errors },
    setError,
  } = useForm()

  return (
    <Box width={1000} mx={'auto'}>
      <Grid container spacing={2}>
        <Grid item sm={4}>
          <Box>
            <Typography fontWeight={700}>Chi tiết đặt phòng của bạn</Typography>
          </Box>
          <Divider sx={{ my: 1 }} />
          <Box>
            <table>
              <tr>
                <td>
                  <Typography fontWeight={700}>Ngày nhận phòng: </Typography>
                </td>
                <td>
                  <Typography sx={{ ml: 2 }}>
                    {typeof searchQuery.dateCheckin === 'string'
                      ? searchQuery.dateCheckin
                      : ''}
                  </Typography>
                </td>
              </tr>
              <tr>
                <td>
                  <Typography fontWeight={700}>Ngày trả phòng: </Typography>
                </td>
                <td>
                  <Typography sx={{ ml: 2 }}>
                    {typeof searchQuery.dateCheckin === 'string'
                      ? searchQuery.dateCheckout
                      : ''}
                  </Typography>
                </td>
              </tr>
              <tr>
                <td>
                  <Typography fontWeight={700}>Tổng số phòng: </Typography>
                </td>
                <td>
                  <Typography sx={{ ml: 2 }}>{searchQuery?.number}</Typography>
                </td>
              </tr>
              <tr>
                <td>
                  <Typography fontWeight={700}>Giá tiền: </Typography>
                </td>
                <td>
                  <Typography sx={{ ml: 2 }}>
                    {Number(searchQuery?.price)?.toLocaleString('it-IT', {
                      style: 'currency',
                      currency: 'VND',
                    }) || ''}
                  </Typography>
                </td>
              </tr>
              <tr>
                <td>
                  <Typography fontWeight={700}>
                    Thông tin chi tiết phòng:{' '}
                  </Typography>
                </td>
              </tr>

              {searchQuery?.bookingDetails?.map((item: any) => {
                return (
                  <tr key={uniqueId()}>
                    <td>{item?.quantity || 0} phòng</td>
                    <td>
                      {(function () {
                        const result = BED_TYPE.find(
                          (bedType: { [key: string]: any }) =>
                            item?.bedInfo === bedType?.code
                        )
                        return result?.label || ''
                      })()}
                    </td>
                  </tr>
                )
              })}
            </table>
          </Box>
        </Grid>
        <Grid item sm={7} ml='auto'>
          <Box>
            <Typography fontWeight={700} mb={2} fontSize={18}>
              Thông tin đặt phòng
            </Typography>
          </Box>
          <form>
            {ORDER_FORM.map((item) => {
              return (
                <Grid item sm={12} key={uniqueId()} mt={1}>
                  <InputLabel required={item.required} htmlFor={item.id}>
                    {item.label}
                  </InputLabel>
                  <Controller
                    name={item.id}
                    control={control}
                    rules={{
                      required: { value: item.required, message: item.message },
                    }}
                    render={({ field }) => {
                      if (item.id === 'note') {
                        return <TextArea id={item.id} {...field} />
                      }
                      return <InputField fullWidth id={item.id} {...field} />
                    }}
                  />
                  {errors[item.id] && (
                    <Box mt={1}>
                      <Typography
                        component='span'
                        sx={{
                          color: primaryColor,
                          fontSize: 16,
                          fontWeight: 500,
                        }}
                        role='alert'
                      >
                        {errors[item.id]?.message?.toString()}
                      </Typography>
                    </Box>
                  )}
                </Grid>
              )
            })}
            <Grid item sm={4} mx='auto' mt={2}>
              <DefaultButton color='primary' sx={{ width: '100%' }}>
                Xác nhận đặt phòng
              </DefaultButton>
            </Grid>
          </form>
        </Grid>
      </Grid>
    </Box>
  )
}
