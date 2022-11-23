import { boxShadow, boxShadowCard, lightColor } from '@constants/styles';
import { Dialog, DialogContent, DialogTitle, IconButton, Typography } from '@mui/material';
import ImageList from '@mui/material/ImageList';
import ImageListItem from '@mui/material/ImageListItem';
import AppsIcon from '@mui/icons-material/Apps';
import ChevronLeftIcon from '@mui/icons-material/ChevronLeft';
import ChevronRightIcon from '@mui/icons-material/ChevronRight';
import { Box } from '@mui/system';
import Image from 'next/image';
import { useState } from 'react';

const itemData = [
    {
      img: 'https://images.unsplash.com/photo-1551963831-b3b1ca40c98e',
      title: 'Breakfast',
      rows: 2,
      cols: 1,
    },
    {
        img: 'https://images.unsplash.com/photo-1668902610778-96403019a7f5',
        title: 'Breakfast',
        rows: 1,
        cols: 2,
    },
    {
        img: 'https://images.unsplash.com/photo-1669052324124-e6ee7da16031',
        title: 'Breakfast',
        rows: 1,
        cols: 2,
    },
    {
        img: 'https://images.unsplash.com/photo-1665686310974-2ed1eb7f57ac',
        title: 'Breakfast',
        rows: 1,
        cols: 2,
    },
  ];

function srcset(image: string, size: number, rows = 1, cols = 1) {
    return {
      src: `${image}`,
    };
  }
  
const ImageContainer = ({width = '100%', height = 600}: {width?: number | string, height?: number | string}) => {
    const [open, setOpen] = useState(false);
    const [current, setCurrent] = useState<number>(0)
    return (
    <Box position='relative'>
        <ImageList
            sx={{ width: `${width}`, height: `${height}`, overflow: 'hidden', borderRadius: 4, border: '1px '}}
            variant="standard"
            cols={3}
            rowHeight={300}
        >
            {itemData.map((item, index) => {
                if (index < 3)
                return (
                    <ImageListItem key={item.img} cols={item.cols || 1} rows={item.rows || 1}>
                        <Image src={item.img} layout='fill' alt={item?.title} loading="lazy" objectFit='cover' />
                    </ImageListItem>
                )
            })}
        </ImageList>
        <Box sx={{
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
                }
            }}>
            <AppsIcon /> 
            <Typography sx={{fontSize:14, fontWeight: 500, ml: '2px'}} onClick={() => setOpen(true)}>Hiển thị tất cả hình ảnh</Typography>
        </Box>
        <Dialog onClose={() => setOpen(false)} open={open} 
            PaperProps={{
                sx: {
                    '&.MuiPaper-root': {
                        minWidth: '50%',
                        minHeight: '90%',
                        maxWidth: '100%',
                        maxHeight: '100%',
                        boxShadow: 'none',
                    }
                }
            }}> 
            <DialogContent>
            {
                (current >= 0 && current < itemData.length)
                && (<Box key={itemData[current].img + 'details'}>
                    {
                        current > 0 && (
                            <IconButton aria-label="previous" sx={{position: 'absolute', top: '50%', left: 10, bgcolor:"white", zIndex: 10}} onClick={() => setCurrent(current - 1)}>
                                <ChevronLeftIcon />
                            </IconButton>
                        )
                    }
                    <Image src={itemData[current].img} alt={itemData[current]?.title || ''} loading="lazy" objectFit='contain' layout="fill"/>
                    {
                        current < itemData.length - 1 && (
                            <IconButton aria-label="next" sx={{position: 'absolute', top: '50%', right: 10, bgcolor:"white", zIndex: 2}} onClick={() => setCurrent(current + 1)}>
                                <ChevronRightIcon />
                            </IconButton>
                        )
                    }
                </Box>)
            }
            </DialogContent>
        </Dialog>
    </Box>)
}

export default ImageContainer