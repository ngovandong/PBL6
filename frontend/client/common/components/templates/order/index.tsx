import { DefaultButton } from '@components/atoms/Button/DefaultButton'
import { InputField } from '@components/atoms/Input/InputField'
import { TextArea } from '@components/atoms/Textarea'
import {
  BED_TYPE,
  ERROR_MESSAGE,
  INFOR_MESSAGE,
  ORDER_FORM,
} from '@constants/constant'
import { primaryColor } from '@constants/styles'
import {
  Divider,
  Grid,
  InputLabel,
  TextareaAutosize,
  Typography,
} from '@mui/material'
import { Box } from '@mui/system'
import { orderApi } from '@utils/api'
import { trimDataObject, validateEmail } from '@utils/helpers'
import { toastError, toastSuccess } from '@utils/notifications'
import { IDataCreateOrder } from '@utils/types'
import { isNumber, uniqueId } from 'lodash'
import { useSession } from 'next-auth/react'
import { useRouter } from 'next/router'
import { ParsedUrlQuery } from 'querystring'
import { useEffect, useState } from 'react'
import { Controller, useForm } from 'react-hook-form'

export default function OrderTemplate({
  searchQuery,
  user,
}: {
  searchQuery: { [key: string]: any }
  user: any
}) {
  const router = useRouter()
  const { data: session }: any = useSession()
  const [loading, setLoading] = useState(false)
  const {
    control,
    handleSubmit,
    formState: { errors },
    setError,
  } = useForm()

  useEffect(() => {
    console.log(session)
  }, [session])

  const onCreateOrder = (value: any) => {
    setLoading(true)
    const formData = {
      ...trimDataObject(value),
      dateCheckin: searchQuery.dateCheckin.toString(),
      dateCheckout: searchQuery.dateCheckout.toString(),
      hostId: searchQuery.hostId.toString(),
      isPrePayment: false,
      bookingDetails: [...searchQuery.bookingDetails],
      userId: session?.user?.id || '',
    }
    orderApi
      .createBooking(formData)
      .then((res: any) => {
        console.log(res.data)
        toastSuccess(INFOR_MESSAGE.BOOKING_SUCCESSFULLY)
        router.push('/order-management')
      })
      .catch((err: any) => {
        console.log(err)
        toastError(ERROR_MESSAGE.BOOKING_ERROR)
      })
      .finally(() => {
        setLoading(false)
      })
  }

  return (
    <Box width={1000} mx={'auto'}>
      <Grid container columnGap={2}>
        <Grid item sm={5}>
          <Box>
            <Typography fontWeight={700} fontSize={18}>
              Chi tiết đặt phòng
            </Typography>
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
                      ? new Intl.DateTimeFormat('vi-VN', {
                          dateStyle: 'full',
                        }).format(new Date(searchQuery.dateCheckin))
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
                      ? new Intl.DateTimeFormat('vi-VN', {
                          dateStyle: 'full',
                        }).format(new Date(searchQuery.dateCheckout))
                      : ''}
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
                      <Typography sx={{ ml: 2 }}>
                        {(function () {
                          const result = BED_TYPE.find(
                            (bedType: { [key: string]: any }) =>
                              item?.bedInfo === bedType?.code
                          )
                          return result?.label || ''
                        })()}
                      </Typography>
                    </td>
                  </tr>
                )
              })}
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
                    {isNumber(Number(searchQuery?.price))
                      ? Number(searchQuery?.price).toLocaleString('it-IT', {
                          style: 'currency',
                          currency: 'VND',
                        })
                      : ''}
                  </Typography>
                </td>
              </tr>
            </table>
          </Box>
        </Grid>
        <Grid item sm={6} ml='auto'>
          <Box>
            <Typography fontWeight={700} fontSize={18}>
              Thông tin đặt phòng
            </Typography>
          </Box>
          <Divider sx={{ mt: 1, mb: 2 }} />
          <form onSubmit={handleSubmit(onCreateOrder)}>
            {ORDER_FORM.map((item: any) => {
              return (
                <Grid item sm={12} key={uniqueId()} mt={1}>
                  <InputLabel required={item.required} htmlFor={item.id}>
                    {item.label}
                  </InputLabel>
                  <Controller
                    name={item.id}
                    control={control}
                    defaultValue={session?.user[item.defaultValue] || ''}
                    rules={{
                      required: { value: item.required, message: item.message },
                      ...item.rules,
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
            <Grid item sm={5} mx='auto' mt={2}>
              <DefaultButton
                color='primary'
                sx={{ width: '100%' }}
                type='submit'
                loading={loading}
                disabled={loading}
              >
                Xác nhận đặt phòng
              </DefaultButton>
            </Grid>
          </form>
        </Grid>
      </Grid>
    </Box>
  )
}
