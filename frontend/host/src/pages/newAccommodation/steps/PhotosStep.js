import { useEffect, useState } from "react";
import { Alert, CircularProgress, Snackbar } from "@mui/material";

const cloudName = process.env.REACT_APP_CLOUD_NAME;
const uploadPreset = process.env.REACT_APP_UPLOAD_PRESET;

function PhotosStep() {
  const [images, setImages] = useState([]);
  const [loading, setLoading] = useState(false);
  const [imagesName, setimagesName] = useState([]);
  const [openSnackbar, setOpenSnackbar] = useState(false);
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
          setImages((pre) => [...pre, data.url]);
          setLoading(false);
        })
        .catch((err) => console.log(err));
    } else {
      setOpenSnackbar(true);
    }
  };
  return (
    <div className="tab-container">
      <div className="image-upload-container">
        {images.map((i) => (
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
