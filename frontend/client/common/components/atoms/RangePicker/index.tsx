import {
  useState,
  useRef,
  useImperativeHandle,
  useEffect,
  forwardRef,
  PointerEventHandler,
} from 'react'
import { Box, TextField } from '@mui/material'
import { MomentInput } from 'moment'
import 'moment/locale/vi'
import { DateRangePickerComponent } from '@syncfusion/ej2-react-calendars'
import { loadCldr, L10n } from '@syncfusion/ej2-base'
import * as gregorian from 'cldr-data/main/vi/ca-gregorian.json'
import * as numbers from 'cldr-data/main/vi/numbers.json'
import * as timeZoneNames from 'cldr-data/main/vi/timeZoneNames.json'
import * as numberingSystems from 'cldr-data/supplemental/numberingSystems.json'
import * as weekData from 'cldr-data/supplemental/weekData.json' //
loadCldr(numberingSystems, gregorian, numbers, timeZoneNames, weekData)
// export interface IRangePickerProps {}

export interface IRangePickerRef {
  startDate: MomentInput
  endDate: MomentInput
}

L10n.load({
  vi: {
    daterangepicker: {
      applyText: 'Áp dụng',
      cancelText: 'Bỏ chọn',
      customRange: 'Tùy chỉnh ngày bắt đầu và ngày kết thúc',
      days: 'ngày',
      endLabel: 'Ngày kết thúc',
      placeholder: 'Chọn ngày',
      selectedDays: 'Số ngày đã chọn',
      startLabel: 'Ngày bắt đầu',
    },
  },
})

const RangePicker = forwardRef<any, any>((props, ref) => {
  return (
    <Box sx={{ mx: 1 }}>
      <DateRangePickerComponent
        width={220}
        format='dd/MM/yyyy'
        id='daterangepicker'
        placeholder='Chọn ngày'
        startDate={props.value[0] || null}
        endDate={props.value[1] || null}
        min={new Date()}
        showClearButton={false}
        locale='vi'
        onChange={(event: any) => {
          if (event?.value) {
            props.onChange(event?.value)
          }
        }}
      />
    </Box>
  )
})

export default RangePicker
