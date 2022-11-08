import { url } from 'inspector'
import NextAuth, { Account, Session, User } from 'next-auth'
import { JWT } from 'next-auth/jwt'
import GoogleProvider from 'next-auth/providers/google'

interface ISession extends Session {
  accessToken: string
}

export default NextAuth({
  providers: [
    GoogleProvider({
      clientId: process.env.GOOGLE_CLIENT_ID || '',
      clientSecret: process.env.GOOGLE_CLIENT_SECRET || '',
    }),
  ],
  secret: process.env.JWT_SECRET || '',
  callbacks: {
    async signIn({ user, account, profile, email, credentials }) {
      return true
    },
    // async redirect({ url, baseUrl }) {
    //   return baseUrl
    // },
    async session({ session, token, user }) {
      if (token?.accessToken) {
        session.accessToken = token?.accessToken
        session.provider = token?.provider
      }
      session.user = user
      return session
    },
    async jwt({ token, user, account, profile, isNewUser }) {
      if (account?.access_token) {
        token.accessToken = account?.id_token
        token.provider = account?.provider
      }
      return token
    },
  },
})
