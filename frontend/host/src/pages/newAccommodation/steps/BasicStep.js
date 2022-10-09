import {
  InputAdornment,
  MenuItem,
  OutlinedInput,
  Rating,
  TextField,
} from "@mui/material";
import { useState } from "react";

const listBT = [
  { icon: "building", name: "Khách sạn" },
  { icon: "house", name: "Resort" },
  { icon: "house-crack", name: "Homestay" },
];
function BasicStep() {
  const [selectedAccommodationType, setselectedAccommodationType] =
    useState("Khách sạn");
  return (
    <div className="tab-container">
      <p className="section-tile">Tên chỗ nghỉ</p>
      <TextField placeholder="Nhập tên chỗ nghỉ" fullWidth />
      <p className="section-tile">Chọn loại chỗ nghỉ</p>
      <div className="house-type-container">
        {listBT.map((bt) => (
          <HouseBT
            key={bt.name}
            name={bt.name}
            icon={bt.icon}
            onClick={() => setselectedAccommodationType(bt.name)}
            isActive={selectedAccommodationType === bt.name}
          />
        ))}
      </div>
      <p className="section-tile">Quy mô chỗ nghỉ</p>
      <OutlinedInput
        endAdornment={<InputAdornment position="end">m²</InputAdornment>}
        inputProps={{
          "aria-label": "weight",
          placeholder: "Diện tích",
          min: "0"
        }}
        type="number"
      />
      <p className="section-tile">Xếp hạng sao</p>
      <Rating />
      <p className="section-tile">Mô tả chỗ ở</p>
      <TextField placeholder="Mô tả về chỗ ở" multiline rows={4} fullWidth />
    </div>
  );
}

export default BasicStep;

function HouseBT({ icon, name, isActive, onClick }) {
  return (
    <div
      className={isActive ? "house-bt-active" : "house-bt"}
      onClick={onClick}
    >
      <i style={{ fontSize: "40px" }} className={`fa-solid fa-${icon}`}></i>
      {name}
    </div>
  );
}
