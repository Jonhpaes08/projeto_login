SET time_zone = "+00:00";
CREATE TABLE usuarios (
  id_usuario INT PRIMARY KEY AUTO_INCREMENT,    /* id_usuario: Identificador único para cada usuário (chave primária auto-incrementada). */
  nome VARCHAR(255) NOT NULL,   /* nome: Nome do usuário (não pode ser nulo). */
  email VARCHAR(255) NOT NULL UNIQUE,   /* email: Endereço de e-mail do usuário (único, não pode ser nulo). */
  senha VARCHAR(255) NOT NULL,  /* senha: Senha do usuário (não pode ser nula). */
  data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,  /* data_criacao: Data e hora de criação do registro do usuário. */
  data_atualizacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE    CURRENT_TIMESTAMP   /* data_atualizacao: Data e hora da última atualização do registro do usuário. */
);
CREATE TABLE tokens (
  id_token INT PRIMARY KEY AUTO_INCREMENT, /* id_token: Identificador único para cada token.  */
  id_usuario INT NOT NULL,  /* id_usuario: ID do usuário associado ao token.  */
  token VARCHAR(255) NOT NULL UNIQUE,   /* token: Valor do token de autenticação (único).  */
  data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,   /* data_criacao: Data e hora de criação do token.  */
  data_expiracao DATETIME NOT NULL  /* data_expiracao: Data e hora em que o token expira e se torna inválido.  */
);
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)

CREATE TABLE perfis (
  id_perfil INT PRIMARY KEY AUTO_INCREMENT,
  nome_perfil VARCHAR(255) NOT NULL UNIQUE,
  descricao TEXT,
  permissoes JSON NOT NULL
);

CREATE TABLE usuarios_perfis (
  id_usuario_perfil INT PRIMARY KEY AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  id_perfil INT NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
  FOREIGN KEY (id_perfil) REFERENCES perfis(id_perfil)
);

CREATE TABLE enderecos (
  id_endereco INT PRIMARY KEY AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  cep VARCHAR(8) NOT NULL,
  logradouro VARCHAR(255) NOT NULL,
  numero INT NOT NULL,
  complemento TEXT,
  bairro VARCHAR(255) NOT NULL,
  cidade VARCHAR(255) NOT NULL,
  estado VARCHAR(2) NOT NULL,
  pais VARCHAR(255) NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE telefones (
  id_telefone INT PRIMARY KEY AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  tipo_telefone VARCHAR(20) NOT NULL,
  numero_telefone VARCHAR(20) NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE logs_acesso_detalhados (
  id_log_acesso INT PRIMARY KEY AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  data_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ip_acesso VARCHAR(255) NOT NULL,
  acao VARCHAR(255) NOT NULL,  -- Tipo de ação realizada (login, logout, acesso a página, etc.)
  recurso_acessado VARCHAR(255),  -- Recurso específico acessado (URL, nome da página, etc.)
  metodo_acesso VARCHAR(255),  -- Método de acesso utilizado (GET, POST, etc.)
  status_resposta INT NOT NULL,  -- Código de status da resposta HTTP (200, 404, etc.)
  tamanho_resposta INT,  -- Tamanho da resposta HTTP em bytes
  user_agent VARCHAR(255),  -- User-Agent do navegador do usuário
  tempo_resposta BIGINT,  -- Tempo de resposta da requisição em milissegundos
  sucesso TINYINT(1) NOT NULL DEFAULT 1,  -- Indica se o acesso foi bem-sucedido (1) ou não (0)
  detalhes_erro TEXT,  -- Detalhes adicionais sobre erros (opcional)
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
