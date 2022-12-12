import {
  InputAdornment,
  OutlinedInput,
  Rating,
  TextField,
} from "@mui/material";
import { useSelector } from "react-redux";
import { AdapterMoment } from "@mui/x-date-pickers/AdapterMoment";
import {
  handleUpdateAddingHost,
  selectAddingHost,
} from "../../../app/store/hostSlice";
import { LocalizationProvider, TimePicker } from "@mui/x-date-pickers";
import moment from "moment";
const listBT = [
  { icon: "building", name: "Khách sạn" },
  { icon: "house", name: "Resort" },
  { icon: "house-crack", name: "Homestay" },
];

function BasicStep() {
  const addingHost = useSelector(selectAddingHost);
  return (
    <div className="tab-container">
      <p className="section-tile">Tên chỗ nghỉ</p>
      <TextField
        placeholder="Nhập tên chỗ nghỉ"
        fullWidth
        onChange={(e) => handleUpdateAddingHost("name", e.target.value)}
        defaultValue={addingHost.name}
      />
      <p className="section-tile">Chọn loại chỗ nghỉ</p>
      <div className="house-type-container">
        {listBT.map((bt) => (
          <HouseBT
            key={bt.name}
            name={bt.name}
            icon={bt.icon}
            onClick={() => handleUpdateAddingHost("hostType", bt.name)}
            isActive={addingHost.hostType === bt.name}
          />
        ))}
      </div>
      <p className="section-tile">Quy mô chỗ nghỉ</p>
      <OutlinedInput
        endAdornment={<InputAdornment position="end">m²</InputAdornment>}
        inputProps={{
          "aria-label": "weight",
          placeholder: "Diện tích",
          min: "0",
        }}
        type="number"
        onChange={(e) => handleUpdateAddingHost("area", Number(e.target.value))}
        defaultValue={addingHost.area ? addingHost.area : 0}
      />
      <p className="section-tile">Xếp hạng sao</p>
      <Rating
        onChange={(event, newValue) => {
          handleUpdateAddingHost("ratingStar", newValue);
        }}
        value={addingHost.ratingStar}
      />
      <LocalizationProvider dateAdapter={AdapterMoment}>
        <p className="section-tile">Giờ check in, check out</p>
        <TimePicker
          ampm={false}
          label="Giờ check in"
          value={
            addingHost.timeCheckin
              ? new moment(addingHost.timeCheckin, "HH:mm:ss")
              : new moment()
          }
          onChange={(newValue) => {
            handleUpdateAddingHost(
              "timeCheckin",
              newValue._d.toTimeString().slice(0, 8)
            );
          }}
          renderInput={(params) => (
            <TextField
              style={{ width: "45%", marginRight: "5%" }}
              {...params}
            />
          )}
        />
        <TimePicker
          label="Giờ checkout"
          ampm={false}
          value={
            addingHost.timeCheckout
              ? new moment(addingHost.timeCheckout, "HH:mm:ss")
              : new moment()
          }
          onChange={(newValue) => {
            handleUpdateAddingHost(
              "timeCheckout",
              newValue._d.toTimeString().slice(0, 8)
            );
          }}
          renderInput={(params) => {
            console.log(params);
            return (
              <TextField
                style={{ width: "45%", marginRight: "5%" }}
                defaultValue={addingHost.timeCheckout}
                value={addingHost.timeCheckout}
                {...params}
              />
            );
          }}
        />
      </LocalizationProvider>
      <p className="section-tile">Mô tả chỗ ở</p>
      <TextField
        placeholder="Mô tả về chỗ ở"
        onChange={(e) => handleUpdateAddingHost("description", e.target.value)}
        multiline
        rows={4}
        fullWidth
        defaultValue={addingHost.description}
      />
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
