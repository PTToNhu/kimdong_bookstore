export const userPostFetch = (userId, identifier) => {
    console.log(userId);
  return (dispatch) => {
    return fetch(
      "http://localhost/kimdong_bookstore/frontend/components/app/BackEnd/php/uploads/getToken.php",
      {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
        },
        body: JSON.stringify({ userId, identifier }),
      }
    )
      .then((resp) => resp.json())
      .then((data) => {
        console.log("userId",userId);
        if (data.message) {
          alert(data.message);
        } else {
            console.log(data.jwt);
          localStorage.setItem("token", data.jwt);
          dispatch(loginUser(data.user));
        }
      })
      .catch((error) => {
        console.log("Đã xảy ra lỗi trong quá trình gửi yêu cầu:", error);
        alert("Không thể hoàn thành yêu cầu. Vui lòng thử lại.");
      });
  };
};

const loginUser = (userObj) => ({
  type: "LOGIN_USER",
  payload: userObj,
});
