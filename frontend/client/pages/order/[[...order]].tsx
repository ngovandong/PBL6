import { NextPageContext } from 'next'
import { getSession } from 'next-auth/react'
import Head from 'next/head'
import { ParsedUrlQuery } from 'querystring'

// import OrderTemplate from '@components/templates/order'
import dynamic from 'next/dynamic'
import { useRouter } from 'next/router'
import { useEffect, useState } from 'react'
import { CircularProgress } from '@mui/material'
import { Box } from '@mui/system'
import { CircleLoading } from '@components/atoms/Loading'

const OrderTemplate = dynamic(
  () =>
    import('../../common/components/templates/order-management/order-create'),
  {
    ssr: false,
    loading: () => {
      return <CircleLoading />
    },
  }
)

export default function OrderPage({
  searchQuery,
  user,
}: {
  searchQuery: ParsedUrlQuery
  user: any
}) {
  const router = useRouter()
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    if (!searchQuery?.hostId || !searchQuery?.bookingDetails) {
      router.back()
    } else {
      setLoading(false)
    }
  }, [])

  if (loading) return <CircleLoading />

  return (
    <div>
      <Head>
        <title>{`Ready Booking | Đặt phòng`}</title>
        <meta name='description' content='Ready Booking' />
      </Head>
      {searchQuery?.bookingDetails && (
        <OrderTemplate
          searchQuery={{
            ...searchQuery,
            bookingDetails: JSON.parse(searchQuery?.bookingDetails as any),
          }}
          user={user}
        />
      )}
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
