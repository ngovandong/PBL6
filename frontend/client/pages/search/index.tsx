import { NextPage, NextPageContext } from 'next'
import Head from 'next/head'
import SearchTemplate from '@components/templates/search'

const SearchPage: NextPage = (props: any) => {

  return (
    <div>
      <Head>
        <title>Ready Booking | Tìm kiếm</title>
        <meta name='description' content='Ready Booking' />
      </Head>
      <SearchTemplate />
    </div>
  )
}

SearchPage.getInitialProps = async (context: NextPageContext) => {
  return { props: {} }
}

export default SearchPage
