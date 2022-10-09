import useLocationForm from "./useLocation";
import CountrySelect from "../CountrySelect";
import { useState } from "react";
import { Autocomplete, TextField } from "@mui/material";

function LocationForm() {
  const { state, onCitySelect, onDistrictSelect, onWardSelect, onSubmit } =
    useLocationForm(false);
  const {
    cityOptions,
    districtOptions,
    wardOptions,
    selectedCity,
    selectedDistrict,
    selectedWard,
  } = state;
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
        }}
        value={selectedCity}
      />
      <Autocomplete
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
      />
      <TextField label="Tên đường" sx={{ width: "45%" }} />
      <TextField label="Địa chỉ" sx={{ width: "45%" }} />
    </div>
  );
}

export default LocationForm;
