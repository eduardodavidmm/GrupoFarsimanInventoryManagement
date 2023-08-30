SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


CREATE TABLE IF NOT EXISTS `categories` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;


INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Antibioticos'),
(3, 'Farmacos Humanos'),
(5, 'Oftalmologicos y Oticos'),
(4, 'Mascotas'),
(2, 'Equipo de Analisis Clinico'),
(8, 'Pruebas Medicas'),
(6, 'Equipo Medico');


CREATE TABLE IF NOT EXISTS `branchs` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;


INSERT INTO `branchs` (`id`, `name`) VALUES
(1, '13 Calle - San Pedro Sula'),
(2, '20 Calle - San Pedro Sula'),
(3, 'Segundo Anillo - San Pedro Sula'),
(4, 'Arenales - San Pedro Sula'),
(5, 'Avenida Junior - San Pedro Sula'),
(6, 'Catarino Rivas - San Pedro Sula'),
(7, 'Boulevard Morazan - Tegucigalpa'),
(8, 'Plaza Lomas - Tegucigalpa'),
(9, 'Colonia Loarque - Tegucigalpa'),
(10, 'Anillo Periferico - Tegucigalpa'),
(11, 'Toncontin - Tegucigalpa'),
(12, 'Juan Pablo II - Tegucigalpa'),
(13, 'Miramar - La Ceiba'),
(14, 'Medicentro - La Ceiba'),
(15, 'MegaPlaza - La Ceiba'),
(16, 'Centro - El Porgreso'),
(17, 'Barrio Cabanas - El Progreso'),
(18, 'San Isidro - El Paraiso'),
(19, 'Altamira - El Paraiso');


CREATE TABLE IF NOT EXISTS `media` (
`id` int(11) unsigned NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;



INSERT INTO `products` (`id`, `name`, `quantity`, `buy_price`, `sale_price`, `categorie_id`,`expire_date`, `media_id`, `date`) VALUES
(1, 'Demo Product', '48', '100.00', '500.00', 1, '2025-01-01', 0, '2023-04-04 16:45:51'),
(2, 'Pet Master Adulto 20 kg', '120', '125.00', '190.00', 4, '2025-01-01', 0, '2023-04-04 18:44:52'),
(3, 'Eukanuba Adult 4.5 lb', '120', '300.00', '568.00', 4, '2025-01-01', 0, '2023-04-04 18:44:52'),
(4, 'BayTril 150 mg', '10', '100.00', '630.00', 4, '2025-01-01', 0, '2023-04-04 18:44:52'),
(5, 'Doxican 200 mg', '10', '300.00', '430.00', 4, '2025-01-01', 0, '2023-04-04 18:44:52'),
(6, 'Metrazol 200 mg', '50', '20.00', '70.00', 4, '2025-01-01', 0, '2023-04-04 18:44:52'),
(7, 'Bravecto 4.5-10 kg', '20', '700.00', '1000.00', 4, '2025-01-01', 0, '2023-04-04 18:48:53'),
(8, 'Borbalan Gotas', '20', '50.00', '190.00', 3, '2026-01-01', 0, '2023-04-04 18:48:53'),
(9, 'Calmol Pediatrico', '100', '50.00', '790.00', 3, '2026-01-01', 0, '2023-04-04 18:48:53'),
(10, 'Naprox', '90', '60.00', '980.00', 3, '2026-01-01', 0, '2023-04-04 18:48:53'),
(11, 'Diclofenaco', '150', '150.00', '190.00', 3, '2026-01-01', 0, '2023-04-04 18:48:53'),
(12, 'Botiquin', '20', '370.00', '790.00', 6, '2026-01-01', 0, '2023-04-04 18:48:53'),
(13, 'Dexprofar', '120', '150.00', '390.00', 3, '2026-01-01', 0, '2023-04-04 18:48:53'),
(14, 'Histadril', '600', '500.00', '900.00', 8, '2026-01-01', 0, '2023-04-04 18:48:53'),
(15, 'Louten Emulsion', '1000', '300.00', '800.00', 8, '2026-01-01', 0, '2023-04-04 18:48:53'),
(16, 'Xegrex 30 ml', '1000', '300.00', '900.00', 3, '2026-01-01', 0, '2023-04-04 18:48:53'),
(17, 'Louten Emulsion', '1000', '300.00', '800.00', 3, '2026-01-01', 0, '2023-04-04 18:48:53'),
(18, 'Denual 150 mg', '1000', '900.00', '1800.00', 3, '2026-01-01', 0, '2023-04-04 18:48:53'),
(19, 'Corentel 30 Tabletas', '1000', '300.00', '800.00', 3, '2026-01-01', 0, '2023-04-04 18:48:53'),
(20, 'Bravecto 10-20kg', '1000', '700.00', '1800.00', 4, '2026-01-01', 0, '2023-04-04 18:48:53'),
(21, 'Bravecto 20-40kg', '1000', '800.00', '1900.00', 4, '2026-01-01', 0, '2023-04-04 18:48:53'),
(22, 'LipoForm', '3000', '98.00', '150.00', 4, '2026-01-01', 0, '2023-04-04 18:48:53'),
(23, 'Clorexivet', '500', '200.00', '360.00', 4, '2026-01-01', 0, '2023-04-04 18:48:53'),
(24, 'PuppyForm', '1100', '300.00', '600.00', 4, '2026-01-01', 0, '2023-04-04 18:48:53');




CREATE TABLE IF NOT EXISTS `sales` (
`id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(25,2) NOT NULL,
  `date` date NOT NULL,
  `branch_id` int(11) unsigned NULL,
  `status` int(1) NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;


INSERT INTO `sales` (`id`, `product_id`, `qty`, `price`, `date`, `branch_id`, `status`) VALUES
(1, 1, 2, '500.00', '2023-08-08', 1, 1),
(2, 3, 3, '570.00', '2023-08-08', 2, 1);


CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(60) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_level` int(11) NOT NULL,
  `image` varchar(255) DEFAULT 'no_image.jpg',
  `status` int(1) NOT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;



INSERT INTO `users` (`id`, `name`, `username`, `password`, `user_level`, `image`, `status`, `last_login`) VALUES
(1, 'Eduardo David', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, 'no_image.png', 1, '2023-04-04 19:45:52'),
(2, 'Joana Martinez', 'special', 'ba36b97a41e7faf742ab09bf88405ac04f99599a', 2, 'no_image.png', 1, '2023-04-04 19:53:26'),
(3, 'Jose Lopez', 'user', '12dea96fec20593566ab75692c9949596833adc9', 3, 'no_image.png', 1, '2023-04-04 19:54:46'),
(4, 'Juan Perez', 'usertwo', '12dea96fec20593566ab75692c9949596833adc9', 3, 'no_image.png', 1, '2023-04-04 19:54:46'),
(5, 'David Aguilar', 'userthree', '12dea96fec20593566ab75692c9949596833adc9', 3, 'no_image.png', 1, '2023-04-04 19:54:46');


CREATE TABLE IF NOT EXISTS `user_groups` (
`id` int(11) NOT NULL,
  `group_name` varchar(150) NOT NULL,
  `group_level` int(11) NOT NULL,
  `group_status` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


INSERT INTO `user_groups` (`id`, `group_name`, `group_level`, `group_status`) VALUES
(1, 'Jefe de Tienda', 1, 1),
(2, 'Usuario Especial', 2, 1),
(3, 'Usuario Regular', 3, 1);



ALTER TABLE `categories`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`); 

ALTER TABLE `branchs`
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

ALTER TABLE `branchs`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;

ALTER TABLE `media`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;

ALTER TABLE `products`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;

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


ALTER TABLE `sales`
ADD CONSTRAINT `FK` FOREIGN KEY (`branch_id`) REFERENCES `branchs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `users`
ADD CONSTRAINT `FK_user` FOREIGN KEY (`user_level`) REFERENCES `user_groups` (`group_level`) ON DELETE CASCADE ON UPDATE CASCADE;
