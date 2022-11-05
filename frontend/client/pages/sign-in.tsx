import { NextPage } from 'next'
import { useState } from 'react'
import {
  AppBar,
  Container,
  Toolbar,
  Typography,
  Box,
  InputLabel,
} from '@mui/material'
import FlightTakeoffIcon from '@mui/icons-material/FlightTakeoff'
import { Title } from '@components/atoms/Heading'
import { DefaultButton } from '@components/atoms/Button/DefaultButton'
import { InputField } from '@components/atoms/Input/InputField'

const SignIn: NextPage = () => {
  const [step, setStep] = useState(1)

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
            <InputLabel htmlFor='email' color='primary'>
              Email
            </InputLabel>
            <InputField id='email' />
            <DefaultButton
              color='primary'
              sx={{ borderRadius: '4px' }}
              onClick={() => setStep(2)}
            >
              Tiếp tục với email
            </DefaultButton>
          </Box>
        )}
        {step > 1 && (
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
            <InputLabel htmlFor='password' color='primary'>
              Mật khẩu
            </InputLabel>
            <InputField id='password' type='password' />
            <DefaultButton color='primary' sx={{ borderRadius: '4px' }}>
              Đăng nhập
            </DefaultButton>
          </Box>
        )}
        <Box
          display='flex'
          flexDirection='row'
          alignItems='center'
          textAlign='center'
        >
          <p
            style={{
              width: '90px',
              height: '1px',
              background: 'rgba(0,0,0,0.1)',
              margin: '0 5px',
            }}
          ></p>
          <p style={{ flexGrow: '1' }}>hoặc đăng nhập bằng Google</p>
          <p
            style={{
              width: '90px',
              height: '1px',
              background: 'rgba(0,0,0,0.1)',
              margin: '0 5px',
            }}
          ></p>
        </Box>
      </Box>
    </div>
  )
}

export default SignIn
