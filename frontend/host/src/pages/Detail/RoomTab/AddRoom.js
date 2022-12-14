import ArrowBackIcon from "@mui/icons-material/ArrowBack";
import SaveAsIcon from "@mui/icons-material/SaveAs";
import {
  Alert,
  Checkbox,
  Fab,
  FormControlLabel,
  InputAdornment,
  OutlinedInput,
  Snackbar,
  Switch,
  TextField,
} from "@mui/material";
import { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import { toast } from "react-toastify";
import { uploadImage } from "../../../api-service/cloudinaryService";
import { AMENITIES, BED_TYPE } from "../../../constants/amenities";
import {
  AddImageBT,
  ImageCard,
  LoadingImg,
} from "../../newAccommodation/steps/PhotosStep";

import accommodationService from "../../../api-service/accommodationService";

function AddRoom() {
  const { id, roomId } = useParams();
  const initialRoom = {
    hostPartnerId: id,
    name: "",
    accommodationType: "",
    outstandingUtilities: [],
    bedTypes: [],
    description: "",
    quantity: 0,
    images: [],
    area: 0,
    extraBed: true,
    bathRooms: 0,
    bathRoomUtilities: [],
    view: "",
    utilities: [],
    smoking: false,
    originalPrice: 0,
    isPrePayment: true,
  };
  const [newRoom, setNewRoom] = useState(initialRoom);
  const [loading, setLoading] = useState(false);
  const [imagesName, setimagesName] = useState([]);
  const [openSnackbar, setOpenSnackbar] = useState(false);
  const navigate = useNavigate();
  const handleBack = () => {
    navigate(-1);
  };

  const fetchRoom = async () => {
    if (roomId) {
      const res = await accommodationService.getAccommodation(roomId);
      setNewRoom(res.data);
    }
  };

  useEffect(() => {
    fetchRoom();
  }, []);

  const handleChangeUltilities = (code) => {
    if (newRoom.utilities.includes(code)) {
      handleUpdate(
        "utilities",
        newRoom.utilities.filter((u) => u !== code)
      );
    } else {
      handleUpdate("utilities", [...newRoom.utilities, code]);
    }
  };
  const handleChangeBedType = (code) => {
    if (newRoom.bedTypes.includes(code)) {
      handleUpdate(
        "bedTypes",
        newRoom.bedTypes.filter((u) => u !== code)
      );
    } else {
      handleUpdate("bedTypes", [...newRoom.bedTypes, code]);
    }
  };

  const handleUpdate = (key, value) => {
    setNewRoom((pre) => ({ ...pre, [key]: value }));
  };

  const handleAddImg = async (e) => {
    const file = e.target.files[0];
    const existed = imagesName.some((n) => n === file.name);
    if (!existed) {
      setimagesName((pre) => [...pre, file.name]);
      setLoading(true);
      const url = await uploadImage(file);
      handleUpdate("images", [...newRoom.images, url]);
      setLoading(false);
    } else {
      setOpenSnackbar(true);
    }
  };

  const handleCreateRoom = () => {
    const {
      name,
      description,
      accommodationType,
      quantity,
      area,
      bathRooms,
      originalPrice,
      images,
    } = newRoom;
    if (
      name &&
      description &&
      accommodationType &&
      quantity &&
      area &&
      bathRooms &&
      originalPrice &&
      images.length
    ) {
      accommodationService.createAccommodation(newRoom).then(() => {
        toast.success("Tạo phòng thành công");
        navigate(`/detail/${id}/room`);
      });
    } else {
      toast.error("Vui lòng điền đầy đủ thông tin");
    }
  };

  const handleEditRoom = () => {
    const {
      name,
      description,
      accommodationType,
      quantity,
      area,
      bathRooms,
      originalPrice,
      images,
    } = newRoom;
    if (
      name &&
      description &&
      accommodationType &&
      quantity &&
      area &&
      bathRooms &&
      originalPrice &&
      images.length
    ) {
      accommodationService.UpdateAccommodation(newRoom).then(() => {
        toast.success("Cập nhật thành công");
      });
    } else {
      toast.error("Vui lòng điền đầy đủ thông tin");
    }
  };

  return (
    <div>
      <div className="tool-bar">
        <Fab
          variant="contained"
          onClick={handleBack}
          color="primary"
          aria-label="add"
        >
          <ArrowBackIcon />
        </Fab>
        {roomId ? (
          <Fab onClick={handleEditRoom} variant="extended">
            <SaveAsIcon sx={{ mr: 1 }} />
            Lưu
          </Fab>
        ) : (
          <Fab onClick={handleCreateRoom} variant="extended">
            <SaveAsIcon sx={{ mr: 1 }} />
            Tạo phòng
          </Fab>
        )}
      </div>
      <div className="add-room">
        <div>
          <p className="row-title">Tên phòng</p>
          <TextField
            placeholder="Nhập tên phòng"
            style={{ width: "30%", marginRight: "5%" }}
            onChange={(e) => handleUpdate("name", e.target.value)}
            defaultValue={newRoom.name}
          />
          <TextField
            placeholder="Nhập loại phòng"
            style={{ width: "30%", marginRight: "5%" }}
            onChange={(e) => handleUpdate("accommodationType", e.target.value)}
            defaultValue={newRoom.accommodationType}
          />
          <p className="row-title">Số lượng</p>
          <OutlinedInput
            endAdornment={<InputAdornment position="end">phòng</InputAdornment>}
            inputProps={{
              placeholder: "Số lượng",
              min: "1",
            }}
            type="number"
            onChange={(e) => handleUpdate("quantity", Number(e.target.value))}
            defaultValue={newRoom.quantity}
          />
          <p className="row-title">Mô tả phòng</p>
          <TextField
            placeholder="Mô tả về phòng"
            multiline
            rows={4}
            onChange={(e) => handleUpdate("description", e.target.value)}
            defaultValue={newRoom.description}
            fullWidth
          />
          <p className="row-title">Giường</p>
          {BED_TYPE.map((t) => (
            <FormControlLabel
              style={{ width: "45%" }}
              key={t.code}
              control={
                <Checkbox
                  checked={newRoom.bedTypes.includes(t.code)}
                  onChange={() => handleChangeBedType(t.code)}
                />
              }
              label={t.label}
            />
          ))}
          <p className="row-title">Tiện nghi</p>
          <div style={{ marginBottom: "20px" }}>
            <OutlinedInput
              endAdornment={<InputAdornment position="end">m2</InputAdornment>}
              inputProps={{
                placeholder: "Diện tích",
                min: "1",
              }}
              type="number"
              style={{ width: "30%", marginRight: "5%" }}
              onChange={(e) => handleUpdate("area", Number(e.target.value))}
              defaultValue={newRoom.area}
            />
            <OutlinedInput
              endAdornment={
                <InputAdornment position="end">phòng tắm</InputAdornment>
              }
              inputProps={{
                placeholder: "Số lượng",
                min: "1",
              }}
              type="number"
              style={{ width: "30%" }}
              onChange={(e) =>
                handleUpdate("bathRooms", Number(e.target.value))
              }
              defaultValue={newRoom.bathRooms}
            />
          </div>
          <TextField
            placeholder="View phòng"
            style={{ width: "30%", marginRight: "5%" }}
            onChange={(e) => handleUpdate("view", e.target.value)}
            defaultValue={newRoom.view}
          />
          <FormControlLabel
            control={
              <Switch
                checked={newRoom.smoking}
                onChange={(e) => handleUpdate("smoking", e.target.checked)}
              />
            }
            label="Được hút thuốc"
            style={{ marginTop: "8px" }}
          />
          <p className="row-title">Tiện nghi thêm</p>
          <div className="amenities-container">
            {AMENITIES.map((a) => (
              <FormControlLabel
                style={{ width: "45%" }}
                key={a.code}
                control={
                  <Checkbox
                    checked={newRoom.utilities.includes(a.code)}
                    onChange={() => handleChangeUltilities(a.code)}
                  />
                }
                label={a.label}
              />
            ))}
          </div>
          <p className="row-title">Giá phòng</p>
          <OutlinedInput
            endAdornment={<InputAdornment position="end">đ</InputAdornment>}
            inputProps={{
              placeholder: "Giá thường ngày",
              min: "1",
            }}
            type="number"
            style={{ width: "40%", marginRight: "5%" }}
            onChange={(e) =>
              handleUpdate("originalPrice", parseInt(e.target.value))
            }
            defaultValue={newRoom.originalPrice}
          />
          <FormControlLabel
            control={
              <Switch
                checked={newRoom.isPrePayment}
                onChange={(e) => handleUpdate("isPrePayment", e.target.checked)}
              />
            }
            label="Trả tiền trước"
          />
          <p className="row-title">Hình ảnh</p>
          <div className="image-upload-container">
            {newRoom.images.map((i) => (
              <ImageCard src={i} key={i} />
            ))}
            {loading && <LoadingImg />}
            <AddImageBT disabled={loading} onClick={(e) => handleAddImg(e)} />
          </div>
          <Snackbar
            open={openSnackbar}
            autoHideDuration={2000}
            onClose={() => setOpenSnackbar(false)}
          >
            <Alert sx={{ width: "100%" }} severity="error">
              Hình ảnh đã tồn tại
            </Alert>
          </Snackbar>
        </div>
      </div>
    </div>
  );
}

export default AddRoom;
