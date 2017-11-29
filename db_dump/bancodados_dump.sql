-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: geekadvanced
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `geekadvanced`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `geekadvanced` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `geekadvanced`;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='contains produto categories, e.g., dairy, meats, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Eletronicos'),(2,'Livros'),(3,'Games'),(4,'Filmes');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `telefone` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `endereco` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `cidade` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `cc_numero` varchar(19) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='maintains cliente details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Hugo Reyes','hurley@mrcluck.com','606252924','Karlova 33','SPSP','5555555555555555555'),(2,'Yago Butchinski Theodoro','freonzx@gmail.com','33550102','Rua das Xaropadas','Xaropolandia','44444444444444444'),(3,'Elvis Lopes','elvis@xaropada.com','4564561234','Rua do Elvis','Elvislandia','456456456423123'),(4,'Lais Xaropada','lais@xarope.com','54564564654','Rua da Lais','Cidade Lais','45664567812312345'),(5,'Lais sem desconto','lais@xarope.com','4564564564564','Rua da Lais','cidade da lais','45656456456123'),(6,'Teste pedido','teste@tes.com','4564564','Rua teste','teste','456456456231231'),(7,'Teste pedido2','teste@teste.com','456465465456','rua dos testes','teste','45425645645645'),(8,'Teste3','TESTE@TESTE','44444444','RUA TESTE','TESTE','444444444444'),(9,'Teste','teste@teste','5555555555555555','rua rua rua','sao paulo','5555555555555555555'),(10,'Com sorte ultimo teste','aaaaaaaa@aaaaaaaaaa','4444444444444444','aaaaaaaaaaa','sp','2222222222222222222'),(11,'Agora vai','agoravai@vaimesmo','3189203812938129','ja foi','funciona porra','98999999999999999'),(12,'FUNCIONA PORRA','FUNCIONA PORRA','888888888888','FUNCIONA PORRA','FUNCIONA PORRA','77777777777777777');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_pedido`
--

DROP TABLE IF EXISTS `cliente_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_pedido` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantidade` decimal(6,2) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `confirmation_number` int(10) unsigned NOT NULL,
  `cliente_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cliente_pedido_cliente` (`cliente_id`),
  CONSTRAINT `fk_cliente_pedido_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='maintains cliente order details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_pedido`
--

LOCK TABLES `cliente_pedido` WRITE;
/*!40000 ALTER TABLE `cliente_pedido` DISABLE KEYS */;
INSERT INTO `cliente_pedido` VALUES (1,999.99,'2017-11-29 01:14:20',74351487,1),(2,100.00,'2017-11-29 01:32:06',974985346,2),(3,100.00,'2017-11-29 01:49:53',553922725,3),(4,899.99,'2017-11-29 01:57:40',441876941,4),(5,999.99,'2017-11-29 01:58:14',482155076,5),(6,90.00,'2017-11-29 03:00:54',712618854,6),(7,1026.75,'2017-11-29 03:03:55',538690658,7),(8,999.99,'2017-11-29 03:05:59',801744060,8),(9,899.99,'2017-11-29 03:07:05',603012568,9),(10,61.61,'2017-11-29 03:08:35',975862029,10),(11,90.00,'2017-11-29 03:09:59',612848230,11),(12,90.00,'2017-11-29 03:11:11',555781507,12);
/*!40000 ALTER TABLE `cliente_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordered_produto`
--

DROP TABLE IF EXISTS `ordered_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordered_produto` (
  `cliente_pedido_id` int(10) unsigned NOT NULL,
  `produto_id` int(10) unsigned NOT NULL,
  `quantity` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`cliente_pedido_id`,`produto_id`),
  KEY `fk_ordered_produto_cliente_pedido` (`cliente_pedido_id`),
  KEY `fk_ordered_produto_produto` (`produto_id`),
  CONSTRAINT `fk_ordered_produto_cliente_pedido` FOREIGN KEY (`cliente_pedido_id`) REFERENCES `cliente_pedido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordered_produto_produto` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='matches produtos with cliente orders and records their quantity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered_produto`
--

LOCK TABLES `ordered_produto` WRITE;
/*!40000 ALTER TABLE `ordered_produto` DISABLE KEYS */;
INSERT INTO `ordered_produto` VALUES (1,12,1),(2,22,10),(3,14,1),(4,12,1),(5,12,1),(6,24,10),(7,9,15),(8,12,1),(9,12,1),(10,9,1),(11,14,1),(12,14,1);
/*!40000 ALTER TABLE `ordered_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `preco` decimal(5,2) NOT NULL,
  `description` tinytext COLLATE utf8_unicode_ci,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `categoria_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_produto_categoria` (`categoria_id`),
  CONSTRAINT `fk_produto_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='contains produto details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (9,'Kali Linux. Introdução ao Penetration Testing',68.45,'Este livro apresenta um passo a passo sobre as técnicas de invasão utilizadas pelos criminosos digitais. Através dos exercícios práticos sobre exploração você aprenderá os artifícios e estratégias na aplicação de contramedidas de proteção e','2017-11-25 00:47:50',2),(10,'Harry Potter e a pedra filosofal',10.00,'Harry Potter  é um garoto de 11 anos, triste e órfão, que vive num pequeno cômodo debaixo da escada na casa dos tios. Quando recebe um estranho convite para estudar em Hogwarts, uma escola de magia, finalmente descobre sua verdadeira identidade de bru','2017-11-28 22:19:16',2),(11,'Matrix',20.00,'Esqueça tudo o que você ouviu sobre o futuro e prepare-se para descobrir o que é o Matrix.','2017-11-28 22:19:44',4),(12,'Iphone X',999.99,'se prepare para a nova geração do Iphone com o Iphone X','2017-11-21 17:20:17',1),(13,'Quadros',100.00,'decore sua casa com estilos quadros de diversos temas para você!','2017-11-21 17:13:39',4),(14,'God of War 3',100.00,'kratos invade o Olimpus em busca de vingança contra os Deuses','2017-11-21 17:21:17',3),(15,'IT - a coisa',70.00,'Durante as férias escolares de 1958, em Derry, pacata cidadezinha do Maine, Bill, Richie, Stan, Mike, Eddie, Ben e Beverly aprenderam o real sentido da amizade, do amor, da confiança e... do medo. O mais profundo e tenebroso medo. Naquele verão, eles e','2017-11-28 22:20:46',2),(16,'O Menino Que Desenhava Monstros ',27.00,'O Menino que Desenhava Monstros\r\nUm livro para fazer você fechar as cortinas e conferir se não há nada embaixo da cama antes de dormir. O Menino que Desenhava Monstros ganhará uma adaptação para os cinemas, dirigida por ninguém menos que James Wan,','2017-11-28 22:20:24',2),(17,'Em Algum Lugar Nas Estrelas',10.00,'Em Algum Lugar nas Estrelas, da autora norte-americana Clare Vanderpool, é um romance intenso sobre a difícil arte de crescer em um mundo que nem sempre parece satisfeito com a nossa presença. Pelo menos é desse jeito que as coisas têm acontecido par','2017-11-28 22:21:04',2),(18,'Xaropada',0.00,'a historia de 3 alunos tentando ganhar nota com o professor! Por favor nos de um 10!','2017-11-21 17:29:55',4),(19,'Liga da Justiça ',55.00,'Liga da Justiça é um filme americano de super-herói de 2017, baseado na equipe homônima da DC Comics e distribuído pela Warner Bros. Pictures. É o quinto filme do Universo Estendido DC. O filme é dirigido por Zack Snyder e escrito por Chris Terrio ','2017-11-21 17:32:47',4),(20,'O culto do chucky',5.00,'O sétimo filme da franquia se passa depois dos acontecimentos do último filme, A maldição de Chucky, e é estrelado por Brad Dourif como Chucky, com um elenco de apoio de Fiona Dourif, Alex Vincent, Jennifer Tilly e Summer H. Howell, em que todos os e','2017-11-21 17:32:47',4),(21,'Power Rangers',15.00,'Saban\'s Power Rangers é um filme de ação e aventura norte-americano de 2017 baseado no grupo homônimo da primeira temporada dos Power Rangers. Dirigido por Dean Israelite, com base no roteiro de Ashley Miller e Zack Stentz. A produção é realizada p','2017-11-21 17:37:10',4),(22,'Who am I ',10.00,'Benjamin, um jovem gênio do computador , é convidado a aderir a um grupo de hacker subversivo que quer ser notado no palco do mundo. ','2017-11-21 17:36:46',4),(23,'Mortal Kombat',20.00,'FINISH HIM!!!','2017-11-21 17:40:08',3),(24,'StarFox',10.00,'Do a barrel roll !','2017-11-21 17:40:08',3),(25,'Legend of Zelda:  Breath of the Wild ',10.00,'The Legend of Zelda: Breath of the Wild é um jogo eletrônico de ação-aventura desenvolvido pela Nintendo Entertainment Planning & Development e publicado pela Nintendo. É o décimo nono título da série The Legend of Zelda e foi lançado mundialment','2017-11-21 17:43:36',3),(26,'Dead rising 4',20.00,'Um jornalista (Jesse Metcalfe, Dallas) investiga e divulga uma epidemia de zumbis. Ao lado de uma mãe (Virginia Madsen, invocando os espíritos) e outros sobreviventes descobrem que a vacina que promete o governo não está funcionando. Baseado no jogo D','2017-11-21 17:43:36',3),(27,'Copos criativos',10.00,'Copos personalizados de acordo com o seu gosto! Traga sua ideia que nos fazemos.','2017-11-21 17:47:31',4),(28,'Almofadas star wars',5.00,'Durma com o lado negro da força','2017-11-21 17:47:31',4),(29,'Luminaria',10.00,'ilumine os lugares com personalidade','2017-11-21 17:50:32',4),(30,'Tablet samsung ',120.00,'Tela de 9,7\"\r\nDesign de vidro\r\nTipo de Processador\r\nQuad Core\r\nTamanho (Tela Principal)\r\n9.7\" (245,8 mm)','2017-11-21 17:53:45',1),(31,'Smart TV',999.99,'smart TV LED 32\" HD LG 32LJ600B com Wi-Fi, WebOS 3.5, Time Machine Ready, Magic Zoom, Quick Access, HDMI e USB','2017-11-21 17:53:45',1),(32,'Notebook Acer',500.00,'Processor Number \r\nProcessador Intel® Core™ i7-7820HK \r\nProcessor threads \r\n8 \r\nL2 Cache \r\n8 MB \r\nCPU Speed \r\n2,9 GHz \r\nCores/threads \r\n4 \r\nProcessor boost frequency \r\n3,9 GHz \r\nSilicon \r\n14 nm \r\nConflict Free \r\nSim \r\nCPU Type \r\nIntel® Core™ i7 de s','2017-11-21 17:57:27',1),(33,'Smartphone samsung',600.99,'Smartphone Samsung Galaxy J7 Prime 32 GB, Dual Chip, Octa Core, Preto - G610M','2017-11-21 17:57:44',1);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-28 22:16:14
