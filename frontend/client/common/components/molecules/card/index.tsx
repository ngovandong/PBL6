import { CardItem } from 'common/components/atoms/Card'
import { Paper, Typography } from '@mui/material'
import Grid from '@mui/material/Grid'
import { Box, styled, width } from '@mui/system'
import Image from 'next/image'
import Link from 'next/link'
import { DefaultButton } from '@components/atoms/Button/DefaultButton'

const dump = {
  src: 'https://images.unsplash.com/photo-1633073985249-b2d67bdf6b7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80',
  title: 'Căn hộ dịch vụ NTA (NTA Serviced Apartments)',
}

const ButtonWrapper = styled('div')(() => ({
  width: 'fit-content',
  margin: '20px auto',
}))

const CardContainer = () => {
  return (
    <Box display='flex' flexDirection='column'>
      <Grid container spacing={3} width='100%' margin='auto'>
        <CardItem src={dump.src} title={dump.title} />
        <CardItem src={dump.src} title={dump.title} />
        <CardItem src={dump.src} title={dump.title} />
        <CardItem src={dump.src} title={dump.title} />
        <CardItem src={dump.src} title={dump.title} />
        <CardItem src={dump.src} title={dump.title} />
      </Grid>
      <ButtonWrapper>
        <DefaultButton>Xem thêm</DefaultButton>
      </ButtonWrapper>
    </Box>
  )
}

export default CardContainer
