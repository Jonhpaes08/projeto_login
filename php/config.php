<?php

// Informações do Aplicativo
define('APP_NAME', 'Meu Sistema de Login');
define('PAGE_TITLE', 'Login');
define('BASE_URL', 'http://localhost/meu_sistema_login/');
define('DEBUG_MODE', true); // Exibir erros em detalhes (true) ou ocultar (false)

// Configurações de Email (exemplo)
define('EMAIL_HOST', 'smtp.example.com'); // Host do servidor de email
define('EMAIL_PORT', 587); // Porta do servidor de email
define('EMAIL_USERNAME', 'sac@imporsale.com'); // Nome de usuário do email
define('EMAIL_PASSWORD', 'sua_senha_secreta'); // Senha do email
define('EMAIL_FROM', 'sac@imporsale.com'); // Endereço de email do remetente
define('EMAIL_NAME_FROM', 'Suporte Meu Sistema'); // Nome do remetente dos emails

// Configurações de Sessão (exemplo)
define('SESSION_NAME', 'meu_sistema_login'); // Nome da sessão PHP
define('SESSION_EXPIRY', 3600); // Tempo de expiração da sessão em segundos (1 hora)
define('SESSION_PATH', '/tmp/sessões'); // Caminho para o diretório de sessões

// ... (outras configurações globais)