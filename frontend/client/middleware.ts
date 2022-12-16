import { getSession } from 'next-auth/react'
import { NextFetchEvent, NextRequest, NextResponse } from 'next/server'

import { withAuth } from 'next-auth/middleware'

export default withAuth(
  // `withAuth` augments your `Request` with the user's token.
  function middleware(req) {
    console.log(req.nextauth.token)
    if (req.nextauth.token) {
      req.nextUrl.pathname = '/sign-in'
      return NextResponse.redirect(req.nextUrl)
    }
    return NextResponse.next()
  },
  {
    pages: {
      signIn: '/sign-in',
    },
    secret: process.env.NEXTAUTH_SECRET
  },
)

export const config = {
  matcher: ['/profile/:path*', '/order-management/:path*'],
}