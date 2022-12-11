import Grid from '@mui/material/Grid'
import { userApi } from '@utils/api'
import { ICardItem } from '@utils/types'
import { CardItem } from 'common/components/atoms/Card'
import { useSession } from 'next-auth/react'
import { useEffect, useState } from 'react'

const CardContainer = (props: {
  hotels: ICardItem[] | null
  province: string
}) => {
  const { data: session }: any = useSession()
  const [favoritedHosts, setFavoritedHosts] = useState([])

  const getFavoriteHost = () => {
    if (session?.user) {
      userApi
        .getFavoritedHosts(session.user.id)
        .then((res) => {
          console.log(session.user.id)
          setFavoritedHosts(res.data)
        })
        .catch((err) => {})
    }
  }

  useEffect(() => {
    getFavoriteHost()
  }, [session?.user])

  return (
    <Grid container rowSpacing={2} columnSpacing={1} width='100%' margin='auto'>
      {props.hotels?.map((hotel: ICardItem) => (
        <CardItem
          id={hotel.id}
          src={hotel.avatarImage}
          title={hotel.name}
          key={hotel.id}
          province={props.province}
          ratingStar={hotel.ratingStar}
          country={hotel.country}
          hostType={hotel.hostType}
          ratingFeedback={hotel.ratingFeedBack}
          priceStandard={hotel.priceStandard}
          favorited={true}
          userId={session?.user.id}
        />
      ))}
    </Grid>
  )
}

export default CardContainer
