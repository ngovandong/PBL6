import LocationForm from "../../../components/Location/LocationForm";
import React, { useState } from "react";
import { GoogleMap, LoadScript, Marker } from "@react-google-maps/api";

const containerStyle = {
  width: "800px",
  height: "300px",
};

const center = {
  lat: 16.0811706,
  lng: 108.1547376,
};

function LocationStep() {
  const [position, setPosition] = useState(center);
  const [placeId, setPlaceId] = useState();

  return (
    <div className="tab-container">
      <LocationForm />
      <p className="section-tile">Đánh dấu địa chỉ của bạn trên bản đồ</p>
      <div className="map-container">
        <LoadScript googleMapsApiKey={process.env.REACT_APP_GOOGLE_API_KEY}>
          <GoogleMap
            onClick={(e) => {
              console.log(e);
              setPosition({ lat: e.latLng.lat(), lng: e.latLng.lng() });
              setPlaceId(e.placeId);
            }}
            mapContainerStyle={containerStyle}
            center={center}
            zoom={15}
          >
            <Marker position={position} />
          </GoogleMap>
        </LoadScript>
      </div>
    </div>
  );
}

export default LocationStep;
