import type { NextPage } from 'next'
import Head from 'next/head'

import DefaultLayout from '@components/layout/DefaultLayout'

import styles from '@styles/Home.module.scss'
import MainFilter from '@components/molecules/filter/MainFilter'

const Home: NextPage = () => {
  return (
    <div className={styles.container}>
      <Head>
        <title>Travel World</title>
        <meta name='description' content='Travel World' />
        <link rel='icon' href='/favicon.ico' />
      </Head>
      <DefaultLayout>
        <MainFilter />
      </DefaultLayout>
    </div>
  )
}

export default Home
