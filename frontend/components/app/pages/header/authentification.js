import jwt from 'jsonwebtoken';
export default function authentification(user_id, identifier ){
    const payload = { userId: data.user_id, username: identifier };
    const secretKey = "your_secret_key"; 
    const token = jwt.sign(payload, secretKey, { expiresIn: "1h" });

    localStorage.setItem("token", token);
    console.log("Token đã được tạo:", token);
}