import { useState } from 'react'
import { Box, Checkbox, FormControlLabel, FormGroup } from '@mui/material'
import { primaryColor } from '@constants/styles'
import { IFilter } from '@utils/types'

const CheckBoxGroup = ({ options, ...props }: { options: IFilter[] }) => {

  const children = (
    <Box sx={{ display: 'flex', flexDirection: 'column', ml: 2 }}>
        {options.length > 0 &&
          options.map((item: IFilter) => (
            <FormControlLabel
              key={item.value}
              label={item.label}
              control={
                <Checkbox
                  name={item.value}
                  sx={{
                    '&.Mui-checked': {
                      color: primaryColor,
                    },
                  }}
                />
              }
            />
          ))}
    </Box>
  )
  return <div>{children}</div>
}
export default CheckBoxGroup
