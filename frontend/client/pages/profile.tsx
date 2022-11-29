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
  const { data: session } = useSession()

  const [user, setUser] = useState<IUserProfile>(profile)

  useEffect(() => {
    if (session?.user) {
      setUser(session.user as any)
    }
  }, [session?.user])

  return (
    <Box>
      <ProfileTemplate profile={user} />
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
