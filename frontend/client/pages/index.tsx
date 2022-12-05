import type { NextPage, NextPageContext } from 'next'
import Head from 'next/head'

import styles from 'public/styles/Home.module.scss'
import HomeTemplate from '@components/templates/home'
import { getSession } from 'next-auth/react'
import { searchHotelProvince } from '@utils/api/search'
import { provinces } from '@constants/data'

const Home: NextPage = (props: any) => {
  return (
    <div className={styles.container}>
      <Head>
        <title>Travel World</title>
        <meta name='description' content='Travel World' />
        <link rel='icon' href='/favicon.ico' />
      </Head>
      <HomeTemplate hotels={props.hotels} province={props.province} />
    </div>
  )
}

Home.getInitialProps = async (context: NextPageContext) => {
  const hotels = await searchHotelProvince({ province: 'Đà Nẵng' })
    .then((res) => {
      return res.data
    })
    .catch((error) => {
      console.log(error)
      return []
    })
  return {
    hotels: hotels,
    province: 'Đà Nẵng',
  }
}

export default Home
