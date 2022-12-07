import ChipItem from '@components/atoms/Chip/ChipItem'
import { provinces } from '@constants/data'
import { Stack } from '@mui/material'
import React, {
  MouseEventHandler,
  useEffect,
  useImperativeHandle,
  useState,
} from 'react'

const ChipContainer = React.forwardRef<
  { selectedProvince: string },
  { province: string; updateHotels?: () => void }
>((props, ref) => {
  const [selectedItem, setSelectedItem] = useState<string>(props.province)
  const onFilter = (id: string) => {
    setSelectedItem(id)
  }

  useImperativeHandle(ref, () => ({
    selectedProvince: selectedItem,
  }))

  useEffect(() => {
    props.updateHotels && props.updateHotels()
  }, [selectedItem])

  return (
    <Stack
      display='flex'
      direction='row'
      alignItems='center'
      justifyContent='center'
      spacing={2}
      mt={2}
      mb={1}
    >
      {provinces.map((item) => (
        <ChipItem
          label={item.name}
          key={`${item.id}-list-chip`}
          variant={selectedItem !== item.id ? 'outlined' : 'filled'}
          onClick={(event: any) => onFilter(item.id)}
        />
      ))}
    </Stack>
  )
})

export default ChipContainer
