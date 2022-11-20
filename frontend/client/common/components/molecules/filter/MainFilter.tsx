import { useForm, Controller, SubmitHandler } from 'react-hook-form'
import React, { useRef } from 'react'

import moment from 'moment'
import 'moment/locale/vi'

import { Box, IconButton } from '@mui/material'
import SearchIcon from '@mui/icons-material/Search'
import DropdownForm from 'common/components/atoms/DropdownForm'
import SearchInput from 'common/components/atoms/SearchInput'
import RangePicker from 'common/components/atoms/RangePicker'

import { borderRadiusLarge, primaryColor } from '@constants/styles'

interface IFormInputs {
  address: string
  time: any
  number: any
}

export default function MainFilter() {
  const { handleSubmit, control, register } = useForm<IFormInputs>({
    defaultValues: {
      address: '',
      time: [
        new Date(moment().toISOString()),
        new Date(moment().add(1, 'days').toISOString()),
      ],
      number: [1, 1],
    },
  })

  const onSubmit: SubmitHandler<IFormInputs> = (data: any) => {
    console.log(data)
  }

  return (
    <Box
      sx={{
        borderRadius: borderRadiusLarge,
        // background: '#f8f7f9',
        border: `1px solid ${primaryColor}`,
        // boxShadow: 'rgb(0 0 0 / 20%) 0px 2px 8px 3px;',
        // margin: 'auto',
        display: 'flex',
        flex: 1,
        maxWidth: 'fit-content',
        px: 1,
      }}
    >
      <form
        onSubmit={handleSubmit(onSubmit)}
        autoComplete='off'
        style={{
          display: 'flex',
          placeContent: 'center',
          placeItems: 'center',
          padding: 0,
          height: 44,
        }}
      >
        <Controller
          name='address'
          control={control}
          render={({ field }) => (
            <SearchInput
              inputRef={field.ref}
              placeholder='Địa điểm, tên khách sạn...'
              {...field}
              sx={{ width: 200, ml: 1 }}
            />
          )}
        />
        <Controller
          name='time'
          control={control}
          render={({ field }) => <RangePicker {...field} />}
        />
        <Controller
          name='number'
          control={control}
          render={({ field }) => <DropdownForm {...field} />}
        />
        <IconButton
          aria-label='search'
          type='submit'
          sx={{ backgroundColor: '#f4f4f4', p: '6px' }}
        >
          <SearchIcon />
        </IconButton>
      </form>
    </Box>
  )
}
