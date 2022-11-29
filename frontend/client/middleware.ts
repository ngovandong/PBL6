import { getSession } from 'next-auth/react'
import { NextFetchEvent, NextResponse } from 'next/server'
import type { NextRequest } from 'next/server'
import { IncomingMessage } from 'http'

// This function can be marked `async` if using `await` inside
export async function middleware(req: NextRequest, ev: NextFetchEvent) {
  const requestForNextAuth = {
    headers: {
      cookie: req.headers.get('cookie'),
    },
  }
  const session = await getSession({ req: requestForNextAuth })

  if (session) {
    return NextResponse.next()
  } else {
    // the user is not logged in, redirect to the sign-in page
    const signInPage = '/sign-in'
    const signInUrl = new URL(signInPage, req.nextUrl.origin)
    return NextResponse.redirect(signInUrl)
  }
}

export const config = {
  matcher: '/profile/:path*',
}
