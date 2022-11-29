import * as React from 'react'
import {
  Tab,
  Tabs,
  Box,
  Typography,
  Avatar,
  FormControl,
  InputLabel,
  Input,
  Grid,
} from '@mui/material'
import { IUserProfile } from '@utils/types'
import { primaryColor } from '@constants/styles'
import { styled } from '@mui/system'
import { grey } from '@mui/material/colors'
import { Title, TitlePost } from '@components/atoms/Heading'
import { Controller, useForm } from 'react-hook-form'
import { DefaultButton } from '@components/atoms/Button/DefaultButton'
import { renderDefaultValuesForHook } from '@utils/helpers'
import { EDIT_USER_LABEL } from '@constants/constant'
import { userApi } from '@utils/api'
import axios from 'axios'
import { useSession } from 'next-auth/react'

interface TabPanelProps {
  children?: React.ReactNode
  index: number
  value: number
}

function TabPanel(props: TabPanelProps) {
  const { children, value, index, ...other } = props

  return (
    <div
      role='tabpanel'
      hidden={value !== index}
      id={`vertical-tabpanel-${index}`}
      aria-labelledby={`vertical-tab-${index}`}
      {...other}
    >
      {value === index && (
        <Box sx={{ p: 3 }}>
          <Typography>{children}</Typography>
        </Box>
      )}
    </div>
  )
}

interface StyledTabProps {
  label: string
}

const TabItem = styled((props: StyledTabProps) => (
  <Tab disableRipple {...props} />
))(({ theme }) => ({
  textTransform: 'none',
  alignItems: 'flex-start',
  color: grey[500],
  fontFamily: 'inherit',
  fontWeight: 500,
  fontSize: 16,
  '&:hover': {
    color: primaryColor,
    opacity: 1,
  },
  '&.Mui-selected': {
    color: primaryColor,
  },
  '&.Mui-focusVisible': {
    backgroundColor: '#d1eaff',
  },
}))
function a11yProps(index: number) {
  return {
    id: `vertical-tab-${index}`,
    'aria-controls': `vertical-tabpanel-${index}`,
  }
}

export default function ProfileTemplate({
  profile,
}: {
  profile: IUserProfile
}) {
  const [value, setValue] = React.useState(0)

  const handleChange = (event: React.SyntheticEvent, newValue: number) => {
    setValue(newValue)
  }

  const { control, handleSubmit } = useForm({
    defaultValues: renderDefaultValuesForHook(profile, EDIT_USER_LABEL),
  })

  const onSubmit = (data: any) => {
    console.log(data)
    userApi
      .editUser(data)
      .then(async (data) => {
        await axios.get('/api/auth/session?update')
        console.log(data)
      })
      .catch((error: any) => {
        console.log(error)
      })
  }

  return (
    <Box
      sx={{
        flexGrow: 1,
        bgcolor: 'background.paper',
        display: 'flex',
        height: '100%',
      }}
    >
      <Tabs
        orientation='vertical'
        variant='scrollable'
        value={value}
        onChange={handleChange}
        aria-label='Profile Menu'
        sx={{ borderRight: 1, borderColor: 'divider', width: 300 }}
      >
        <TabItem label='Chỉnh sửa thông tin' {...a11yProps(0)} />
        <TabItem label='Item Two' {...a11yProps(1)} />
        <TabItem label='Item Three' {...a11yProps(2)} />
      </Tabs>
      <Box component={TabPanel} value={value} index={0}>
        {/* <TitlePost>Chỉnh sửa thông tin</TitlePost> */}
        <Grid container component='form' onSubmit={handleSubmit(onSubmit)}>
          <Grid item sm={12}>
            <Avatar
              src={profile.avatarImageUrl?.split('=')[0] || ''}
              sx={{ width: 200, height: 200, margin: 'auto' }}
            />
          </Grid>
          <Grid item sm={6}>
            <InputLabel htmlFor='familyName'>Họ</InputLabel>
            <Controller
              name='familyName'
              control={control}
              render={({ field }) => (
                <Input fullWidth id='familyName' {...field} />
              )}
            />
          </Grid>
          <Grid item sm={6}>
            <InputLabel htmlFor='givenName'>Tên</InputLabel>
            <Controller
              name='givenName'
              control={control}
              render={({ field }) => (
                <Input fullWidth id='givenName' {...field} />
              )}
            />
          </Grid>
          <Grid item sm={6}>
            <InputLabel htmlFor='email'>Email</InputLabel>
            <Input fullWidth id='email' value={profile.email} disabled />
          </Grid>
          <Grid item sm={6}>
            <InputLabel htmlFor='phoneNumber'>Số điện thoại</InputLabel>
            <Input fullWidth id='phoneNumber' value={profile.phoneNumber} />
          </Grid>
          <Grid item sm={6}>
            <InputLabel htmlFor='address'>Địa chỉ</InputLabel>
            <Input fullWidth id='address' value={profile.address} />
          </Grid>
          <Grid item sm={6}>
            <InputLabel htmlFor='country'>Quốc tịch</InputLabel>
            <Input fullWidth id='country' value={profile.country} />
          </Grid>
          <Grid item sm={12}>
            <DefaultButton color='primary' type='submit'>
              Chỉnh sửa
            </DefaultButton>
          </Grid>
        </Grid>
      </Box>
      <TabPanel value={value} index={1}>
        Item Two
      </TabPanel>
      <TabPanel value={value} index={2}>
        Item Three
      </TabPanel>
    </Box>
  )
}
