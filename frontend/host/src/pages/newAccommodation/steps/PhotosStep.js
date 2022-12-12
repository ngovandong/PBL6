import { useEffect, useState } from "react";
import { Alert, CircularProgress, Snackbar } from "@mui/material";
import {
  handleUpdateAddingHost,
  selectAddingHost,
} from "../../../app/store/hostSlice";
import { useSelector } from "react-redux";
import { uploadImage } from "../../../api-service/cloudinaryService";

function PhotosStep() {
  const [loading, setLoading] = useState(false);
  const [imagesName, setimagesName] = useState([]);
  const [openSnackbar, setOpenSnackbar] = useState(false);
  const [avatarLoading, setAvatarLoading] = useState(false);
  const addingHost = useSelector(selectAddingHost);

  const handleAddImg = async (e) => {
    const file = e.target.files[0];
    const existed = imagesName.some((n) => n === file.name);
    if (!existed) {
      setimagesName((pre) => [...pre, file.name]);
      setLoading(true);
      const url = await uploadImage(file);
      handleUpdateAddingHost("images", [
        ...(addingHost.images ? addingHost.images : []),
        url,
      ]);
      setLoading(false);
    } else {
      setOpenSnackbar(true);
    }
  };

  const uploadAvatar = async (e) => {
    const file = e.target.files[0];
    setAvatarLoading(true);
    const url = await uploadImage(file);
    handleUpdateAddingHost("avatarImage", url);
    setAvatarLoading(false);
  };
  return (
    <div className="tab-container">
      <input
        type="file"
        id="avatar_img"
        style={{ display: "none" }}
        onChange={uploadAvatar}
      ></input>

      <p className="section-tile">Hình ảnh đại diện</p>
      <Avatar
        src={addingHost.avatarImage}
        handleClick={() => {
          document.getElementById("avatar_img").click();
        }}
        avatarLoading={avatarLoading}
      />

      <p className="section-tile">Hình ảnh chỗ ở</p>
      <div className="image-upload-container">
        {(addingHost.images ? addingHost.images : []).map((i) => (
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
  );
}

export default PhotosStep;

export function ImageCard({ src }) {
  return (
    <div>
      <img className="upload-img" alt="alt" src={src} />
    </div>
  );
}
function Avatar({ src, handleClick, avatarLoading }) {
  return !src ? (
    <button className="add-img-bt" onClick={handleClick}>
      <i className={"fa-regular fa-add"}></i>
    </button>
  ) : avatarLoading ? (
    <LoadingImg />
  ) : (
    <div>
      <img className="upload-img" alt="alt" src={src} onClick={handleClick} />
    </div>
  );
}
export function LoadingImg() {
  return (
    <div className="loading-img">
      <CircularProgress />
    </div>
  );
}

export function AddImageBT({ onClick, disabled }) {
  const handleClick = () => {
    document.getElementById("upload_image").click();
  };
  return (
    <button disabled={disabled} className="add-img-bt" onClick={handleClick}>
      <i className={"fa-regular fa-add"}></i>
      <input type="file" id="upload_image" onChange={onClick}></input>
    </button>
  );
}
