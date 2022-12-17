import * as React from 'react'
import {
  Box,
  Typography,
  InputLabel,
  Grid,
  InputAdornment,
  IconButton,
} from '@mui/material'

import { Title, TitlePost } from '@components/atoms/Heading'
import { Controller, useForm } from 'react-hook-form'
import { DefaultButton } from '@components/atoms/Button/DefaultButton'
import {
  EDIT_PASSWORD_FORM,
  ERROR_MESSAGE,
  INFOR_MESSAGE,
} from '@constants/constant'
import { InputField } from '@components/atoms/Input/InputField'
import { primaryColor } from '@constants/styles'
import { userApi } from '@utils/api'
import { toastError, toastSuccess } from '@utils/notifications'
import { reloadSession, validatePassword } from '@utils/helpers'
import { Visibility, VisibilityOff } from '@mui/icons-material'
import TabPanel from '@components/atoms/TabPanel'

const ChangePassword = ({
  value,
  havePassword,
  idUser,
}: {
  value: any
  havePassword: boolean
  idUser: string
}) => {
  const {
    control,
    handleSubmit,
    formState: { errors },
    setError,
  } = useForm()

  const [values, setValues] = React.useState<{ [key: string]: boolean }>({
    newPassword: false,
    oldPassword: false,
  })

  const handleClickShowPassword = (newValues: any) => {
    setValues({
      ...values,
      ...newValues,
    })
  }

  const handleMouseDownPassword = (
    event: React.MouseEvent<HTMLButtonElement>
  ) => {
    event.preventDefault()
  }

  const onSubmit = (data: any) => {
    if (!validatePassword(data.newPassword)) {
      setError('newPassword', { message: ERROR_MESSAGE.NEW_PASSWORD_ERROR })
    } else {
      userApi
        .changePassword(havePassword, { userId: idUser, ...data })
        .then((res) => {
          if (res.status === 200) {
            reloadSession()
            toastSuccess(INFOR_MESSAGE.UPDATED_SUCCESSFULLY)
          }
        })
        .catch((error: any) => {
          if (error?.response?.data?.error === 'Old password is incorrect.') {
            setError('oldPassword', {
              type: 'custom',
              message: ERROR_MESSAGE.OLD_PASSWORD_ERROR,
            })
          }
        })
    }
  }

  return (
    <Box component={TabPanel} value={value} index={1} sx={{ width: '100%' }}>
      <TitlePost sx={{ mb: 2 }}>Mật khẩu</TitlePost>
      <Grid
        name='change-password'
        container
        component='form'
        spacing={2}
        width='60%'
        onSubmit={handleSubmit(onSubmit)}
      >
        {EDIT_PASSWORD_FORM.map((item) => {
          return (
            <Grid item sm={12} key={item.id}>
              <InputLabel required={item.required} htmlFor={item.id}>
                {item.label}
              </InputLabel>
              <Controller
                name={item.id}
                control={control}
                rules={{
                  required: { value: item.required, message: item.message },
                }}
                render={({ field }) => (
                  <InputField
                    fullWidth
                    id={item.id}
                    {...field}
                    type={values[item.id] ? 'text' : item.type}
                    endAdornment={
                      <InputAdornment position='end'>
                        <IconButton
                          aria-label='toggle password visibility'
                          onClick={(event) =>
                            handleClickShowPassword({
                              [item.id]: !values[item.id],
                            })
                          }
                          onMouseDown={handleMouseDownPassword}
                          edge='end'
                        >
                          {values[item.id] ? <VisibilityOff /> : <Visibility />}
                        </IconButton>
                      </InputAdornment>
                    }
                  />
                )}
              />
              {errors[item.id] && (
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
                    {errors[item.id]?.message?.toString()}
                  </Typography>
                </Box>
              )}
            </Grid>
          )
        })}
        <Grid item sm={3} mx='auto' mt={2}>
          <DefaultButton color='primary' type='submit' sx={{ width: '100%' }}>
            Chỉnh sửa
          </DefaultButton>
        </Grid>
      </Grid>
    </Box>
  )
}

export default ChangePassword
