import {
  Checkbox,
  FormControlLabel,
  FormGroup,
  InputAdornment,
  OutlinedInput,
  Switch,
} from "@mui/material";
import { useSelector } from "react-redux";
import {
  handleUpdateAddingHost,
  selectAddingHost,
} from "../../../app/store/hostSlice";
import { AMENITIES } from "../../../constants/amenities";

function Amenities() {
  const addingHost = useSelector(selectAddingHost);
  const outstandingUtilities = addingHost.outstandingUtilities
    ? addingHost.outstandingUtilities
    : [];
  const chooesedAmenities = {};
  outstandingUtilities.forEach((e) => {
    chooesedAmenities[e] = true;
  });

  const utilities = addingHost.utilities ? addingHost.utilities : [];
  const chooesedUtilities = {};
  utilities.forEach((e) => {
    chooesedUtilities[e] = true;
  });

  const handleChooseUtilities = (key) => {
    chooesedUtilities[key] = !chooesedUtilities[key];
    let result = [];
    for (const property in chooesedUtilities) {
      if (chooesedUtilities[property]) {
        result.push(property);
      }
    }
    handleUpdateAddingHost("utilities", result);
  };

  const handleChooes = (key) => {
    chooesedAmenities[key] = !chooesedAmenities[key];
    let result = [];
    for (const property in chooesedAmenities) {
      if (chooesedAmenities[property]) {
        result.push(property);
      }
    }
    handleUpdateAddingHost("outstandingUtilities", result);
  };

  return (
    <div className="tab-container">
      <p className="section-tile">Các tiện nghi nổi bật</p>
      <div className="amenities-container">
        {AMENITIES.map((a) => (
          <FormControlLabel
            style={{ width: "45%" }}
            key={a.code}
            control={
              <Checkbox
                checked={Boolean(chooesedAmenities[a.code])}
                onChange={() => handleChooes(a.code)}
              />
            }
            label={a.label}
          />
        ))}
      </div>
      <p className="section-tile">Các tiện nghi khác</p>
      <div className="amenities-container">
        {AMENITIES.map((a) => (
          <FormControlLabel
            style={{ width: "45%" }}
            key={a.code}
            control={
              <Checkbox
                checked={Boolean(chooesedUtilities[a.code])}
                onChange={() => handleChooseUtilities(a.code)}
              />
            }
            label={a.label}
          />
        ))}
      </div>
      <p className="section-tile">Các dịch vụ</p>

      <FormGroup>
        <div className="service-row">
          <FormControlLabel
            control={
              <Switch
                checked={addingHost.breakfast}
                onChange={(e) =>
                  handleUpdateAddingHost("breakfast", e.target.checked)
                }
              />
            }
            label="Phục vụ bữa sáng"
            style={{ width: "51%" }}
          />
          {addingHost.breakfast && (
            <OutlinedInput
              endAdornment={<InputAdornment position="end">đ</InputAdornment>}
              inputProps={{
                "aria-label": "weight",
                placeholder: "Phí bữa sáng",
                min: "0",
                type: "number",
              }}
              type="number"
              onChange={(e) =>
                handleUpdateAddingHost("breakfastFee", Number(e.target.value))
              }
              defaultValue={
                addingHost.breakfastFee ? addingHost.breakfastFee : null
              }
            />
          )}
        </div>
        <div className="service-row">
          <FormControlLabel
            control={
              <Switch
                checked={addingHost.parkingLot}
                onChange={(e) =>
                  handleUpdateAddingHost("parkingLot", e.target.checked)
                }
              />
            }
            label="Bãi đỗ xe"
          />
          {addingHost.parkingLot && (
            <OutlinedInput
              endAdornment={<InputAdornment position="end">đ</InputAdornment>}
              inputProps={{
                "aria-label": "weight",
                placeholder: "Phí đỗ xe",
                min: "0",
                type: "number",
              }}
              onChange={(e) =>
                handleUpdateAddingHost("parkingLotFee", Number(e.target.value))
              }
              defaultValue={
                addingHost.parkingLotFee ? addingHost.parkingLotFee : null
              }
            />
          )}
        </div>
        <div className="service-row">
          <FormControlLabel
            control={
              <Switch
                checked={addingHost.currencyService}
                onChange={(e) =>
                  handleUpdateAddingHost("currencyService", e.target.checked)
                }
              />
            }
            label="Dịch vụ đổi tiền"
          />
        </div>
      </FormGroup>
    </div>
  );
}

export default Amenities;
