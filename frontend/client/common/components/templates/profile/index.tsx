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
} from '@mui/material'
import {CameraAltRounded} from '@mui/icons-material';
import { IUserProfile } from '@utils/types'
import { boxShadowCard, primaryColor } from '@constants/styles'
import { styled } from '@mui/system'
import { grey } from '@mui/material/colors'
import { Title, TitlePost } from '@components/atoms/Heading'
import { Controller, useForm } from 'react-hook-form'
import { DefaultButton } from '@components/atoms/Button/DefaultButton'
import { reloadSession, renderDefaultValuesForHook } from '@utils/helpers'
import { EDIT_PASSWORD_FORM, EDIT_USER_FORM, EDIT_USER_LABEL } from '@constants/constant'
import { userApi } from '@utils/api'
import { toastSuccess } from '@utils/notifications'
import { InputField } from '@components/atoms/Input/InputField';
import { editUser } from '@utils/api/user';

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

  const { control, handleSubmit, formState: { errors }, } = useForm({
    defaultValues: renderDefaultValuesForHook(profile, EDIT_USER_LABEL),
  })

  const onSubmit = (data: any) => {
    userApi
      .editUser(data)
      .then((res) => {
        reloadSession();
        if(res.status === 200) {
          toastSuccess('Cập nhật thông tin thành công!')
        }
      })
      .catch((error: any) => {
        console.log(error)
      })
  }

  async function handleClick(this: HTMLInputElement) {
    console.log("Changed!");
    const fileList = this.files
    if (fileList) {
      const cloudName = process.env.NEXT_PUBLIC_CLOUD_NAME
      const uploadPreset = process.env.NEXT_PUBLIC_UPLOAD_PRESET
      if (cloudName && uploadPreset) {
        const formData = new FormData()
        formData.append('file', fileList[0])
        formData.append('upload_preset', uploadPreset)
        formData.append('cloud_name', cloudName)
        try {
          const res = await fetch(`https://api.cloudinary.com/v1_1/${cloudName}/upload`, {method: 'POST', body: formData})
          const data = await res.json()
          if (data.url) {
            console.log({...profile, 'avatarImageUrl': data.url})
            const updateImage = await editUser({...profile, 'avatarImageUrl': data.url})
            if(updateImage.status === 200) {
              toastSuccess('Cập nhật thông tin thành công!')
              reloadSession()
            }
          }
        } catch (error: any) {
          console.log(error)
        }
      }
    }
    this.removeEventListener("click", handleClick);
  }

  const onUploadImage = (event: React.MouseEvent) => {
    const inputFile = document.createElement('input')
    inputFile.style.display = 'none';
    inputFile.type = 'file'
    inputFile.accept = 'image/*'
    document.body.appendChild(inputFile);
    inputFile.addEventListener('change', handleClick)
    inputFile.click()
    document.body.removeChild(inputFile);
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
        <TabItem label='Mật khẩu' {...a11yProps(1)} />
      </Tabs>
      <Box component={TabPanel} value={value} index={0} ml={2} sx={{width: '100%'}}>
        <TitlePost sx={{mb: 2}}>Thông tin cá nhân</TitlePost>
        <Grid container component='form' onSubmit={handleSubmit(onSubmit)} spacing={2} >
          <Grid item sm={12} mb={2}>
            <Badge
              sx={{ 
                width: '200px',
                margin: 'auto',
                display: 'block', 
                '& .MuiBadge-badge': {
                  backgroundColor: 'rgba(255,255,255)',
                  height: 40,
                  width: 40,
                  borderRadius: '50%',
                  boxShadow: boxShadowCard,
                  '&:hover': {
                    cursor: 'pointer',
                    backgroundColor: 'rgba(255,255,255,0.9)',
                  }
                }
              }}
              onClick={onUploadImage}
              overlap="circular"
              anchorOrigin={{ vertical: 'bottom', horizontal: 'right'}}
              badgeContent={
                <CameraAltRounded/>
              }
            >
              <Avatar
                src={profile.avatarImageUrl?.split('=')[0] || ''}
                sx={{ width: 200, height: 200, margin: 'auto',boxShadow: boxShadowCard, }}
              />
            </Badge>
          </Grid>
          {
            EDIT_USER_FORM.map((item) => {
              return (
                <Grid item sm={6} key={item.id} >
                  <InputLabel required={item.required} htmlFor={item.id}>{item.label}</InputLabel>
                  <Controller
                    name={item.id}
                    control={control}
                    rules={{required: item.required}}
                    render={({ field }) => (
                      <InputField fullWidth id={item.id} {...field} />
                    )}
                  />
                  {errors[item.id] && item.message && (
                    <Box mt={1}>
                      <Typography component='span' sx={{ color: primaryColor, fontSize: 16, fontWeight: 500}} role="alert">
                        {item.message}
                      </Typography>
                    </Box>
                  )}
                </Grid>
              )
            })
          }
          <Grid item sm={2} mx='auto' mt={2}>
            <DefaultButton color='primary' type='submit' sx={{width: '100%'}}>
              Chỉnh sửa
            </DefaultButton>
          </Grid>
        </Grid>
      </Box>
      <Box component={TabPanel} value={value} index={1} ml={2} sx={{width: '100%'}}>
        <TitlePost sx={{mb: 2}}>Mật khẩu</TitlePost>
        <Grid container component='form' onSubmit={() => {}} spacing={2} width='60%'>
          {
            EDIT_PASSWORD_FORM.map((item) => {
              return (
                <Grid item sm={12} key={item.id} >
                  <InputLabel required={item.required} htmlFor={item.id}>{item.label}</InputLabel>
                  <Controller
                    name={item.id}
                    control={control}
                    rules={{required: item.required}}
                    render={({ field }) => (
                      <InputField fullWidth id={item.id} {...field} />
                    )}
                  />
                  {errors[item.id] && item.message && (
                    <Box mt={1}>
                      <Typography component='span' sx={{ color: primaryColor, fontSize: 16, fontWeight: 500}} role="alert">
                        {item.message}
                      </Typography>
                    </Box>
                  )}
                </Grid>
              )
            })
          }
          <Grid item sm={3} mx='auto' mt={2}>
            <DefaultButton color='primary' type='submit' sx={{width: '100%'}}>
              Chỉnh sửa
            </DefaultButton>
          </Grid>
        </Grid>
      </Box>
    </Box>
  )
}
