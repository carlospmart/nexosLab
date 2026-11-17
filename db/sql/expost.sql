-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17/11/2026 às 00:14
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `nexos_lab`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `amount` int(11) NOT NULL CHECK (`amount` >= 0),
  `preco` decimal(10,2) NOT NULL CHECK (`preco` >= 0),
  `supplier_id` int(11) NOT NULL,
  `tag_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `product`
--

INSERT INTO `product` (`id`, `name`, `img_url`, `description`, `amount`, `preco`, `supplier_id`, `tag_id`) VALUES
(4, ' Logitech G PRO 2 LIGHTSPEED ', 'img_6af78d7a7ac4c.jpg', 'Desenvolvido para o cenário competitivo, o Logitech G PRO 2 LIGHTSPEED combina design ambidestro versátil com desempenho de nível profissional. Conta com botões laterais magnéticos e removíveis em ambos os lados, adaptando-se perfeitamente a jogadores destros ou canhotos, além de iluminação LIGHTSYNC RGB personalizável.', 12, 25.50, 5, 4),
(5, 'kit completo de PC Gamer', 'img_6af78e127e842.jpg', 'Computador gamer completo acompanhado de monitor e kit de periféricos com iluminação LED, ideal para jogos competitivos, estudos e trabalho. Montado no gabinete Mancer Narok V2, conta com frente em mesh (gradeada) e 3 ventoinhas frontais RGB', 2, 2900.00, 4, 5),
(6, 'Monitor Gamer Curvo Nexus 34 GO', 'img_6af78e875fa0b.jpg', 'Projetado para máxima imersão em jogos e produtividade multitarefa, o Pichau Nexus 34 GO conta com tela curva ultrawide de 34 polegadas e resolução WQHD (2K). Seu painel VA oferece pretos profundos e alto contraste, combinado com taxa de atualização de 165Hz e tempo de resposta de 1ms para partidas fluidas e sem rastros.', 3, 799.99, 6, 4),
(7, 'Controle Gamepad Sem Fio 2.4G', 'img_6af78f051b1d1.webp', 'Controle sem fio com design ergonômico inspirado no padrão Xbox Series, ideal para jogar com conforto e resposta rápida no console ou no computador. Acompanha receptor USB 2.4 GHz de conexão estável e baixa latência (basta conectar e jogar), além de motores duplos de vibração para maior imersão.', 12, 350.00, 7, 4),
(8, 'PC Gamer High-End Gabinete Aquário', 'img_6af78f4830524.jpg', 'Computador gamer de alto desempenho montado em gabinete estilo aquário (frente e lateral em vidro temperado), oferecendo visual panorâmico e fluxo de ar otimizado com 9 ventoinhas RGB e sistema de refrigeração líquida (Water Cooler). Ideal para jogos pesados em alta resolução, transmissões ao vivo (streaming) e edição profissional.', 14, 2250.00, 3, 5),
(9, 'Teclado Gamer Membrana Sem Fio Redragon ', 'img_6af78f9d64b5c.avif', 'Versátil e silencioso, o Redragon Netherbane Pro oferece liberdade total no setup com conectividade Tri-Mode (sem fio 2.4 GHz, Bluetooth e cabo USB-C removível). Possui formato completo (Full Size) com teclado numérico integrado, layout brasileiro ABNT2 e iluminação RGB com múltiplos efeitos.', 20, 325.90, 4, 4),
(10, 'Controle Gamer Sem Fio Ajazz GP100', 'img_6af78fd2a928f.jpg', 'Desenvolvido para máxima precisão e zero drift, o Ajazz GP100 conta com analógicos e gatilhos magnéticos Hall Effect e taxa de resposta (polling rate) de 1000Hz. Acompanha base de carregamento magnética com iluminação RGB e funciona em múltiplas plataformas via 2.4 GHz, Bluetooth ou cabo.', 10, 290.90, 6, 4),
(11, 'Monitor Gamer Goldentec GT Gamer 24\"', 'img_6af7902261938.webp', 'Monitor Gamer Goldentec GT Gamer 24\" LED Full HD – 1ms Ideal para jogos e uso diário, o Monitor GT Gamer traz tela de 23,8\" (24\") com bordas ultrafinas (frameless) e resolução Full HD. Conta com tempo de resposta de 1ms e tecnologia FreeSync para eliminar cortes na imagem, além de recursos de proteção ocular para longas sessões.', 3, 759.90, 4, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `telephone` char(14) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `supplier`
--

INSERT INTO `supplier` (`id`, `name`, `telephone`, `email`) VALUES
(3, 'TechNova Computadores Ltda', '(11)99123-4567', 'vendas@technova.com.br'),
(4, 'MegaHardware Distribuidora', '(41)98765-1234', 'comercial@megahardware.com.br'),
(5, 'Periféricos Pro S.A.', '(21)99876-5432', 'contato@perifericospro.com'),
(6, 'InfoByte Suprimentos', '(31)98456-7890', 'pedidos@infobyte.com.br'),
(7, 'NextGen Acessórios Tech', '(51)99321-6548', 'suporte@nextgentech.com.br');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tag`
--

INSERT INTO `tag` (`id`, `name`) VALUES
(5, 'Computador'),
(6, 'kit tecnologia'),
(4, 'periférico');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `img_url` (`img_url`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `tag_id` (`tag_id`);
ALTER TABLE `product` ADD FULLTEXT KEY `search_idx` (`name`,`description`);

--
-- Índices de tabela `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `telephone` (`telephone`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices de tabela `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
