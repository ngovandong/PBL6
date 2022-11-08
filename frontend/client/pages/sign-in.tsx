import { NextPage } from 'next'
import { useState } from 'react'
import { useSession, signIn, signOut } from 'next-auth/react'
import {
  AppBar,
  Container,
  Toolbar,
  Typography,
  Box,
  InputLabel,
  FormGroup,
  styled,
  alpha,
} from '@mui/material'
import FlightTakeoffIcon from '@mui/icons-material/FlightTakeoff'
import { Title } from '@components/atoms/Heading'
import { DefaultButton } from '@components/atoms/Button/DefaultButton'
import { InputField } from '@components/atoms/Input/InputField'
import Image from 'next/image'
import { boxShadow, primaryColor } from '@constants/styles'

const StraightLine = styled('p')({
  width: '90px',
  height: '1px',
  background: '#ced4da',
  margin: '0 5px',
})

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

const SignIn: NextPage = () => {
  const [step, setStep] = useState(1)
  const { data: session } = useSession()
  if (session) {
    console.log(session)
  }
  return (
    <div>
      <AppBar
        position='sticky'
        style={{ boxShadow: 'unset', borderBottom: '1px solid #F7F7F7' }}
      >
        <Container maxWidth='lg'>
          <Toolbar disableGutters>
            <Box
              sx={{
                display: 'flex',
                alignItems: 'center',
                margin: 'auto',
              }}
            >
              <FlightTakeoffIcon
                sx={{ display: { xs: 'none', md: 'flex' }, mr: 1 }}
              />
              <Typography
                variant='h6'
                noWrap
                component='a'
                href='/'
                sx={{
                  display: { xs: 'none', md: 'flex' },
                  fontFamily: 'monospace',
                  fontWeight: 700,
                  letterSpacing: '.3rem',
                  color: 'inherit',
                  textDecoration: 'none',
                }}
              >
                ReadyBooking
              </Typography>
            </Box>
          </Toolbar>
        </Container>
      </AppBar>
      <Box sx={{ margin: '30px auto', maxWidth: '450px' }}>
        {step === 1 && (
          <>
            <Box
              display='flex'
              component='form'
              autoComplete='off'
              flexDirection='column'
              gap={2}
            >
              <Title
                title='Đăng nhập hoặc tạo tài khoản'
                sx={{ fontSize: '24px', textAlign: 'center' }}
              />
              <FormGroup>
                <InputLabel htmlFor='email' color='primary'>
                  Email
                </InputLabel>
                <InputField id='email' />
              </FormGroup>
              <DefaultButton
                color='primary'
                onClick={() => setStep(2)}
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
            <SquareIcon onClick={() => signIn()}>
              <Image src='/icons/google.svg' width='32px' height='32px' />
            </SquareIcon>
          </>
        )}
        {step === 2 && (
          <Box
            display='flex'
            component='form'
            autoComplete='off'
            flexDirection='column'
            gap={2}
          >
            <Title
              title='Nhập mật khẩu của bạn'
              sx={{ fontSize: '24px', textAlign: 'center' }}
            />
            <FormGroup>
              <InputLabel htmlFor='password' color='primary'>
                Mật khẩu
              </InputLabel>
              <InputField id='password' type='password' />
            </FormGroup>
            <Box sx={{ width: '100%', display: 'flex', gap: '10px' }}>
              <DefaultButton
                sx={{ flexGrow: 1 }}
                onClick={() => setStep(step - 1)}
              >
                Quay lại
              </DefaultButton>
              <DefaultButton
                color='primary'
                sx={{ flexGrow: 1 }}
                onClick={() => setStep(step + 1)}
              >
                Đăng nhập
              </DefaultButton>
            </Box>
          </Box>
        )}
        {step === 3 && (
          <Box
            display='flex'
            component='form'
            autoComplete='off'
            flexDirection='column'
            gap={2}
          >
            <Title
              title='Nhập mật khẩu'
              sx={{ fontSize: '24px', textAlign: 'center' }}
            />
            <FormGroup>
              <InputLabel htmlFor='password' color='primary'>
                Mật khẩu
              </InputLabel>
              <InputField id='password' />
            </FormGroup>
            <FormGroup>
              <InputLabel htmlFor='confirmPassword' color='primary'>
                Xác nhận mật khẩu
              </InputLabel>
              <InputField id='confirmPassword' />
            </FormGroup>
            <Box sx={{ width: '100%', display: 'flex', gap: '10px' }}>
              <DefaultButton
                sx={{ flexGrow: 1 }}
                onClick={() => setStep(step - 1)}
              >
                Quay lại
              </DefaultButton>
              <DefaultButton color='primary' sx={{ flexGrow: 1 }}>
                Tạo tài khoản
              </DefaultButton>
            </Box>
          </Box>
        )}
      </Box>
    </div>
  )
}

export default SignIn