import * as React from 'react';
import Paper from '@mui/material/Paper';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TablePagination from '@mui/material/TablePagination';
import TableRow from '@mui/material/TableRow';
import { MenuItem, Select, Typography } from '@mui/material';
import { DefaultButton } from '@components/atoms/Button/DefaultButton';
import { Box } from '@mui/system';
import { TitleLink } from '@components/atoms/Heading';
import { AMENITIES, BED_TYPE } from '@constants/constant';
import { uniqueId } from 'lodash';

interface Column {
  id: 'name' | 'price' | 'room' | 'number';
  label: string;
  minWidth?: number;
  align?: 'right' | 'left';
  format?: () => string;
}

const columns: readonly Column[] = [
  { id: 'name', label: 'Loại chỗ nghỉ', minWidth: 150 },
  {
    id: 'price',
    label: 'Giá phòng',
    minWidth: 100,
    align: 'left',
    // format: (value: number) => value,
  },
  {
    id: 'room',
    label: 'Tiện ích phòng',
    minWidth: 150,
    align: 'left',
    // format: (value: number) => value,
  },
  {
    id: 'number',
    label: 'Số lượng',
    minWidth: 150,
    align: 'left',
    // format: (value: number) => value,
  },
];

interface rows {
  name: any;
  price: string;
  room: any;
}

const createData = (data: any, selectedItem: any, updateSelectedItem: (id: string, number: number, price: number) => void) => {
  console.log(data)
  return {
    name: (<Box>
        <Typography fontSize={14} fontWeight='700'>{data.name}</Typography>
        <Box component='ul' sx={{pl: 2, mt: 1}}>
          <li>Mô tả: {data.description ?? ''}</li>
          <li>Loại chỗ ở: {data.accommodationType ?? ''}</li>
          <li>Diện tích 1 phòng từ: {data.area ?? 0}m<sup>2</sup></li>
          <li>View: {data.view?.join(',')}</li>
          <li>Đánh giá: {data.ratingFeedback} - {data.quantityFeedBack} lượt đánh giá</li>
        </Box>
        <Typography fontSize={14} fontWeight='500' mt={1}>Phòng hút thuốc: <span>{data?.smoke ? <i className="fas fa-smoking"/>: <i className="fas fa-smoking-ban"/>}</span></Typography>
        {data.bedTypes && data.bedTypes?.map((item: string) => {
          const result = BED_TYPE.find((bedType: {[key: string]: any}) => bedType.code === item)
          return (<Typography fontSize={14} component='span' sx={{display: 'block'}} key={uniqueId()}>{result?.label} {
            result?.icon?.map((item: string) => <i className={item} key={uniqueId()}/>)
          }</Typography>)
        })}
        {data?.extraBed && <Typography fontSize={14} fontWeight='500' mt={1}>Cho thêm giường</Typography>}
      </Box>),
    price: (<Box>
      <Typography fontSize={14} fontWeight='500'>Giá 1 đêm: {data.price?.toLocaleString('it-IT', {style : 'currency', currency : 'VND'})}</Typography>
      <Typography fontSize={14} fontWeight='500' mt={1}>{data?.isPrePayment ? 'Thanh toán trước' : 'Thanh toán tại khách sạn'}</Typography>
    </Box>),
    room: <Box>
      
      <Typography component='p' fontSize={14} fontWeight='500' mt={1}>Số phòng tắm: <Typography component='span'fontSize={14} fontWeight='400' >{data.bathRooms ?? 0}</Typography></Typography>
      <Typography component='p' fontSize={14} fontWeight='500' mt={1}>Tiện ích phòng tắm: <Typography component='span'fontSize={14} fontWeight='400' >{data.bathRoomUtilities?.join(';')}</Typography></Typography>
      <Typography fontSize={14} fontWeight='500' mt={1}>Tiện nghi phòng:</Typography>
      <Box component='ul' sx={{pl: 2, my: 0}}>
        {data.utilities?.map((item: string) => {
          const element = AMENITIES.find((element: any) => element.code === item)
          return (
            <Typography component='li' sx={{ px: 1, fontSize: 14, mt: 0}} key={item + uniqueId()}>
              {element?.label} <i className={element?.icon} style={{ padding: '5px' }} />
            </Typography>
          )
        })}
      </Box>
    </Box>,
    number: <Select defaultValue={0} disabled={selectedItem?.number && data?.id !== selectedItem?.idRoom} onChange={(event) => { const number = Number(event.target.value) || 0 ; updateSelectedItem(data.id, number, number * data.price)}}>
      {
        Array.from(Array(data.quantityAvailable + 1).keys()).map((item: number) => <MenuItem value={item} key={uniqueId()}>{item}</MenuItem>)
      }
    </Select>
  }
}

export default function TableRoom({data}: any) {
  const [page, setPage] = React.useState(0);
  const [rowsPerPage, setRowsPerPage] = React.useState(10);
  const [selectedItem, setSelectedItem] = React.useState({number: 0, idRoom: '', price: 0})

  const handleChangePage = (event: unknown, newPage: number) => {
    setPage(newPage);
  };

  const handleChangeRowsPerPage = (event: React.ChangeEvent<HTMLInputElement>) => {
    setRowsPerPage(+event.target.value);
    setPage(0);
  };

  const updateSelectedItem = (id: string, number: number, price: number) => {
    setSelectedItem({number: number, idRoom: id, price: price})
  }

  const rows = data?.map((item: any) => createData(item, selectedItem, updateSelectedItem));

  return (
    <Paper sx={{ width: '100%', overflow: 'hidden' }}>
      <TableContainer sx={{ maxHeight: 440 }}>
        <Table stickyHeader aria-label="sticky table" sx={{position: 'relative'}}>
          <TableHead sx={{position: 'relative'}}>
            <TableRow>
              {columns.map((column) => (
                <TableCell
                  key={column.id}
                  align={column.align}
                  style={{ minWidth: column.minWidth }}
                >
                  {column.label}
                </TableCell>
              ))}
               <TableCell
                  align={'center'}
                  style={{ minWidth: 200 }}
                >        
                </TableCell>
            </TableRow>
          </TableHead>
          <TableBody sx={{position: 'relative'}} >
            {rows
              ?.slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage)
              .map((row: any, rowIndex: number) => {
                return (
                  <TableRow hover role="checkbox" tabIndex={-1} key={row.code}>
                    {columns.map((column, columnIndex) => {
                      const value = row[column.id];
                      return (
                        <>
                          <TableCell key={column.id} align={column.align} sx={{verticalAlign: 'top'}}>
                              {value}
                          </TableCell>
                          {columnIndex === columns.length - 1 &&  rowIndex === 0 && (
                            <TableCell
                              align={'left'}
                              rowSpan={rows.length}
                              sx={{verticalAlign: 'top'}}
                            >
                              {
                                selectedItem.number != 0 ? (
                                  <Box mb={2} sx={{position: 'sticky',  zindex: 100, top: 80, textAlign: 'center'}} >
                                    <Typography>{selectedItem.number} phòng</Typography>
                                    <Typography>{selectedItem.price.toLocaleString('it-IT', {style : 'currency', currency : 'VND'})}</Typography>
                                    <Typography>Đã bao gồm thuế và phí</Typography>
                                    <DefaultButton color="primary" sx={{mt: 2}}>Đặt phòng</DefaultButton>
                                  </Box>
                                ) : <>
                                <DefaultButton color="primary" sx={{mt: 2}}>Vui lòng </DefaultButton>
                                  <ul><li>Chỉ mất có 2 phút</li>
                                <li>Xác nhận tức thời</li>
                                <li>Không mất phí đặt phòng hay phí thẻ tín dụng!</li></ul>
                                </>
                              }
                            </TableCell>
                          )}
                        </>);
                    })}
                    
                  </TableRow>
                );
              })}
          </TableBody>
        </Table>
      </TableContainer>
      <TablePagination
        rowsPerPageOptions={[10, 25, 100]}
        component="div"
        count={rows?.length}
        rowsPerPage={rowsPerPage}
        page={page}
        onPageChange={handleChangePage}
        onRowsPerPageChange={handleChangeRowsPerPage}
      />
    </Paper>
  );
}
