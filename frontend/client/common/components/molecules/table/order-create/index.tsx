import * as React from 'react'
import Paper from '@mui/material/Paper'
import Table from '@mui/material/Table'
import TableBody from '@mui/material/TableBody'
import TableCell from '@mui/material/TableCell'
import TableContainer from '@mui/material/TableContainer'
import TableHead from '@mui/material/TableHead'
import TablePagination from '@mui/material/TablePagination'
import TableRow from '@mui/material/TableRow'
import { MenuItem, Select, Tooltip, Typography } from '@mui/material'
import { DefaultButton } from '@components/atoms/Button/DefaultButton'
import { Box } from '@mui/system'
import { TitleLink } from '@components/atoms/Heading'
import { AMENITIES, BED_TYPE } from '@constants/constant'
import { isArray, isEmpty, isNumber, uniqueId } from 'lodash'
import { useForm } from 'react-hook-form'
import { useSession } from 'next-auth/react'
import { toastError } from '@utils/notifications'
import { useRouter } from 'next/router'
import styled from '@emotion/styled'
import { primaryColor } from '@constants/styles'

interface Column {
  id: 'name' | 'price' | 'room' | 'number' | 'people'
  label: string
  width?: number
  align?: 'right' | 'left'
  format?: () => string
}

const columns: readonly Column[] = [
  { id: 'name', label: 'Loại chỗ nghỉ', width: 320 },
  {
    id: 'room',
    label: 'Tiện ích phòng',
    width: 250,
    align: 'left',
    // format: (value: number) => value,
  },
  {
    id: 'price',
    label: 'Giá phòng',
    width: 200,
    align: 'left',
    // format: (value: number) => value,
  },
  {
    id: 'number',
    label: 'Số lượng',
    width: 150,
    align: 'left',
    // format: (value: number) => value,
  },
]

interface rows {
  name: any
  price: string
  room: any
}

const CustomSelect = styled('select')`
  /* styling */
  background-color: white;
  border: thin solid blue;
  border-radius: 4px;
  display: inline-block;
  font: inherit;
  line-height: 1.5em;
  padding: 0.5em 3.5em 0.5em 1em;

  /* reset */

  margin: 0;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-appearance: none;
  -moz-appearance: none;

  background-image: linear-gradient(45deg, transparent 50%, gray 50%),
    linear-gradient(135deg, gray 50%, transparent 50%),
    linear-gradient(to right, #ccc, #ccc);
  background-position: calc(100% - 20px) calc(1em + 2px),
    calc(100% - 15px) calc(1em + 2px), calc(100% - 2.5em) 0.4em;
  background-size: 5px 5px, 5px 5px, 1px 1.5em;
  background-repeat: no-repeat;
  &:focus {
    outline: none;
    border-color: ${primaryColor};
    box-shadow: 0 0 0 2px rgba(${primaryColor}, 0.2);
    background-image: linear-gradient(45deg, green 50%, transparent 50%),
      linear-gradient(135deg, transparent 50%, green 50%),
      linear-gradient(to right, #ccc, #ccc);
    background-position: calc(100% - 15px) 1em, calc(100% - 20px) 1em,
      calc(100% - 2.5em) 0.5em;
    background-size: 5px 5px, 5px 5px, 1px 1.5em;
    background-repeat: no-repeat;
    border-color: green;
  }
`

const createData = (
  data: any,
  selectedItem: any,
  register: any,
  updateSelectedItem: () => void,
  setUpdate: (value: boolean) => void,
  setValue: (name: string, value: unknown, config?: Object) => void
) => {
  return {
    name: (
      <Box>
        <Typography fontSize={14} fontWeight='700'>
          {data.name}
        </Typography>
        <Box component='ul' sx={{ pl: 2, mt: 1 }}>
          <li>Mô tả: {data.description ?? ''}</li>
          <li>Loại chỗ ở: {data.accommodationType ?? ''}</li>
          <li>
            Diện tích 1 phòng từ: {data.area ?? 0}m<sup>2</sup>
          </li>
          <li>View: {data.view?.join(',')}</li>
          <li>
            Đánh giá: {data.ratingFeedback} - {data.quantityFeedBack} lượt đánh
            giá
          </li>
        </Box>
        <Typography fontSize={14} fontWeight='500' mt={1}>
          Phòng hút thuốc:{' '}
          <span>
            {data?.smoke ? (
              <i className='fas fa-smoking' />
            ) : (
              <i className='fas fa-smoking-ban' />
            )}
          </span>
        </Typography>
        {data.bedTypes &&
          data.bedTypes?.map((item: string) => {
            const result = BED_TYPE.find(
              (bedType: { [key: string]: any }) => bedType.code === item
            )
            return (
              <Typography
                fontSize={14}
                component='span'
                sx={{ display: 'block' }}
                key={uniqueId()}
              >
                <input
                  {...register(`bedInfo_${data.id}`, {
                    onChange: (event: React.ChangeEvent<HTMLInputElement>) => {
                      setValue(`bedInfo_${data.id}`, event.target.value)
                      setUpdate(true)
                    },
                  })}
                  type='radio'
                  id={`bedInfo_${data.id}_${result?.code}`}
                  // name={`bedInfo_${data.id}`}
                  value={`bedInfo_${data.id}_${result?.code}`}
                />
                <label htmlFor={`bedInfo_${data.id}_${result?.code}`}>
                  {result?.label}{' '}
                  {result?.icon?.map((item: string) => (
                    <i className={item} key={uniqueId()} />
                  ))}
                </label>
                <br></br>
              </Typography>
            )
          })}
        {data?.extraBed && (
          <Typography fontSize={14} fontWeight='500' mt={1}>
            Cho thêm giường
          </Typography>
        )}
      </Box>
    ),
    price: (
      <Box>
        <Typography fontSize={14} fontWeight='500'>
          Giá 1 đêm:{' '}
          {isNumber(Number(data.price) + Number(data?.vatFee))
            ? (Number(data.price) + Number(data?.vatFee))?.toLocaleString(
                'it-IT',
                {
                  style: 'currency',
                  currency: 'VND',
                }
              )
            : ''}
        </Typography>
        {/* <Typography fontSize={14} fontWeight='500' mt={1}>
          {data?.isPrePayment ? 'Thanh toán trước' : 'Thanh toán tại khách sạn'}
        </Typography> */}
      </Box>
    ),
    room: (
      <Box>
        <Typography component='p' fontSize={14} fontWeight='500' mt={1}>
          Số người tối đa:{' '}
          <Typography component='span' fontSize={14} fontWeight='400'>
            {Array.from(Array(Number(data?.quantityPersonFit || 0)).keys()).map(
              (item: number) => (
                <i className='fas fa-user-alt' key={uniqueId()} />
              )
            ) ?? 0}
          </Typography>
        </Typography>
        <Typography component='p' fontSize={14} fontWeight='500' mt={1}>
          Số phòng tắm:{' '}
          <Typography component='span' fontSize={14} fontWeight='400'>
            {data.bathRooms ?? 0}
          </Typography>
        </Typography>
        <Typography component='p' fontSize={14} fontWeight='500' mt={1}>
          Tiện ích phòng tắm:{' '}
          <Typography component='span' fontSize={14} fontWeight='400'>
            {data.bathRoomUtilities?.join(';')}
          </Typography>
        </Typography>
        <Typography fontSize={14} fontWeight='500' mt={1}>
          Tiện nghi phòng:
        </Typography>
        <Box component='ul' sx={{ pl: 2, my: 0 }}>
          {data.utilities?.map((item: string) => {
            const element = AMENITIES.find(
              (element: any) => element.code === item
            )
            return (
              <Typography
                component='li'
                sx={{ px: 1, fontSize: 14, mt: 0 }}
                key={item + uniqueId()}
              >
                {element?.label}{' '}
                <i className={element?.icon} style={{ padding: '5px' }} />
              </Typography>
            )
          })}
        </Box>
      </Box>
    ),
    number: (
      <CustomSelect
        id={`quantity_${data.id}`}
        {...register(`quantity_${data.id}`, {
          defaultValue: `quantity_${data.id}_0`,
        })}
        onChange={(event: React.ChangeEvent<HTMLInputElement>) => {
          setValue(`quantity_${data.id}`, event.target.value)
          setUpdate(true)
        }}
      >
        {Array.from(Array(data.quantityAvailable + 1).keys()).map(
          (item: number) => (
            <option value={`quantity_${data.id}_${item}`} key={uniqueId()}>
              {item}
            </option>
          )
        )}
      </CustomSelect>
    ),
  }
}

export default function TableRoom({ data, hostId }: any) {
  const [page, setPage] = React.useState(0)
  const [updated, setUpdated] = React.useState(true)
  const [rowsPerPage, setRowsPerPage] = React.useState(5)
  const [selectedItem, setSelectedItem] = React.useState({
    price: 0,
    number: 0,
  })

  const router = useRouter()

  const { data: session } = useSession()

  const {
    register,
    getValues,
    setValue,
    formState: { errors, isDirty },
  } = useForm()

  React.useEffect(() => {
    if (updated) {
      updateSelectedItem()
    }
  }, [updated])

  const updateSelectedItem = () => {
    const values = getValues()
    const newArr = []
    let number = 0
    let price = 0
    if (data?.length > 0) {
      for (let i = 0; i < data.length; i++) {
        const id = data[i].id
        const hostPrice = isNumber(
          Number(data[i].price) + Number(data[i].vatFee)
        )
          ? Number(data[i].price) + Number(data[i].vatFee)
          : 0
        const bedInfoId = `bedInfo_${id}`
        const quantityid = `quantity_${id}`

        if (
          values[bedInfoId] &&
          values[quantityid] &&
          values[quantityid] !== `${quantityid}_0`
        ) {
          newArr.push({
            accommodationId: id,
            quantity: values[quantityid]?.split('_')[2] || '',
            bedInfo: values[bedInfoId]?.split('_')[2] || '',
          })
          const currentQuantity = Number(values[quantityid]?.split('_')[2]) || 0
          price += currentQuantity * hostPrice
          number += currentQuantity
        }
      }
      setSelectedItem({ price: price, number: number })
      setUpdated(false)
    }
    return newArr
  }

  const rows = data?.map((item: any) =>
    createData(
      item,
      selectedItem,
      register,
      updateSelectedItem,
      setUpdated,
      setValue
    )
  )
  const onSubmit = () => {
    if (!session) {
      return
    }
    const values = updateSelectedItem()
    if (!values || values?.length <= 0) {
      return
    }
    router.push({
      pathname: '/order',
      query: {
        hostId: hostId,
        dateCheckin: router.query.DateCheckin,
        dateCheckout: router.query.DateCheckout,
        bookingDetails: JSON.stringify(values),
        price: selectedItem.price,
        number: selectedItem.number,
      },
    })
  }

  return (
    <Paper sx={{ width: '100%', overflow: 'hidden' }}>
      <Box component='form'>
        <TableContainer sx={{ maxHeight: '80vh' }}>
          <Table
            stickyHeader
            aria-label='sticky table'
            sx={{ position: 'relative' }}
          >
            <TableHead sx={{ position: 'relative' }}>
              <TableRow>
                {columns.map((column) => (
                  <TableCell
                    key={uniqueId()}
                    align={column.align}
                    style={{ width: column.width }}
                  >
                    {column.label}
                  </TableCell>
                ))}
                <TableCell
                  align={'center'}
                  style={{ minWidth: 200 }}
                ></TableCell>
              </TableRow>
            </TableHead>
            <TableBody sx={{ position: 'relative' }}>
              {rows
                ?.slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage)
                .map((row: any, rowIndex: number) => {
                  return (
                    <TableRow tabIndex={-1} key={uniqueId()}>
                      {columns.map((column: any, columnIndex) => {
                        const value = row[column.id]
                        return (
                          <>
                            <TableCell
                              key={uniqueId()}
                              align={column.align}
                              sx={{ verticalAlign: 'top' }}
                            >
                              {value}
                            </TableCell>
                            {columnIndex === columns.length - 1 &&
                              rowIndex === 0 && (
                                <TableCell
                                  width={250}
                                  rowSpan={rows.length}
                                  sx={{ verticalAlign: 'top' }}
                                >
                                  <Box
                                    mb={2}
                                    sx={{
                                      position: 'sticky',
                                      zindex: 1,
                                      top: 80,
                                      textAlign: 'center',
                                    }}
                                  >
                                    {selectedItem?.price > 0 && (
                                      <>
                                        <Typography
                                          sx={{ span: { fontWeight: 700 } }}
                                        >
                                          <span>{selectedItem.number}</span>{' '}
                                          phòng
                                        </Typography>
                                        <Typography
                                          sx={{ span: { fontWeight: 700 } }}
                                        >
                                          Tổng giá:{' '}
                                          <span>
                                            {selectedItem?.price?.toLocaleString(
                                              'it-IT',
                                              {
                                                style: 'currency',
                                                currency: 'VND',
                                              }
                                            )}
                                          </span>
                                        </Typography>
                                        <Typography fontSize={12} color='error'>
                                          <i>
                                            Đà bao gồm thuế và phí (10% VAT)
                                          </i>
                                        </Typography>
                                      </>
                                    )}

                                    <DefaultButton
                                      color='primary'
                                      sx={{ mt: 2 }}
                                      onClick={onSubmit}
                                    >
                                      <Tooltip
                                        key={uniqueId()}
                                        title={
                                          selectedItem.price > 0
                                            ? !session
                                              ? 'Vui lòng đăng nhập để đặt phòng'
                                              : ''
                                            : 'Vui lòng chọn số phòng'
                                        }
                                      >
                                        <span>Đặt phòng ngay</span>
                                      </Tooltip>
                                    </DefaultButton>

                                    <Box sx={{ textAlign: 'left' }}>
                                      <ul>
                                        <li>Chỉ mất có 2 phút</li>
                                        <li>Xác nhận tức thời</li>
                                        {/* <li>
                                          Không mất phí đặt phòng hay phí thẻ
                                          tín dụng!
                                        </li> */}
                                      </ul>
                                    </Box>
                                  </Box>
                                </TableCell>
                              )}
                          </>
                        )
                      })}
                    </TableRow>
                  )
                })}
            </TableBody>
          </Table>
        </TableContainer>
        {/* <TablePagination
          labelRowsPerPage={'Hiển thị:'}
          rowsPerPageOptions={[5, 10, 25]}
          component='div'
          count={rows?.length}
          rowsPerPage={rowsPerPage}
          page={page}
          onPageChange={handleChangePage}
          onRowsPerPageChange={handleChangeRowsPerPage}
        /> */}
      </Box>
    </Paper>
  )
}
