import * as React from 'react'
import Box from '@mui/material/Box'
import Slider from '@mui/material/Slider'
import { activeLinkColor, primaryColor } from '@constants/styles'

function valuetext(value: number) {
  return `${value}°C`
}

export default function RangeSlider(props: any) {
  const [value, setValue] = React.useState<number[]>([0, 6000000])

  const handleChange = (event: Event, newValue: number | number[]) => {
    setValue(newValue as number[])
    props.onChange(event, newValue)
  }

  return (
    <Box sx={{ width: '100%', px: 2, mt: 5 }}>
      <Slider
        sx={{ 
          color: `${activeLinkColor}`,
          '& .MuiSlider-thumb': {
            height: 24,
            width: 24,
            backgroundColor: '#fff',
            border: '2px solid currentColor',
            '&:focus, &:hover, &.Mui-active, &.Mui-focusVisible': {
              boxShadow: 'inherit',
            },
            '&:before': {
              display: 'none',
            },
          },
          '& .MuiSlider-rail': {
            color: '#bfbfbf',
            opacity:  1,
            height: 3,
          }
        }}
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
