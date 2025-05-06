import { useLocation } from "react-router-dom";
import { Test } from "../helper/pagination";
import { useData } from "../helper/getData";
import React, { useRef, useEffect, useState } from "react";

export const Favorite = (item) => {
  const [img, setImages] = useState([]);
  const [favourite, setFavourite] = useState([]);



  useEffect(() => {
    async function loadImages() {
      const imagePaths = import.meta.glob('../../BackEnd/php/images/tat_ca_san_pham/**/*.{jpg,jpeg,png,gif,svg,webp}');
      const imagePromises = Object.values(imagePaths).map(importer => importer());
      const loadedImages = await Promise.all(imagePromises);
      setImages(loadedImages.map(module => module.default));
    }
    loadImages();
  }, []);

  const location = useLocation();
  const urlParams = new URLSearchParams(location.search);
  const page = urlParams.get('page') ? urlParams.get('page') : 1;

  function getCookie(name) {
    const value = `; ${document.cookie}`;
    const parts = value.split(`; ${name}=`);
    if (parts.length === 2) return parts.pop().split(";").shift();
  }

  const fetchDataID = async () => {
    try {
      const response = await fetch(
        `http://localhost/kimdong_bookstore/frontend/src/components/app/BackEnd/php/php/getAllFavorite.php?phone=${encodeURIComponent(
          item.ID
        )}`
      );
      const data = await response.json();
      setFavourite(data);
    } catch (error) {
    }
  };

  const fetchData = async () => {
    const currentFavorites = getCookie("Favorite");
    const favoritesArray = currentFavorites ? currentFavorites.split(",") : [];
    const favourite = [];

    if (favoritesArray.length > 0) {
      const promises = favoritesArray.map(async (element_id) => {
        const response = await fetch(
          `http://localhost/kimdong_bookstore/frontend/src/components/app/BackEnd/php/php/getdataFromID.php?variable=${encodeURIComponent(
            element_id
          )}`
        );
        if (!response.ok) {
          throw new Error(`Error fetching data for ID ${element_id}`);
        }
        const data = await response.json();
        favourite.push(data[0]);
      });
      await Promise.all(promises);
    }
    setFavourite(favourite);
    return favourite;
  };

  useEffect(() => {
    if (!item.ID) {
      fetchData();
    } else {
      fetchDataID();
    }
  }, [getCookie("Favorite"), item.ID]);


  let image = useState([]);

  const getImg = (img) => {
    let result = [];
    if (favourite.length > 0)
      favourite.forEach((element) => {
        const filteredImages = img.filter((ele) => {
          const fileName = ele.split("/");
          const pathParts = fileName[fileName.length - 1].split("_");
          return (
            pathParts.includes("0") && pathParts.includes(element.id.toString())
          );
        });
        result.push(filteredImages);
      });
    result = result.flat();
    return result;
  };

  image = getImg(img);

  const images = useData(image, "tat_ca_san_pham", "");

  return (
    <div>
      <Test
        currentPage={Number(page)}
        location={location.pathname}
        images={images}
        childWidth={item.Width}
        favourite={favourite}
      />
    </div>
  );
};

export default Favorite;
