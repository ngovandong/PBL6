import type { NextPage } from 'next'
import Head from 'next/head'

import DefaultLayout from '@components/templates/layout/DefaultLayout'

import styles from 'public/styles/Home.module.scss'
import HomeTemplate from '@components/templates/home'

const Home: NextPage = () => {
  return (
    <div className={styles.container}>
      <Head>
        <title>Travel World</title>
        <meta name='description' content='Travel World' />
        <link rel='icon' href='/favicon.ico' />
      </Head>
      <DefaultLayout>
        <HomeTemplate />
      </DefaultLayout>
    </div>
  )
}

export default Home
