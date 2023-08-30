SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


CREATE TABLE IF NOT EXISTS `categories` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;


INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Categoria Prueba'),
(3, 'Farmacos Humanos'),
(5, 'Equipo Medico'),
(4, 'Mascotas'),
(2, 'Equipo de Analisis Clinico'),
(8, 'Pruebas'),
(6, 'Equipo');

CREATE TABLE IF NOT EXISTS `branchs` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;


INSERT INTO `branchs` (`id`, `name`) VALUES
(1, 'Boulevard Morazan'),
(3, 'Boulevard Morazan II'),
(5, 'Boulevard Juan Pablo II'),
(4, 'Salida Norte'),
(2, 'Salida Sur'),
(8, 'Boulevard Centro'),
(6, '3 Avenida');

CREATE TABLE IF NOT EXISTS `media` (
`id` int(11) unsigned NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `products` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` varchar(50) DEFAULT NULL,
  `buy_price` decimal(25,2) DEFAULT NULL,
  `sale_price` decimal(25,2) NOT NULL,
  `categorie_id` int(11) unsigned NOT NULL,
  `expire_date` DATE,
  `media_id` int(11) DEFAULT '0',
  `date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;



INSERT INTO `products` (`id`, `name`, `quantity`, `buy_price`, `sale_price`, `expire_date`, `categorie_id`, `media_id`, `date`) VALUES
(1, 'Demo Product', '48', '100.00', '500.00', 1, '2025-01-01', 0, '2021-04-04 16:45:51'),
(2, 'Pet Master Adulto 20 kg', '120', '125.00', '190.00', 4, '2025-01-01', 0, '2021-04-04 18:44:52'),
(3, 'Bravecto 4.5-10 kg', '20', '700.00', '1000.00', 4, '2025-01-01', 0, '2021-04-04 18:48:53');


CREATE TABLE IF NOT EXISTS `sales` (
`id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(25,2) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;


INSERT INTO `sales` (`id`, `product_id`, `qty`, `price`, `date`) VALUES
(1, 1, 2, '1000.00', '2021-04-04'),
(2, 3, 3, '1500.00', '2021-04-04');


CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(60) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_level` int(11) NOT NULL,
  `image` varchar(255) DEFAULT 'no_image.jpg',
  `status` int(1) NOT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;



INSERT INTO `users` (`id`, `name`, `username`, `password`, `user_level`, `image`, `status`, `last_login`) VALUES
(1, 'Eduardo David', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, 'no_image.png', 1, '2021-04-04 19:45:52'),
(2, 'David Flores', 'special', 'ba36b97a41e7faf742ab09bf88405ac04f99599a', 2, 'no_image.png', 1, '2021-04-04 19:53:26'),
(3, 'Joana Martinez', 'user', '12dea96fec20593566ab75692c9949596833adc9', 3, 'no_image.png', 1, '2021-04-04 19:54:46');


CREATE TABLE IF NOT EXISTS `user_groups` (
`id` int(11) NOT NULL,
  `group_name` varchar(150) NOT NULL,
  `group_level` int(11) NOT NULL,
  `group_status` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;


INSERT INTO `user_groups` (`id`, `group_name`, `group_level`, `group_status`) VALUES
(1, 'Jefe de Tienda', 1, 1),
(2, 'Usuario Especial', 2, 1),
(3, 'Usuario Regular', 3, 1);



ALTER TABLE `categories`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);


ALTER TABLE `media`
 ADD PRIMARY KEY (`id`), ADD KEY `id` (`id`);


ALTER TABLE `products`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`), ADD KEY `categorie_id` (`categorie_id`), ADD KEY `media_id` (`media_id`);

ALTER TABLE `sales`
 ADD PRIMARY KEY (`id`), ADD KEY `product_id` (`product_id`);

ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD KEY `user_level` (`user_level`);

ALTER TABLE `user_groups`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `group_level` (`group_level`);

ALTER TABLE `categories`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;

ALTER TABLE `media`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;

ALTER TABLE `products`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;

ALTER TABLE `sales`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;

ALTER TABLE `users`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;

ALTER TABLE `user_groups`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;

ALTER TABLE `products`
ADD CONSTRAINT `FK_products` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `sales`
ADD CONSTRAINT `SK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `users`
ADD CONSTRAINT `FK_user` FOREIGN KEY (`user_level`) REFERENCES `user_groups` (`group_level`) ON DELETE CASCADE ON UPDATE CASCADE;
