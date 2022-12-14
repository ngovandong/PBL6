import { CardSearch } from '@components/atoms/Card'
import { LeftFilter } from '@components/molecules/filter'
import { Box, Divider, Grid, Typography } from '@mui/material'
import { useEffect, useState } from 'react'

const SearchTemplate = (props: any) => {
  const [data, setData] = useState([])

  useEffect(() => {
    let filteredData: any = []
    props?.data?.map((item: any) => {
      if (item.accommodationSearches) filteredData.push(item)
    })
    setData(filteredData)
  }, [props?.data])

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
        {data?.map(
          (item: any) =>
            item?.accommodationSearches && (
              <Grid item sm={8} key={item.id}>
                <CardSearch data={item} />
              </Grid>
            )
        )}
      </Grid>
    </Box>
  )
}

export default SearchTemplate
