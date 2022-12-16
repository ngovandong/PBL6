import { primaryColor } from '@constants/styles'
import { Tabs, Box, Tab } from '@mui/material'
import { useState } from 'react'

const OrderManagement = () => {
  const [value, setValue] = useState('one')

  const handleChange = (event: React.SyntheticEvent, newValue: string) => {
    setValue(newValue)
  }

  return (
    <Box>
      <Box sx={{ width: '100%' }}>
        <Tabs
          value={value}
          onChange={handleChange}
          textColor='inherit'
          sx={{
            '& .MuiTabs-indicator': {
              backgroundColor: primaryColor,
            },
          }}
          aria-label='secondary tabs example'
        >
          <Tab value='one' label='Chỗ nghỉ vừa đặt' />
          <Tab value='two' label='Chỗ nghỉ đã đặt' />
          <Tab value='three' label='Chỗ nghỉ đã hủy' />
        </Tabs>
      </Box>
    </Box>
  )
}

export default OrderManagement
