import { ContentLink, TitleLink } from "@components/atoms/Heading"
import { Divider, Grid, Tooltip, Typography } from "@mui/material"
import { Box } from "@mui/system"
import { StarPurple500Outlined, LocationOn, Remove } from "@mui/icons-material";
import ImageContainer from "@components/molecules/image";
import TableRoom from "@components/molecules/table";
import { activeLinkColor, lightColor } from "@constants/styles";
import { ProgressBarHorizontal } from "@components/atoms/Progress";

const PostDetailTemplate = () => {
    return (
        <Box>
            <Box display="flex" flexDirection="column">
                <Box display="flex"  alignItems="center">
                    <TitleLink>Koi Resort & Spa Hoi An Koi Resort & Spa Hoi An</TitleLink>
                    <Box sx={{ ml: 1, mt: 'auto', display: 'inline-block' }}>    
                        <Tooltip title='Đánh giá sao này do chỗ nghỉ cung cấp cho Booking.com và thường được quyết định bởi một tổ chức đánh giá khách sạn chính thức hoặc một bên thứ ba khác.'>
                            <span>
                            {Array.from(Array(5).keys()).map((item) => (
                                <StarPurple500Outlined color='warning' key='1' />
                            ))}
                            </span>
                        </Tooltip>
                    </Box>
                </Box>
                <Box display="flex"  alignItems="center">
                    <ContentLink><LocationOn sx={{my: 'auto', mr: 1}} /></ContentLink>
                    <ContentLink>549 Tran Hung Dao Street, District 1, Quận 1, TP. Hồ Chí Minh, Việt Nam –</ContentLink>
                </Box>
                <ImageContainer />
            </Box>
            <Box width="80%" id="description" >
                <Box>
                    <Typography fontSize={18} fontWeight="700" mb={1}>Mô tả</Typography>
                    <Typography sx={{fontSize: 14}}>
                        Tọa lạc tại một vị trí lý tưởng tại Quận 1 thuộc Thành phố Hồ Chí Minh, Sunshine Antique Hotel Saigon nằm cách Bảo tàng Mỹ thuật 2 km, Công viên Tao Đàn 2 km và Chợ Bến Thành 2,1 km. Trong số các tiện nghi của chỗ nghỉ này có nhà hàng, lễ tân 24 giờ, dịch vụ phòng và WiFi miễn phí. Khách sạn còn có hồ bơi trong nhà, trung tâm thể dục và sảnh khách chung.
                        <br/>Tất cả phòng nghỉ tại khách sạn đều được trang bị máy điều hòa, truyền hình vệ tinh màn hình phẳng, tủ lạnh, ấm đun nước, vòi sen, máy sấy tóc và bàn làm việc. Các phòng còn có tủ để quần áo và phòng tắm riêng.
                        <br/>Sunshine Antique Hotel Saigon phục vụ bữa sáng tự chọn hàng ngày.
                        <br/>Khách sạn cung cấp chỗ nghỉ 4 sao có bể sục và sân hiên.
                        <br/>Sunshine Antique Hotel Saigon nằm trong bán kính 2,2 km từ Chợ ẩm thực đường phố Bến Thành và 2,3 km từ trung tâm thương mại Takashimaya Việt Nam. Sân bay gần nhất là sân bay quốc tế Tân Sơn Nhất, cách đó 8 km, và khách sạn cung cấp dịch vụ đưa đón sân bay với một khoản phụ phí.
                        <br/>Các cặp đôi đặc biệt thích địa điểm này — họ cho điểm 8,2 cho kỳ nghỉ dành cho 2 người.
                    </Typography>
                </Box>
                <Box sx={{my: 1}}>
                    <Typography fontSize={18} fontWeight="700">Các tiện nghi được ưa chuộng nhất</Typography>
                </Box>
            </Box>
            <Divider sx={{ my: 2 }}/>
            <Box sx={{my: 1}}>
                <Box sx={{my: 1}}>
                        <Typography fontSize={18} fontWeight="700">Danh sách phòng trống</Typography>
                </Box>
                <TableRoom />
            </Box>
            <Box sx={{my: 2}}>
                <Box sx={{my: 1}}>
                    <Typography fontSize={18} fontWeight="700">Đánh giá của khách hàng</Typography>
                </Box>
                <Box sx={{ ml: 'auto', display: 'flex', alignItems: 'center' }}>
                    <Box
                        p={1}
                        height='fit-content'
                        bgcolor={activeLinkColor}
                        color={lightColor}
                        borderRadius={'6px'}
                        >
                            8,7
                    </Box>
                    <Remove sx={{ mx: 1, fontSize: 12 }}/>
                    <Typography>125 đánh giá</Typography>
                    <Remove sx={{ mx: 1, fontSize: 12 }}/>
                    <Typography sx={{ fontWeight: 400, textTransform: 'none'}}><ContentLink>Xem tất cả đánh giá</ContentLink></Typography>
                </Box>
                <Box sx={{my: 2}}>
                    <Typography fontSize={16} fontWeight="700">Hạng mục đánh giá</Typography>
                    <Grid container pt={1} columnSpacing={4} rowSpacing={1}>
                        <Grid item sm={4} >
                            <Box display='flex' justifyContent='space-between'>
                                <Typography fontSize={14} fontWeight="400" mb={1}>Nhân viên phục vụ</Typography>
                                <Typography fontSize={14} fontWeight="400" mb={1}>7.5</Typography>
                            </Box>
                            <ProgressBarHorizontal value={7.5*100/10} />
                        </Grid>
                        <Grid item sm={4} >
                            <Box display='flex' justifyContent='space-between'>
                                <Typography fontSize={14} fontWeight="400" mb={1}>Nhân viên phục vụ</Typography>
                                <Typography fontSize={14} fontWeight="400" mb={1}>7.5</Typography>
                            </Box>
                            <ProgressBarHorizontal value={7.5*100/10}/>
                        </Grid>
                    </Grid>
                </Box>
            </Box>
        </Box>
    )
}

export default PostDetailTemplate