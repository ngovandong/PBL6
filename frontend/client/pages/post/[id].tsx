import PostDetailTemplate from '@components/templates/post'
import { searchApi } from '@utils/api'
import { isEmpty } from 'lodash'
import { NextPageContext } from 'next'

const PostDetail = (props: any) => {
  console.log(props.data)

  return <PostDetailTemplate data={props.data} />
}

PostDetail.getInitialProps = async (context: NextPageContext) => {
  const id = context.query.id
  
  let data = {}

  const body = { Id: id , DateCheckin: context.query?.DateCheckin || '', DateCheckout: context.query?.DateCheckout || '', QuantityPerson: context.query?.QuantityPerson || 1}

  if (id) {
    try {
      data = (await searchApi.getDetailHotel(body)).data
    } catch (error) {
      console.log(error)
    }
  }

  if (isEmpty(data)) {
    context.res?.writeHead(302, {Location: '/'})
    context.res?.end()
  }

  return {
    data: data,
  }
}

export default PostDetail
