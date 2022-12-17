import { NextPageContext } from 'next'
import { getSession } from 'next-auth/react'
import { Box } from '@mui/material'
import { OrderManagementTemplate } from '@components/templates/order-management'
import { orderApi } from '@utils/api'

const OrderManagementPage = (props: any) => {
  return <OrderManagementTemplate userId={props.user?.id || ''} />
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
