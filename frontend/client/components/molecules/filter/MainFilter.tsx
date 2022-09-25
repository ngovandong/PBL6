import { useForm, Controller, SubmitHandler } from 'react-hook-form'
import { Box, Button } from '@mui/material'
import SearchInput from '@components/atoms/SearchInput'
import RangePicker, { IRangePickerRef } from '@components/atoms/RangePicker'
import { useRef } from 'react'

interface IFormInputs {
  address: string
  startDate: any
  endDate: any
}

const MainFilter = () => {
  const { handleSubmit, control, register } = useForm<IFormInputs>({
    defaultValues: {
      address: '',
    },
  })

  const dateRef = useRef<IRangePickerRef>(null)

  const onSubmit: SubmitHandler<IFormInputs> = (data: any) => {
    console.log(data, dateRef.current?.startDate)
  }

  return (
    <Box
      sx={{
        maxWidth: 1200,
        borderRadius: '16px',
        background: '#f8f7f9',
        boxShadow: 'rgb(0 0 0 / 20%) 0px 2px 8px 3px;',
        margin: 'auto',
        padding: '32px',
        display: 'flex',
      }}
    >
      <form onSubmit={handleSubmit(onSubmit)} autoComplete='off'>
        <Controller
          name='address'
          control={control}
          render={({ field }) => (
            <SearchInput
              inputRef={field.ref}
              placeholder='Nhập thành phố, địa điểm hoặc tên khách sạn'
              {...field}
              sx={{
                minWidth: 400,
                flex: 2,
                height: 50,
              }}
            />
          )}
        />
      </form>
      <RangePicker ref={dateRef} />
      <Button
        variant='contained'
        sx={{
          width: 120,
          height: 50,
        }}
      >
        Tìm kiếm
      </Button>
    </Box>
  )
}

export default MainFilter
