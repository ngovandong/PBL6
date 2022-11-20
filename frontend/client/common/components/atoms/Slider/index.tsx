import * as React from 'react'
import Box from '@mui/material/Box'
import Slider from '@mui/material/Slider'

function valuetext(value: number) {
  return `${value}°C`
}

export default function RangeSlider() {
  const [value, setValue] = React.useState<number[]>([0, 6000000])

  const handleChange = (event: Event, newValue: number | number[]) => {
    setValue(newValue as number[])
  }

  return (
    <Box sx={{ width: '100%', px: 2, mt: 5 }}>
      <Slider
        getAriaLabel={() => 'Temperature range'}
        value={value}
        onChange={handleChange}
        valueLabelDisplay='on'
        min={100000}
        max={6000000}
        step={10000}
        getAriaValueText={valuetext}
      />
    </Box>
  )
}
