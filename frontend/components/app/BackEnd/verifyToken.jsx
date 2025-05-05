export const verifyToken = async (token) => {
    try {
        const response = await fetch('http://localhost/kimdong_bookstore/frontend/components/app/BackEnd/php/uploads/verify.php', {
            method: 'POST',
            headers: {
                'Authorization': `Bearer ${token}`,
                'Content-Type': 'application/json'
            }
        });

        if (!response.ok) {
            throw new Error('Network response was not ok');
        }

        const data = await response.json();
        return data; 
    } catch (error) {
        console.error('Đã xảy ra lỗi:', error);
        return { success: false, message: 'Đã xảy ra lỗi trong quá trình xác thực.' };
    }
};