import React, { useEffect, useState } from "react";
import axios from "axios";
import { MapContainer, TileLayer, Marker, Popup, useMap } from "react-leaflet";
import L from "leaflet";
import './contact.css';
import "leaflet/dist/leaflet.css";

// Fix lỗi marker không hiện
delete L.Icon.Default.prototype._getIconUrl;
L.Icon.Default.mergeOptions({
  iconRetinaUrl:
    "https://unpkg.com/leaflet@1.9.3/dist/images/marker-icon-2x.png",
  iconUrl: "https://unpkg.com/leaflet@1.9.3/dist/images/marker-icon.png",
  shadowUrl: "https://unpkg.com/leaflet@1.9.3/dist/images/marker-shadow.png",
});

// Component dùng để cập nhật vị trí trung tâm bản đồ
const MapUpdater = ({ position }) => {
  const map = useMap();
  useEffect(() => {
    if (position) {
      map.setView(position, 16); // 16 là zoom level
    }
  }, [position, map]);
  return null;
};

const OSMMap = ({ address }) => {
  const [position, setPosition] = useState(null);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchCoordinates = async () => {
      try {
        const response = await axios.get(
          "https://nominatim.openstreetmap.org/search",
          {
            params: {
              q: address,
              format: "json",
              limit: 1,
            },
          }
        );

        if (response.data.length > 0) {
          const { lat, lon } = response.data[0];
          setPosition([parseFloat(lat), parseFloat(lon)]);
          setError(null);
        } else {
          setError("Không tìm thấy địa chỉ.");
          setPosition(null);
        }
      } catch (err) {
        setError("Lỗi khi lấy tọa độ từ địa chỉ.");
        setPosition(null);
      }
    };

    fetchCoordinates();
  }, [address]);

  return (
    <>
      {position ? (
        <MapContainer center={position} zoom={16} scrollWheelZoom={true} style={{ height: "400px", width: "100%" }}>
          <TileLayer
            attribution='© <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>'
            url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
          />
          <MapUpdater position={position} />
          <Marker position={position}>
            <Popup>{address}</Popup>
          </Marker>
        </MapContainer>
      ) : (
        <p>{error || "Đang tải bản đồ..."}</p>
      )}
    </>
  );
};

export default OSMMap;
