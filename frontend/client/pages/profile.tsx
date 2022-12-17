import { Suspense, useEffect, useState } from 'react'
import { NextPage, NextPageContext } from 'next'
import { getSession, useSession } from 'next-auth/react'
import Head from 'next/head'
import dynamic from 'next/dynamic'
import { Box } from '@mui/system'
import { IUserProfile } from '@utils/types'
import { CircleLoading } from '@components/atoms/Loading'

const ProfileTemplate = dynamic(
  () => import('../common/components/templates/profile'),
  {
    ssr: false,
    loading: () => {
      return <CircleLoading />
    },
  }
)

const ProfilePage = ({ profile }: { profile: IUserProfile }) => {
  const [user, setUser] = useState<IUserProfile>(profile)
  const { data: session } = useSession()

  useEffect(() => {
    if (session?.user) {
      setUser(session?.user as IUserProfile)
    }
  }, [session])

  return (
    <Suspense fallback={<CircleLoading />}>
      <Box>
        <Head>
          <title>{`Ready Booking | Thông tin cá nhân`}</title>
          <meta name='description' content='Ready Booking' />
        </Head>
        <ProfileTemplate
          profile={user}
          havePassword={profile.havePassword as boolean}
        />
      </Box>
    </Suspense>
  )
}

ProfilePage.getInitialProps = async (context: NextPageContext) => {
  const session = await getSession(context)
  return {
    profile: session?.user || {},
  }
}

export default ProfilePage
