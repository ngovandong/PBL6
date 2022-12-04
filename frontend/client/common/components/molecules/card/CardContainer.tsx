import Grid from '@mui/material/Grid'
import { ICardItem } from '@utils/types'
import { CardItem } from 'common/components/atoms/Card'

const CardContainer = (props: { hotels: ICardItem[] | null }) => {
  return (
    <Grid container rowSpacing={2} columnSpacing={1} width='100%' margin='auto'>
      {props.hotels?.map((hotel: ICardItem) => (
        <CardItem src={hotel.avatarImage} title={hotel.name} />
      ))}
    </Grid>
  )
}

export default CardContainer
