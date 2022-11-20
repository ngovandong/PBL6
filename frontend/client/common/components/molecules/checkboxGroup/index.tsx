import { useState } from 'react'
import { Box, Checkbox, FormControlLabel } from '@mui/material'
import { primaryColor } from '@constants/styles'
import { IFilter } from '@utils/types'

const CheckBoxGroup = ({ options }: { options: IFilter[] }) => {
  const [checked, setChecked] = useState([true, false])

  const children = (
    <Box sx={{ display: 'flex', flexDirection: 'column', ml: 2 }}>
      {options.length > 0 &&
        options.map((item: IFilter) => (
          <FormControlLabel
            label={item.label}
            control={
              <Checkbox
                id={item.value}
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
