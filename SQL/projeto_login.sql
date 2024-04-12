SET time_zone = "+00:00";


CREATE TABLE usuarios (
  id_usuario INT PRIMARY KEY AUTO_INCREMENT,    /* id_usuario: Identificador único para cada usuário (chave primária auto-incrementada). */
  nome VARCHAR(255) NOT NULL,   /* nome: Nome do usuário (não pode ser nulo). */
  email VARCHAR(255) NOT NULL UNIQUE,   /* email: Endereço de e-mail do usuário (único, não pode ser nulo). */
  senha VARCHAR(255) NOT NULL,  /* senha: Senha do usuário (não pode ser nula). */
  data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,  /* data_criacao: Data e hora de criação do registro do usuário. */
  data_atualizacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE    CURRENT_TIMESTAMP   /* data_atualizacao: Data e hora da última atualização do registro do usuário. */
); ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE tokens (
  id_token INT PRIMARY KEY AUTO_INCREMENT, /* id_token: Identificador único para cada token.  */
  id_usuario INT NOT NULL,  /* id_usuario: ID do usuário associado ao token.  */
  token VARCHAR(255) NOT NULL UNIQUE,   /* token: Valor do token de autenticação (único).  */
  data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,   /* data_criacao: Data e hora de criação do token.  */
  data_expiracao DATETIME NOT NULL  /* data_expiracao: Data e hora em que o token expira e se torna inválido.  */
);

FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)