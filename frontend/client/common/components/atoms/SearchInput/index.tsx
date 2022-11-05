import * as React from 'react'

import { Box, Input, InputAdornment, InputProps } from '@mui/material'
import SearchIcon from '@mui/icons-material/Search'

const SearchInput = React.forwardRef((props: InputProps, ref) => {
  return (
    <Input
      {...props}
      autoComplete='off'
      disableUnderline
      startAdornment={
        <InputAdornment position='start'>
          <SearchIcon />
        </InputAdornment>
      }
      sx={{
        ...props.sx,
        p: 1,
        border: '2px solid #dddfe2',
        borderRadius: '10px',
        backgroundColor: '#ffffff',
      }}
    />
  )
})

export default SearchInput
