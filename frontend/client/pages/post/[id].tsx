import PostDetailTemplate from '@components/templates/post'
import { searchApi } from '@utils/api'
import { NextPageContext } from 'next'

const PostDetail = (props: any) => {
  return <PostDetailTemplate data={props.data} />
}

PostDetail.getInitialProps = async (context: NextPageContext) => {
  const id = context.query.id
  let data = {}
  if (id) {
    try {
      data = (await searchApi.getDetailHotel({ Id: id })).data
    } catch (error) {
      console.log(error)
    }
  }
  return {
    data: data,
  }
}

export default PostDetail
