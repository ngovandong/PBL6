import { boxShadow, boxShadowCard, lightColor } from '@constants/styles';
import { Typography } from '@mui/material';
import ImageList from '@mui/material/ImageList';
import ImageListItem from '@mui/material/ImageListItem';
import AppsIcon from '@mui/icons-material/Apps';
import { Box } from '@mui/system';
import Image from 'next/image';

const itemData = [
    {
      img: 'https://images.unsplash.com/photo-1551963831-b3b1ca40c98e',
      title: 'Breakfast',
      rows: 2,
      cols: 1,
    },
    {
        img: 'https://images.unsplash.com/photo-1551963831-b3b1ca40c98e',
        title: 'Breakfast',
        rows: 1,
        cols: 2,
    },
    {
        img: 'https://images.unsplash.com/photo-1551963831-b3b1ca40c98e',
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
    return (
    <Box position='relative'>
        <ImageList
            sx={{ width: `${width}`, height: `${height}`, overflow: 'hidden', borderRadius: 4, border: '1px '}}
            variant="standard"
            cols={3}
            rowHeight={300}
        >
            {itemData.map((item, index) => {
                if (index < 5)
                return (
                    <ImageListItem key={item.img} cols={item.cols || 1} rows={item.rows || 1}>
                    <Image src={item.img} width='100%' height='100%' layout='fill' alt={item?.title} loading="lazy" objectFit='cover' />
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
            <Typography sx={{fontSize:14, fontWeight: 500, ml: '2px'}}>Hiển thị tất cả hình ảnh</Typography>
        </Box>
    </Box>)
}

export default ImageContainer