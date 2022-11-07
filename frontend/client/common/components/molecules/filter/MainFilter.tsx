import { useState} from 'react'
import { useForm, Controller, SubmitHandler } from 'react-hook-form'

import { Box, Button, Input, styled } from '@mui/material';
import { DateRangePickerComponent } from '@syncfusion/ej2-react-calendars';
import TextField from '@mui/material/TextField';
import ShareLocationOutlinedIcon from '@mui/icons-material/ShareLocationOutlined';

import { borderRadius, boxShadow, secondaryColor } from '@constants/styles'
import DropdownForm from '@components/atoms/DropdownForm';
interface IFormInputs {
  address: string
  startDate: any
  endDate: any
}

const MainFilter = () => {
  const { handleSubmit, control, register } = useForm<IFormInputs>({
    defaultValues: {
      address: '',
    },
  })

  const minDate = new Date(new Date().getFullYear(), new Date().getMonth(), 7);
  const maxDate = new Date(new Date().getFullYear(), new Date().getMonth(), 27);
  const dateValue = new Date(new Date().setDate(14));

  return (
    <Box
      sx={{
        maxWidth: 1300,
        borderRadius: borderRadius,
        background: secondaryColor,
        // boxShadow: boxShadow,
        margin: 'auto',
      }}
    >
      <form>
        <Box sx={{ display: 'flex', alignItems: 'center' }}>
          <TextField id="address" placeholder='Nhập tên khách sạn hoặc địa điểm' 
            autoComplete='false'
            sx={{
              "& fieldset": { border: 'none' },
              flexGrow: 1,
              // minWidth: 320
            }}
            
            InputProps={{
              startAdornment: <ShareLocationOutlinedIcon sx={{ color: 'action.active', mr: 1, my: 0.5 , width: 32, height: 32 }} />, // <== adjusted this
              disableUnderline: true, // <== added this
            }}/>
          <Box>
            <DateRangePickerComponent id="daterangepicker" placeholder='Select a range' width="250px"/>
          </Box>
          <DropdownForm />
        </Box>
      </form>
    </Box>
  )
}

export default MainFilter
