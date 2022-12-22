import { useEffect, useState } from 'react'
import { uniqueId } from 'lodash'
import Image from 'next/image'

import TabPanel from '@components/atoms/TabPanel'
import { DefaultTable } from '@components/molecules/table'
import { primaryColor } from '@constants/styles'
import { Tabs, Box, Tab, IconButton, Typography, Grid } from '@mui/material'
import CancelIcon from '@mui/icons-material/Cancel'
import VisibilityIcon from '@mui/icons-material/Visibility'
import { CircleLoading } from '@components/atoms/Loading'
import DefaultDialog from '@components/atoms/Dialog'
import styled from '@emotion/styled'
import { toastError, toastSuccess } from '@utils/notifications'

import { BookingDetailItem } from '@utils/types'
import { orderApi } from '@utils/api'
import { BED_TYPE, ERROR_MESSAGE, INFOR_MESSAGE } from '@constants/constant'

const TableCustom = styled('table')({
  marginRight: 24,
  '& > tr > td:first-of-type': {
    width: 180,
    verticalAlign: 'top',
  },
})

function createData(
  index: number,
  data: BookingDetailItem,
  handleOpen: (value: BookingDetailItem) => void,
  handleCancel: (id: string) => void,
  isCancel: boolean
) {
  return {
    no: index,
    hostName: <Box>{data?.hostName ?? ''}</Box>,
    province: <Box>{data?.province ?? ''}</Box>,
    userFirstName: <Box>{data?.userFirstName ?? ''}</Box>,
    userLastName: <Box>{data?.userLastName ?? ''}</Box>,
    userEmail: <Box>{data?.userEmail ?? ''}</Box>,
    dateCheckin: (
      <Box>
        {typeof data.dateCheckin === 'string'
          ? new Intl.DateTimeFormat('vi-VN', {
              dateStyle: 'full',
            }).format(new Date(data.dateCheckin))
          : ''}
      </Box>
    ),
    dateCheckout: (
      <Box>
        {typeof data.dateCheckout === 'string'
          ? new Intl.DateTimeFormat('vi-VN', {
              dateStyle: 'full',
            }).format(new Date(data.dateCheckout))
          : ''}
      </Box>
    ),
    totalPrice: (
      <Box>
        {data?.totalPrice?.toLocaleString('it-IT', {
          style: 'currency',
          currency: 'VND',
        }) ?? '0'}
      </Box>
    ),
    isPrePayment: (
      <Box>{data?.isPrePayment ? 'Thanh toán trước' : 'Thanh toán sau'}</Box>
    ),
    action: (
      <Box display='flex'>
        <IconButton
          aria-label='delete'
          size='small'
          title='Xem chi tiết'
          onClick={(event) => handleOpen(data)}
        >
          <VisibilityIcon fontSize='small' />
        </IconButton>
        {isCancel && (
          <IconButton
            aria-label='delete'
            size='small'
            title='Hủy đặt phòng'
            onClick={(event) => handleCancel(data.id || '')}
          >
            <CancelIcon fontSize='small' />
          </IconButton>
        )}
      </Box>
    ),
  }
}

const columns: { label: string }[] = [
  { label: 'STT' },
  { label: 'Chỗ nghỉ' },
  { label: 'Địa điểm' },
  { label: 'Tên' },
  { label: 'Họ' },
  { label: 'Email' },
  { label: 'Ngày check-in' },
  { label: 'Ngày check-out' },
  { label: 'Tổng tiền' },
  { label: 'Loại thanh toán' },
  { label: '' },
]

const OrderManagement = ({ userId }: { userId: string }) => {
  const [open, setOpen] = useState(false)
  const [loading, setLoading] = useState(true)
  const [isDeleting, setIsDeleting] = useState(false)
  const [value, setValue] = useState('one')
  const [rows, setRows] = useState<BookingDetailItem[]>([])
  const [detail, setDetail] = useState<BookingDetailItem>()

  const handleChange = (event: React.SyntheticEvent, newValue: string) =>
    setValue(newValue)

  const handleOpen = (value: BookingDetailItem) => {
    setDetail(value)
    setOpen(true)
  }

  const handleClose = () => setOpen(false)

  const handleCancel = async (value: string) => {
    try {
      const res = await orderApi.postCancelBooking(value)
      console.log(res)
      toastSuccess(INFOR_MESSAGE.UPDATED_SUCCESSFULLY)
      setIsDeleting((isDeleting) => !isDeleting)
    } catch (error) {
      toastError(ERROR_MESSAGE.COMMON_ERROR)
    }
  }

  const handleChangeBookingList = async () => {
    if (userId) {
      switch (value) {
        case 'one':
          try {
            const res = await orderApi.getPendingBooking(userId)
            const newRows =
              res.data?.map((item: BookingDetailItem, index: number) =>
                createData(index + 1, item, handleOpen, handleCancel, true)
              ) || []
            setRows(newRows)
          } catch (error) {}
          break

        case 'two':
          try {
            const res = await orderApi.getCurrentBooking(userId)
            const newRows =
              res.data?.map((item: BookingDetailItem, index: number) =>
                createData(index + 1, item, handleOpen, handleCancel, true)
              ) || []
            setRows(newRows)
          } catch (error) {}
          break

        case 'one':
          try {
            const res = await orderApi.getHistoryBooking(userId)
            const newRows =
              res.data?.map((item: BookingDetailItem, index: number) =>
                createData(index + 1, item, handleOpen, handleCancel, false)
              ) || []
            setRows(newRows)
          } catch (error) {}
          break

        case 'four':
          try {
            const res = await orderApi.getCancelBooking(userId)
            const newRows =
              res.data?.map((item: BookingDetailItem, index: number) =>
                createData(index + 1, item, handleOpen, handleCancel, false)
              ) || []
            setRows(newRows)
          } catch (error) {}
          break

        default:
          setRows([])
          break
      }
    }
    setLoading(false)
  }

  useEffect(() => {
    setLoading(true)
    handleChangeBookingList()
  }, [value, isDeleting])

  return (
    <Box>
      <Typography px={3} pb={1} sx={{ fontWeight: 700, fontSize: 24 }}>
        Đặt chỗ và chuyến đi
      </Typography>
      <Box sx={{ width: '100%' }}>
        <Tabs
          value={value}
          onChange={handleChange}
          textColor='inherit'
          sx={{
            px: 3,
            '& .MuiTabs-indicator': {
              backgroundColor: primaryColor,
            },
            '& .MuiButtonBase-root.MuiTab-root': {
              fontSize: 16,
              textTransform: 'initial',
              px: 0,
              mr: 4,
            },
          }}
          aria-label='secondary tabs example'
        >
          <Tab value='one' label='Chỗ nghỉ chờ xác nhận' />
          <Tab value='two' label='Chỗ nghỉ đã xác nhận' />
          <Tab value='three' label='Chỗ nghỉ đã đặt' />
          <Tab value='four' label='Chỗ nghỉ đã hủy' />
        </Tabs>
      </Box>
      {loading ? (
        <CircleLoading />
      ) : (
        <Box>
          <TabPanel value={value} index='one'>
            <DefaultTable rows={rows} columns={columns} />
          </TabPanel>
          <TabPanel value={value} index='two'>
            <DefaultTable rows={rows} columns={columns} />
          </TabPanel>
          <TabPanel value={value} index='three'>
            <DefaultTable rows={rows} columns={columns} />
          </TabPanel>
        </Box>
      )}
      <DefaultDialog
        open={open}
        handleClose={handleClose}
        title='Chi tiết đặt phòng'
      >
        <Grid container spacing={2} m='auto'>
          <Grid item display='flex' alignItems='center'>
            <Image src={detail?.avatarImage || ''} width={250} height={250} />
          </Grid>
          <Grid item flexGrow={1}>
            <TableCustom>
              <tr>
                <td>
                  <Typography fontWeight={700}>Khách sạn, chỗ nghỉ:</Typography>
                </td>
                <td>
                  <Typography sx={{ ml: 2 }}>{detail?.hostName}</Typography>
                </td>
              </tr>
              <tr>
                <td>
                  <Typography fontWeight={700}>Địa điểm:</Typography>
                </td>
                <td>
                  <Typography sx={{ ml: 2 }}>{detail?.province}</Typography>
                </td>
              </tr>
              <tr>
                <td>
                  <Typography fontWeight={700}>Ngày nhận phòng: </Typography>
                </td>
                <td>
                  <Typography sx={{ ml: 2 }}>
                    {typeof detail?.dateCheckin === 'string'
                      ? new Intl.DateTimeFormat('vi-VN', {
                          dateStyle: 'full',
                        }).format(new Date(detail?.dateCheckin))
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
                    {typeof detail?.dateCheckin === 'string'
                      ? new Intl.DateTimeFormat('vi-VN', {
                          dateStyle: 'full',
                        }).format(new Date(detail?.dateCheckout))
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
              {detail?.bookingDetailDtos?.map((item: any) => {
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
                  <Typography fontWeight={700}>Thuế, phí: </Typography>
                </td>
                <td>
                  <Typography sx={{ ml: 2 }}>
                    {detail?.vatFee.toLocaleString('it-IT', {
                      style: 'currency',
                      currency: 'VND',
                    }) ?? ''}
                  </Typography>
                </td>
              </tr>
              <tr>
                <td>
                  <Typography fontWeight={700}>Giá tiền: </Typography>
                </td>
                <td>
                  <Typography sx={{ ml: 2 }}>
                    {detail?.totalPrice.toLocaleString('it-IT', {
                      style: 'currency',
                      currency: 'VND',
                    }) ?? ''}
                  </Typography>
                </td>
              </tr>
              <tr style={{ width: '100%' }}>
                <td>
                  <Typography fontWeight={700}>Ghi chú: </Typography>
                </td>
                <td>
                  <Typography sx={{ ml: 2 }}>{detail?.note ?? ''}</Typography>
                </td>
              </tr>
            </TableCustom>
          </Grid>
        </Grid>
      </DefaultDialog>
    </Box>
  )
}

export default OrderManagement
