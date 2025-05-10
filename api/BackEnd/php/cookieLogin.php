<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
error_reporting(E_ALL);
ini_set('display_errors', 1);

$currentPage = $_SERVER['REQUEST_URI'];

$user = isset($_GET['user']) ? $_GET['user'] : null;
$password = isset($_GET['password']) ? $_GET['password'] : null;

echo json_encode(['user' => $user, 'password' => $password]);
?>

<script>
    function setCookie(name, value, days) {
        let expires = "";
        if (days) {
            const date = new Date();
            date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
            expires = "; expires=" + date.toUTCString();
        }
        document.cookie = name + "=" + (value || "") + expires + "; path=/";
    }

    function getAllCookies() {
        return document.cookie.split('; ').map(cookie => {
            const [name, value] = cookie.split('=');
            return { name, value };
        });
    }

    function showCookies() {
        const cookies = getAllCookies();
        const cookieList = cookies.map(cookie => `${cookie.name}=${cookie.value}`).join(', ');
    }

    function addCookie() {
        const User = "<?php echo addslashes($user); ?>";
        const password = "<?php echo addslashes($password); ?>";
        
        if (User && password) {
            setCookie("User", User, 7); 
            setCookie("password", password, 7); 
            showCookies();
            clearInputFields();
        }
    }

    function deleteCookie(name) {
        setCookie(name, "", -1); 
        showCookies();
    }

    addCookie();
</script>