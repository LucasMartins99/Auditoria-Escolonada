-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17-Jan-2020 às 19:45
-- Versão do servidor: 10.4.8-MariaDB
-- versão do PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `auditoriaescalonada`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `auditoria`
--

CREATE TABLE `auditoria` (
  `id` int(11) NOT NULL,
  `setor` varchar(255) NOT NULL,
  `semana` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `auditor` varchar(255) NOT NULL,
  `data_realizado` datetime DEFAULT NULL,
  `obs` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `data` date DEFAULT NULL,
  `turno` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `auditoria`
--

INSERT INTO `auditoria` (`id`, `setor`, `semana`, `status`, `auditor`, `data_realizado`, `obs`, `created_at`, `updated_at`, `data`, `turno`) VALUES
(13, 'Pintura/Morita Linha 3/Acabamento', 6, 'Planejado', 'Fabio', NULL, NULL, '2019-12-26 23:58:17', '2019-12-26 23:58:17', '2019-12-28', NULL),
(14, 'Pintura/Morita Linha 3/Acabamento', 3, 'Realizado', 'Fabio', NULL, NULL, '2019-12-26 23:58:24', '2019-12-26 23:58:24', '2020-01-04', NULL),
(20, 'Linha de Fornos', 2, 'Realizado', 'Jose', '2020-01-06 03:00:00', NULL, '2020-01-10 13:21:24', '2020-01-10 13:21:24', '2020-01-06', '1'),
(21, 'Linha Tubulares', 5, 'Planejado', 'Fabio', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 'adm'),
(22, 'Linha de Pintura', 4, 'Planejado', 'Fabio', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 'adm'),
(23, 'Usinagem / Recalque', 1, 'Planejado', 'Fabio', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 'adm'),
(24, 'Linha de Fornos', 2, 'Realizado', 'joão', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `files`
--

INSERT INTO `files` (`id`, `name`, `path`, `created_at`, `updated_at`) VALUES
(1, 'cris.jpeg', '40b515c473528812db1be74d9bc978f2.jpeg', '2019-12-23 11:31:57', '2019-12-23'),
(2, 'cris.jpeg', '8d390ff75dde6fba2f65c8c3cf0d851c.jpeg', '2019-12-23 11:37:12', '2019-12-23'),
(3, 'cris.jpeg', '73359126cc088511d16d5a73e7ce549b.jpeg', '2019-12-23 11:41:21', '2019-12-23'),
(4, 'cris.jpeg', 'ef9e82ecb4157879954c70d5d5b91138.jpeg', '2019-12-23 11:43:56', '2019-12-23');

-- --------------------------------------------------------

--
-- Estrutura da tabela `plans`
--

CREATE TABLE `plans` (
  `id` int(11) NOT NULL,
  `item` decimal(2,1) DEFAULT NULL,
  `problema` varchar(255) NOT NULL,
  `auditor` varchar(255) NOT NULL,
  `maquina` varchar(255) NOT NULL,
  `setor` varchar(255) NOT NULL,
  `acao` varchar(255) DEFAULT NULL,
  `responsavel` varchar(255) NOT NULL,
  `data` datetime NOT NULL,
  `prazo` datetime NOT NULL,
  `conclusao` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `auditoria_id` int(11) DEFAULT NULL,
  `avatar_id` int(11) DEFAULT NULL,
  `area` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `plans`
--

INSERT INTO `plans` (`id`, `item`, `problema`, `auditor`, `maquina`, `setor`, `acao`, `responsavel`, `data`, `prazo`, `conclusao`, `created_at`, `updated_at`, `auditoria_id`, `avatar_id`, `area`) VALUES
(46, '1.1', 'Mola 301 no auxilio x visual', 'Jose', 'Morita', 'Linha de Fornos', NULL, 'Produção', '2020-01-06 00:00:00', '2019-12-22 00:00:00', '2020-01-07 00:00:00', '2020-01-15 13:54:28', '2020-01-16 10:52:03', 20, NULL, 1),
(52, '1.2', 'Mola 301 no auxilio x visual', 'Jose', 'Morita', 'Linha de Fornos', NULL, 'Produção', '2020-01-06 00:00:00', '2019-12-22 00:00:00', NULL, '2020-01-16 11:49:04', '2020-01-16 11:49:04', 20, NULL, 2),
(53, '1.3', 'Mola 301 no auxilio x visual', 'Jose', 'Morita', 'Linha de Fornos', NULL, 'Produção', '2020-01-06 00:00:00', '2019-12-22 00:00:00', NULL, '2020-01-16 11:49:56', '2020-01-16 11:49:56', 20, NULL, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `item` decimal(2,1) NOT NULL,
  `text` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `questions`
--

INSERT INTO `questions` (`id`, `item`, `text`, `created_at`, `updated_at`) VALUES
(1, '1.1', 'A FOI (Folha de operação e inspeção) esta disponível e acessível fisicamente ou eletronicamente?', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '1.2', 'Os parâmetros de processo e produto estão sendo avaliados conforme frequência definida na FOI?', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, '1.3', 'As instruções de trabalhos/Tabelas estão disponíveis, atualizadas e acessíveis fisicamente ou eletronicamente? ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, '1.4', 'Os registros de liberação e/ou de setup estão sendo preenchidos conforme frequência definida na FOI?', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, '1.5', ' Para parâmetros de processo ou produto fora da especificação o plano de reação esta sendo seguido? Ou existe um desvio previamente aprovado?', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, '2.1', 'Os instrumentos de medição e dispositivos de controle estão disponíveis e em boas condições para uso?', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, '2.2', 'A numeração dos instrumentos / dispositivos de controle estão legíveis? A validação/calibração estão em dia?', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, '3.1', 'As validações da correta funcionalidade dos poka yokes estão sendo realizadas?', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, '3.2', 'No caso de problemas identificados: O plano de reação esta sendo seguindo? Ou existe um desvio previamente aprovado?', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, '4.1', 'O operador esta capacitado / treinado para realizar a atividade? A matriz de versatilidade do setor confirma essa informação?', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, '5.1', 'Os produtos não conforme estão identificados, apontados e segregados?', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, '5.2', 'A quantidade de peças apontadas nas fichas de refugo coincidem com as peças na caixa vermelha de scrap?', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, '5.3', 'Toda as peças de retrabalho na caixa amarela estão identificadas com a RNC?', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, '6.1', 'Existem alertas da qualidade postados no setor? A validade esta OK?', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, '7.1', 'Todos os produtos em processo estão identificados com a ficha de ordem de produção? A ficha esta preenchida de acordo o processo atual?', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, '8.1', 'O Modelo padrão de 5S esta disponível e atualizado no setor?', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, '8.2', 'O setor encontra-se limpo, organizado? Existem materiais sem utilização no setor?', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, '9.1', 'Os operadores estão utilizando os EPIs padrão do setor?', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, '9.2', 'Os dispositivos de segurança estão sendo validados conforme definido no Check list de segurança?', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, '9.3', 'A coleta seletiva do setor esta sendo respeitada? A lista de aspectos e impactos do setor e lista de destinação de residuos estão disponiveis?', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, '9.4', 'Se aplicavel, os kits de emergência do setor estão disponiveis e em bom estado?', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, '9.9', 'O check list de TPM esta disponível no setor?', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, '9.9', 'O operador esta verificando os itens do check list? Problemas estão sendo abertos no diário de bordo?', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, '9.9', 'As auditorias estão sendo realizadas conforme frequência estabelecida?', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, '9.9', 'As checagem da primeira peça OK estão sendo realizadas? Os problemas estão sendo tratados de acordo previsto?', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20191220112350-create-auditorias.js'),
('20191220113632-create-plans.js'),
('20191220115054-create-users.js'),
('20191220125349-add-auditoria-field-to-plan.js.js'),
('20191220130840-create-files.js'),
('20191220131750-add-avatar-field-to-plans.js.js'),
('20191230113013-create-questions.js'),
('20200110003117-add-setor-to-user.js'),
('20200110173000-add-turno-to-auditoria.js');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `cargo` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `setor` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password_hash`, `cargo`, `created_at`, `updated_at`, `setor`) VALUES
(2, 'Fabio Lucas', 'fabio.lima@sogefigroup.com', '$2a$08$ahOsWyblqBa/KvnjhnvKpeZD82jjhRHAZhM8AC3nwT3SRoZCVnsVa', 'Coordenador Produção', '2019-12-20 13:56:52', '2019-12-20 13:56:52', NULL),
(3, 'Fabio', 'fabio.lucas@sogefigroup.com', '$2a$08$vWfhgDy6qhq4/Z9LU7CX5uPET/pJkGohpW6tl8mTh9jVFSRvmOXzO', 'Coordenador Produção', '2019-12-24 13:36:57', '2019-12-24 13:36:57', NULL),
(4, 'Fabio M', 'fabio@sogefigroup.com', '$2a$08$3PptzgutNwzl9SKeIgTLRepvrmmtyt7lISPRomAQ8OlzG5hOQ7Pgq', 'Coordenador Produção', '2019-12-26 11:07:00', '2019-12-26 11:07:00', NULL),
(5, 'Francisco Paladini', 'francisco.paladini@sogefigroup.com', '$2a$08$1VO7g5QI6Uux5RlGVfWQKOKUdm7Hoa9ziskZCmH8gXWa875aUR6sm', '', '2019-12-26 11:34:38', '2019-12-26 11:34:38', NULL),
(6, 'Rovilson Augusto', 'rovilson.augusto@sogefigroup.com', '$2a$08$ealovDQOC7/aleE31Onak.jXvICuu0V8vgnka7Y3Kxq.5fbxtmeVW', '', '2019-12-26 11:37:14', '2019-12-26 11:37:14', NULL),
(7, 'kkkk', 'xxxx@sogefigroup.com', '$2a$08$wvu97mGxtHBMEuqpV5SFz.Hh2kCYiY9IvSyfTujc32HUzlfGFl26a', '', '2019-12-26 11:41:10', '2019-12-26 11:41:10', NULL),
(8, 'operador', 'operador@sogefigroup.com', '$2a$08$KiYCqF03ZTPyAYmytYXueuVCJfN7KxxNgQBatnc2zW/p89RBYls9S', 'Operador', '2019-12-27 11:23:33', '2020-01-10 11:24:29', 'Linha de Fornos'),
(9, 'operador', 'operador.producao@sogefigroup.com', '$2a$08$5.JP98fbyBRZaDZ4rTPbsO9tfCQVI9s6iYCWkp3T5DocPOOM1dvCS', 'Operador', '2019-12-27 11:24:57', '2019-12-27 11:24:57', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `path` (`path`);

--
-- Índices para tabela `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plans_auditoria_id_foreign_idx` (`auditoria_id`),
  ADD KEY `plans_avatar_id_foreign_idx` (`avatar_id`);

--
-- Índices para tabela `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `auditoria`
--
ALTER TABLE `auditoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de tabela `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `plans`
--
ALTER TABLE `plans`
  ADD CONSTRAINT `plans_auditoria_id_foreign_idx` FOREIGN KEY (`auditoria_id`) REFERENCES `auditoria` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `plans_avatar_id_foreign_idx` FOREIGN KEY (`avatar_id`) REFERENCES `files` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;