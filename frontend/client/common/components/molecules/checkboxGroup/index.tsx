import { primaryColor } from '@constants/styles'
import { Box, Checkbox, FormControlLabel } from '@mui/material'
import { useState } from 'react'

const CheckBoxGroup = () => {
  const [checked, setChecked] = useState([true, false])

  const children = (
    <Box sx={{ display: 'flex', flexDirection: 'column', ml: 2 }}>
      <FormControlLabel
        label='1 sao'
        control={
          <Checkbox
            checked={checked[0]}
            sx={{
              '&.Mui-checked': {
                color: primaryColor,
              },
            }}
          />
        }
      />
    </Box>
  )
  return <div>{children}</div>
}
export default CheckBoxGroup
