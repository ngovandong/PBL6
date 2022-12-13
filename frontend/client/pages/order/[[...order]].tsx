import { NextPageContext } from 'next'
import { getSession } from 'next-auth/react'
import Head from 'next/head'
import { ParsedUrlQuery } from 'querystring'

// import OrderTemplate from '@components/templates/order'
import dynamic from 'next/dynamic'

const OrderTemplate = dynamic(
  () => import('../../common/components/templates/order'),
  { ssr: false }
)


export default function OrderPage({
  searchQuery,
  user,
}: {
  searchQuery: ParsedUrlQuery
  user: any
}) {
  return (
    <div>
      <Head>
        <title>{`Ready Booking | Đặt phòng`}</title>
        <meta name='description' content='Ready Booking' />
      </Head>
      <OrderTemplate
        searchQuery={{
          ...searchQuery,
          bookingDetails: JSON.parse(searchQuery?.bookingDetails as any),
        }}
        user={user}
      />
    </div>
  )
}

OrderPage.getInitialProps = async (context: NextPageContext) => {
  const { query, asPath, req, res } = context
  const session = await getSession()
  return {
    searchQuery: query || {},
    user: session?.user || {},
  }
}
