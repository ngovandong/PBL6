import * as React from 'react'
import {
  Tab,
  Tabs,
  Box,
  Typography,
  Avatar,
  InputLabel,
  Input,
  Grid,
  Badge,
  IconButton,
  Divider,
} from '@mui/material'
import { CameraAltRounded } from '@mui/icons-material'
import { IUserProfile } from '@utils/types'
import { boxShadowCard, primaryColor } from '@constants/styles'
import { styled } from '@mui/system'
import { grey } from '@mui/material/colors'
import { Title, TitlePost } from '@components/atoms/Heading'
import { Controller, useForm } from 'react-hook-form'
import { DefaultButton } from '@components/atoms/Button/DefaultButton'
import {
  reloadSession,
  renderDefaultValuesForHook,
  trimDataObject,
} from '@utils/helpers'
import {
  EDIT_PASSWORD_FORM,
  EDIT_USER_FORM,
  EDIT_USER_LABEL,
  ERROR_MESSAGE,
  INFOR_MESSAGE,
} from '@constants/constant'
import { uploadImageCloudinary, userApi } from '@utils/api'
import { toastError, toastSuccess } from '@utils/notifications'
import { InputField } from '@components/atoms/Input/InputField'
import { editUser } from '@utils/api/user'
import {
  ChangePasswordForm,
  ChangeProfileForm,
} from '@components/molecules/form'

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
  havePassword,
}: {
  profile: IUserProfile
  havePassword: boolean
}) {
  const [value, setValue] = React.useState(0)

  const handleChange = (event: React.SyntheticEvent, newValue: number) => {
    setValue(newValue)
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
        sx={{ borderRight: 1, borderColor: 'divider', minWidth: 250 }}
      >
        <TabItem label='Thông tin cá nhân' {...a11yProps(0)} />
        {havePassword && <TabItem label='Mật khẩu' {...a11yProps(1)} />}
      </Tabs>
      <ChangeProfileForm value={value} profile={profile} />
      {havePassword && (
        <ChangePasswordForm
          value={value}
          havePassword={havePassword}
          idUser={profile.id as string}
        />
      )}
    </Box>
  )
}
