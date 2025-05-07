export const verifyToken = async (token) => {

        const response = await fetch('http://localhost/kimdong_bookstore/frontend/src/components/app/BackEnd/php/php/verify.php', {
            method: 'POST',
            headers: {
                'Authorization': `Bearer ${token}`,
                'Content-Type': 'application/json'
            }
        });

        if (!response.ok) {
            const errorData = await response.json();
            throw new Error(`Error: ${errorData.message}`);
        }

        const data = await response.json();

        return data; 

};