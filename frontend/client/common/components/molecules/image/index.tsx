import { boxShadow, boxShadowCard, lightColor } from '@constants/styles'
import {
  Dialog,
  DialogContent,
  DialogTitle,
  IconButton,
  Typography,
} from '@mui/material'
import ImageList from '@mui/material/ImageList'
import ImageListItem from '@mui/material/ImageListItem'
import AppsIcon from '@mui/icons-material/Apps'
import ChevronLeftIcon from '@mui/icons-material/ChevronLeft'
import ChevronRightIcon from '@mui/icons-material/ChevronRight'
import { Box } from '@mui/system'
import Image from 'next/image'
import { useState } from 'react'

const ImageContainer = ({
  images = [],
  width = '100%',
  height = 600,
  alt = 'Ready Booking',
}: {
  images?: string[]
  width?: number | string
  height?: number | string
  alt?: string
}) => {
  const [open, setOpen] = useState(false)
  const [current, setCurrent] = useState<number>(0)
  console.log(images)
  return (
    <Box position='relative'>
      <ImageList
        sx={{
          width: `${width}`,
          height: `${height}`,
          overflow: 'hidden',
          borderRadius: 4,
          border: '1px ',
        }}
        variant='standard'
        cols={3}
        rowHeight={300}
      >
        {images?.map((item: string, index: number) => {
          if (index < 3)
            return (
              <ImageListItem key={item}>
                <Image
                  src={item}
                  layout='fill'
                  alt={alt}
                  loading='lazy'
                  objectFit='cover'
                />
              </ImageListItem>
            )
        })}
      </ImageList>
      <Box
        sx={{
          display: 'flex',
          alignItems: 'center',
          position: 'absolute',
          bottom: 32,
          right: 20,
          borderRadius: 1,
          bgcolor: 'white',
          color: 'black',
          px: 1,
          py: 1,
          border: '1px solid #222222',
          cursor: 'pointer',
          '&:hover': {
            boxShadow: 1,
            backgroundColor: '#f4f4f4',
          },
        }}
      >
        <AppsIcon />
        <Typography
          sx={{ fontSize: 14, fontWeight: 500, ml: '2px' }}
          onClick={() => setOpen(true)}
        >
          Hiển thị tất cả hình ảnh
        </Typography>
      </Box>
      <Dialog
        onClose={() => setOpen(false)}
        open={open}
        PaperProps={{
          sx: {
            '&.MuiPaper-root': {
              minWidth: '50%',
              minHeight: '90%',
              maxWidth: '100%',
              maxHeight: '100%',
              boxShadow: 'none',
            },
          },
        }}
      >
        <DialogContent>
          {current >= 0 && current < images.length && (
            <Box key={images[current] + 'details'}>
              {current > 0 && (
                <IconButton
                  aria-label='previous'
                  sx={{
                    position: 'absolute',
                    top: '50%',
                    left: 10,
                    bgcolor: 'white',
                    zIndex: 10,
                  }}
                  onClick={() => setCurrent(current - 1)}
                >
                  <ChevronLeftIcon />
                </IconButton>
              )}
              <Image
                src={images[current] || ''}
                alt={alt}
                loading='lazy'
                objectFit='contain'
                layout='fill'
              />
              {current < images.length - 1 && (
                <IconButton
                  aria-label='next'
                  sx={{
                    position: 'absolute',
                    top: '50%',
                    right: 10,
                    bgcolor: 'white',
                    zIndex: 2,
                  }}
                  onClick={() => setCurrent(current + 1)}
                >
                  <ChevronRightIcon />
                </IconButton>
              )}
            </Box>
          )}
        </DialogContent>
      </Dialog>
    </Box>
  )
}

export default ImageContainer
