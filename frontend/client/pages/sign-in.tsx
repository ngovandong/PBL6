import { NextPage, NextPageContext } from 'next'
import React, { useState, useEffect, useContext, memo } from 'react'
import Image from 'next/image'
import { useSession, signIn, getCsrfToken, getSession } from 'next-auth/react'
import {
  Typography,
  Box,
  InputLabel,
  FormGroup,
  styled,
  alpha,
} from '@mui/material'
import { Title } from '@components/atoms/Heading'
import { DefaultButton } from '@components/atoms/Button/DefaultButton'
import { InputField } from '@components/atoms/Input/InputField'
import { primaryColor } from '@constants/styles'
import { authApi } from '@utils/api'
import { Session } from 'next-auth'
import { LOCAL_STORAGE } from '@constants/constant'
import { useRouter } from 'next/router'
import { MainContext, useUser } from 'common/context'
import { toastError } from '@utils/notifications'
import { validateEmail, validatePassword } from '@utils/helpers'
import { isEmpty } from 'lodash'

const StraightLine = styled('p')({
  width: '90px',
  height: '1px',
  background: '#ced4da',
  margin: '0 5px',
})

interface ISession extends Session {
  idToken: string
}

const SquareIcon = styled(Box)(({ theme }) => ({
  width: '60px',
  height: '60px',
  border: '1px solid #ced4da',
  borderRadius: '8px',
  display: 'flex',
  placeItems: 'center',
  placeContent: 'center',
  cursor: 'pointer',
  margin: 'auto',
  transition: theme.transitions.create([
    'border-color',
    'background-color',
    'box-shadow',
  ]),

  '&:hover': {
    boxShadow: `${alpha(primaryColor, 0.8)} 0 0 0 0.05rem`,
  },
  '&:focus': {
    boxShadow: `${alpha(primaryColor, 0.8)} 0 0 0 0.05rem`,
  },
}))

const SignIn = () => {
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [errors, setErrors] = useState('')
  const [step, setStep] = useState(1)
  const { data: session } = useSession()
  const { state, setState } = useContext(MainContext)
  const router = useRouter()

  useEffect(() => {
    if (!isEmpty(state.user)) {
      router.replace('/')
    }
    if (session) {
      if (session?.idToken) {
        const user: any = session?.user
        user?.id && localStorage.setItem(LOCAL_STORAGE.idUser, user?.id)
        user?.accessToken &&
          localStorage.setItem(
            LOCAL_STORAGE.accessToken,
            user?.accessToken || ''
          )
        setState({ user: user })
        router.replace('/')
        // authApi
        //   .loginGoogle({
        //     idToken: session.idToken || '',
        //   })
        //   .then((res) => {
        //     if (res.data?.accessToken) {
        //       localStorage.setItem(
        //         LOCAL_STORAGE.accessToken,
        //         res.data?.accessToken
        //       )
        //       localStorage.setItem(LOCAL_STORAGE.idUser, res.data?.id)
        //       setState({ user: res.data })
        //       router.replace('/')
        //     }
        //   })
        //   .catch((error) => {
        //     console.log(error)
        //   })
      } else {
        const user: any = session?.user
        user?.id && localStorage.setItem(LOCAL_STORAGE.idUser, user?.id)
        user?.accessToken &&
          localStorage.setItem(
            LOCAL_STORAGE.accessToken,
            user?.accessToken || ''
          )
        setState({ user: user })
        router.replace('/')
      }
    }
  }, [session])

  const handleSubmit = async () => {
    if (!validatePassword(password)) {
      setErrors(
        'Mật khẩu có chứa ít nhất tám ký tự, trong đó có ít nhất một số và bao gồm cả chữ hoa và chữ thường.'
      )
    } else {
      setErrors('')
    }
    if (!errors) {
      const res = await signIn('credentials', {
        email: email,
        password: password,
        redirect: false,
      })
      if (res?.status === 401) {
        toastError('Mật khẩu không chính xác.')
      }
    }
  }

  return (
    <Box
      sx={{ margin: '30px auto', maxWidth: '450px' }}
      component='form'
      autoComplete='false'
    >
      {step === 1 && (
        <>
          <Box display='flex' flexDirection='column' gap={2}>
            <Title
              title='Đăng nhập hoặc tạo tài khoản'
              sx={{ fontSize: '24px', textAlign: 'center' }}
            />
            <FormGroup>
              {/* <input name='csrfToken' type='hidden' defaultValue={csrfToken} /> */}
              <InputLabel htmlFor='email' color='primary'>
                Email
              </InputLabel>
              <InputField
                id='email'
                type='email'
                value={email}
                onChange={(
                  event: React.ChangeEvent<
                    HTMLTextAreaElement | HTMLInputElement
                  >
                ) => {
                  const value = event.currentTarget.value
                  if (validateEmail(value)) {
                    setErrors('')
                  } else {
                    setErrors('Email không hợp lệ.')
                  }
                  setEmail(value)
                }}
              />
            </FormGroup>
            <Typography textAlign={'justify'}>{errors}</Typography>
            <DefaultButton
              color='primary'
              onClick={() => {
                if (email.trim()) {
                  setStep(2)
                }
              }}
              sx={{ flexFlow: 1 }}
            >
              Tiếp tục với email
            </DefaultButton>
          </Box>
          <Box
            display='flex'
            flexDirection='row'
            alignItems='center'
            textAlign='center'
          >
            <StraightLine />
            <p style={{ flexGrow: '1' }}>hoặc đăng nhập bằng Google</p>
            <StraightLine />
          </Box>
          <SquareIcon onClick={() => signIn('google')}>
            <Image
              src='/icons/google.svg'
              width='32px'
              height='32px'
              alt='Login with google'
            />
          </SquareIcon>
        </>
      )}
      {step === 2 && (
        <Box display='flex' flexDirection='column' gap={2}>
          <Title
            title='Nhập mật khẩu của bạn'
            sx={{ fontSize: '24px', textAlign: 'center' }}
          />
          <FormGroup>
            <InputLabel htmlFor='password' color='primary' disabled>
              Mật khẩu
            </InputLabel>
            <InputField
              id='password'
              type='password'
              value={password}
              onChange={(
                event: React.ChangeEvent<HTMLTextAreaElement | HTMLInputElement>
              ) => {
                const value = event.currentTarget.value.trim() || ''
                if (!validatePassword(value)) {
                  setErrors(
                    'Mật khẩu có chứa ít nhất tám ký tự, trong đó có ít nhất một số và bao gồm cả chữ hoa và chữ thường.'
                  )
                } else {
                  setErrors('')
                }
                setPassword(event.currentTarget.value)
              }}
            />
          </FormGroup>
          <Typography textAlign={'justify'}>{errors}</Typography>
          <Box sx={{ width: '100%', display: 'flex', gap: '10px' }}>
            <DefaultButton
              sx={{ flexGrow: 1 }}
              onClick={() => {
                setErrors('')
                setStep(step - 1)
              }}
            >
              Quay lại
            </DefaultButton>
            <DefaultButton
              color='primary'
              sx={{ flexGrow: 1 }}
              onClick={() => {
                if (errors.length <= 0) {
                  handleSubmit()
                }
              }}
            >
              Đăng nhập
            </DefaultButton>
          </Box>
        </Box>
      )}
    </Box>
  )
}

export async function getServerSideProps(context: NextPageContext) {
  return {
    props: {
      csrfToken: await getCsrfToken(context),
    },
  }
}

export default memo(SignIn)
