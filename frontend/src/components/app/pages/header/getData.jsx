import React, { useState, useEffect } from 'react';

export function Data(url) {  
  const [data, setData] = useState([]);

  useEffect(() => {
    fetch(`http://localhost/kimdong_bookstore/frontend/src/components/app/BackEnd/php/php/getSearch.php?&url=${encodeURIComponent(url)}`)
      .then((response) => response.json())
      .then((data) => {
        setData(data);
      })
      .catch((error) => {
        // console.error("Error fetching data:", error);
      });
  }, [url]); 

  return data;
}
