import { useEffect, useState } from 'react'
import { uniqueId } from 'lodash'
import Image from 'next/image'

import TabPanel from '@components/atoms/TabPanel'
import { DefaultTable } from '@components/molecules/table'
import { primaryColor } from '@constants/styles'
import {
  Tabs,
  Box,
  Tab,
  IconButton,
  Typography,
  Grid,
  Chip,
} from '@mui/material'
import CancelIcon from '@mui/icons-material/Cancel'
import VisibilityIcon from '@mui/icons-material/Visibility'
import { CircleLoading } from '@components/atoms/Loading'
import DefaultDialog from '@components/atoms/Dialog'
import styled from '@emotion/styled'
import { toastError, toastSuccess } from '@utils/notifications'

import { BOOKING_STATUS, BookingDetailItem } from '@utils/types'
import { orderApi } from '@utils/api'
import { BED_TYPE, ERROR_MESSAGE, INFOR_MESSAGE } from '@constants/constant'
import { PaymentRounded } from '@mui/icons-material'
import { useSocket } from 'common/context'

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
  handleCancel: (value: BookingDetailItem) => void,
  hide?: string[],
  currentTab?: string,
  handlePayment?: (value: string) => void
) {
  return {
    no: index,
    hostName: <Box>{data?.hostName ?? ''}</Box>,
    province: <Box>{data?.province ?? ''}</Box>,
    userFirstName: <Box>{data?.userFirstName ?? ''}</Box>,
    userLastName: <Box>{data?.userLastName ?? ''}</Box>,
    userEmail: <Box>{data?.userEmail ?? ''}</Box>,
    dateCheckin: (
      <Box key={uniqueId()}>
        {typeof data.dateCheckin === 'string'
          ? new Intl.DateTimeFormat('vi-VN', {
              dateStyle: 'full',
            }).format(new Date(data.dateCheckin))
          : ''}
      </Box>
    ),
    dateCheckout: (
      <Box key={uniqueId()}>
        {typeof data.dateCheckout === 'string'
          ? new Intl.DateTimeFormat('vi-VN', {
              dateStyle: 'full',
            }).format(new Date(data.dateCheckout))
          : ''}
      </Box>
    ),
    totalPrice: (
      <Box key={uniqueId()}>
        {data?.totalPrice?.toLocaleString('it-IT', {
          style: 'currency',
          currency: 'VND',
        }) ?? '0'}
      </Box>
    ),

    isPrePayment: (
      <Box key={uniqueId()}>
        {data?.requirePayment ? 'Thanh toán trước' : 'Thanh toán sau'}
      </Box>
    ),
    ...(!hide?.includes('status') && {
      status: (
        <Box key={uniqueId()}>
          {currentTab === BOOKING_STATUS.PENDING ? (
            data?.requirePayment ? (
              <Chip color='error' label='Chờ thanh toán' />
            ) : (
              <Chip color='warning' label='Chờ xác nhận' />
            )
          ) : data?.hasPayment ? (
            <Chip color='success' label='Đã thanh toán' />
          ) : (
            <Chip color='default' label='Chưa thanh toán' />
          )}
        </Box>
      ),
    }),
    action: (
      <Box display='flex' key={uniqueId()}>
        {!data?.hasPayment && (
          <IconButton
            aria-label='payment'
            size='small'
            title='Thanh toán'
            onClick={(event) => handlePayment && handlePayment(data?.id || '')}
          >
            <PaymentRounded fontSize='small' />
          </IconButton>
        )}
        <IconButton
          aria-label='detail'
          size='small'
          title='Xem chi tiết'
          onClick={(event) => handleOpen(data)}
        >
          <VisibilityIcon fontSize='small' />
        </IconButton>

        {!hide?.includes('cancel') && (
          <IconButton
            aria-label='delete'
            size='small'
            title='Hủy đặt phòng'
            onClick={(event) => handleCancel(data)}
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
  { label: 'Trạng thái' },
  { label: 'Hành động' },
]

const OrderManagement = ({ userId }: { userId: string }) => {
  const [open, setOpen] = useState(false)
  const [isPayment, setIsPayment] = useState(false)
  const [urlPayment, setUrlPayment] = useState('')
  const [confirmDelete, setConfirmDelete] = useState(false)
  const [loading, setLoading] = useState(true)
  const [isDeleting, setIsDeleting] = useState(false)
  const [value, setValue] = useState<BOOKING_STATUS>(BOOKING_STATUS.PENDING)
  const [rows, setRows] = useState<BookingDetailItem[]>([])
  const [detail, setDetail] = useState<BookingDetailItem | null>()
  const { connection } = useSocket()

  const handlePayment = (bookingId: string) => {
    orderApi
      .getPaymentBooking(bookingId)
      .then((data) => {
        // setIsPayment(true)
        setUrlPayment(data?.data?.url)
        console.log(data?.data?.url)
        if (typeof window !== 'undefined')
          window.open(data?.data?.url, '_blank')?.focus()
      })
      .catch((error) => {
        console.log(error)
      })
  }

  const handleChange = (
    event: React.SyntheticEvent,
    newValue: BOOKING_STATUS
  ) => setValue(newValue)

  const handleOpen = (value: BookingDetailItem) => {
    setDetail(value)
    setOpen(true)
  }

  const handleClose = () => setOpen(false)

  const handleCancel = async () => {
    if (detail?.id) {
      try {
        const res = await orderApi.postCancelBooking(detail?.id || '')
        toastSuccess(INFOR_MESSAGE.UPDATED_SUCCESSFULLY)
        setIsDeleting((isDeleting) => !isDeleting)
      } catch (error) {
        toastError(ERROR_MESSAGE.COMMON_ERROR)
        setDetail(null)
      }
    } else {
      toastError(ERROR_MESSAGE.COMMON_ERROR)
    }
  }

  const handleChangeBookingList = async () => {
    if (userId) {
      switch (value) {
        case BOOKING_STATUS.PENDING:
          try {
            const res = await orderApi.getPendingBooking(userId)
            const newRows =
              res.data?.map((item: BookingDetailItem, index: number) =>
                createData(
                  index + 1,
                  item,
                  handleOpen,
                  (value: BookingDetailItem) => {
                    setDetail(value)
                    setConfirmDelete(true)
                  },
                  [],
                  BOOKING_STATUS.PENDING,
                  handlePayment
                )
              ) || []
            setRows(newRows)
          } catch (error) {}
          break

        case BOOKING_STATUS.CONFIRMED:
          try {
            const res = await orderApi.getCurrentBooking(userId)
            const newRows =
              res.data?.map((item: BookingDetailItem, index: number) =>
                createData(
                  index + 1,
                  item,
                  handleOpen,
                  (value: BookingDetailItem) => {
                    setDetail(value)
                    setConfirmDelete(true)
                  },
                  ['payment'],
                  BOOKING_STATUS.CONFIRMED,
                  handlePayment
                )
              ) || []
            setRows(newRows)
          } catch (error) {}
          break

        case BOOKING_STATUS.COMPLETED:
          try {
            const res = await orderApi.getHistoryBooking(userId)
            const newRows =
              res.data?.map((item: BookingDetailItem, index: number) =>
                createData(index + 1, item, handleOpen, () => {}, [
                  'status',
                  'payment',
                ])
              ) || []
            setRows(newRows)
          } catch (error) {}
          break

        case BOOKING_STATUS.CANCELED:
          try {
            const res = await orderApi.getCancelBooking(userId)
            const newRows =
              res.data?.map((item: BookingDetailItem, index: number) =>
                createData(index + 1, item, handleOpen, () => {}, [
                  'status',
                  'cancel',
                  'payment',
                ])
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
          <Tab value={BOOKING_STATUS.PENDING} label='Chỗ nghỉ đang chờ' />
          <Tab value={BOOKING_STATUS.CONFIRMED} label='Chỗ nghỉ đã xác nhận' />
          <Tab value={BOOKING_STATUS.COMPLETED} label='Chỗ nghỉ đã đặt' />
          <Tab value={BOOKING_STATUS.CANCELED} label='Chỗ nghỉ đã hủy' />
        </Tabs>
      </Box>
      {loading ? (
        <CircleLoading />
      ) : (
        <Box>
          {Object.keys(BOOKING_STATUS).map((key) => {
            const newColumns =
              key === BOOKING_STATUS.PENDING || key === BOOKING_STATUS.CONFIRMED
                ? [...columns]
                : [...columns.filter((column) => column.label !== 'Trạng thái')]
            return (
              <TabPanel
                value={value}
                index={BOOKING_STATUS[key as keyof typeof BOOKING_STATUS]}
              >
                <DefaultTable rows={rows} columns={newColumns} />
              </TabPanel>
            )
          })}
        </Box>
      )}

      <DefaultDialog
        open={confirmDelete}
        handleClose={() => setConfirmDelete(false)}
        title='Xác nhận xóa'
        width='200px'
        isConfirm
        onConfirm={handleCancel}
      >
        <Box my={2} mx={1}>
          Bạn có chắc chắn muốn xóa đơn đặt phòng này không?
        </Box>
      </DefaultDialog>

      <DefaultDialog
        open={isPayment}
        handleClose={() => setIsPayment(true)}
        title='Thanh toán'
        width='200px'
      >
        <Box my={2} mx={1}>
          <iframe src={urlPayment} height='100%' width='100%'></iframe>
        </Box>
      </DefaultDialog>

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
