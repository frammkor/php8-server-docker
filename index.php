<?php

$connect = mysqli_connect(
    'database', # service name
    'php_docker', # username
    'password', # password
    getenv('DB_DATABASE'), # db table NOT WORKING
);

$table_name = "NOTIFICATION";

$query = "SELECT * FROM $table_name";

$response = mysqli_query($connect, $query);

echo "<strong>$table_name: </strong>";
while($i = mysqli_fetch_assoc($response))
{
    echo "<p>".$i['title']."</p>";
    echo "<p>".$i['notiDescription']."</p>";
    echo "<p>".$i['lastUpdated']."</p>";
    echo "<hr>";
}