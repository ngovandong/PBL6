import * as React from 'react';
import Paper from '@mui/material/Paper';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TablePagination from '@mui/material/TablePagination';
import TableRow from '@mui/material/TableRow';
import { Typography } from '@mui/material';
import { DefaultButton } from '@components/atoms/Button/DefaultButton';
import { Box } from '@mui/system';
import { TitleLink } from '@components/atoms/Heading';

interface Column {
  id: 'name' | 'price' | 'room' | 'size' | 'density';
  label: string;
  minWidth?: number;
  align?: 'right';
  format?: () => string;
}

const columns: readonly Column[] = [
  { id: 'name', label: 'Loại chỗ nghỉ', minWidth: 170 },
  {
    id: 'price',
    label: 'Giá phòng',
    minWidth: 170,
    align: 'right',
    // format: (value: number) => value,
  },
  {
    id: 'room',
    label: 'Tiện ích phòng',
    minWidth: 170,
    align: 'right',
    // format: (value: number) => value,
  },
];

interface rows {
  name: any;
  price: string;
  room: any;
}

const createData = (data: any) => {
  console.log(data)
  return {
    name: (<Box>
        <Typography fontSize={14} fontWeight='700'>{data.name}</Typography>
        <Box component='ul'>
          <li>Mô tả: {data.description ?? ''}</li>
          <li>Loại: {data.accommodationType ?? ''}</li>
        </Box>
      </Box>),
    price: data.price,
    room: <></>
  }
}

export default function TableRoom({data}: any) {
  const [page, setPage] = React.useState(0);
  const [rowsPerPage, setRowsPerPage] = React.useState(5);

  const handleChangePage = (event: unknown, newPage: number) => {
    setPage(newPage);
  };

  const handleChangeRowsPerPage = (event: React.ChangeEvent<HTMLInputElement>) => {
    setRowsPerPage(+event.target.value);
    setPage(0);
  };

  const rows = data?.map((item: any) => createData(item));

  return (
    <Paper sx={{ width: '100%', overflow: 'hidden' }}>
      <TableContainer sx={{ maxHeight: 440 }}>
        <Table stickyHeader aria-label="sticky table">
          <TableHead>
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
                  ABC
                </TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {rows
              ?.slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage)
              .map((row: any, rowIndex: number) => {
                return (
                  <TableRow hover role="checkbox" tabIndex={-1} key={row.code}>
                    {columns.map((column, columnIndex) => {
                      const value = row[column.id];
                      return (
                        <>
                          <TableCell key={column.id} align={column.align}>
                              {column.format && typeof value === 'number'
                                ? column.format(value)
                                : value}
                          </TableCell>
                          {columnIndex === columns.length - 1 &&  rowIndex === 0 && (
                            <TableCell
                              align={'center'}
                              rowSpan={rows.length} 
                            >
                              <Box mb={2}>
                                <Typography>1 phòng</Typography>
                                <Typography>VND 342.000</Typography>
                                <Typography>Đã bao gồm thuế và phí</Typography>
                                <DefaultButton color="primary" sx={{mt: 2}}>Đặt phòng</DefaultButton>
                              </Box>
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
