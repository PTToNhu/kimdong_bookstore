import React, { useState, useEffect } from 'react';

export function Data(variable) {  
  const [data, setData] = useState([]);
  useEffect(() => {
    fetch(`http://localhost/kimdong_bookstore/frontend/components/app/BackEnd/php/uploads/getOrder.php?variable=${encodeURIComponent(variable)}`)
      .then((response) => response.json())
      .then((data) => {
        setData(data);
      })
      .catch((error) => {
        console.error("Error fetching data:", error);
      });
  }, ); 
  console.log(data);
  return data;
}
