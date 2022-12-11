import { useEffect, useState } from 'react'
import { NextPage, NextPageContext } from 'next'
import { getSession, useSession } from 'next-auth/react'
import dynamic from 'next/dynamic'
import { Box } from '@mui/system'
import { IUserProfile } from '@utils/types'

const ProfileTemplate = dynamic(
  () => import('../common/components/templates/profile'),
  { ssr: false }
)

const ProfilePage = ({ profile }: { profile: IUserProfile }) => {
  const [user, setUser] = useState<IUserProfile>(profile)

  const { data: session } = useSession()

  useEffect(() => {
    if (session?.user) setUser(session?.user as IUserProfile)
  }, [session])

  return (
    <Box>
      <ProfileTemplate
        profile={user}
        havePassword={profile.havePassword as boolean}
      />
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
