import React, { useState } from "react";

const AboutUsEdit = () => {
    const [formData, setFormData] = useState({
        intro_title: "",
        intro_subtitle: "",
        intro_highlight: "",
        intro_content: "",
        intro_image: null,
    });

    const handleChange = (e) => {
        const { name, value, files } = e.target;
        setFormData((prev) => ({
            ...prev,
            [name]: files ? files[0] : value,
        }));
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        const data = new FormData();
        for (let key in formData) {
            data.append(key, formData[key]);
        }

        const res = await fetch("http://localhost/kim_dong/api/update_aboutus.php", {
            method: "POST",
            body: data,
        });

        const result = await res.text();
        alert(result);
    };

    const previewImage = () => {
        const input = document.getElementById('intro_image');
        const preview = document.getElementById('image_preview');
        const file = input.files[0];
        if (file) {
            preview.src = URL.createObjectURL(file);
            preview.style.display = 'block';
        }
    };

    return (
        <div id="app">

            {/* Main content */}
            <div id="main">
                <header className="mb-3 px-4">
                    <h3>Quản trị - About Us</h3>
                </header>

                <div className="page-content px-4">
                    <form onSubmit={handleSubmit} encType="multipart/form-data" className="p-4 border rounded bg-white shadow-sm">
                        <h4 className="mb-4">Chỉnh sửa phần Intro</h4>

                        <div className="mb-3">
                            <label className="form-label">Tiêu đề</label>
                            <input type="text" className="form-control" name="intro_title" onChange={handleChange} required />
                        </div>

                        <div className="mb-3">
                            <label className="form-label">Phụ đề</label>
                            <input type="text" className="form-control" name="intro_subtitle" onChange={handleChange} />
                        </div>

                        <div className="mb-3">
                            <label className="form-label">Highlight</label>
                            <input type="text" className="form-control" name="intro_highlight" onChange={handleChange} />
                        </div>

                        <div className="mb-3">
                            <label className="form-label">Nội dung</label>
                            <textarea className="form-control" name="intro_content" rows="5" onChange={handleChange} required></textarea>
                        </div>

                        <div className="mb-3">
                            <label className="form-label">Ảnh minh họa</label>
                            <input type="file" className="form-control" name="intro_image" id="intro_image" onChange={(e) => { handleChange(e); previewImage(); }} />
                            <img id="image_preview" src="" alt="" className="img-fluid mt-3" style={{ maxWidth: '200px', display: 'none' }} />
                        </div>

                        <button type="submit" className="btn btn-primary">Lưu thông tin</button>
                    </form>
                </div>
            </div>
        </div>
    );
};

export default AboutUsEdit;
