/* eslint-disable react/display-name */
import React, {
  useImperativeHandle,
} from 'react'
import { Autocomplete, Input, Popper, PopperProps } from '@mui/material'
import { searchApi } from '@utils/api'
import { debounce, isEmpty } from 'lodash'
import { IAddress } from '@utils/types'

const SearchInput = React.forwardRef<{ defaultValue: any }, any>(
  (props: any, ref) => {
    const [value, setValue] = React.useState<IAddress | null>(null)
    const [textSearch, setTextSearch] = React.useState<string>(props.textSearch)
    const [options, setOptions] = React.useState<IAddress[]>([])

    useImperativeHandle(ref, () => ({
      defaultValue: !isEmpty(options) ? options[0] : {},
    }))

    // React.useEffect(
    //   debounce(() => {
    //     searchApi
    //       .getAddress({ textSearch: textSearch })
    //       .then((res) => {
    //         setOptions(res.data)
    //       })
    //       .catch((error) => {
    //         console.log(error.data)
    //       })
    //   }, 700),
    //   [textSearch]
    // )

    React.useEffect(() => {
      console.log(textSearch)
      searchApi
        .getAddress({ textSearch: textSearch})
        .then((res) => {
          setOptions(res.data)
          if (res.data[0]) setValue(res.data[0])
        })
        .catch((error) => {
          console.log(error.data)
        })
    }, [textSearch])

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
        value={value as any}
        // inputValue={value?.placeName}
        options={options}
        // onChange={(_, newValue) => {
        //   setValue(newValue)
        // }}
        getOptionLabel={(option: IAddress) => option.placeName}
        renderOption={(props, option) => (
          <li {...props} id={option.id}>
            {option.placeName}
          </li>
        )}
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
                setOptions([])
                setTextSearch(event.currentTarget.value)
              }}
            />
          </div>
        )}
      />
    )
  }
)

export default SearchInput
