import { NextPageContext } from 'next'
import { getSession } from 'next-auth/react'
import { IUserProfile } from '@utils/types'
import { useContext, useEffect, useState } from 'react'
import { userApi } from '@utils/api'
import { MainContext } from 'common/context'
import { CardItem } from '@components/atoms/Card'
import { isArray } from 'lodash'
import { Divider, Grid } from '@mui/material'
import Head from 'next/head'
import { TitlePost } from '@components/atoms/Heading'
import { Box } from '@mui/system'

const FavoritePage = ({ profile }: { profile: IUserProfile }) => {
  const { state } = useContext(MainContext)
  const [favoriteHosts, setFavoriteHosts] = useState<any>([])

  useEffect(() => {
    setFavoriteHosts(state.favoriteHosts)
  }, [state.favoriteHosts])

  return (
    <>
      <Head>
        <title>{`Ready Booking | Danh sách đã lưu`}</title>
        <meta name='description' content='Ready Booking' />
      </Head>
      <TitlePost pl={1}>Danh sách chỗ nghỉ đã lưu</TitlePost>
      <Divider sx={{ my: 1, px: 2 }} />
      <Grid
        container
        rowSpacing={2}
        columnSpacing={1}
        width='100%'
        margin='auto'
      >
        {isArray(favoriteHosts) ? (
          favoriteHosts?.map((hotel) => (
            <CardItem
              id={hotel.hostId}
              src={hotel.avatarImage ?? '/images/no-image-available.png'}
              title={hotel.hostName}
              key={hotel.hostId}
              province={hotel.province}
              ratingStar={hotel.ratingStar}
              country={hotel.country}
              hostType={hotel.hostType}
              ratingFeedback={hotel.ratingFeedBack}
              priceStandard={hotel.priceStandard}
              favoritedId={hotel.id}
              favorited
            />
          ))
        ) : (
          <Box pl={1}>Danh sách trống.</Box>
        )}
      </Grid>
    </>
  )
}

FavoritePage.getInitialProps = async (context: NextPageContext) => {
  const session: any = await getSession(context)
  const favoriteHosts = new Promise((resolve) => {
    userApi
      .getFavoriteHosts(session?.user?.id)
      .then((response) => {
        resolve(response.data ?? [])
      })
      .catch((error) => {
        console.log(error)
        resolve([])
      })
  })
  return {
    profile: session?.user || {},
  }
}

export default FavoritePage
