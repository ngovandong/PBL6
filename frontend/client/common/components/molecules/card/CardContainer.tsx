import Grid from '@mui/material/Grid'
import { ICardItem } from '@utils/types'
import { CardItem } from 'common/components/atoms/Card'
import { MainContext } from 'common/context'
import { isArray } from 'lodash'
import { useContext } from 'react'

const CardContainer = (props: {
  hotels: ICardItem[] | null
  province: string
}) => {
  const { state } = useContext(MainContext)

  const idFavorites =
    (isArray(state.favoriteHosts) &&
      state.favoriteHosts.map((item) => item.hostId)) ||
    []

  return (
    <Grid container rowSpacing={2} columnSpacing={1} width='100%' margin='auto'>
      {isArray(props.hotels) &&
        props.hotels?.map((hotel: ICardItem) => (
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
            favorited={idFavorites.includes(hotel.id)}
            favoritedId={
              isArray(state.favoriteHosts)
                ? state.favoriteHosts.find(
                    (item: any) => item.hostId === hotel.id
                  )?.id
                : ''
            }
          />
        ))}
    </Grid>
  )
}

export default CardContainer
