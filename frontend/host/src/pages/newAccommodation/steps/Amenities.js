import { Checkbox, FormControlLabel } from "@mui/material";
import { useState } from "react";

const amenities = [
  { label: "Wi-Fi miễn phí", code: "wifi" },
  { label: "Nhà hàng", code: "restaurant" },
  { label: "Quầy bar", code: "bar" },
  { label: "Dịch vụ phòng", code: "roomService" },
  { label: "Lễ tân 24 giờ", code: "reception24h" },
  { label: "Phòng xông hơi", code: "sauna" },
  { label: "Trung tâm thể dục", code: "gym" },
  { label: "Sân vườn", code: "garden" },
  { label: "Sân thượng/ hiên", code: "terrace" },
  { label: "Phòng không hút thuốc", code: "nonSmokingRoom" },
  { label: "Xe đưa đón sân bay", code: "airportShuttle" },
  { label: "Phòng gia đình", code: "familyRoom" },
  { label: "Trung tâm Spa & chăm sóc sức khoe", code: "spa" },
  { label: "Bồn tắm nóng/bể sục (jacuzzi)", code: "jacuzzi" },
  { label: "Điều hòa nhiệt độ", code: "AC" },
  { label: "Hồ bơi", code: "swimmingPool" },
  { label: "Bãi biển", code: "beach" },
];
function Amenities() {
  const [chooesedAmenities, setChooesedAmenities] = useState({
    wifi: false,
    restaurant: false,
    bar: false,
    roomService: false,
    reception24h: false,
    sauna: false,
    gym: false,
    garden: false,
    nonSmokingRoom: false,
    airportShuttle: false,
    familyRoom: false,
    spa: false,
    jacuzzi: false,
    AC: false,
    swimmingPool: false,
    beach: false,
  });
  const handleChooes = (key) => {
    setChooesedAmenities((pre) => ({ ...pre, [key]: !pre[key] }));
  };
  return (
    <div className="tab-container">
      <p className="section-tile">Chọn các tiện nghi</p>
      <div className="amenities-container">
        {amenities.map((a) => (
          <FormControlLabel
            style={{ width: "45%" }}
            key={a.code}
            control={
              <Checkbox
                checked={chooesedAmenities[a.code]}
                onChange={() => handleChooes(a.code)}
              />
            }
            label={a.label}
          />
        ))}
      </div>
    </div>
  );
}

export default Amenities;
