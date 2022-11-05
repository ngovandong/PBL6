import { secondaryColor, textColor } from '@constants/styles'
import { Box, Typography } from '@mui/material'
import { styled } from '@mui/system'
import Link from 'next/link'

const IconRound = styled('i')({
  backgroundColor: 'transparent',
  margin: '0 15px',
  textAlign: 'center',
  color: '#fff',
  border: '2px solid #fff',
  padding: '5px',
  borderRadius: '50%',
  fontSize: '12px',
  cursor: 'pointer',
})

export const Footer = () => {
  return (
    <Box sx={{ backgroundColor: textColor }}>
      <Box
        sx={{
          padding: '20px 0',
          textAlign: 'center',
        }}
      >
        <Link href='https://www.facebook.com/'>
          <IconRound className='fab fa-facebook' />
        </Link>
        <Link href='https://twitter.com/'>
          <IconRound className='fab fa-twitter' />
        </Link>
        <Link href='https://www.linkedin.com/'>
          <IconRound className='fab fa-linkedin-in' />
        </Link>
        <Link href='https://www.instagram.com/'>
          <IconRound className='fab fa-instagram' />
        </Link>
      </Box>
      <Box
        pb={1}
        sx={{
          textAlign: 'center',
          color: '#ffffff',
          // backgroundColor: 'rgba(0,0,0, 0.9)',
          fontSize: '14px',
        }}
      >
        © 2022 Copyright - Ready Booking
      </Box>
    </Box>
  )
}
