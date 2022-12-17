import { NextPageContext } from 'next'
import { getSession } from 'next-auth/react'
import { Box } from '@mui/material'
import { OrderManagementTemplate } from '@components/templates/order-management'
import { orderApi } from '@utils/api'
import Head from 'next/head'

const OrderManagementPage = (props: any) => {
  return (
    <div>
      <Head>
        <title>Ready Booking | Danh sách đặt phòng</title>
        <meta name='description' content='Ready Booking' />
      </Head>
      <OrderManagementTemplate userId={props.user?.id || ''} />
    </div>
  )
}

OrderManagementPage.getInitialProps = async (context: NextPageContext) => {
  const { query, asPath, req, res } = context
  const session: any = await getSession(context)

  return {
    searchQuery: query || {},
    user: session?.user || {},
  }
}

export default OrderManagementPage
