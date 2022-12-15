import LocationForm from "../../../components/Location/LocationForm";
import React, { useState } from "react";
import { GoogleMap, LoadScript, Marker } from "@react-google-maps/api";
import {
  handleUpdateAddingHost,
  selectAddingHost,
} from "../../../app/store/hostSlice";
import { useSelector } from "react-redux";

const containerStyle = {
  width: "800px",
  height: "300px",
};

const center = {
  lat: 16.0811706,
  lng: 108.1547376,
};

function LocationStep() {
  // const [placeId, setPlaceId] = useState();
  const addingHost = useSelector(selectAddingHost);
  const initialState = addingHost.latitude
    ? { lat: addingHost.latitude, lng: addingHost.longitude }
    : center;
  const [position, setPosition] = useState(initialState);

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
              handleUpdateAddingHost("longitude", e.latLng.lng());
              handleUpdateAddingHost("latitude", e.latLng.lat());
              // setPlaceId(e.placeId);
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
