import React, { useState, useEffect } from "react";
import { useLocation } from "react-router-dom";
import { Test } from "../helper/pagination";
import { useData } from "../helper/getData";

export default function Van_hoc_Viet_Nam(item) {
  const [img, setImages] = useState([]);

  useEffect(() => {
    async function loadImages() {
      const imagePaths = import.meta.glob(
        "../../../../../../api/BackEnd/images/van_hoc_viet_nam/**/*.{jpg,jpeg,png,gif,svg,webp}"
      );
      const imagePromises = Object.values(imagePaths).map((importer) =>
        importer()
      );
      const loadedImages = await Promise.all(imagePromises);
      setImages(loadedImages.map((module) => module.default));
    }

    loadImages();
  }, []);
  const images = useData(img, "van_hoc_Viet_Nam");
  const location = useLocation();
  const urlParams = new URLSearchParams(location.search);
  const page = urlParams.get('page') || '1';

  return (
    <div>
      <Test
        currentPage={Number(page)}
        location={location.pathname}
        images={images}
        childWidth={item.Width}
      />
    </div>
  );
}
