import * as React from 'react'
import {
  Box,
  Typography,
  Avatar,
  InputLabel,
  Grid,
  Badge,
  Divider,
} from '@mui/material'
import { CameraAltRounded } from '@mui/icons-material'
import { IUserProfile } from '@utils/types'
import { boxShadowCard, primaryColor } from '@constants/styles'
import { Title, TitlePost } from '@components/atoms/Heading'
import { Controller, useForm } from 'react-hook-form'
import { DefaultButton } from '@components/atoms/Button/DefaultButton'
import {
  reloadSession,
  renderDefaultValuesForHook,
  trimDataObject,
} from '@utils/helpers'
import {
  EDIT_USER_FORM,
  EDIT_USER_LABEL,
  ERROR_MESSAGE,
  INFOR_MESSAGE,
} from '@constants/constant'
import { uploadImageCloudinary, userApi } from '@utils/api'
import { toastError, toastSuccess } from '@utils/notifications'
import { InputField } from '@components/atoms/Input/InputField'
import { editUser } from '@utils/api/user'

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

const ChangeProfile = ({
  value,
  profile,
}: {
  value: any
  profile: IUserProfile
}) => {
  const {
    control,
    handleSubmit,
    formState: { errors },
  } = useForm({
    defaultValues: renderDefaultValuesForHook(profile, EDIT_USER_LABEL),
  })

  const onSubmit = (data: any) => {
    userApi
      .editUser(trimDataObject(data))
      .then((res) => {
        reloadSession()
        if (res.status === 200) {
          toastSuccess(INFOR_MESSAGE.UPDATED_SUCCESSFULLY)
        }
      })
      .catch((error: any) => {
        toastError(ERROR_MESSAGE.COMMON_ERROR)
      })
  }

  async function handleClick(this: HTMLInputElement) {
    const fileList = this.files
    if (fileList) {
      const imageUrl = await uploadImageCloudinary(fileList[0])
      if (imageUrl) {
        const updateImage = await editUser({
          ...profile,
          avatarImageUrl: imageUrl,
        })
        if (updateImage.status === 200) {
          reloadSession()
          toastSuccess(INFOR_MESSAGE.UPDATED_SUCCESSFULLY)
        }
      } else {
        toastError(ERROR_MESSAGE.COMMON_ERROR)
      }
    }
    this.removeEventListener('click', handleClick)
  }

  const onUploadImage = (event: React.MouseEvent) => {
    const inputFile = document.createElement('input')
    inputFile.style.display = 'none'
    inputFile.type = 'file'
    inputFile.accept = 'image/*'
    document.body.appendChild(inputFile)
    inputFile.addEventListener('change', handleClick)
    inputFile.click()
    document.body.removeChild(inputFile)
  }

  return (
    <Box
      component={TabPanel}
      value={value}
      index={0}
      ml={2}
      sx={{ width: '100%' }}
    >
      <Grid
        container
        component='form'
        onSubmit={handleSubmit(onSubmit)}
        spacing={2}
        pt={'0px !important'}
      >
        <Grid item sm={12}>
          <TitlePost>Ảnh đại diện</TitlePost>
        </Grid>
        <Grid item sm={12} mb={2} sx={{ py: '0 !important' }}>
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
                },
              },
            }}
            onClick={onUploadImage}
            overlap='circular'
            anchorOrigin={{ vertical: 'bottom', horizontal: 'right' }}
            badgeContent={<CameraAltRounded />}
          >
            <Avatar
              src={profile.avatarImageUrl?.split('=')[0] || ''}
              sx={{
                width: 200,
                height: 200,
                margin: 'auto',
                boxShadow: boxShadowCard,
              }}
            />
          </Badge>
        </Grid>
        <Grid item sm={12} sx={{ pt: '10px !important' }}>
          <Divider />
          <TitlePost sx={{ mt: 2 }}>Thông tin cá nhân</TitlePost>
        </Grid>
        {EDIT_USER_FORM.map((item) => {
          return (
            <Grid item sm={6} key={item.id}>
              <InputLabel required={item.required} htmlFor={item.id}>
                {item.label}
              </InputLabel>
              <Controller
                name={item.id}
                control={control}
                rules={{ required: item.required, ...(item.rules as any) }}
                render={({ field }) => (
                  <InputField
                    fullWidth
                    id={item.id}
                    {...field}
                    disabled={item.disabled}
                  />
                )}
              />
              {errors[item.id] && item.message && (
                <Box mt={1}>
                  <Typography
                    component='span'
                    sx={{
                      color: primaryColor,
                      fontSize: 16,
                      fontWeight: 500,
                    }}
                    role='alert'
                  >
                    {item.message}
                  </Typography>
                </Box>
              )}
            </Grid>
          )
        })}
        <Grid item sm={2} mx='auto' mt={2}>
          <DefaultButton color='primary' type='submit' sx={{ width: '100%' }}>
            Chỉnh sửa
          </DefaultButton>
        </Grid>
      </Grid>
    </Box>
  )
}

export default ChangeProfile
