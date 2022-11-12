import useLocationForm from "./useLocation";
import CountrySelect from "../CountrySelect";
import { Autocomplete, TextField } from "@mui/material";
import { useEffect } from "react";
import {
  handleUpdateAddingHost,
  selectAddingHost,
} from "../../app/store/hostSlice";
import { useSelector } from "react-redux";

function LocationForm() {
  const { state, onCitySelect, onDistrictSelect, onWardSelect } =
    useLocationForm(false);
  const {
    cityOptions,
    districtOptions,
    wardOptions,
    selectedCity,
    selectedDistrict,
    selectedWard,
  } = state;

  const addingHost = useSelector(selectAddingHost);
  useEffect(() => handleUpdateAddingHost("country", "Vietnam"), []);
  return (
    <div className="location-container">
      <CountrySelect />
      <Autocomplete
        disablePortal
        options={cityOptions}
        sx={{ width: "45%" }}
        renderInput={(params) => <TextField {...params} label="Tỉnh/Thành" />}
        onChange={(_, value) => {
          onCitySelect(value);
          handleUpdateAddingHost("province", value.label);
        }}
        value={addingHost.province}
      />
      {/* <Autocomplete
        disablePortal
        disabled={districtOptions.length === 0}
        options={districtOptions}
        sx={{ width: "45%" }}
        renderInput={(params) => <TextField {...params} label="Huyện/Quận" />}
        onChange={(_, value) => onDistrictSelect(value)}
        value={selectedDistrict}
      />
      <Autocomplete
        disablePortal
        disabled={wardOptions.length === 0}
        options={wardOptions}
        sx={{ width: "45%" }}
        renderInput={(params) => <TextField {...params} label="Xã/Phường" />}
        onChange={(_, value) => onWardSelect(value)}
        value={selectedWard}
      /> */}
      <TextField
        label="Post code"
        sx={{ width: "45%" }}
        type="text"
        onChange={(e) => handleUpdateAddingHost("postalCode", e.target.value)}
        defaultValue={addingHost.postalCode}
      />
      <TextField
        label="Địa chỉ"
        sx={{ width: "45%" }}
        onChange={(e) => handleUpdateAddingHost("address", e.target.value)}
        defaultValue={addingHost.address}
      />
    </div>
  );
}

export default LocationForm;
