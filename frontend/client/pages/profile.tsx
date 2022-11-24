import ProfileTemplate from '@components/templates/profile'
import { LOCAL_STORAGE } from '@constants/constant'
import { Box } from '@mui/system'
import { userApi } from '@utils/api'
import { IUserProfile } from '@utils/types'
import { NextPage, NextPageContext } from 'next'
import { getSession, useSession } from 'next-auth/react'

const ProfilePage = ({ profile }: { profile: IUserProfile }) => {
  return (
    <Box>
      <ProfileTemplate />
    </Box>
  )
}

ProfilePage.getInitialProps = async (context: NextPageContext) => {
  let user = {}
  const session = await getSession(context)
  const userId = session?.user?.id || null
  if (userId) {
    userApi
      .getUserInfor(userId)
      .then((res: any) => {
        user = res.data
      })
      .catch((err) => {
        console.log(err)
      })
  }
  return {
    profile: session?.user,
  }
}

export default ProfilePage
