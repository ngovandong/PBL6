import { getSession } from 'next-auth/react'
import { NextFetchEvent, NextRequest, NextResponse } from 'next/server'

// // This function can be marked `async` if using `await` inside
// export async function middleware(req: NextRequest) {
//   const jwt = req.cookies.get('next-auth.session-token')

//   if (!jwt) {
//     req.nextUrl.pathname = '/sign-in'
//     return NextResponse.redirect(req.nextUrl)
//   }
//   return NextResponse.next()
// }

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
  }
)

export const config = {
  matcher: ['/profile/:path*', '/order-management/:path*'],
}
