import Grid from '@mui/material/Grid'
import { ICardItem } from '@utils/types'
import { CardItem } from 'common/components/atoms/Card'

const CardContainer = (props: {
  hotels: ICardItem[] | null
  province: string
}) => {
  return (
    <Grid container rowSpacing={2} columnSpacing={1} width='100%' margin='auto'>
      {props.hotels?.map((hotel: ICardItem) => (
        <CardItem
          id={hotel.id}
          src={hotel.avatarImage ?? '/images/no-image-available.png'}
          title={hotel.name}
          key={hotel.id}
          province={props.province}
          ratingStar={hotel.ratingStar}
          country={hotel.country}
          hostType={hotel.hostType}
          ratingFeedback={hotel.ratingFeedBack}
          priceStandard={hotel.priceStandard}
        />
      ))}
    </Grid>
  )
}

export default CardContainer
