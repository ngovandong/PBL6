import { useRouter, withRouter } from 'next/router'
import { useForm, Controller, SubmitHandler } from 'react-hook-form'
import React, { useEffect, useRef, useState } from 'react'

import moment from 'moment'
import 'moment/locale/vi'

import { Box, IconButton, Popover, Popper, Typography } from '@mui/material'
import SearchIcon from '@mui/icons-material/Search'
import DropdownForm from 'common/components/atoms/DropdownForm'
import SearchInput from 'common/components/atoms/SearchInput'
import RangePicker from 'common/components/atoms/RangePicker'

import { borderRadiusLarge, primaryColor } from '@constants/styles'
import { IAddress, ISearchForm } from '@utils/types'
import { ParsedUrlQuery } from 'querystring'

interface IFormInputs {
  address: IAddress
  time: any
  number: any
}

export default function MainFilter({
  searchQuery,
}: {
  searchQuery: ParsedUrlQuery
}) {
  const router = useRouter()
  const searchAdressRef = useRef<{
    defaultValue: any
    setDefaultValue: (value: IAddress | null) => void
    ref: any
  }>(null)
  const [query, setQuery] = useState<ParsedUrlQuery>()

  useEffect(() => {
    setQuery(router?.query)
  }, [router])

  const { handleSubmit, control, register } = useForm<IFormInputs>({
    defaultValues: {
      address: {},
      time: [
        new Date(
          (searchQuery?.DateCheckin as string) || moment().toISOString()
        ),
        new Date(
          (searchQuery?.DateCheckout as string) ||
            moment().add(1, 'days').toISOString()
        ),
      ],
      number: [Number(searchQuery?.QuantityPerson) || 1, 1],
    },
  })

  const [anchorEl, setAnchorEl] = React.useState<null | HTMLElement>(null)

  const handleClick = (event?: React.MouseEvent<HTMLElement>) => {
    setAnchorEl(anchorEl ? null : searchAdressRef?.current?.ref || null)
  }

  const open = Boolean(anchorEl)
  const id = open ? 'simple-popper' : undefined

  const onSubmit: SubmitHandler<IFormInputs> = (data: IFormInputs) => {
    const form = {
      SearchText:
        data.address.placeName ?? searchQuery?.SearchText?.toString() ?? '',
      SearchType: data.address.placeType || 'location',
      DateCheckin: data.time[0]?.toISOString().split('T')[0] || '',
      DateCheckout: data.time[1]?.toISOString().split('T')[0] || '',
      QuantityPerson: data.number[0] || 1,
      PlaceId: data.address.placeId ?? searchQuery?.placeId?.toString(),
    }

    if (!form.SearchText) {
      handleClick()
      return
    }

    if (router.pathname.includes('search')) {
      router.query = form
      router.push(router)
    } else {
      router.push(
        '/search/[[...query]]',
        {
          pathname: '/search',
          query: { ...form },
        },
        { shallow: true }
      )
    }
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
              placeholder='Địa điểm, chỗ nghỉ...'
              {...field}
              sx={{ width: 150, ml: 1 }}
              ref={searchAdressRef}
              textSearch={searchQuery.SearchText || ''}
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
      <Popover
        id={id}
        open={open}
        anchorEl={anchorEl}
        onClose={() => setAnchorEl(null)}
        anchorOrigin={{
          vertical: 'bottom',
          horizontal: 'left',
        }}
        style={{ top: '12px' }}
      >
        <Typography
          sx={{ p: 1, bgcolor: '#c82333', color: '#fff', fontSize: 12 }}
        >
          Vui lòng nhập điểm đến để bắt đầu tìm kiếm.
        </Typography>
      </Popover>
    </Box>
  )
}
