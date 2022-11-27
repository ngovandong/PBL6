import ProfileTemplate from '@components/templates/profile'
import { Box } from '@mui/system'
import { IUserProfile } from '@utils/types'
import { NextPage, NextPageContext } from 'next'
import { getSession, useSession } from 'next-auth/react'

const ProfilePage = ({ profile }: { profile: IUserProfile }) => {
  return (
    <Box>
      <ProfileTemplate profile={profile} />
    </Box>
  )
}

ProfilePage.getInitialProps = async (context: NextPageContext) => {
  const session = await getSession(context)
  return {
    profile: session?.user || {},
  }
}

export default ProfilePage
