import { CardSearch } from '@components/atoms/Card'
import { LeftFilter } from '@components/molecules/filter'
import { Box, Divider, Grid, Typography } from '@mui/material'

const SearchTemplate = (props: any) => {
  return (
    <Box>
      <Box>
        <Typography variant='body1'>Tìm thấy 700 kết quả phù hợp</Typography>
        <Divider sx={{ mt: 1 }} />
      </Box>
      <Grid container>
        <Grid item sm={4}>
          <LeftFilter />
        </Grid>
        <Grid item sm={8}>
          <CardSearch />
          <CardSearch />
          <CardSearch />
        </Grid>
      </Grid>
    </Box>
  )
}

export default SearchTemplate
