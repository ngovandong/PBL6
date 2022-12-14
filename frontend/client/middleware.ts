import { getSession } from 'next-auth/react'
import { NextFetchEvent, NextRequest, NextResponse } from 'next/server'

// This function can be marked `async` if using `await` inside
export async function middleware(req: NextRequest) {
  const jwt = req.cookies.get('next-auth.session-token')

  console.log(jwt)

  if (!jwt) {
    req.nextUrl.pathname = '/sign-in'
    return NextResponse.redirect(req.nextUrl)
  }
  return NextResponse.next()
}

export const config = {
  matcher: ['/profile/:path*', '/order-management/:path*'],
}
