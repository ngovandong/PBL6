import NextAuth from 'next-auth'
import GoogleProvider from 'next-auth/providers/google'

export default NextAuth({
  providers: [
    GoogleProvider({
      clientId: process.env.GOOGLE_CLIENT_ID || '',
      clientSecret: process.env.GOOGLE_CLIENT_SECRET || '',
    }),
  ],
  secret: process.env!.JWT_SECRET,

  callbacks: {
    async signIn({ user, account, profile, email, credentials }) {
      return true
    },
    // async redirect({ url, baseUrl }) {
    //   return baseUrl
    // },
    async session({ session, token, user }) {
      if (token?.idToken) {
        session.idToken = token?.idToken
      }
      return session
    },
    async jwt({ token, user, account, profile, isNewUser }) {
      if (account?.access_token) {
        token.idToken = account?.id_token
      }
      return token
    },
  },
})
