import React, { useState, useRef, useImperativeHandle, useEffect } from 'react'
import { Box, TextField } from '@mui/material'
import { DateRangePicker } from 'react-dates'
import { MomentInput } from 'moment'
import moment from 'moment'
import 'moment/locale/vi'

// export interface IRangePickerProps {}

export interface IRangePickerRef {
  startDate: MomentInput
  endDate: MomentInput
}

const RangePicker = React.forwardRef<any, IRangePickerRef>((props, ref) => {
  const [date, setDate] = useState({
    startDate: moment(),
    endDate: moment().add(1, 'days'),
  })
  const [focusedDate, setFocusDate] = useState(null)
  const inputRef = useRef<any>(null)

  useEffect(() => {
    moment.locale('vi')
  }, [])

  useImperativeHandle(ref, () => ({
    startDate: inputRef.current.props.startDate,
    endDate: inputRef.current.props.endDate,
  }))
  return (
    <Box>
      <DateRangePicker
        ref={inputRef}
        startDateId='startDate'
        endDateId='endDate'
        startDate={date.startDate}
        endDate={date.endDate}
        onDatesChange={(value: any) => {
          setDate({ startDate: value.startDate, endDate: value.endDate })
          console.log(inputRef.current)
        }}
        focusedInput={focusedDate}
        onFocusChange={(focusedInput: any) => {
          setFocusDate(focusedInput)
        }}
        startDatePlaceholderText='Nhận phòng'
        endDatePlaceholderText='Trả phòng'
      />
    </Box>
  )
})

export default RangePicker
