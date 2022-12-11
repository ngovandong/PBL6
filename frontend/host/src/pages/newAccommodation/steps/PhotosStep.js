import { useEffect, useState } from "react";
import { Alert, CircularProgress, Snackbar } from "@mui/material";
import {
  handleUpdateAddingHost,
  selectAddingHost,
} from "../../../app/store/hostSlice";
import { useSelector } from "react-redux";

const cloudName = process.env.REACT_APP_CLOUD_NAME;
const uploadPreset = process.env.REACT_APP_UPLOAD_PRESET;

function PhotosStep() {
  const [loading, setLoading] = useState(false);
  const [imagesName, setimagesName] = useState([]);
  const [openSnackbar, setOpenSnackbar] = useState(false);
  const [avatarLoading, setAvatarLoading] = useState(false);
  const addingHost = useSelector(selectAddingHost);

  const handleAddImg = (e) => {
    const file = e.target.files[0];
    const existed = imagesName.some((n) => n === file.name);
    if (!existed) {
      setimagesName((pre) => [...pre, file.name]);
      setLoading(true);
      const data = new FormData();
      data.append("file", file);
      data.append("upload_preset", uploadPreset);
      data.append("cloud_name", cloudName);
      fetch(`https://api.cloudinary.com/v1_1/${cloudName}/image/upload`, {
        method: "post",
        body: data,
      })
        .then((resp) => resp.json())
        .then((data) => {
          handleUpdateAddingHost("images", [
            ...(addingHost.images ? addingHost.images : []),
            data.url,
          ]);
          setLoading(false);
        })
        .catch((err) => console.log(err));
    } else {
      setOpenSnackbar(true);
    }
  };

  const uploadAvatar = (e) => {
    const file = e.target.files[0];
    setAvatarLoading(true);
    const data = new FormData();
    data.append("file", file);
    data.append("upload_preset", uploadPreset);
    data.append("cloud_name", cloudName);
    fetch(`https://api.cloudinary.com/v1_1/${cloudName}/image/upload`, {
      method: "post",
      body: data,
    })
      .then((resp) => resp.json())
      .then((data) => {
        handleUpdateAddingHost("avatarImage", data.url);
        setAvatarLoading(false);
      })
      .catch((err) => console.log(err));
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

function ImageCard({ src }) {
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
function LoadingImg() {
  return (
    <div className="loading-img">
      <CircularProgress />
    </div>
  );
}

function AddImageBT({ onClick, disabled }) {
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
