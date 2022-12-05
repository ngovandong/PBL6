import { NextPage, NextPageContext } from 'next'
import Head from 'next/head'
import SearchTemplate from '@components/templates/search'
import { searchApi } from '@utils/api'
import { isEmpty } from 'lodash'
import { useRouter } from 'next/router'
import { useEffect } from 'react'

const SearchPage: NextPage = (props: any) => {
  const router = useRouter()
  console.log('update', props.data)

  return (
    <div>
      <Head>
        <title>Ready Booking | Tìm kiếm</title>
        <meta name='description' content='Ready Booking' />
      </Head>
      <SearchTemplate data={props?.data?.hostSearches}/>
    </div>
  )
}

SearchPage.getInitialProps = async (context) => {
  const {
    query,
    asPath,
    req,
    res,
} = context;
  let data = {}
  if(!isEmpty(query)) {
    data = await searchApi.searchHotel( query)
    .then((res) => res.data)
    .catch((error) => {
      console.log(error)
      return {}
    })
  }
  
  return { 
    searchQuery: query || {}, 
    data: data
 }
}

export default SearchPage
