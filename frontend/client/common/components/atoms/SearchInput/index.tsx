import * as React from 'react'

import { Autocomplete, Input } from '@mui/material'

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

  return (
    <Autocomplete
      disableClearable
      options={top100Films.map((option) => option.title)}
      onChange={(event, value) => props.onChange(value)}
      selectOnFocus
      clearOnBlur
      handleHomeEndKeys
      sx={{ padding: '6px 0' }}
      renderInput={(params) => (
        <div ref={params.InputProps.ref}>
          <Input
            sx={{ mx: 2 }}
            type='text'
            value={value}
            placeholder={props.placeholder}
            inputProps={{ ...params.inputProps }}
            ref={props.inputRef}
            disableUnderline
          />
        </div>
      )}
    />
  )
})

export default SearchInput
