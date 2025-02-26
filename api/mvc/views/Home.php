<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h2>Homepage</h2>
    <?php
    while ($row = mysqli_fetch_array($data["Danh_muc"]))
        echo $row["Name"] . "</br>";
    ?>
</body>
</html>