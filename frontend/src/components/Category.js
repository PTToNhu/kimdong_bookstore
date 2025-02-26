import { useState, useEffect } from "react";
import axios from "axios";

export default function Category() {
  const [data, setData] = useState([]);

  useEffect(() => {
    getCategory();
  }, []);
  function getCategory() {
    axios
      .get("http://localhost/kimdong_bookstore/api/home")
      .then((response) => {
        console.log("API response:", response);
        setData(response.data);
      })
      .catch((error) => {
        console.error("Error fetching data:", error); // Kiểm tra lỗi nếu có
      });
  }
  return (
    <div>
      <pre>{JSON.stringify(data, null, 2)}</pre>
    </div>
  );
}
