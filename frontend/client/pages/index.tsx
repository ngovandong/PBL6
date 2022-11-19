import type { NextPage } from 'next'
import Head from 'next/head'

import styles from 'public/styles/Home.module.scss'
import HomeTemplate from '@components/templates/home'
import { useContext } from 'react'
import { MainContext } from 'common/context'

const Home: NextPage = () => {
  return (
    <div className={styles.container}>
      <Head>
        <title>Travel World</title>
        <meta name='description' content='Travel World' />
        <link rel='icon' href='/favicon.ico' />
      </Head>
      <HomeTemplate />
    </div>
  )
}

export default Home
