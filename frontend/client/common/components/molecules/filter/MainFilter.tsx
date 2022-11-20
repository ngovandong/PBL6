import { useForm, Controller, SubmitHandler } from 'react-hook-form'
import React, { useRef } from 'react'

import moment from 'moment'
import 'moment/locale/vi'

import { Box, Button } from '@mui/material'
import DropdownForm from 'common/components/atoms/DropdownForm'
import SearchInput from 'common/components/atoms/SearchInput'
import RangePicker from 'common/components/atoms/RangePicker'

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
        borderRadius: '16px',
        // background: '#f8f7f9',
        // boxShadow: 'rgb(0 0 0 / 20%) 0px 2px 8px 3px;',
        // margin: 'auto',
        display: 'flex',
        flex: 1,
        maxWidth: 600,
      }}
    >
      <form
        onSubmit={handleSubmit(onSubmit)}
        autoComplete='off'
        style={{
          display: 'flex',
          placeContent: 'center',
          placeItems: 'center',
          rowGap: '12px',
        }}
      >
        <Controller
          name='address'
          control={control}
          render={({ field }) => (
            <SearchInput
              inputRef={field.ref}
              placeholder='Nhập địa điểm hoặc tên khách sạn'
              {...field}
              sx={{ width: 100 }}
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
        <Button
          variant='contained'
          sx={{
            width: 120,
          }}
          type='submit'
        >
          Tìm kiếm
        </Button>
      </form>
    </Box>
  )
}
