import React, { useState, useEffect } from "react";
import { useLocation } from "react-router-dom";
import { Test } from "../helper/pagination";
import { useData } from "../helper/getData";

export default function Kien_thuc_khoa_hoc(item) {
  const [img, setImages] = useState([]);

  useEffect(() => {
    async function loadImages() {
      const imagePaths = import.meta.glob(
        "../../BackEnd/php/images/tat_ca_san_pham/**/*.{jpg,jpeg,png,gif,svg,webp}"
      );
      const imagePromises = Object.values(imagePaths).map((importer) =>
        importer()
      );
      const loadedImages = await Promise.all(imagePromises);
      setImages(loadedImages.map((module) => module.default));
    }

    loadImages();
  }, []);
  const images = useData(img, "kien_thuc_khoa_hoc");
  const location = useLocation();
  const urlParams = new URLSearchParams(location.search);
  const page = urlParams.get('page') || '1';

  return (
    <div>
      <div className="flex relative">
        <Test
          currentPage={Number(page)}
          location={location.pathname}
          images={images}
          childWidth={item.Width}
        />
      </div>
    </div>
  );
}
