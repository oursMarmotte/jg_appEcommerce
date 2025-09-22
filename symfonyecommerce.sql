-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 22 sep. 2025 à 15:53
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `symfonyecommerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `category_order` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `category_order`, `slug`) VALUES
(1, NULL, 'Informatique', 1, 'informatique'),
(2, 1, 'Ordinateurs portable', 2, 'ordinateurs-portable'),
(3, 1, 'Ecrans', 3, 'ecrans'),
(4, 1, 'Souris', 4, 'souris'),
(5, NULL, 'Mode', 5, 'mode'),
(6, 5, 'Homme', 8, 'homme'),
(7, 5, 'Femme', 7, 'femme'),
(8, 5, 'Enfant', 6, 'enfant'),
(9, 7, 'Chaussures femme', 9, 'chaussures-femme'),
(11, 7, 'Vestes femme', 12, 'vestes-femme'),
(12, 7, 'Pantalon femme', 11, 'pantalon-femme'),
(17, 6, 'Pantalon homme', 15, 'pantalon-homme'),
(18, 6, 'Chaussure homme', 13, 'chaussure-homme'),
(19, 6, 'Veste homme', 14, 'veste-homme'),
(20, 8, 'Veste enfant', 16, 'veste-enfant'),
(21, 8, 'Chaussure enfant', 17, 'chaussure-enfant'),
(22, 8, 'Pantalon enfant', 18, 'pantalon-enfant'),
(23, 8, 'Bonnet enfant', 19, 'bonnet-enfant'),
(24, 8, 'Manteau hiver enfant', 20, 'manteau-hiver-enfant'),
(25, 8, 'T-shirt enfant', 21, 't-shirt-enfant');

-- --------------------------------------------------------

--
-- Structure de la table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `coupons_type_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `description` longtext NOT NULL,
  `discount` int(11) NOT NULL,
  `max_usage` int(11) NOT NULL,
  `validity` datetime NOT NULL,
  `is_valid` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `coupons_types`
--

CREATE TABLE `coupons_types` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `imagecategorie`
--

CREATE TABLE `imagecategorie` (
  `id` int(11) NOT NULL,
  `categorie_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `imagecategorie`
--

INSERT INTO `imagecategorie` (`id`, `categorie_id`, `name`, `created_at`) VALUES
(1, 17, 'e0df7b788df8105270e41f7a2c48f54e.webp', '2025-09-19 12:29:50'),
(2, 18, '38387e21d00176d0cd04bfde2f8d7fe2.webp', '2025-09-19 16:41:07'),
(3, 19, '9b1bf429d09e9274f84692c2e3def6c7.webp', '2025-09-19 16:41:57'),
(4, 20, '7af620a09a6956f9fe8a066da91240b2.webp', '2025-09-19 16:46:38'),
(5, 21, '81d90043575f898feaaff59bb8a3b033.webp', '2025-09-19 16:47:30'),
(6, 22, 'b5ebf170c7450a7f3883d746ce0ad928.webp', '2025-09-19 17:11:05'),
(7, 23, '7d85a56b0a110aa12d11f483daacf7d4.webp', '2025-09-19 18:14:35'),
(8, 24, 'cabc47ea4499bac8d3549c83bd5c9a3d.webp', '2025-09-19 18:17:54'),
(9, 25, '5765a759b897826b1bf7bb04d604f661.webp', '2025-09-19 18:20:10');

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `images`
--

INSERT INTO `images` (`id`, `products_id`, `name`) VALUES
(100, 24, '5276d57f3a5945a2a6261040e4591c87.webp'),
(101, 25, '94d56a0e3399010074c444e9b584e665.webp'),
(102, 26, '68426941bcba33976d016da3b72c9bb6.webp'),
(103, 26, 'fae58ad05bd408a30a52206c2c7a1e32.webp'),
(104, 26, '079bf3d7fd58aef8f7744c7a29c00552.webp'),
(105, 27, 'c4f45e74aa7c0b12f1d935a9d3ce7ae5.webp'),
(108, 27, 'a0b0ca7e11fcd30d54bc974a053cd3fe.webp'),
(109, 27, '7971795b1fd4ddd6bd86375ad9e28503.webp'),
(111, 28, '4013acde4c4fed1ac892c8a1e926572c.webp'),
(112, 28, '69fbd95b1a04bb5a153c7c8dd5f77253.webp'),
(113, 28, 'bc294e0d94c115affc1093c6f3fe1193.webp'),
(114, 29, '9397ec0f337fcab7b95c10ef5938da6d.webp'),
(115, 29, '842eca7eb90e6da366a574cb4784db5f.webp'),
(116, 30, '700824ebc0890634a651d3d4b6669c38.webp'),
(117, 31, '59c15453ff18e9dac8a3bc7186bde319.webp'),
(118, 32, '68a4d6afc69d15172d5ebee10e93ad3a.webp'),
(119, 33, 'c3bc31029b48710597002855612babbb.webp'),
(120, 34, 'fd87e99efe7a37a3211e093635396e9d.webp'),
(121, 35, 'bfc55e04aea2902e676630320d34a22c.webp'),
(122, 36, '1faf8b6cafe35d78879dddf1be8b6ad2.webp'),
(123, 37, '0612ffdadcd41c6e854d17eeb9780c7b.webp'),
(124, 38, '7c91d07f3add553fc32368732062847e.webp'),
(125, 39, '18b6c1a44c21f774c1aef0804c8cd719.webp'),
(126, 40, '46c725f1a33597a2ae2fb30db1083286.webp'),
(127, 41, 'e85024a8ad794c52dc862d79123e456e.webp'),
(128, 42, '94a07808fa5e9b322c12106bba9987d9.webp'),
(129, 43, 'e531947c857882ca8c5115db387ed48c.webp'),
(130, 44, '3fa6ac9b50a20ee8c9902bcb03f59dc2.webp'),
(131, 45, 'ccbd13842fb63cabcdb0bb9f280a5f4a.webp'),
(132, 46, 'f77a6892819f1eae9a6ee4fcddc27604.webp'),
(134, 48, '40e22126df4c776137e7728f6ee9941d.webp'),
(135, 49, 'c55842c4aa88c5047873ef0975b53c34.webp'),
(136, 50, '052ff4a1fc45e1f2e4aa526888131d9e.webp'),
(137, 51, '7c76ef105557afe0a0e5de043cc71383.webp'),
(138, 52, 'f49b979c6d3a8699d7f8c0a5c535e943.webp'),
(139, 53, '6a1dbb3a7eb9a666aafe6d39a283638c.webp'),
(140, 54, '36302f0b2d440604496709f02559da41.webp'),
(141, 55, 'cb6d54f0f69749155ed7ab07cb214665.webp'),
(142, 56, 'a4d94e594f653724bd158531092ea5ba.webp'),
(143, 57, '01b1806ab5d082768493e7f0dc484441.webp'),
(144, 58, '1ce74e51d1cbc760ba8db0b10dd5c3a3.webp'),
(145, 59, '2687b4d6ecc82dce0b9433a9e39e9ee6.webp'),
(146, 60, '40a9172c3476c486389c8d4e9e56477c.webp'),
(147, 61, '46cd065c61d76609392677889cca4d75.webp'),
(148, 62, '2621694a120a13f0fa65251010c80b85.webp'),
(149, 63, '15956bc16caca1e58d15e840d03b0ca8.webp'),
(150, 64, '866bd57b738a9a6a3a1d24e4c7cc6e59.webp');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `coupons_id` int(11) DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '(DC2Type:datetime_immutable)',
  `transporteur_id` int(11) DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `is_delivered` tinyint(1) DEFAULT NULL,
  `method` varchar(255) NOT NULL,
  `stripe_session_id` varchar(255) DEFAULT NULL,
  `paypal_order_id` varchar(255) DEFAULT NULL,
  `delivery` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `coupons_id`, `users_id`, `reference`, `created_at`, `transporteur_id`, `is_paid`, `is_delivered`, `method`, `stripe_session_id`, `paypal_order_id`, `delivery`) VALUES
(1, NULL, 7, '29 Apr 2025 16:53:42:6810e7f66605a', '2025-04-29 16:53:42', NULL, 0, NULL, '', NULL, NULL, ''),
(2, NULL, 7, '29 Apr 2025 17:05:04:6810eaa08bfc2', '2025-04-29 17:05:04', NULL, 0, NULL, '', NULL, NULL, ''),
(3, NULL, 7, '29 Apr 2025 17:12:00:6810ec40356c1', '2025-04-29 17:12:00', NULL, 0, NULL, '', NULL, NULL, ''),
(4, NULL, 7, '29 Apr 2025 17:25:07:6810ef5324959', '2025-04-29 17:25:07', NULL, 0, NULL, '', NULL, NULL, ''),
(5, NULL, 1, '08 May 2025 09:43:44:681c60b0144a9', '2025-05-08 09:43:44', NULL, 0, NULL, '', NULL, NULL, ''),
(6, NULL, 1, '09 May 2025 17:48:21:681e23c57b491', '2025-05-09 17:48:21', NULL, 0, NULL, '', NULL, NULL, ''),
(7, NULL, 1, '14 May 2025 09:27:50:682445f657f41', '2025-05-14 09:27:50', NULL, 0, NULL, '', NULL, NULL, ''),
(8, NULL, 1, '14 May 2025 09:31:31:682446d304723', '2025-05-14 09:31:31', NULL, 0, NULL, '', NULL, NULL, ''),
(9, NULL, 1, '14 May 2025 09:42:38:6824496e7c8b9', '2025-05-14 09:42:38', NULL, 0, NULL, '', NULL, NULL, ''),
(10, NULL, 1, '14 May 2025 09:44:30:682449ded7205', '2025-05-14 09:44:30', NULL, 0, NULL, '', NULL, NULL, ''),
(11, NULL, 1, '14 May 2025 17:11:35:6824b2a7d41de', '2025-05-14 17:11:35', NULL, 0, NULL, '', NULL, NULL, ''),
(12, NULL, 1, '15 May 2025 09:20:59:682595db3adb4', '2025-05-15 09:20:59', NULL, 0, NULL, '', NULL, NULL, ''),
(13, NULL, 1, '16 May 2025 12:48:58:6827181a95f34', '2025-05-16 12:48:58', NULL, 0, NULL, '', NULL, NULL, ''),
(14, NULL, 1, '16 May 2025 16:47:40:6827500c9a07a', '2025-05-16 16:47:40', NULL, 0, NULL, '', NULL, NULL, ''),
(15, NULL, 1, '21 May 2025 13:03:54:682db31a78b6f', '2025-05-21 13:03:54', NULL, 0, NULL, '', NULL, NULL, ''),
(16, NULL, 1, '21 May 2025 13:06:16:682db3a838f32', '2025-05-21 13:06:16', NULL, 0, NULL, '', NULL, NULL, ''),
(17, NULL, 1, '22 May 2025 11:02:48:682ee838def91', '2025-05-22 11:02:48', NULL, 0, NULL, '', NULL, NULL, ''),
(18, NULL, 1, '22 May 2025 12:16:54:682ef996c7552', '2025-05-22 12:16:54', 1, 0, NULL, '', NULL, NULL, ''),
(19, NULL, 1, '22 May 2025 16:00:41:682f2e09a83f1', '2025-05-22 16:00:41', 1, 0, NULL, '', NULL, NULL, ''),
(20, NULL, 1, '22 May 2025 17:01:35:682f3c4f3d0b4', '2025-05-22 17:01:35', 2, 0, NULL, '', NULL, NULL, ''),
(21, NULL, 1, '27 May 2025 20:58:13:68360b459c127', '2025-05-27 20:58:13', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(22, NULL, 1, '27 May 2025 21:48:46:6836171eec3b0', '2025-05-27 21:48:46', 2, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(23, NULL, 1, '28 May 2025 09:24:42:6836ba3a573c0', '2025-05-28 09:24:42', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(24, NULL, 1, '28 May 2025 11:16:08:6836d4582b94d', '2025-05-28 11:16:08', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(25, NULL, 1, '28 May 2025 11:18:37:6836d4edc1b51', '2025-05-28 11:18:37', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(26, NULL, 1, '28 May 2025 11:19:29:6836d52158322', '2025-05-28 11:19:29', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(27, NULL, 1, '28 May 2025 11:19:35:6836d527bda4b', '2025-05-28 11:19:35', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(28, NULL, 1, '28 May 2025 11:19:57:6836d53d5f3d8', '2025-05-28 11:19:57', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(29, NULL, 1, '28 May 2025 11:21:38:6836d5a2e0221', '2025-05-28 11:21:38', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(30, NULL, 1, '28 May 2025 11:23:05:6836d5f9dd3e5', '2025-05-28 11:23:05', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(31, NULL, 1, '28 May 2025 11:24:56:6836d668bc472', '2025-05-28 11:24:56', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(32, NULL, 1, '28 May 2025 11:26:04:6836d6acb04f1', '2025-05-28 11:26:04', 2, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(33, NULL, 1, '28 May 2025 11:26:07:6836d6af37924', '2025-05-28 11:26:07', 2, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(34, NULL, 1, '28 May 2025 11:26:29:6836d6c5acdab', '2025-05-28 11:26:29', 2, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(35, NULL, 1, '28 May 2025 11:27:09:6836d6ed4b874', '2025-05-28 11:27:09', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(36, NULL, 1, '28 May 2025 11:28:31:6836d73fbf5fb', '2025-05-28 11:28:31', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(37, NULL, 1, '28 May 2025 11:34:22:6836d89e12c55', '2025-05-28 11:34:22', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(38, NULL, 1, '28 May 2025 11:35:25:6836d8dd5bec3', '2025-05-28 11:35:25', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(39, NULL, 1, '28 May 2025 11:36:39:6836d927178b4', '2025-05-28 11:36:39', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(40, NULL, 1, '28 May 2025 11:36:46:6836d92eb27cd', '2025-05-28 11:36:46', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(41, NULL, 1, '28 May 2025 11:38:55:6836d9af50e40', '2025-05-28 11:38:55', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(42, NULL, 1, '28 May 2025 11:40:56:6836da28c1b36', '2025-05-28 11:40:56', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(43, NULL, 1, '28 May 2025 11:50:16:6836dc585a52b', '2025-05-28 11:50:16', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(44, NULL, 1, '28 May 2025 11:50:50:6836dc7ad9e77', '2025-05-28 11:50:50', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(45, NULL, 1, '28 May 2025 12:25:09:6836e485ea0a8', '2025-05-28 12:25:09', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(46, NULL, 1, '28 May 2025 12:52:50:6836eb02f23de', '2025-05-28 12:52:50', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(47, NULL, 1, '28 May 2025 12:54:40:6836eb702e96b', '2025-05-28 12:54:40', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(48, NULL, 1, '28 May 2025 12:54:43:6836eb7349406', '2025-05-28 12:54:43', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(49, NULL, 1, '28 May 2025 12:56:22:6836ebd621638', '2025-05-28 12:56:22', 2, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(50, NULL, 1, '28 May 2025 13:00:16:6836ecc0d70e5', '2025-05-28 13:00:16', 2, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(51, NULL, 1, '28 May 2025 13:12:18:6836ef92961a2', '2025-05-28 13:12:18', 2, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(52, NULL, 1, '28 May 2025 13:21:16:6836f1ac4eb05', '2025-05-28 13:21:16', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(53, NULL, 1, '28 May 2025 13:31:15:6836f403eaa3f', '2025-05-28 13:31:15', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(54, NULL, 1, '28 May 2025 13:34:15:6836f4b7ab215', '2025-05-28 13:34:15', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(55, NULL, 1, '28 May 2025 13:45:49:6836f76d27f52', '2025-05-28 13:45:49', 1, 0, 0, 'stripe', NULL, NULL, '</br>Benoit  Gambier</br></br>admin@demo.fr  12 rue des sots</br></br>Paris  75</br>'),
(56, NULL, 1, '04 Jun 2025 16:32:18:684058f22b5fa', '2025-06-04 16:32:18', 1, 0, 0, 'stripe', NULL, NULL, 'Benoit  Gambier</br>admin@demo.fr  12 rue des sots</br>Paris  75</br>'),
(57, NULL, 1, '09 Jun 2025 08:52:01:68468491d2941', '2025-06-09 08:52:01', 1, 0, 0, 'stripe', NULL, NULL, 'Benoit  Gambier</br>admin@demo.fr  12 rue des sots</br>Paris  75</br>'),
(58, NULL, 1, '09 Jun 2025 09:55:42:6846937edacc1', '2025-06-09 09:55:42', 5, 0, 0, 'stripe', NULL, NULL, 'Benoit  Gambier</br>admin@demo.fr  12 rue des sots</br>Paris  75</br>'),
(59, NULL, 1, '12 Jun 2025 08:57:47:684a7a6b1728e', '2025-06-12 08:57:47', 2, 0, 0, 'stripe', NULL, NULL, 'Benoit  Gambier</br>admin@demo.fr  12 rue des sots</br>Paris  75</br>'),
(60, NULL, 1, '12 Jun 2025 10:48:39:684a9467b9ebf', '2025-06-12 10:48:39', 5, 0, 0, 'stripe', NULL, NULL, 'Benoit  Gambier</br>admin@demo.fr  12 rue des sots</br>Paris  75</br>'),
(61, NULL, 1, '12 Jun 2025 11:44:38:684aa18680eaf', '2025-06-12 11:44:38', 1, 0, 0, 'stripe', NULL, NULL, 'Benoit  Gambier</br>admin@demo.fr  12 rue des sots</br>Paris  75</br>'),
(62, NULL, 1, '12 Jun 2025 11:51:33:684aa32577060', '2025-06-12 11:51:33', 2, 0, 0, 'stripe', NULL, NULL, 'Benoit  Gambier</br>admin@demo.fr  12 rue des sots</br>Paris  75</br>'),
(63, NULL, 1, '12 Jun 2025 11:53:32:684aa39c2824c', '2025-06-12 11:53:32', 2, 0, 0, 'stripe', NULL, NULL, 'Benoit  Gambier</br>admin@demo.fr  12 rue des sots</br>Paris  75</br>'),
(64, NULL, 1, '12 Jun 2025 12:12:10:684aa7fa2c44f', '2025-06-12 12:12:10', 2, 0, 0, 'stripe', 'cs_test_b1iyFTrm5RmWGKlC2fEz40OrT2wJRiJDXBVT3sUAEnBBB79BC4DyfkbMeC', NULL, 'Benoit  Gambier</br>admin@demo.fr  12 rue des sots</br>Paris  75</br>'),
(65, NULL, 1, '12 Jun 2025 12:17:28:684aa938160c1', '2025-06-12 12:17:28', 2, 0, 0, 'stripe', 'cs_test_b1oFtrtkgq46z0vmv07cl1d3HOaYekajfgtvxu6im7XzzCOmoDm6grSmmt', NULL, 'Benoit  Gambier</br>admin@demo.fr  12 rue des sots</br>Paris  75</br>'),
(66, NULL, 1, '12 Jun 2025 12:44:10:684aaf7a887a7', '2025-06-12 12:44:10', 2, 0, 0, 'stripe', 'cs_test_b1JZQgdxBhmfb89NnJCIOtOyTMphS63lHRNA1MS768WKGlR7Mv7vayXZDb', NULL, 'Benoit  Gambier</br>admin@demo.fr  12 rue des sots</br>Paris  75</br>'),
(67, NULL, 8, '12 Jun 2025 14:59:44:684acf40b5d60', '2025-06-12 14:59:44', 2, 0, 0, 'stripe', NULL, NULL, 'rambo  john</br>johnrambo@gmail.com  washington</br>washington  00000</br>'),
(68, NULL, 8, '16 Jun 2025 09:12:48:684fc3f035153', '2025-06-16 09:12:48', 5, 0, 0, 'stripe', 'cs_test_b1DPUtply4dNgKHHZnRfgYjiMXT9hZQyZWr6MG5S9z75JYg5P9oEyQ2KgE', NULL, 'rambo  john</br>johnrambo@gmail.com  washington</br>washington  00000</br>'),
(69, NULL, 8, '16 Jun 2025 10:37:50:684fd7de3c47e', '2025-06-16 10:37:50', 2, 0, 0, 'stripe', NULL, NULL, 'rambo  john</br>johnrambo@gmail.com  washington</br>washington  00000</br>'),
(70, NULL, 8, '16 Jun 2025 11:01:23:684fdd6358420', '2025-06-16 11:01:23', 2, 0, 0, 'stripe', NULL, NULL, 'rambo  john</br>johnrambo@gmail.com  washington</br>washington  00000</br>'),
(71, NULL, 8, '16 Jun 2025 11:40:42:684fe69a1f61b', '2025-06-16 11:40:42', 1, 0, 0, 'stripe', NULL, NULL, 'rambo  john</br>johnrambo@gmail.com  washington</br>washington  00000</br>'),
(72, NULL, 8, '19 Jun 2025 12:07:27:6853e15f1b080', '2025-06-19 12:07:27', 1, 0, 0, 'paypal', NULL, NULL, 'rambo  john</br>johnrambo@gmail.com  washington</br>washington  00000</br>'),
(73, NULL, 1, '27 Jun 2025 15:35:54:685e9e3a71102', '2025-06-27 15:35:54', 1, 0, 0, 'paypal', NULL, NULL, 'Benoit  Gambier</br>admin@demo.fr  12 rue des sots</br>Paris  75</br>'),
(74, NULL, 1, '27 Jun 2025 15:55:48:685ea2e472d92', '2025-06-27 15:55:48', 2, 0, 0, 'stripe', NULL, NULL, 'Benoit  Gambier</br>admin@demo.fr  12 rue des sots</br>Paris  75</br>'),
(75, NULL, 1, '27 Jun 2025 16:10:57:685ea671670da', '2025-06-27 16:10:57', 2, 0, 0, 'paypal', NULL, NULL, 'Benoit  Gambier</br>admin@demo.fr  12 rue des sots</br>Paris  75</br>'),
(76, NULL, 1, '27 Jun 2025 16:40:57:685ead7973f24', '2025-06-27 16:40:57', 2, 0, 0, 'paypal', NULL, NULL, 'Benoit  Gambier</br>admin@demo.fr  12 rue des sots</br>Paris  75</br>'),
(77, NULL, 1, '27 Jun 2025 17:02:50:685eb29a8c095', '2025-06-27 17:02:50', 2, 0, 0, 'paypal', NULL, NULL, 'Benoit  Gambier</br>admin@demo.fr  12 rue des sots</br>Paris  75</br>'),
(78, NULL, 1, '27 Jun 2025 17:10:00:685eb448d4aba', '2025-06-27 17:10:00', 2, 0, 0, 'stripe', NULL, NULL, 'Benoit  Gambier</br>admin@demo.fr  12 rue des sots</br>Paris  75</br>'),
(79, NULL, 1, '27 Jun 2025 17:11:49:685eb4b5e6958', '2025-06-27 17:11:49', 2, 0, 0, 'stripe', NULL, NULL, 'Benoit  Gambier</br>admin@demo.fr  12 rue des sots</br>Paris  75</br>'),
(80, NULL, 1, '27 Jun 2025 17:59:12:685ebfd0f3835', '2025-06-27 17:59:12', 2, 0, 0, 'paypal', NULL, '2XH010827H050181E', 'Benoit  Gambier</br>admin@demo.fr  12 rue des sots</br>Paris  75</br>'),
(81, NULL, 8, '04 Jul 2025 16:37:32:6867e72ca55fe', '2025-07-04 16:37:32', 1, 0, 0, 'paypal', NULL, '88480365V3065205D', 'rambo  john</br>johnrambo@gmail.com  washington</br>washington  00000</br>'),
(82, NULL, 8, '04 Jul 2025 19:27:25:68680efd643bf', '2025-07-04 19:27:25', 2, 0, 0, 'paypal', NULL, '88383347P3960404P', 'rambo  john</br>johnrambo@gmail.com  washington</br>washington  00000</br>'),
(83, NULL, 8, '04 Jul 2025 20:30:26:68681dc2c6ecd', '2025-07-04 20:30:26', 2, 0, 0, 'paypal', NULL, '6UF86897LW480544N', 'rambo  john</br>johnrambo@gmail.com  washington</br>washington  00000</br>'),
(84, NULL, 8, '04 Jul 2025 20:52:06:686822d6f1f68', '2025-07-04 20:52:06', 2, 0, 0, 'paypal', NULL, '4RU25481EN396053T', 'rambo  john</br>johnrambo@gmail.com  washington</br>washington  00000</br>'),
(85, NULL, 8, '04 Jul 2025 21:01:52:686825203b6e3', '2025-07-04 21:01:52', 2, 0, 0, 'paypal', NULL, '82Y77008X85111913', 'rambo  john</br>johnrambo@gmail.com  washington</br>washington  00000</br>'),
(86, NULL, 8, '04 Jul 2025 21:02:37:6868254d13cfe', '2025-07-04 21:02:37', 5, 0, 0, 'stripe', NULL, NULL, 'rambo  john</br>johnrambo@gmail.com  washington</br>washington  00000</br>'),
(87, NULL, 8, '10 Jul 2025 10:56:11:686f802bcd4a0', '2025-07-10 10:56:11', 2, 1, 0, 'paypal', NULL, '9R069193W47273509', 'rambo  john</br>johnrambo@gmail.com  washington</br>washington  00000</br>'),
(88, NULL, 8, '10 Jul 2025 11:26:04:686f872cde297', '2025-07-10 11:26:04', 6, 0, 0, 'paypal', NULL, '02143733FM1020848', 'rambo  john</br>johnrambo@gmail.com  washington</br>washington  00000</br>'),
(89, NULL, 8, '10 Jul 2025 11:28:51:686f87d378aaa', '2025-07-10 11:28:51', 2, 0, 0, 'stripe', NULL, NULL, 'rambo  john</br>johnrambo@gmail.com  washington</br>washington  00000</br>'),
(90, NULL, 8, '10 Jul 2025 12:04:18:686f90229b38d', '2025-07-10 12:04:18', 2, 0, 0, 'stripe', NULL, NULL, 'rambo  john</br>johnrambo@gmail.com  washington</br>washington  00000</br>'),
(91, NULL, 8, '10 Jul 2025 12:41:24:686f98d496754', '2025-07-10 12:41:24', 2, 0, 0, 'stripe', NULL, NULL, 'rambo  john</br>johnrambo@gmail.com  washington</br>washington  00000</br>'),
(92, NULL, 1, '11 Jul 2025 09:11:43:6870b92f55ada', '2025-07-11 09:11:43', 1, 0, 0, 'stripe', NULL, NULL, 'Benoit  Gambier</br>admin@demo.fr  12 rue des sots</br>Paris  75</br>'),
(93, NULL, 1, '11 Jul 2025 09:51:52:6870c2984e596', '2025-07-11 09:51:52', 1, 0, 0, 'stripe', NULL, NULL, 'Benoit  Gambier</br>admin@demo.fr  12 rue des sots</br>Paris  75</br>'),
(94, NULL, 1, '11 Jul 2025 12:03:55:6870e18b81e4f', '2025-07-11 12:03:55', 1, 0, 0, 'stripe', NULL, NULL, 'Benoit  Gambier</br>admin@demo.fr  12 rue des sots</br>Paris  75</br>'),
(95, NULL, 1, '11 Jul 2025 12:25:20:6870e6909bbbd', '2025-07-11 12:25:20', 5, 0, 0, 'stripe', NULL, NULL, 'Benoit  Gambier</br>admin@demo.fr  12 rue des sots</br>Paris  75</br>'),
(96, NULL, 1, '11 Jul 2025 12:27:26:6870e70edf7db', '2025-07-11 12:27:26', 2, 1, 0, 'paypal', NULL, '0Y932466KM913042F', 'Benoit  Gambier</br>admin@demo.fr  12 rue des sots</br>Paris  75</br>'),
(97, NULL, 1, '11 Jul 2025 12:32:07:6870e827caf33', '2025-07-11 12:32:07', 2, 0, 0, 'stripe', NULL, NULL, 'Benoit  Gambier</br>admin@demo.fr  12 rue des sots</br>Paris  75</br>'),
(98, NULL, 1, '11 Jul 2025 12:36:34:6870e932a47b9', '2025-07-11 12:36:34', 5, 0, 0, 'stripe', NULL, NULL, 'Benoit  Gambier</br>admin@demo.fr  12 rue des sots</br>Paris  75</br>'),
(99, NULL, 1, '11 Jul 2025 12:55:37:6870eda974813', '2025-07-11 12:55:37', 5, 0, 0, 'stripe', NULL, NULL, 'Benoit  Gambier</br>admin@demo.fr  12 rue des sots</br>Paris  75</br>');

-- --------------------------------------------------------

--
-- Structure de la table `orders_details`
--

CREATE TABLE `orders_details` (
  `orders_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `orders_details`
--

INSERT INTO `orders_details` (`orders_id`, `products_id`, `quantity`, `price`) VALUES
(1, 25, 3, 49900),
(2, 25, 3, 49900),
(3, 25, 1, 49900),
(4, 24, 1, 49900),
(4, 28, 1, 25000),
(5, 27, 3, 35000),
(6, 24, 2, 49900),
(7, 25, 1, 49900),
(8, 27, 1, 35000),
(9, 24, 1, 49900),
(10, 25, 1, 49900),
(11, 25, 1, 49900),
(12, 24, 2, 49900),
(12, 25, 2, 49900),
(13, 24, 1, 49900),
(13, 25, 3, 49900),
(14, 25, 3, 49900),
(15, 25, 1, 49900),
(16, 25, 1, 49900),
(17, 25, 1, 49900),
(18, 25, 1, 49900),
(19, 25, 1, 49900),
(20, 24, 1, 49900),
(20, 25, 2, 49900),
(21, 28, 2, 25000),
(22, 24, 3, 49900),
(22, 25, 2, 49900),
(23, 24, 1, 49900),
(23, 25, 1, 49900),
(24, 24, 1, 49900),
(24, 25, 1, 49900),
(25, 24, 1, 49900),
(25, 25, 1, 49900),
(26, 24, 1, 49900),
(26, 25, 1, 49900),
(27, 24, 1, 49900),
(27, 25, 1, 49900),
(28, 24, 1, 49900),
(28, 25, 1, 49900),
(29, 24, 1, 49900),
(29, 25, 1, 49900),
(30, 24, 1, 49900),
(30, 25, 1, 49900),
(31, 24, 1, 49900),
(31, 25, 1, 49900),
(32, 24, 1, 49900),
(32, 25, 1, 49900),
(33, 24, 1, 49900),
(33, 25, 1, 49900),
(34, 24, 1, 49900),
(34, 25, 1, 49900),
(35, 24, 1, 49900),
(35, 25, 1, 49900),
(36, 24, 1, 49900),
(36, 25, 1, 49900),
(37, 24, 1, 49900),
(37, 25, 1, 49900),
(38, 24, 1, 49900),
(38, 25, 1, 49900),
(39, 24, 1, 49900),
(39, 25, 1, 49900),
(40, 24, 1, 49900),
(40, 25, 1, 49900),
(41, 24, 1, 49900),
(41, 25, 1, 49900),
(42, 24, 1, 49900),
(42, 25, 1, 49900),
(43, 24, 1, 49900),
(43, 25, 1, 49900),
(44, 24, 1, 49900),
(44, 25, 1, 49900),
(45, 24, 1, 49900),
(45, 25, 1, 49900),
(46, 24, 1, 49900),
(46, 25, 1, 49900),
(47, 24, 1, 49900),
(47, 25, 1, 49900),
(48, 24, 1, 49900),
(48, 25, 1, 49900),
(49, 24, 1, 49900),
(49, 25, 1, 49900),
(50, 24, 1, 49900),
(50, 25, 1, 49900),
(51, 24, 1, 49900),
(51, 25, 1, 49900),
(52, 24, 1, 49900),
(52, 25, 1, 49900),
(53, 25, 1, 49900),
(54, 25, 1, 49900),
(55, 25, 1, 49900),
(56, 25, 1, 49900),
(57, 25, 2, 49900),
(58, 25, 1, 49900),
(59, 25, 1, 49900),
(60, 25, 1, 49900),
(61, 25, 2, 49900),
(62, 25, 1, 49900),
(63, 25, 1, 49900),
(64, 28, 1, 25000),
(65, 25, 3, 49900),
(66, 25, 1, 49900),
(67, 25, 1, 49900),
(68, 25, 1, 49900),
(69, 25, 1, 49900),
(70, 25, 1, 49900),
(71, 25, 1, 49900),
(72, 25, 1, 49900),
(73, 25, 1, 49900),
(74, 25, 2, 49900),
(75, 25, 1, 49900),
(76, 25, 1, 49900),
(77, 25, 1, 49900),
(78, 25, 1, 49900),
(79, 25, 1, 49900),
(80, 25, 1, 49900),
(81, 25, 1, 49900),
(82, 25, 1, 49900),
(83, 25, 1, 49900),
(84, 25, 1, 49900),
(85, 25, 1, 49900),
(86, 25, 1, 49900),
(87, 25, 2, 49900),
(88, 25, 2, 49900),
(89, 25, 1, 49900),
(90, 25, 1, 49900),
(91, 25, 1, 49900),
(92, 25, 1, 49900),
(93, 25, 1, 49900),
(94, 25, 1, 49900),
(95, 25, 1, 49900),
(96, 25, 3, 49900),
(97, 25, 2, 49900),
(98, 25, 2, 49900),
(99, 25, 2, 49900);

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '(DC2Type:datetime_immutable)',
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `categories_id`, `name`, `description`, `price`, `stock`, `created_at`, `slug`) VALUES
(24, 3, 'Ecran Desktop Asus', 'portable 16g0 r', 49900, 10, '2025-04-03 19:15:53', 'Ecran-Desktop-Asus'),
(25, 3, 'Ecran Desktop HP', 'Ecran 80 pouces Hewlett packard', 49900, 10, '2025-04-03 19:33:51', 'Ecran-Desktop-HP'),
(26, 3, 'Ecran Desktop HP', 'Ecran 80', 49900, 10, '2025-04-03 19:45:33', 'Ecran-Desktop-HP'),
(27, 3, 'Ecran Lenovo', 'Ecran 60pouces', 35000, 2, '2025-04-04 19:40:41', 'Ecran-Lenovo'),
(28, 3, 'Ecran', 'Ecran 50 pouces', 25000, 50, '2025-04-11 20:18:31', 'Ecran'),
(29, 3, 'Ecran PCS36GD', 'Écran PC 24\" Essential Monitor S3 S36GD FHD 100Hz', 10100, 50, '2025-08-12 10:53:24', 'Ecran-PCS36GD'),
(30, 3, 'ordinateur Desktop Asus', 'Ecran pc', 15000, 10, '2025-08-12 12:41:22', 'ordinateur-Desktop-Asus'),
(31, 3, 'ordinateur Desktop Asus', 'Ecran pc', 15000, 10, '2025-08-12 12:41:35', 'ordinateur-Desktop-Asus'),
(32, 3, 'ordinateur Desktop Asus', 'Ecran pc', 15000, 10, '2025-08-12 12:42:13', 'ordinateur-Desktop-Asus'),
(33, 3, 'ordinateur Desktop Asus', 'Ecran pc', 15000, 10, '2025-08-12 12:43:00', 'ordinateur-Desktop-Asus'),
(34, 3, 'Ecran Epson', 'Ecran oled', 20000, 10, '2025-08-12 12:49:54', 'Ecran-Epson'),
(35, 3, 'Ecran Epson', 'Ecran', 20000, 10, '2025-08-12 12:57:06', 'Ecran-Epson'),
(36, 3, 'Ecran Asus', 'Ecran double hdmi', 10000, 20, '2025-08-12 13:00:02', 'Ecran-Asus'),
(37, 3, 'Ecran Asus', 'Ecran double hdmi', 10000, 20, '2025-08-12 13:00:18', 'Ecran-Asus'),
(38, 3, 'LG 24U421A-B Ecran PC bureautique', 'Ecran Desktop LG', 30000, 15, '2025-08-18 09:52:14', 'LG-24U421A-B-Ecran-PC-bureautique'),
(39, 3, 'LG 24U421A-B Ecran PC bureautique', 'Ecran Desktop LG', 30000, 15, '2025-08-18 09:52:32', 'LG-24U421A-B-Ecran-PC-bureautique'),
(40, 3, 'Minifire Écran PC 27\" FHD 1080', 'Petit Ecran enfant', 9900, 5, '2025-08-18 10:20:26', 'Minifire-Ecran-PC-27-FHD-1080'),
(41, 3, 'LG 24U421A-B Ecran PC bureautique', 'Ecran LG', 9900, 15, '2025-08-18 10:59:07', 'LG-24U421A-B-Ecran-PC-bureautique'),
(42, 3, 'LG 24U421A-B Ecran PC bureautique', 'Ecran LG', 9900, 15, '2025-08-18 10:59:30', 'LG-24U421A-B-Ecran-PC-bureautique'),
(43, 3, 'LG 24U421A-B Ecran PC bureautique', 'Ecran large LG', 30000, 15, '2025-08-18 11:06:01', 'LG-24U421A-B-Ecran-PC-bureautique'),
(44, 3, 'LG 24U421A-B Ecran PC bureautique', 'Ecran large LG', 30000, 15, '2025-08-18 11:06:16', 'LG-24U421A-B-Ecran-PC-bureautique'),
(45, 3, 'Ecran PCS36GD', 'Nouvel EcranAsus 80 pouces', 25000, 50, '2025-08-18 11:26:59', 'Ecran-PCS36GD'),
(46, 6, 'Veste Homme', 'Veste', 15000, 15, '2025-08-18 12:18:03', 'Veste-Homme'),
(47, 7, 'veste femme', 'Veste femme', 9900, 20, '2025-08-18 12:21:13', 'veste-femme'),
(48, 2, 'Ordinateur Portable 15,6 Pouces', 'Ordinateur Portable 15,6 Pouces, PC Portable Win 11, écran HD 1920x1080 Core jusqu\'à 3,4 GHz, Pc Portable 16Go 512Go SSD, Laptop avec WiFi 5 BT5.0, USB-3.0, Type-c,Emplacement pour Carte TF, HDMI', 26000, 10, '2025-08-18 12:25:30', 'Ordinateur-Portable-15-6-Pouces'),
(49, 9, 'HKR Basket Femme', 'Chaussure de Running Sneakers', 4000, 45, '2025-08-29 15:43:41', 'HKR-Basket-Femme'),
(50, 11, 'veste femme', 'veste Hiver grande taille', 15000, 20, '2025-08-29 16:36:31', 'veste-femme'),
(51, 11, 'Veste femme', 'veste femme', 2500, 123, '2025-09-03 16:38:52', 'Veste-femme'),
(52, 9, 'Chaussure femme', 'escarpin', 2500, 300, '2025-09-03 16:45:12', 'Chaussure-femme'),
(53, 9, 'Chaussure femme', 'escarpin', 2500, 300, '2025-09-03 16:45:15', 'Chaussure-femme'),
(54, 9, 'Chaussure femme', 'Escarpin', 12500, 20, '2025-09-03 16:46:15', 'Chaussure-femme'),
(55, 11, 'Veste femme', 'veste femme', 4500, 15, '2025-09-03 16:55:01', 'Veste-femme'),
(56, 11, 'Veste femme', 'veste pluie', 2500, 40, '2025-09-03 17:45:12', 'Veste-femme'),
(57, 9, 'Chaussure femme', 'escarpin rose', 4500, 50, '2025-09-04 09:45:34', 'Chaussure-femme'),
(58, 9, 'Chaussure femme', 'Escarpin rose', 2500, 20, '2025-09-04 09:58:08', 'Chaussure-femme'),
(59, 9, 'Chaussure femme', 'escarpin', 2500, 10, '2025-09-04 10:00:51', 'Chaussure-femme'),
(60, 11, 'Veste femme', 'veste grande', 4500, 45, '2025-09-04 12:27:27', 'Veste-femme'),
(61, 11, 'Veste femme', 'veste pluie', 4500, 10, '2025-09-04 15:23:22', 'Veste-femme'),
(62, 11, 'Veste femme', 'veste pluie', 6500, 10, '2025-09-04 16:19:05', 'Veste-femme'),
(63, 12, 'Pantalon femme', 'pantalon femme', 3000, 10, '2025-09-04 17:10:11', 'Pantalon-femme'),
(64, 12, 'Pantalon femme', 'jean femme', 4500, 100, '2025-09-04 17:19:32', 'Pantalon-femme');

-- --------------------------------------------------------

--
-- Structure de la table `recap_details`
--

CREATE TABLE `recap_details` (
  `id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `product` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `total_recap` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `recap_details`
--

INSERT INTO `recap_details` (`id`, `order_product_id`, `quantity`, `product`, `price`, `total_recap`) VALUES
(1, 22, 3, 'Ecran Desktop Asus', 49900, 1497),
(2, 23, 1, 'Ecran Desktop HP', 49900, 499),
(3, 23, 1, 'Ecran Desktop Asus', 49900, 499),
(4, 24, 1, 'Ecran Desktop Asus', 49900, 499),
(5, 24, 1, 'Ecran Desktop HP', 49900, 499),
(6, 25, 1, 'Ecran Desktop Asus', 49900, 499),
(7, 25, 1, 'Ecran Desktop HP', 49900, 499),
(8, 26, 1, 'Ecran Desktop Asus', 49900, 499),
(9, 26, 1, 'Ecran Desktop HP', 49900, 499),
(10, 27, 1, 'Ecran Desktop Asus', 49900, 499),
(11, 27, 1, 'Ecran Desktop HP', 49900, 499),
(12, 28, 1, 'Ecran Desktop Asus', 49900, 499),
(13, 28, 1, 'Ecran Desktop HP', 49900, 499),
(14, 29, 1, 'Ecran Desktop Asus', 49900, 499),
(15, 29, 1, 'Ecran Desktop HP', 49900, 499),
(16, 30, 1, 'Ecran Desktop Asus', 49900, 499),
(17, 30, 1, 'Ecran Desktop HP', 49900, 499),
(18, 31, 1, 'Ecran Desktop Asus', 49900, 499),
(19, 31, 1, 'Ecran Desktop HP', 49900, 499),
(20, 32, 1, 'Ecran Desktop Asus', 49900, 499),
(21, 32, 1, 'Ecran Desktop HP', 49900, 499),
(22, 33, 1, 'Ecran Desktop Asus', 49900, 499),
(23, 33, 1, 'Ecran Desktop HP', 49900, 499),
(24, 34, 1, 'Ecran Desktop Asus', 49900, 499),
(25, 34, 1, 'Ecran Desktop HP', 49900, 499),
(26, 35, 1, 'Ecran Desktop Asus', 49900, 499),
(27, 35, 1, 'Ecran Desktop HP', 49900, 499),
(28, 36, 1, 'Ecran Desktop Asus', 49900, 499),
(29, 36, 1, 'Ecran Desktop HP', 49900, 499),
(30, 37, 1, 'Ecran Desktop Asus', 49900, 499),
(31, 37, 1, 'Ecran Desktop HP', 49900, 499),
(32, 38, 1, 'Ecran Desktop Asus', 49900, 499),
(33, 38, 1, 'Ecran Desktop HP', 49900, 499),
(34, 39, 1, 'Ecran Desktop Asus', 49900, 499),
(35, 39, 1, 'Ecran Desktop HP', 49900, 499),
(36, 40, 1, 'Ecran Desktop Asus', 49900, 499),
(37, 40, 1, 'Ecran Desktop HP', 49900, 499),
(38, 41, 1, 'Ecran Desktop Asus', 49900, 499),
(39, 41, 1, 'Ecran Desktop HP', 49900, 499),
(40, 42, 1, 'Ecran Desktop Asus', 49900, 499),
(41, 42, 1, 'Ecran Desktop HP', 49900, 499),
(42, 43, 1, 'Ecran Desktop Asus', 49900, 499),
(43, 43, 1, 'Ecran Desktop HP', 49900, 499),
(44, 44, 1, 'Ecran Desktop Asus', 49900, 499),
(45, 44, 1, 'Ecran Desktop HP', 49900, 499),
(46, 45, 1, 'Ecran Desktop Asus', 49900, 499),
(47, 45, 1, 'Ecran Desktop HP', 49900, 499),
(48, 46, 1, 'Ecran Desktop Asus', 49900, 499),
(49, 46, 1, 'Ecran Desktop HP', 49900, 499),
(50, 47, 1, 'Ecran Desktop Asus', 49900, 499),
(51, 47, 1, 'Ecran Desktop HP', 49900, 499),
(52, 48, 1, 'Ecran Desktop Asus', 49900, 499),
(53, 48, 1, 'Ecran Desktop HP', 49900, 499),
(54, 49, 1, 'Ecran Desktop Asus', 49900, 499),
(55, 49, 1, 'Ecran Desktop HP', 49900, 499),
(56, 50, 1, 'Ecran Desktop Asus', 49900, 499),
(57, 50, 1, 'Ecran Desktop HP', 49900, 499),
(58, 51, 1, 'Ecran Desktop Asus', 49900, 499),
(59, 51, 1, 'Ecran Desktop HP', 49900, 499),
(60, 52, 1, 'Ecran Desktop Asus', 49900, 499),
(61, 52, 1, 'Ecran Desktop HP', 49900, 499),
(62, 53, 1, 'Ecran Desktop HP', 49900, 499),
(63, 54, 1, 'Ecran Desktop HP', 49900, 499),
(64, 55, 1, 'Ecran Desktop HP', 49900, 499),
(65, 56, 1, 'Ecran Desktop HP', 49900, 499),
(66, 57, 2, 'Ecran Desktop HP', 49900, 998),
(67, 58, 1, 'Ecran Desktop HP', 49900, 499),
(68, 59, 1, 'Ecran Desktop HP', 49900, 499),
(69, 60, 1, 'Ecran Desktop HP', 49900, 499),
(70, 61, 2, 'Ecran Desktop HP', 49900, 998),
(71, 62, 1, 'Ecran Desktop HP', 49900, 499),
(72, 63, 1, 'Ecran Desktop HP', 49900, 499),
(73, 64, 1, 'Ecran', 25000, 250),
(74, 65, 3, 'Ecran Desktop HP', 49900, 1497),
(75, 66, 1, 'Ecran Desktop HP', 49900, 499),
(76, 67, 1, 'Ecran Desktop HP', 49900, 499),
(77, 68, 1, 'Ecran Desktop HP', 49900, 499),
(78, 69, 1, 'Ecran Desktop HP', 49900, 499),
(79, 70, 1, 'Ecran Desktop HP', 49900, 499),
(80, 71, 1, 'Ecran Desktop HP', 49900, 499),
(81, 72, 1, 'Ecran Desktop HP', 49900, 499),
(82, 73, 1, 'Ecran Desktop HP', 49900, 499),
(83, 74, 2, 'Ecran Desktop HP', 49900, 998),
(84, 75, 1, 'Ecran Desktop HP', 49900, 499),
(85, 76, 1, 'Ecran Desktop HP', 49900, 499),
(86, 77, 1, 'Ecran Desktop HP', 49900, 499),
(87, 78, 1, 'Ecran Desktop HP', 49900, 499),
(88, 79, 1, 'Ecran Desktop HP', 49900, 499),
(89, 80, 1, 'Ecran Desktop HP', 49900, 499),
(90, 81, 1, 'Ecran Desktop HP', 49900, 499),
(91, 82, 1, 'Ecran Desktop HP', 49900, 499),
(92, 83, 1, 'Ecran Desktop HP', 49900, 499),
(93, 84, 1, 'Ecran Desktop HP', 49900, 499),
(94, 85, 1, 'Ecran Desktop HP', 49900, 499),
(95, 86, 1, 'Ecran Desktop HP', 49900, 499),
(96, 87, 2, 'Ecran Desktop HP', 49900, 998),
(97, 88, 2, 'Ecran Desktop HP', 49900, 998),
(98, 89, 1, 'Ecran Desktop HP', 49900, 499),
(99, 90, 1, 'Ecran Desktop HP', 49900, 499),
(100, 91, 1, 'Ecran Desktop HP', 49900, 499),
(101, 92, 1, 'Ecran Desktop HP', 49900, 499),
(102, 93, 1, 'Ecran Desktop HP', 49900, 499),
(103, 94, 1, 'Ecran Desktop HP', 49900, 499),
(104, 95, 1, 'Ecran Desktop HP', 49900, 499),
(105, 96, 3, 'Ecran Desktop HP', 49900, 1497),
(106, 97, 2, 'Ecran Desktop HP', 49900, 998),
(107, 98, 2, 'Ecran Desktop HP', 49900, 998),
(108, 99, 2, 'Ecran Desktop HP', 49900, 998);

-- --------------------------------------------------------

--
-- Structure de la table `transporteur`
--

CREATE TABLE `transporteur` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `transpoter`
--

CREATE TABLE `transpoter` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `transpoter`
--

INSERT INTO `transpoter` (`id`, `title`, `content`, `price`) VALUES
(1, 'Colissimo', 'Transporteur filiale La Poste', 15),
(2, 'Mondial relay', 'transporteur Mondial relay', 10),
(5, 'Amazon Locker Centre commercial Auchan', 'livré en 48 heures', 5),
(6, 'Amazon Locker Laposte', 'livré en 48 heures', 5);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(5) NOT NULL,
  `city` varchar(150) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `lastname`, `address`, `zipcode`, `city`, `firstname`, `created_at`) VALUES
(1, 'admin@demo.fr', '[\"ROLE_ADMIN\"]', '$2y$13$.yZpsPrJJaC8YlM973QzKOxRcTAcM7/GVZGD/0X3T8JO39.aBOwcC', 'Gambier', '12 rue des sots', '75', 'Paris', 'Benoit', '2025-03-28 12:10:09'),
(2, 'suzanne.richard@club-internet.fr', '[\"ROLE_USER\"]', '$2y$13$GGxHRZd.Hm9H95WkCcALhesg43QYcU.bq.sTrA8.WpqTqXZiw0uiy', 'Dupre', '475, place Gabrielle Duhamel', '40966', 'Neveu', 'Auguste', '2025-03-28 12:10:10'),
(3, 'helene.petit@gomez.org', '[\"ROLE_USER\"]', '$2y$13$Zx0mF058Om.Uu3ObU9rn9OzTgo0ID2rKAiGxRRSVsR0BDGLgXrgqK', 'Deschamps', '18, avenue Loiseau', '13708', 'Mary-sur-Mer', 'Claude', '2025-03-28 12:10:11'),
(4, 'uroussel@gmail.com', '[\"ROLE_USER\"]', '$2y$13$O3.b7W5OS8WqW5S5S/FdWOvXX1YRVymKcoV3AVZ1pPSCJ61vMuxuC', 'Lelievre', '65, place de Martin', '81130', 'Joubert-la-Forêt', 'Brigitte', '2025-03-28 12:10:11'),
(5, 'obruneau@boulanger.com', '[\"ROLE_USER\"]', '$2y$13$XpAdOzhbna7HuQaYLcLdPe9cY73Hx.ACgXef2Lo2GhzNq7ji4gldO', 'Leduc', '74, avenue de Gregoire', '48069', 'RoyerBourg', 'René', '2025-03-28 12:10:11'),
(6, 'arnaude.boyer@godard.com', '[\"ROLE_USER\"]', '$2y$13$MwDDqSn6dN/MRuSznMvINOcqIuvzTG3Oi6t9tSoIfd.9aUtAyT8H6', 'Rousset', '360, rue Michaud', '13103', 'Lelievre-la-Forêt', 'André', '2025-03-28 12:10:12'),
(7, 'kareentrump@mail.us', '[]', '$2y$13$eXM3/awJWiTc0S9SjfYGY.cBQ.KfvO4VmfHpkq2nkfkKAG9R2fYSa', 'kareen', 'washington', '00000', 'washington', 'trump', '2025-04-29 15:48:41'),
(8, 'johnrambo@gmail.com', '[]', '$2y$13$m30ibN1ugFOQ2BgnTxRjdOTBQdNq46oktX5I.1NGfjgjIHlF/Y1JO', 'john', 'washington', '00000', 'washington', 'rambo', '2025-06-12 12:28:16');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_3AF34668727ACA70` (`parent_id`);

--
-- Index pour la table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_F564111877153098` (`code`),
  ADD KEY `IDX_F5641118CC42426B` (`coupons_type_id`);

--
-- Index pour la table `coupons_types`
--
ALTER TABLE `coupons_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `imagecategorie`
--
ALTER TABLE `imagecategorie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E84D1DFCBCF5E72D` (`categorie_id`);

--
-- Index pour la table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E01FBE6A6C8A81A9` (`products_id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_E52FFDEEAEA34913` (`reference`),
  ADD KEY `IDX_E52FFDEE6D72B15C` (`coupons_id`),
  ADD KEY `IDX_E52FFDEE67B3B43D` (`users_id`),
  ADD KEY `IDX_E52FFDEE97C86FA4` (`transporteur_id`);

--
-- Index pour la table `orders_details`
--
ALTER TABLE `orders_details`
  ADD PRIMARY KEY (`orders_id`,`products_id`),
  ADD KEY `IDX_835379F1CFFE9AD6` (`orders_id`),
  ADD KEY `IDX_835379F16C8A81A9` (`products_id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B3BA5A5AA21214B7` (`categories_id`);

--
-- Index pour la table `recap_details`
--
ALTER TABLE `recap_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1D1FD69F65E9B0F` (`order_product_id`);

--
-- Index pour la table `transporteur`
--
ALTER TABLE `transporteur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `transpoter`
--
ALTER TABLE `transpoter`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `coupons_types`
--
ALTER TABLE `coupons_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `imagecategorie`
--
ALTER TABLE `imagecategorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT pour la table `recap_details`
--
ALTER TABLE `recap_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT pour la table `transporteur`
--
ALTER TABLE `transporteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `transpoter`
--
ALTER TABLE `transpoter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `FK_3AF34668727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `FK_F5641118CC42426B` FOREIGN KEY (`coupons_type_id`) REFERENCES `coupons_types` (`id`);

--
-- Contraintes pour la table `imagecategorie`
--
ALTER TABLE `imagecategorie`
  ADD CONSTRAINT `FK_E84D1DFCBCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`);

--
-- Contraintes pour la table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `FK_E01FBE6A6C8A81A9` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`);

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_E52FFDEE67B3B43D` FOREIGN KEY (`users_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_E52FFDEE6D72B15C` FOREIGN KEY (`coupons_id`) REFERENCES `coupons` (`id`),
  ADD CONSTRAINT `FK_E52FFDEE97C86FA4` FOREIGN KEY (`transporteur_id`) REFERENCES `transpoter` (`id`);

--
-- Contraintes pour la table `orders_details`
--
ALTER TABLE `orders_details`
  ADD CONSTRAINT `FK_835379F16C8A81A9` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK_835379F1CFFE9AD6` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`);

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_B3BA5A5AA21214B7` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`);

--
-- Contraintes pour la table `recap_details`
--
ALTER TABLE `recap_details`
  ADD CONSTRAINT `FK_1D1FD69F65E9B0F` FOREIGN KEY (`order_product_id`) REFERENCES `orders` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
