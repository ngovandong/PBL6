import Grid from '@mui/material/Grid'
import { CardItem } from 'common/components/atoms/Card'

const dump = {
  src: 'https://images.unsplash.com/photo-1633073985249-b2d67bdf6b7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80',
  title: 'Căn hộ dịch vụ NTA (NTA Serviced Apartments)',
}

const CardContainer = () => {
  return (
    <Grid container spacing={3} width='100%' margin='auto'>
      <CardItem src={dump.src} title={dump.title} />
      <CardItem src={dump.src} title={dump.title} />
      <CardItem src={dump.src} title={dump.title} />
      <CardItem src={dump.src} title={dump.title} />
      <CardItem src={dump.src} title={dump.title} />
      <CardItem src={dump.src} title={dump.title} />
    </Grid>
  )
}

export default CardContainer
