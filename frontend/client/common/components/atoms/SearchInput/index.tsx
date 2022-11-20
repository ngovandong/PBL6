import * as React from 'react'

import { Autocomplete, Input, Popper, PopperProps } from '@mui/material'

interface FilmOptionType {
  inputValue?: string
  title: string
  year?: number
}

const top100Films: readonly FilmOptionType[] = [
  { title: 'The Shawshank Redemption', year: 1994 },
  { title: 'The Godfather', year: 1972 },
  { title: 'The Godfather: Part II', year: 1974 },
  { title: 'The Dark Knight', year: 2008 },
  { title: '12 Angry Men', year: 1957 },
  { title: "Schindler's List", year: 1993 },
  { title: 'Pulp Fiction', year: 1994 },
  {
    title: 'The Lord of the Rings: The Return of the King',
    year: 2003,
  },
]

const SearchInput = React.forwardRef((props: any, ref) => {
  const [value, setValue] = React.useState<string | null>(null)

  // const CustomPopper = function (props: PopperProps) {
  //   return (
  //     <Popper
  //       {...props}
  //       style={{
  //         width: 300,
  //       }}
  //       placement='bottom-start'
  //     />
  //   )
  // }

  return (
    <Autocomplete
      disableClearable
      componentsProps={{
        paper: {
          sx: {
            width: 300,
            mt: 2,
            borderRadius: 2,
            filter: 'drop-shadow(0px 2px 8px rgba(0,0,0,0.32))',
          },
        },
      }}
      options={top100Films.map((option) => option.title)}
      onChange={(event, value) => props.onChange(value)}
      selectOnFocus
      clearOnBlur
      handleHomeEndKeys
      // PopperComponent={CustomPopper}
      renderInput={(params) => (
        <div ref={params.InputProps.ref}>
          <Input
            type='text'
            value={value}
            placeholder={props.placeholder}
            inputProps={{ ...params.inputProps }}
            ref={props.inputRef}
            disableUnderline
            sx={props.sx}
          />
        </div>
      )}
    />
  )
})

export default SearchInput
