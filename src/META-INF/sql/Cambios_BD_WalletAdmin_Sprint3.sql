-- Ajustes en Esquema de Preferencias
-- author: yamelis Almea
-- Fecha: 15/07/2020

DROP TABLE IF EXISTS `alodigaWallet`.`preference_control`;
DROP TABLE IF EXISTS `alodigaWallet`.`preference_value`;
DROP TABLE IF EXISTS `alodigaWallet`.`preference_field_data`;
DROP TABLE IF EXISTS `alodigaWallet`.`preference_field`;
DROP TABLE IF EXISTS `alodigaWallet`.`preference_type`;
DROP TABLE IF EXISTS `alodigaWallet`.`preference`;
DROP TABLE IF EXISTS `alodigaWallet`.`preference_classification`;


CREATE TABLE `alodigaWallet`.`preference` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

INSERT INTO `alodigaWallet`.`preference` VALUES (1,'session',1,'Values relacionados con las sesion'),
(2,'background',1,'Can set default and not default values'),
(3,'transaction',1,'All related to transaction.'),
(4,'commission',1,'Value relacionados con la session');

CREATE TABLE `preference_type` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

INSERT INTO `alodigaWallet`.`preference_type` VALUES (1,'INTEGER'),
(2,'FLOAT'),
(3,'STRING'),
(4,'DATE'),
(5,'PERIOD');



CREATE TABLE `alodigaWallet`.`preference_field` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `preferenceId` bigint(10) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `preferenceTypeId` bigint(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_preference_field_preference1` (`preferenceId`),
  KEY `fk_preference_field_preference_type1` (`preferenceTypeId`),
  CONSTRAINT `fk_preference_field_preference1` FOREIGN KEY (`preferenceId`) REFERENCES `preference` (`id`),
  CONSTRAINT `fk_preference_field_preference_type1` FOREIGN KEY (`preferenceTypeId`) REFERENCES `preference_type` (`id`)
) ENGINE=InnoDB;


INSERT INTO `alodigaWallet`.`preference_field` VALUES (1,'TIMEOUT_INACTIVE_SESSION',1,1,1),
(4,'MAX_TRANSACTION_AMOUNT_LIMIT',3,1,1),
(7,'MAX_WRONG_LOGIN_INTENT_NUMBER',1,1,1),
(8,'PERIOD',1,1,1),
(9,'DISABLED_TRANSACTION',3,1,1),
(10,'MAX_TRANSACTION_AMOUNT_DAILY_LIMIT',3,1,1),
(12,'DEFAULT_SMS_PROVIDER',2,1,1),
(19,'MIN_VALUE_BALANCE_TRANSFER_TO',3,1,1),
(20,'MAX_TRANSACTION_AMOUNT_MONTHLY_LIMIT',3,1,1),
(21,'MAX_TRANSACTION_AMOUNT_YEARLY_LIMIT',3,1,1),
(22,'MAX_TRANSACTION_QUANTITY_DAILY_LIMIT',3,1,1),
(23,'MAX_TRANSACTION_QUANTITY_MONTHLY_LIMIT',3,1,1),
(24,'MAX_TRANSACTION_QUANTITY_YEARLY_LIMIT',3,1,1);



CREATE TABLE `preference_field_data` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `preferenceFieldId` bigint(20) NOT NULL,
  `languageId` bigint(3) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_preference_field_data_preference_field1` (`preferenceFieldId`),
  KEY `fk_preference_field_data_language1` (`languageId`),
  CONSTRAINT `fk_preference_field_data_language1` FOREIGN KEY (`languageId`) REFERENCES `language` (`id`),
  CONSTRAINT `fk_preference_field_data_preference_field1` FOREIGN KEY (`preferenceFieldId`) REFERENCES `preference_field` (`id`)
) ENGINE=InnoDB;


INSERT INTO `alodigaWallet`.`preference_field_data` VALUES ('1', '1', '1', 'Timeout inactive session'),
('2', '1', '2', 'Maximo tiempo de inactividad de sesion'),
('3', '4', '1', 'Max transaction amount limit'),
('4', '4', '2', 'Monto limite maximo por transaccion'),
('5', '7', '1', 'Max wrong number intent login'),
('6', '7', '2', 'Maximo numero de intentos de login'),
('7', '8', '1', 'Period'),
('8', '8', '2', 'Periodo'),
('9', '9', '1', 'Enabled transactions'),
('10', '9', '2', 'Transacciones habilitadas'),
('11', '10', '1', 'Max transaction amount limit (Daily).'),
('12', '10', '2', 'Monto limite maximo por transaccion (Diario)'),
('13', '12', '1', 'Default SMS provider'),
('14', '12', '2', 'Proveedor SMS predeterminado'),
('15', '19', '1', 'Min Value balance Transferto'),
('16', '19', '2', 'Minimo Saldo de Transferto'),
('17', '20', '1', 'Max transaction amount limit (Monthly).'),
('18', '20', '2', 'Monto limite maximo por transaccion (Mensual)'),
('19', '21', '1', 'Max transaction amount limit (Yearly).'),
('20', '21', '2', 'Monto limite maximo por transaccion (Anual)'),
('21', '22', '1', 'Max transaction quantity limit (Daily).'),
('22', '22', '2', 'Monto limite maximo por transaccion (Diario)'),
('23', '23', '1', 'Max transaction quantity limit (Monthly).'),
('24', '23', '2', 'Monto limite maximo por transaccion (Mensual)'),
('25', '24', '1', 'Max transaction quantity limit (Yearly).'),
('26', '24', '2', 'Monto limite maximo por transaccion (Anual)');


CREATE TABLE `alodigaWallet`.`preference_classification` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

INSERT INTO `alodigaWallet`.`preference_classification` VALUES (1,'cliente',1),
(2,'negocio',1);


CREATE TABLE `alodigaWallet`.`preference_value` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `value` varchar(45) NOT NULL,
  `preferenceFieldId` bigint(20) NOT NULL,
  `productId` bigint(3) DEFAULT NULL,
  `transactionTypeId` bigint(3) DEFAULT NULL,
  `preferenceClassficationId` bigint(3) NOT NULL,
  `preferenceValueParentId` bigint(10) DEFAULT NULL,
  `bussinessId` bigint(10) DEFAULT NULL,
  `createDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_preference_value_preference_field2` (`preferenceFieldId`),
  KEY `fk_preference_value_product2` (`productId`),
  KEY `fk_preference_value_transactionType2` (`transactionTypeId`),
  KEY `fk_preference_value_preference_classification2` (`preferenceClassficationId`),
  KEY `fk_preference_value_preference_value2` (`preferenceValueParentId`),
  CONSTRAINT `fk_preference_value_preference_fiel2` FOREIGN KEY (`preferenceFieldId`) REFERENCES `preference_field` (`id`),
  CONSTRAINT `fk_preference_value_product2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_preference_value_transactionType2` FOREIGN KEY (`transactionTypeId`) REFERENCES `transaction_type` (`id`),
  CONSTRAINT `fk_preference_value_preference_classification2` FOREIGN KEY (`preferenceClassficationId`) REFERENCES `preference_classification` (`id`),
   CONSTRAINT `fk_preference_value_preference_value2` FOREIGN KEY (`preferenceValueParentId`) REFERENCES `preference_value` (`id`)
) ENGINE=InnoDB;


INSERT INTO `alodigaWallet`.`preference_value` VALUES (1,'20',1,NULL,NULL,1,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(2,'500000',4,NULL,NULL,1,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(3,'5',7,NULL,NULL,1,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(4,'1',8,NULL,NULL,1,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(5,'1',9,NULL,NULL,1,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(6,'1500000',10,NULL,NULL,1,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(7,'1',12,NULL,NULL,1,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(8,'100',19,NULL,NULL,1,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(9,'2500000',20,NULL,NULL,1,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(10,'25000000',21,NULL,NULL,1,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(11,'10',22,NULL,NULL,1,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(12,'50',23,NULL,NULL,1,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(13,'200',24,NULL,NULL,1,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1);


CREATE TABLE `alodigaWallet`.`preference_control` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `userId` bigint(10) NOT NULL,
  `paramOld` varchar(255) NOT NULL,
  `creationDate` datetime NOT NULL,
  `preferenceValueId` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_preference_control_userId1` (`userId`),
  KEY `fk_preference_control_preference_value_1` (`preferenceValueId`),
  CONSTRAINT `fk_preference_control_preference_value_1` FOREIGN KEY (`preferenceValueId`) REFERENCES `preference_value`  (`id`),
  CONSTRAINT `fk_preference_control_userId1` FOREIGN KEY (`userId`) REFERENCES `user`  (`id`)
) ENGINE=InnoDB;


INSERT INTO `alodigawallet`.`provider` (`id`, `name`, `url`, `isSMSProvider`, `enabled`, `aditionalPercent`) VALUES ('2', 'Twilio', 'www', '1', '1', '0');

-- Agregar campo en tabla product
-- author: Jesús Gómez
-- Fecha: 15/07/2020
ALTER TABLE `alodigaWallet`.`product` 
ADD COLUMN `indHasAssociatedBank` TINYINT(1) NULL AFTER `isPaymentInfo`;
