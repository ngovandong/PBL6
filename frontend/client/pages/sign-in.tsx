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
  InputAdornment,
  IconButton,
} from '@mui/material'
import { Title } from '@components/atoms/Heading'
import { DefaultButton } from '@components/atoms/Button/DefaultButton'
import { InputField } from '@components/atoms/Input/InputField'
import { primaryColor } from '@constants/styles'
import { authApi } from '@utils/api'
import { Session } from 'next-auth'
import { LOCAL_STORAGE } from '@constants/constant'
import { useRouter } from 'next/router'
import { MainContext } from 'common/context'
import { toastError } from '@utils/notifications'
import { validateEmail, validatePassword } from '@utils/helpers'
import { isEmpty } from 'lodash'
import { Visibility, VisibilityOff } from '@mui/icons-material'

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
  const [showPassword, setShowPassword] = useState(false)
  const [step, setStep] = useState(1)
  const { data: session }: any = useSession()
  const { state, setState } = useContext(MainContext)
  const router = useRouter()

  useEffect(() => {
    if (!isEmpty(state.user)) {
      router.replace('/')
    }
  }, [session])

  const handleClickShowPassword = () => {
    setShowPassword(!showPassword)
  }

  const handleMouseDownPassword = (
    event: React.MouseEvent<HTMLButtonElement>
  ) => {
    event.preventDefault()
  }

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
      onSubmit={(event) => {
        event.preventDefault()
        handleSubmit()
      }}
    >
      {step === 1 && (
        <>
          <Box display='flex' flexDirection='column'>
            <Title
              title='Đăng nhập hoặc tạo tài khoản'
              sx={{ fontSize: '24px', textAlign: 'center' }}
            />
            <FormGroup sx={{ mt: '16px' }}>
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
            {errors && (
              <Box mt={2}>
                <Typography
                  component='span'
                  sx={{ color: primaryColor, fontSize: 16 }}
                  role='alert'
                >
                  {errors}
                </Typography>
              </Box>
            )}
            <DefaultButton
              color='primary'
              onClick={() => {
                const emailTrim = email.trim()
                const errorMessage = !email.trim()
                  ? 'Trường bắt buộc nhập.'
                  : errors
                  ? 'Email không hợp lệ.'
                  : ''
                if (errorMessage) {
                  setErrors(errorMessage)
                } else {
                  setStep(2)
                }
              }}
              sx={{ flexFlow: 1, mt: 2, mb: '10px' }}
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
              type={showPassword ? 'text' : 'password'}
              endAdornment={
                <InputAdornment position='end'>
                  <IconButton
                    aria-label='toggle password visibility'
                    onClick={handleClickShowPassword}
                    onMouseDown={handleMouseDownPassword}
                    edge='end'
                  >
                    {showPassword ? <VisibilityOff /> : <Visibility />}
                  </IconButton>
                </InputAdornment>
              }
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
                if (!errors) {
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
