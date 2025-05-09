document.addEventListener("DOMContentLoaded", () => {
  // Kiểm tra theme hiện tại và thiết lập các tùy chọn theme
  const themeOptions = document.body.classList.contains("dark")
    ? {
        skin: "oxide-dark",
        content_css: "dark",
      }
    : {
        skin: "oxide",
        content_css: "default",
      };

  // Cấu hình cho editor đầu tiên
  tinymce.init({
    selector: "#default",
    plugins: "image code", // Thêm plugin image
    toolbar:
      "undo redo styleselect bold italic alignleft aligncenter alignright bullist numlist outdent indent code image", // Thêm nút "image"
    image_uploadtab: true, // Kích hoạt tab upload image
    automatic_uploads: true, // Tự động upload ảnh khi được chèn vào
    images_upload_url:
      "http://localhost/kimdong_bookstore/api/upload/UploadFile", // Đường dẫn xử lý upload ảnh (cần thay đổi cho phù hợp với server của bạn)
    file_picker_types: "image", // Đảm bảo chỉ chọn ảnh
    file_picker_callback: function (callback, value, meta) {
      var input = document.createElement("input");
      input.setAttribute("type", "file");
      input.setAttribute("accept", "image/*");

      input.onchange = function () {
        var file = input.files[0];
        var reader = new FileReader();

        reader.onload = function () {
          // Gửi ảnh lên server hoặc chèn ảnh trực tiếp vào nội dung
          var formData = new FormData();
          formData.append("file", file);

          fetch("http://localhost/kimdong_bookstore/api/upload/UploadFile", {
            method: "POST",
            body: formData,
          })
            .then((response) => response.json())
            .then((data) => {
              console.log("Upload response:", data);

              if (data && typeof data.location === "string") {
                callback(data.location);
              } else {
                console.error("Upload failed: Invalid response format");
                alert(`Upload ảnh thất bại: ${data}.`);
              }
            })
            .catch((error) => console.error("Error uploading image:", error));
        };
        reader.readAsDataURL(file);
      };
      input.click();
    },
    ...themeOptions,
  });

  // Cấu hình cho editor thứ hai (dark mode)
  tinymce.init({
    selector: "#dark",
    plugins: "image code", // Thêm plugin image
    toolbar:
      "undo redo styleselect bold italic alignleft aligncenter alignright bullist numlist outdent indent code image", // Thêm nút "image"
    image_uploadtab: true, // Kích hoạt tab upload image
    automatic_uploads: true, // Tự động upload ảnh khi được chèn vào
    images_upload_url:
      "http://localhost/kimdong_bookstore/api/upload/UploadFile", // Đường dẫn xử lý upload ảnh
    file_picker_types: "image", // Đảm bảo chỉ chọn ảnh
    file_picker_callback: function (callback, value, meta) {
      var input = document.createElement("input");
      input.setAttribute("type", "file");
      input.setAttribute("accept", "image/*");

      input.onchange = function () {
        var file = input.files[0];
        console.log("file", file);
        var reader = new FileReader();

        reader.onload = function () {
          var formData = new FormData();
          formData.append("file", file);

          fetch("/http://localhost/kimdong_bookstore/api/upload/UploadFile", {
            method: "POST",
            body: formData,
          })
            .then((response) => response.json())
            .then((data) => {
              callback(data.location);
            })
            .catch((error) => console.error("Error uploading image:", error));
        };
        reader.readAsDataURL(file);
      };
      input.click();
    },
    ...themeOptions,
  });
});
