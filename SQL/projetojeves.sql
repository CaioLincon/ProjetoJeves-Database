-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: projetojeves
-- ------------------------------------------------------
-- Server version	5.5.5-10.11.16-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alunos`
--

DROP TABLE IF EXISTS `alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alunos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `escola_id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_nascimento` date NOT NULL,
  `genero` varchar(20) NOT NULL,
  `documento` varchar(50) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_alunos_escola` (`escola_id`),
  CONSTRAINT `fk_alunos_escola` FOREIGN KEY (`escola_id`) REFERENCES `escolas` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunos`
--

LOCK TABLES `alunos` WRITE;
/*!40000 ALTER TABLE `alunos` DISABLE KEYS */;
/*!40000 ALTER TABLE `alunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `idade_min` int(11) NOT NULL,
  `idade_max` int(11) NOT NULL,
  `genero` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipe_alunos`
--

DROP TABLE IF EXISTS `equipe_alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipe_alunos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipe_id` int(11) NOT NULL,
  `atleta_id` int(11) NOT NULL,
  `numero_camisa` int(11) DEFAULT NULL,
  `posicao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_equipe_atleta` (`equipe_id`,`atleta_id`),
  KEY `fk_ea_aluno` (`atleta_id`),
  CONSTRAINT `fk_ea_aluno` FOREIGN KEY (`atleta_id`) REFERENCES `alunos` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ea_equipe` FOREIGN KEY (`equipe_id`) REFERENCES `equipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe_alunos`
--

LOCK TABLES `equipe_alunos` WRITE;
/*!40000 ALTER TABLE `equipe_alunos` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipe_alunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipes`
--

DROP TABLE IF EXISTS `equipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inscricao_id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `tecnico_nome` varchar(100) NOT NULL,
  `tecnico_contato` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_equipes_inscricao` (`inscricao_id`),
  CONSTRAINT `fk_equipes_inscricao` FOREIGN KEY (`inscricao_id`) REFERENCES `inscricoes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipes`
--

LOCK TABLES `equipes` WRITE;
/*!40000 ALTER TABLE `equipes` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escolas`
--

DROP TABLE IF EXISTS `escolas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escolas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `codigo_inep` varchar(20) NOT NULL,
  `cnpj` varchar(18) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `logradouro` varchar(100) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `cep` varchar(10) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `responsavel` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_inep` (`codigo_inep`),
  UNIQUE KEY `cnpj` (`cnpj`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escolas`
--

LOCK TABLES `escolas` WRITE;
/*!40000 ALTER TABLE `escolas` DISABLE KEYS */;
/*!40000 ALTER TABLE `escolas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscricoes`
--

DROP TABLE IF EXISTS `inscricoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscricoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `torneio_modalidade_id` int(11) NOT NULL,
  `escola_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pendente',
  `observacao_organizador` text DEFAULT NULL,
  `criado_em` datetime NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_inscricoes_tm` (`torneio_modalidade_id`),
  KEY `fk_inscricoes_escola` (`escola_id`),
  CONSTRAINT `fk_inscricoes_escola` FOREIGN KEY (`escola_id`) REFERENCES `escolas` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_inscricoes_tm` FOREIGN KEY (`torneio_modalidade_id`) REFERENCES `torneio_modalidades` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscricoes`
--

LOCK TABLES `inscricoes` WRITE;
/*!40000 ALTER TABLE `inscricoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscricoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogos`
--

DROP TABLE IF EXISTS `jogos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `torneio_modalidade_id` int(11) NOT NULL,
  `fase` varchar(50) NOT NULL,
  `equipe_a_id` int(11) NOT NULL,
  `equipe_b_id` int(11) NOT NULL,
  `local_id` int(11) NOT NULL,
  `data_hora` datetime NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'agendado',
  `placar_a` int(11) DEFAULT 0,
  `placar_b` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_jogos_tm` (`torneio_modalidade_id`),
  KEY `fk_jogos_equipe_a` (`equipe_a_id`),
  KEY `fk_jogos_equipe_b` (`equipe_b_id`),
  KEY `fk_jogos_local` (`local_id`),
  CONSTRAINT `fk_jogos_equipe_a` FOREIGN KEY (`equipe_a_id`) REFERENCES `equipes` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_jogos_equipe_b` FOREIGN KEY (`equipe_b_id`) REFERENCES `equipes` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_jogos_local` FOREIGN KEY (`local_id`) REFERENCES `locais` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_jogos_tm` FOREIGN KEY (`torneio_modalidade_id`) REFERENCES `torneio_modalidades` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogos`
--

LOCK TABLES `jogos` WRITE;
/*!40000 ALTER TABLE `jogos` DISABLE KEYS */;
/*!40000 ALTER TABLE `jogos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locais`
--

DROP TABLE IF EXISTS `locais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locais`
--

LOCK TABLES `locais` WRITE;
/*!40000 ALTER TABLE `locais` DISABLE KEYS */;
/*!40000 ALTER TABLE `locais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modalidades`
--

DROP TABLE IF EXISTS `modalidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modalidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `individual_ou_coletiva` varchar(20) NOT NULL,
  `min_alunos` int(11) NOT NULL,
  `max_alunos` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modalidades`
--

LOCK TABLES `modalidades` WRITE;
/*!40000 ALTER TABLE `modalidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `modalidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torneio_modalidades`
--

DROP TABLE IF EXISTS `torneio_modalidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `torneio_modalidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `torneio_id` int(11) NOT NULL,
  `modalidade_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `max_equipes` int(11) NOT NULL,
  `regras_especificas` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_torneio_modalidade_categoria` (`torneio_id`,`modalidade_id`,`categoria_id`),
  KEY `fk_tm_modalidade` (`modalidade_id`),
  KEY `fk_tm_categoria` (`categoria_id`),
  CONSTRAINT `fk_tm_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tm_modalidade` FOREIGN KEY (`modalidade_id`) REFERENCES `modalidades` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tm_torneio` FOREIGN KEY (`torneio_id`) REFERENCES `torneios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torneio_modalidades`
--

LOCK TABLES `torneio_modalidades` WRITE;
/*!40000 ALTER TABLE `torneio_modalidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `torneio_modalidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torneios`
--

DROP TABLE IF EXISTS `torneios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `torneios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `organizador_id` int(11) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `inicio_inscricoes` datetime NOT NULL,
  `fim_inscricoes` datetime NOT NULL,
  `regras` text DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'rascunho',
  PRIMARY KEY (`id`),
  KEY `fk_torneios_organizador` (`organizador_id`),
  CONSTRAINT `fk_torneios_organizador` FOREIGN KEY (`organizador_id`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torneios`
--

LOCK TABLES `torneios` WRITE;
/*!40000 ALTER TABLE `torneios` DISABLE KEYS */;
/*!40000 ALTER TABLE `torneios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `escola_id` int(11) DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha_hash` varchar(100) NOT NULL,
  `perfil` varchar(50) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_usuarios_escola` (`escola_id`),
  CONSTRAINT `fk_usuarios_escola` FOREIGN KEY (`escola_id`) REFERENCES `escolas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'projetojeves'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-16 11:26:48
