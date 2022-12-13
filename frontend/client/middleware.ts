import { getSession } from 'next-auth/react'
import { NextFetchEvent, NextRequest, NextResponse } from 'next/server'

// This function can be marked `async` if using `await` inside
export async function middleware(req: NextRequest) {
  // const requestForNextAuth = {
  //   headers: {
  //     cookie: req.headers.get('cookie'),
  //   },
  // }

  // const session = await getSession({ req: requestForNextAuth } as any)

  // if (session?.user) {
  //   return NextResponse.next()
  // } else {
  //   // the user is not logged in, redirect to the sign-in page
  //   const signInPage = '/sign-in'
  //   const signInUrl = new URL(signInPage, req.nextUrl.origin)
  //   return NextResponse.redirect(signInUrl)
  // }
}

export const config = {
  matcher: ['/profile/:path*', '/order-management/:path*'],
}
