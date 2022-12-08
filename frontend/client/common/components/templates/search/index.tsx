import { CardSearch } from '@components/atoms/Card'
import { LeftFilter } from '@components/molecules/filter'
import { Box, Divider, Grid, Typography } from '@mui/material'

const SearchTemplate = (props: any) => {
  return (
    <Box>
      <Box>
        <Typography variant='body1'>
          Tìm thấy {props.total || 0} kết quả phù hợp
        </Typography>
        <Divider sx={{ mt: 1 }} />
      </Box>
      <Grid container>
        <Grid item sm={4}>
          <LeftFilter />
        </Grid>
        {props.data?.map((item: any) => (
          <Grid item sm={8} key={item.id}>
            <CardSearch data={item} />
          </Grid>
        ))}
      </Grid>
    </Box>
  )
}

export default SearchTemplate
