import { NextPageContext } from 'next'
import { getSession } from 'next-auth/react'
import { Box } from '@mui/material'

const OrderManagementPage = () => {
  return <Box></Box>
}

OrderManagementPage.getInitialProps = async (context: NextPageContext) => {
  const { query, asPath, req, res } = context
  const session = await getSession()
  const data = []
  try {
  } catch (error) {}

  return {
    searchQuery: query || {},
    user: session?.user || {},
    data: [],
  }
}

export default OrderManagementPage
