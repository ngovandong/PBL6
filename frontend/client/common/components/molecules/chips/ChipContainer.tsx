import ChipItem from '@components/atoms/Chip/ChipItem'
import { Stack } from '@mui/material'
import { MouseEventHandler, useState } from 'react'

const dump = [
  {
    name: 'Hà Nội',
    id: 'Hà Nội',
  },
  {
    name: 'TP Hồ Chí Minh',
    id: 'TP Hồ Chí Minh',
  },
  {
    name: 'Đà Nẵng',
    id: 'Đà Nẵng',
  },
  {
    name: 'Hội An',
    id: 'Hội An',
  },
]

const ChipContainer = () => {
  const [selectedItem, setSelectedItem] = useState<string>('Hà Nội')
  const onFilter = (id: string) => {
    setSelectedItem(id)
  }

  return (
    <Stack
      display='flex'
      direction='row'
      alignItems='center'
      justifyContent='center'
      spacing={2}
      mt={1}
    >
      {dump.map((item) => (
        <ChipItem
          label={item.name}
          key={`${item.id}-list-chip`}
          variant={selectedItem !== item.id ? 'outlined' : 'filled'}
          onClick={(event: any) => onFilter(item.id)}
        />
      ))}
    </Stack>
  )
}

export default ChipContainer
