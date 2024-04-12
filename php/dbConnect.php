<?php

// Conexão com o banco de dados
$dbhost = 'localhost'; // Insira o host do banco de dados
$dbuser = 'root'; // Insira o nome de usuário do banco de dados
$dbpass = 'root'; // Insira a senha do banco de dados
$dbname = 'projeto_login_db'; // Insira o nome do banco de dados

$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);

// Verifique se a conexão foi bem-sucedida
if (!$conn) {
    die("Erro de conexão com o banco de dados: " . mysqli_connect_error());
}

// Selecione o banco de dados
mysqli_select_db($conn, $dbname);