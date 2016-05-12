-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2016 at 08:39 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ubu`
--
CREATE DATABASE IF NOT EXISTS `ubu` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ubu`;

-- --------------------------------------------------------

--
-- Table structure for table `chat_rooms`
--

DROP TABLE IF EXISTS `chat_rooms`;
CREATE TABLE `chat_rooms` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chat_rooms`
--

INSERT INTO `chat_rooms` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'hola', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comentarios-codigos`
--

DROP TABLE IF EXISTS `comentarios-codigos`;
CREATE TABLE `comentarios-codigos` (
  `id` bigint(80) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `codigo_id` bigint(20) NOT NULL,
  `comentario` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comentarios-codigos`
--

INSERT INTO `comentarios-codigos` (`id`, `user_id`, `codigo_id`, `comentario`) VALUES
(1, 8, 3, 'Este código es genial'),
(2, 8, 3, 'A ver crack, como le hiciste'),
(3, 8, 3, 'error en linea 3'),
(4, 8, 3, 'jajajaj idiota'),
(5, 8, 3, 'Y en la 4 no hay nada'),
(6, 8, 3, 'Lol, si funciono');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `privacy` tinyint(1) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups_members`
--

DROP TABLE IF EXISTS `groups_members`;
CREATE TABLE `groups_members` (
  `interaction_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `interaction_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`interaction_id`, `post_id`, `user_id`) VALUES
(17, 21, 15),
(19, 20, 15);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `chat_room_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2016_03_29_211015_create_profiles_table', 1),
('2016_03_29_220312_create_posts_table', 1),
('2016_03_29_225832_create_groups_table', 1),
('2016_05_08_192357_create_chat_rooms_table', 2),
('2016_05_08_192530_create_messages_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(11) NOT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mencion` bigint(20) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `id_user`, `text`, `mencion`, `created_at`, `updated_at`) VALUES
(15, 13, 'Madre mia del amor hermoso', 13, '2016-04-17 05:17:44', NULL),
(16, 13, 'Qué Honduras con tus verduras que tienes a bajas temperaturas?!', 8, '2016-04-17 18:23:52', NULL),
(17, 13, 'Ah raza!', 13, '2016-04-17 19:11:11', NULL),
(19, 13, 'Dio mio que pro', 13, '2016-04-17 19:20:12', NULL),
(20, 13, 'Que narices tio!', 11, '2016-04-17 19:22:44', NULL),
(21, 11, 'Joder macho ! dejame!', 11, '2016-04-17 19:23:36', NULL),
(22, 15, 'sup', 15, '2016-04-20 14:26:54', NULL),
(23, 15, '(◕︵◕)', 11, '2016-04-20 16:42:00', NULL),
(24, 15, '?¿?¿?¿?¿?¿', 15, '2016-04-21 03:15:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `suscribciones`
--

DROP TABLE IF EXISTS `suscribciones`;
CREATE TABLE `suscribciones` (
  `id` bigint(20) NOT NULL,
  `suscriptor_id` bigint(20) NOT NULL,
  `suscripcion_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `suscribciones`
--

INSERT INTO `suscribciones` (`id`, `suscriptor_id`, `suscripcion_id`) VALUES
(1, 13, 8),
(5, 13, 12),
(6, 11, 8),
(7, 13, 11),
(8, 13, 10),
(9, 15, 11);

-- --------------------------------------------------------

--
-- Table structure for table `user-data`
--

DROP TABLE IF EXISTS `user-data`;
CREATE TABLE `user-data` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `profile_picture` varchar(5000) NOT NULL DEFAULT 'https://raw.githubusercontent.com/Garyi/UbuSocialNetwork/master/public/users-data/profile-pictures/defaultpicture.png',
  `profile_cover` varchar(5000) DEFAULT NULL,
  `Twitter` varchar(5000) DEFAULT NULL,
  `fav-language` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user-data`
--

INSERT INTO `user-data` (`id`, `user_id`, `profile_picture`, `profile_cover`, `Twitter`, `fav-language`) VALUES
(2, 8, 'https://raw.githubusercontent.com/Garyi/UbuSocialNetwork/master/public/users-data/profile-pictures/defaultpicture.png', NULL, NULL, NULL),
(5, 10, 'https://raw.githubusercontent.com/Garyi/UbuSocialNetwork/master/public/users-data/profile-pictures/defaultpicture.png', NULL, NULL, NULL),
(6, 11, 'https://raw.githubusercontent.com/Garyi/UbuSocialNetwork/master/public/users-data/profile-pictures/defaultpicture.png', NULL, NULL, NULL),
(7, 12, 'https://raw.githubusercontent.com/Garyi/UbuSocialNetwork/master/public/users-data/profile-pictures/defaultpicture.png', NULL, NULL, NULL),
(8, 13, 'https://raw.githubusercontent.com/Garyi/UbuSocialNetwork/master/public/users-data/profile-pictures/defaultpicture.png', NULL, NULL, NULL),
(9, 14, 'https://raw.githubusercontent.com/Garyi/UbuSocialNetwork/master/public/users-data/profile-pictures/defaultpicture.png', NULL, NULL, NULL),
(10, 15, 'https://raw.githubusercontent.com/Garyi/UbuSocialNetwork/master/public/users-data/profile-pictures/defaultpicture.png', NULL, NULL, NULL),
(11, 16, 'https://raw.githubusercontent.com/Garyi/UbuSocialNetwork/master/public/users-data/profile-pictures/defaultpicture.png', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(8, 'Edgar Arroyo', 'hi.ed@hotmail.com', '4dab03bd0b05b7b5799ef56dd8f26bc4', NULL, NULL, NULL),
(10, 'Eddie Lozano', 'eddie@hotmail.com', 'b67733c3e4ddc0633ddb2531e3a51ec9', NULL, NULL, NULL),
(11, 'Aldair Alvarado', 'alda@hotmail.com', 'f897b8d1e5cc779db28d2cbed3eaf188', NULL, NULL, NULL),
(12, 'Oscar Rangel', 'oscar@hotmail.com', 'f156e7995d521f30e6c59a3d6c75e1e5', NULL, NULL, NULL),
(13, 'Alex', 'alex@hotmail.com', '534b44a19bf18d20b71ecc4eb77c572f', NULL, NULL, NULL),
(15, 'Miguel Mtz', 'miguel_mtz2121@hotmail.com', '3714cc6e9d3193e4f4535ab76ab9d1b6', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups_members`
--
ALTER TABLE `groups_members`
  ADD PRIMARY KEY (`interaction_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`interaction_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_chat_room_id_foreign` (`chat_room_id`),
  ADD KEY `messages_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suscribciones`
--
ALTER TABLE `suscribciones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user-data`
--
ALTER TABLE `user-data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `groups_members`
--
ALTER TABLE `groups_members`
  MODIFY `interaction_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `interaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `suscribciones`
--
ALTER TABLE `suscribciones`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `user-data`
--
ALTER TABLE `user-data`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_chat_room_id_foreign` FOREIGN KEY (`chat_room_id`) REFERENCES `chat_rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
