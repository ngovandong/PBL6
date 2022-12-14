import { NextApiRequest, NextApiResponse } from 'next'

const errors: { [key: string]: string } = {
  Signin: 'Try signing with a different account.',
  OAuthSignin: 'Try signing with a different account.',
  OAuthCallback: 'Try signing with a different account.',
  OAuthCreateAccount: 'Try signing with a different account.',
  EmailCreateAccount: 'Try signing with a different account.',
  Callback: 'Try signing with a different account.',
  OAuthAccountNotLinked:
    'To confirm your identity, sign in with the same account you used originally.',
  EmailSignin: 'Check your email address.',
  CredentialsSignin:
    'Sign in failed. Check the details you provided are correct.',
  default: 'Unable to sign in.',
}

type Data = {
  error: string
}

export default async function SignInError(
  req: NextApiRequest,
  res: NextApiResponse<Data>
) {
  const error =
    typeof req.query.error === 'string' ? req.query.error : 'default'
  const errorMessage = errors[error]
  return res.status(401).send({ error: errorMessage })
}
