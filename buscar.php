<?php
header('Access-Control-Allow-Origin: *'); // 👈 Añadido para solucionar CORS
header('Content-Type: application/json');

$host = 'localhost';
$user = 'manel'; 
$password = '1234-Abcd'; 
$database = 'pokedex';

$conn = mysqli_connect($host, $user, $password, $database);

if (!$conn) {
    echo json_encode(["error" => "Error de conexión: " . mysqli_connect_error()]);
    exit;
}

$nombre = isset($_POST['nombre']) ? mysqli_real_escape_string($conn, $_POST['nombre']) : '';
$generacion = isset($_POST['generacion']) ? mysqli_real_escape_string($conn, $_POST['generacion']) : '';
$tipo = isset($_POST['tipo']) ? mysqli_real_escape_string($conn, $_POST['tipo']) : '';

$query = "SELECT id, name, sprite_url, type1, type2 FROM pokemon WHERE 1=1";

if (!empty($nombre)) {
    $query .= " AND name LIKE '%$nombre%'";
}

if (!empty($generacion)) {
    $query .= " AND generation = '$generacion'";
}

if (!empty($tipo)) {
    $query .= " AND (type1 = '$tipo' OR type2 = '$tipo')";
}

$result = mysqli_query($conn, $query);

if (!$result) {
    echo json_encode(["error" => "Error en la consulta: " . mysqli_error($conn)]);
    mysqli_close($conn);
    exit;
}

$pokemons = [];

while ($row = mysqli_fetch_assoc($result)) {
    $pokemons[] = $row;
}

echo json_encode($pokemons);

mysqli_close($conn);
?>
