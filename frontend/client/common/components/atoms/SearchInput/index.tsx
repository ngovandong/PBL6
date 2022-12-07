/* eslint-disable react/display-name */
import React, { startTransition, useImperativeHandle } from 'react'
import { Autocomplete, Input, Popper, PopperProps } from '@mui/material'
import { searchApi } from '@utils/api'
import { debounce, isEmpty } from 'lodash'
import { IAddress } from '@utils/types'

const SearchInput = React.forwardRef<{ defaultValue: any }, any>(
  (props: any, ref) => {
    const [value, setValue] = React.useState<IAddress | null>(null)
    const [textSearch, setTextSearch] = React.useState<string>('Hà')
    const [options, setOptions] = React.useState<IAddress[]>([])

    useImperativeHandle(ref, () => ({
      defaultValue: !isEmpty(options) ? options[0] : {},
    }))

    React.useEffect(() => {
      setOptions([])
      searchApi
        .getAddress({ textSearch: textSearch })
        .then((res) => {
          setOptions(res.data)
        })
        .catch((error) => {
          console.log(error.data)
        })
    }, [textSearch])

    React.useEffect(() => {
      searchApi
        .getAddress({ textSearch: props.textSearch })
        .then((res) => {
          if (res.data[0]) setValue(res.data[0])
        })
        .catch((error) => {
          console.log(error.data)
        })
    }, [])

    return (
      <Autocomplete
        componentsProps={{
          paper: {
            sx: {
              width: 200,
              mt: 2,
              borderRadius: 2,
              filter: 'drop-shadow(0px 2px 8px rgba(0,0,0,0.32))',
            },
          },
        }}
        filterSelectedOptions={false}
        value={value as any}
        options={options}
        onChange={(_, newValue) => {
          props.onChange(newValue)
          setValue(newValue)
        }}
        getOptionLabel={(option: IAddress) => option.placeName}
        renderOption={(props, option) => (
          <li {...props} id={option.id}>
            {option.placeName}
          </li>
        )}
        filterOptions={(options) => options}
        loadingText='Đang tải...'
        disableClearable
        handleHomeEndKeys
        loading={true}
        selectOnFocus
        renderInput={(params) => (
          <div ref={params.InputProps.ref}>
            <Input
              type='text'
              placeholder={props.placeholder}
              inputProps={{ ...params.inputProps }}
              disableUnderline
              sx={props.sx}
              onChange={(event) => {
                startTransition(() => setTextSearch(event.currentTarget.value))
              }}
            />
          </div>
        )}
      />
    )
  }
)

export default SearchInput
