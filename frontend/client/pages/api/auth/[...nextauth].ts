import NextAuth from 'next-auth'
import GoogleProvider from 'next-auth/providers/google'
import CreadentialProvider from 'next-auth/providers/credentials'
import axios from 'axios'
import https from 'https'

export default NextAuth({
  providers: [
    GoogleProvider({
      clientId: process.env.GOOGLE_CLIENT_ID || '',
      clientSecret: process.env.GOOGLE_CLIENT_SECRET || '',
      authorization: {
        params: {
          prompt: 'consent',
          access_type: 'offline',
          response_type: 'code',
        },
      },
      idToken: true,
    }),
    CreadentialProvider({
      type: 'credentials',
      credentials: {
        email: { label: 'Email', type: 'email' },
        password: { label: 'Password', type: 'password' },
      },
      async authorize(credentials, req) {
        const { email, password } = credentials as {
          email: string
          password: string
        }
        try {
          const user = await axios.post(
            `${process.env.NEXT_PUBLIC_API_URL}/auth/login-with-email`,
            {
              email: email,
              password: password,
            },
            {
              httpsAgent: new https.Agent({
                rejectUnauthorized: false,
              }),
            }
          )
          return user.data
        } catch (error: any) {
          const message =
            error?.response?.data?.error || error?.response?.message
          return null
        }
      },
    }),
  ],

  secret: process.env.NEXTAUTH_SECRET,

  pages: {
    error: '/api/auth/error',
  },

  callbacks: {
    async signIn({ user, account, profile, email, credentials }) {
      if (!user) return Promise.reject(true)
      return Promise.resolve(true)
    },
    async redirect({ url, baseUrl }) {
      return baseUrl
    },
    async jwt({ token, user, account, profile, isNewUser }) {
      if (account?.access_token) {
        token.idToken = account?.id_token
      }
      if (account?.provider === 'google') {
        try {
          const res = await axios.post(
            `${process.env.NEXT_PUBLIC_API_URL}/auth/login-with-google`,
            {
              idToken: account?.id_token,
            },
            {
              httpsAgent: new https.Agent({
                rejectUnauthorized: false,
              }),
            }
          )
          token.user = res.data
        } catch (error: any) {
          console.log(error)
          const message =
            error?.response?.data?.error || error?.response?.message
          return Promise.reject({
            error: error?.response?.status || 401,
            message: message,
          })
        }
      } else {
        user && (token.user = user)
      }
      return token
    },
    async session({ session, token, user }: any) {
      if (token?.idToken) {
        session.idToken = token?.idToken
      }
      if (token.user?.id) {
        const idUser = token.user?.id
        const res = await axios.get(
          `${process.env.NEXT_PUBLIC_API_URL}/user/${idUser}/user-info`,
          {
            httpsAgent: new https.Agent({
              rejectUnauthorized: false,
            }),
          }
        )
        if (res.status === 200) {
          session.user = res.data
        }
      } else {
        session.user = token.user
      }
      return session
    },
  },
})
