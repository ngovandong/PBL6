import type { NextPage } from 'next'
import Head from 'next/head'

import DefaultLayout from '@components/layout/DefaultLayout'

import styles from '@styles/Home.module.scss'
import MainFilter from '@components/molecules/filter/MainFilter'
import { Box, Button, Grid, Slide, Typography } from '@mui/material'
import SliderCards from '@components/molecules/silder'
import CardContainer from '@components/molecules/card'
import { Title } from '@components/atoms/Heading'

const Home: NextPage = () => {
  return (
    <div className={styles.container}>
      <Head>
        <title>Travel World</title>
        <meta name='description' content='Travel World' />
        <link rel='icon' href='/favicon.ico' />
      </Head>
      <DefaultLayout>
        <Box sx={{ margin: 'auto', padding: '50px 0' }}>
          <Title
            title='TÌM KHÁCH SẠN, KHU NGHỈ DƯỠNG VÀ HƠN THẾ NỮA'
            align='center'
          />
          <MainFilter />
        </Box>
        <Box
          sx={{ margin: 'auto', maxWidth: '1200px', marginBottom: '32px' }}
          className='content'
        >
          <Title
            title='Khám phá những điểm đến thu hút nhất Việt Nam'
            align='center'
          />
          <SliderCards />
        </Box>
        <Box
          sx={{ margin: 'auto', maxWidth: '1200px', marginBottom: '40px' }}
          className='content'
        >
          <Title
            title='Khám phá những chỗ nghỉ nổi bật khuyến nghị cho bạn'
            align='center'
          />
          <CardContainer />
        </Box>
        <Box
          sx={{ margin: 'auto', maxWidth: '1200px', marginBottom: '20px' }}
          className='content'
        >
          <Typography
            align='center'
            fontSize='28px'
            fontWeight='700'
            marginBottom='32px'
          >
            Khuyến mãi, giảm giá và ưu đãi đặc biệt dành riêng cho bạn
          </Typography>
          <SliderCards />
        </Box>
      </DefaultLayout>
    </div>
  )
}

export default Home
