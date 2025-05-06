import React, { useState, useEffect } from "react";
import { useLocation } from "react-router-dom";
import { Test } from "../helper/pagination";
import { useData } from "../helper/searchData";

export default function SearchPage(item) {
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

  const location = useLocation();
  const urlParams = new URLSearchParams(location.search);
  const urlValue = urlParams.get('url');
  const value = urlParams.get('value');
  const page = urlParams.get('page') || '1';
  const images = useData(img, urlValue, value);
  const updatedSearch = new URLSearchParams(location.search);
  updatedSearch.delete('page');
  return (
    <div>
      <div>
        <Test
          currentPage={Number(page)}
          location={location.pathname + "?" + updatedSearch.toString()}
          images={images}
          childWidth={item.Width}
        />
      </div>
    </div>
  );
}
