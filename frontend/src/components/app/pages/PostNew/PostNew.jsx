import React from "react";
import { Editor } from "@tinymce/tinymce-react";
import { useRef } from "react";
const MyEditor = () => {
  const editorRef = useRef(null);

  const handleSubmit = () => {
    if (editorRef.current) {
      const content = editorRef.current.getContent();
      console.log("Nội dung bài viết:", content);
    }
  };

  return (
    <div>
      <Editor
        apiKey="5rlpqzuped7jy9cgv8efkxwrcpr8kpmzyon4f9p294wdsdrx"
        onInit={(evt, editor) => (editorRef.current = editor)}
        initialValue="<p>Nhập nội dung bài viết tại đây...</p>"
        init={{
          height: 500,
          menubar: true,
          plugins: [
            "advlist",
            "autolink",
            "lists",
            "link",
            "image",
            "charmap",
            "preview",
            "anchor",
            "searchreplace",
            "visualblocks",
            "code",
            "fullscreen",
            "insertdatetime",
            "media",
            "table",
            "code",
            "help",
            "wordcount",
          ],
          toolbar:
            "undo redo | blocks | bold italic underline | alignleft aligncenter alignright alignjustify | " +
            "bullist numlist outdent indent | link image | preview code fullscreen",

          images_upload_handler: function (blobInfo, success, failure) {
            const formData = new FormData();
            formData.append("file", blobInfo.blob());

            fetch(
              "http://localhost/kimdong_bookstore/index.php?controller=upload&action=UploadFile",
              {
                method: "POST",
                body: formData,
              }
            )
              .then((res) => res.json())
              .then((json) => {
                console.log(json);
                if (json.location) {
                  success(json.location); // trả đường dẫn ảnh về cho TinyMCE
                } else {
                  failure(json.error || "Lỗi không rõ.");
                }
              })
              .catch(() => {
                failure("Lỗi kết nối server.");
              });
          },
          content_style:
            "body { font-family:Helvetica,Arial,sans-serif; font-size:14px }",
        }}
      />
      <button
        onClick={handleSubmit}
        className="mt-4 bg-blue-600 text-white px-4 py-2 rounded"
      >
        Lưu bài viết
      </button>
    </div>
  );
};

export default MyEditor;
