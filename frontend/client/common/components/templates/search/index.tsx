import { CardSearch } from '@components/atoms/Card'
import { LeftFilter } from '@components/molecules/filter'
import { Box, Divider, Grid, Typography } from '@mui/material'
import { userApi } from '@utils/api'
import { MainContext, updateFavoriteHost } from 'common/context'
import { isArray } from 'lodash'
import { useSession } from 'next-auth/react'
import { useContext, useEffect, useState } from 'react'

const SearchTemplate = (props: any) => {
  const [data, setData] = useState([])
  const { state, setState } = useContext(MainContext)
  const [favorites, setFavorites] = useState<any[]>([])
  const { data: session }: any = useSession()

  useEffect(() => {
    let filteredData: any = []
    props?.data?.map((item: any) => {
      if (item.accommodationSearches) filteredData.push(item)
    })
    setData(filteredData)
  }, [props?.data])

  const handleFavoriteHost = async (id: string, favoritedId: any) => {
    if (session) {
      try {
        if (!favoritedId) {
          await userApi.postFavoriteHost({
            userId: session?.user?.id,
            hostId: id,
          })
        } else {
          await userApi.deleteFavoriteHost(favoritedId)
        }
        const newArr = await updateFavoriteHost(session?.user?.id as string)
        setState({
          ...state,
          favoriteHosts: newArr,
        })
        setFavorites(newArr)
      } catch (error) {}
    }
  }

  return (
    <Box>
      <Box>
        <Typography variant='body1'>
          Tìm thấy {data?.length || 0} kết quả phù hợp
        </Typography>
        <Divider sx={{ mt: 1 }} />
      </Box>
      <Grid container>
        <Grid item sm={4}>
          <LeftFilter />
        </Grid>
        <Grid item sm={8}>
          {data?.map((item: any) => (
            <CardSearch
              data={item}
              key={item.id}
              favorited={favorites?.some((t) => t.hostId === item.id)}
              favoritedId={
                isArray(favorites)
                  ? favorites.find((i: any) => i.hostId === item.id)?.id
                  : null
              }
              handleFavoriteHost={handleFavoriteHost}
            />
          ))}
        </Grid>
      </Grid>
    </Box>
  )
}

export default SearchTemplate
