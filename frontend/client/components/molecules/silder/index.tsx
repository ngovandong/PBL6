import { cities } from '@constants/city'
import Carousel from 'react-material-ui-carousel'
import { Box, Grid } from '@mui/material'
import { CardCarousel } from '@components/atoms/Card'

const SliderCards = (props: any) => {
  const totalItems = props.length ? props.length : 6
  const content = []
  const num = cities.length / totalItems
  for (let i = 0; i < num + 1; i++) {
    const item = []
    for (let j = i; j <= i + totalItems - 1; j++) {
      item.push(
        <CardCarousel
          size={200}
          key={cities[j]?.src}
          src={cities[j]?.src}
          title={cities[j]?.title}
          description={cities[j]?.description}
        />
      )
    }
    const Content = (
      <Grid
        container
        direction='row'
        alignItems='center'
        justifyContent='space-evenly'
        wrap='nowrap'
        spacing={3}
      >
        {item.map((item: any) => item)}
      </Grid>
    )
    content.push(Content)
  }

  return <Carousel>{content.map((item: any) => item)}</Carousel>
}

export default SliderCards
