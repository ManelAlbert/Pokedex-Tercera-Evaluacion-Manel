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

// Incluimos la habilidad en el SELECT y hacemos JOIN con la tabla habilidades
$query = "SELECT p.id, p.numero_pokedex, p.name, p.sprite_url, p.type1, p.type2, h.nombre AS habilidad
          FROM pokemon p
          LEFT JOIN habilidades h ON p.habilidad_id = h.id
          WHERE 1=1";

if (!empty($nombre)) {
    $query .= " AND p.name LIKE '%$nombre%'";
}

if (!empty($generacion)) {
    $query .= " AND p.generation = '$generacion'";
}

if (!empty($tipo)) {
    $query .= " AND (p.type1 = '$tipo' OR p.type2 = '$tipo')";
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
