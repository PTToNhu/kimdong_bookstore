import React, { useState, useEffect } from 'react';

export function Data(url, variable) {  
  const [data, setData] = useState([]);
  useEffect(() => {
    fetch(`http://localhost/kimdong_bookstore/api/BackEnd/php/getdata.php?&url=${encodeURIComponent(url)}&variable=${encodeURIComponent(variable)}`)
      .then((response) => response.json())
      .then((data) => {
        setData(data);
      })
      .catch((error) => {
        console.error("Error fetching data:", error);
      });
  }, [url, variable]); 
  return data;
}
