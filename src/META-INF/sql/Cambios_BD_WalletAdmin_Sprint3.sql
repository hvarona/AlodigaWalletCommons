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

CREATE TABLE `alodigaWallet`.`preference_type` (
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



CREATE TABLE `alodigaWallet`.`preference_field_data` (
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
(7,'2',12,NULL,NULL,1,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(8,'100',19,NULL,NULL,1,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(9,'2500000',20,NULL,NULL,1,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(10,'25000000',21,NULL,NULL,1,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(11,'10',22,NULL,NULL,1,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(12,'50',23,NULL,NULL,1,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(13,'200',24,NULL,NULL,1,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(14,'20',1,NULL,NULL,2,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(15,'500000',4,NULL,NULL,2,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(16,'5',7,NULL,NULL,2,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(17,'1',8,NULL,NULL,2,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(18,'1',9,NULL,NULL,2,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(19,'1500000',10,NULL,NULL,2,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(20,'2',12,NULL,NULL,2,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(21,'100',19,NULL,NULL,2,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(22,'2500000',20,NULL,NULL,2,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(23,'25000000',21,NULL,NULL,2,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(24,'10',22,NULL,NULL,2,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(25,'50',23,NULL,NULL,2,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1),
(26,'200',24,NULL,NULL,2,NULL,NULL,'2020-07-14 14:40:46','2020-07-14 15:17:48',1);


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


INSERT INTO `alodigaWallet`.`provider` (`id`, `name`, `url`, `isSMSProvider`, `enabled`, `aditionalPercent`) VALUES ('2', 'Twilio', 'www', '1', '1', '0');

ALTER TABLE `alodigaWallet`.`user_has_profile_has_enterprise` 
DROP FOREIGN KEY `fk_user_has_profile_has_enterprise_enterprise1`;
ALTER TABLE `alodigaWallet`.`user_has_profile_has_enterprise` 
DROP COLUMN `enterpriseId`,
DROP INDEX `fk_user_has_profile_has_enterprise_enterprise1` ;
;
ALTER TABLE `alodigaWallet`.`user_has_profile_has_enterprise` 
RENAME TO  `alodigaWallet`.`user_has_profile` ;

-- Agregar campo en tabla product
-- author: Jesús Gómez
-- Fecha: 15/07/2020
ALTER TABLE `alodigaWallet`.`product` 
ADD COLUMN `indHasAssociatedBank` TINYINT(1) NULL AFTER `isPaymentInfo`;

-- Agregar tabla collection_type
-- author: Jesús Gómez
-- Fecha: 21/07/2020
CREATE TABLE IF NOT EXISTS `alodigaWallet`.`collection_type` (
  `id` INT NOT NULL,
  `description` VARCHAR(50) NOT NULL,
  `countryId` BIGINT(3) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_collectionType_country1_idx` (`countryId` ASC),
  CONSTRAINT `fk_collectionType_country1`
    FOREIGN KEY (`countryId`)
    REFERENCES `alodigaWallet`.`country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Agregar tabla person_type
-- author: Jesús Gómez
-- Fecha: 21/07/2020
CREATE TABLE IF NOT EXISTS `alodigaWallet`.`person_type` (
  `id` INT NOT NULL,
  `description` VARCHAR(50) NULL,
  `countryId` BIGINT(3) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_personType_country1_idx` (`countryId` ASC),
  CONSTRAINT `fk_personType_country1`
    FOREIGN KEY (`countryId`)
    REFERENCES `alodigaWallet`.`country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Agregar tabla documents_person_type
-- author: Jesús Gómez
-- Fecha: 21/07/2020
CREATE TABLE IF NOT EXISTS `alodigaWallet`.`documents_person_type` (
  `id` INT NOT NULL,
  `description` VARCHAR(50) NULL,
  `personTypeId` INT NOT NULL,
  `codeIdentification` VARCHAR(10) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_documentsPersonType_personType1_idx` (`personTypeId` ASC),
  CONSTRAINT `fk_documentsPersonType_personType1`
    FOREIGN KEY (`personTypeId`)
    REFERENCES `alodigaWallet`.`person_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Agregar tabla collections_request
-- author: Jesús Gómez
-- Fecha: 21/07/2020
CREATE TABLE IF NOT EXISTS `alodigaWallet`.`collections_request` (
  `id` INT NOT NULL,
  `collectionTypeId` INT NOT NULL,
  `categoryId` BIGINT(3) NOT NULL,
  `personTypeId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_collectionsRequest_collectionType1_idx` (`collectionTypeId` ASC),
  INDEX `fk_collectionsRequest_category1_idx` (`categoryId` ASC),
  INDEX `fk_collectionsRequest_personType1_idx` (`personTypeId` ASC),
  CONSTRAINT `fk_collectionsRequest_collectionType1`
    FOREIGN KEY (`collectionTypeId`)
    REFERENCES `alodigaWallet`.`collection_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_collectionsRequest_category1`
    FOREIGN KEY (`categoryId`)
    REFERENCES `alodigaWallet`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_collectionsRequest_personType1`
    FOREIGN KEY (`personTypeId`)
    REFERENCES `alodigaWallet`.`person_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Agregar FKs bank_has_product
-- author: Adira Quintero
-- Fecha: 20/07/2020
ALTER TABLE `alodigaWallet`.`bank_has_product`
ADD INDEX `fk_bank_has_product_1_idx` (`productId` ASC),
ADD INDEX `fk_bank_has_product_2_idx` (`bankId` ASC);
ALTER TABLE `alodigaWallet`.`bank_has_product`
ADD CONSTRAINT `fk_bank_has_product_1`
 FOREIGN KEY (`productId`)
 REFERENCES `alodigaWallet`.`product` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_bank_has_product_2`
 FOREIGN KEY (`bankId`)
 REFERENCES `alodigaWallet`.`bank` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION;

-- Generar los auto increment en varias tablas
-- author: Jesús Gómez
-- Fecha: 22/07/2020
SET FOREIGN_KEY_CHECKS=0;
ALTER TABLE `alodigaWallet`.`collection_type` 
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `alodigaWallet`.`collections_request` 
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `alodigaWallet`.`person_type` 
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `alodigaWallet`.`documents_person_type` 
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT;
SET FOREIGN_KEY_CHECKS=1;

-- Agregar tabla business_category
-- author: Jesús Gómez
-- Fecha: 22/07/2020
CREATE TABLE IF NOT EXISTS `alodigaWallet`.`business_category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(80) NOT NULL,
  `mccCode` VARCHAR(10) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- Agregar tabla business_sub_category
-- author: Jesús Gómez
-- Fecha: 22/07/2020
CREATE TABLE IF NOT EXISTS `alodigaWallet`.`business_sub_category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(80) NULL,
  `mccCode` VARCHAR(10) NULL,
  `businessCategoryId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_business_sub_category_business_category1_idx` (`businessCategoryId` ASC),
  CONSTRAINT `fk_business_sub_category_business_category1`
    FOREIGN KEY (`businessCategoryId`)
    REFERENCES `alodigaWallet`.`business_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Esquema Solicitudes de Aprobación de Transacciones
-- author: Jesús Gómez
-- Fecha: 27/07/2020

ALTER TABLE `alodigaWallet`.`transaction` 
ADD COLUMN `transactionNumber` VARCHAR(40) NOT NULL AFTER `id`;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`account_type_bank` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`status_account_bank` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`account_bank` (
  `id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
  `UnifiedRegistryId` BIGINT UNIQUE NOT NULL,
  `accountNumber` VARCHAR(40) NOT NULL,
  `bankId` BIGINT(3) NOT NULL,
  `updateDate` TIMESTAMP NULL,
  `statusAccountBankId` INT NOT NULL,
  `accountTypeBankId` INT NOT NULL,
  `createDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_account_bank_bank1_idx` (`bankId` ASC),
  INDEX `fk_account_bank_status_account_bank1_idx` (`statusAccountBankId` ASC),
  INDEX `fk_account_bank_account_type_bank1_idx` (`accountTypeBankId` ASC),
  CONSTRAINT `fk_account_bank_bank1`
    FOREIGN KEY (`bankId`)
    REFERENCES `alodigaWallet`.`bank` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_account_bank_status_account_bank1`
    FOREIGN KEY (`statusAccountBankId`)
    REFERENCES `alodigaWallet`.`status_account_bank` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_account_bank_account_type_bank1`
    FOREIGN KEY (`accountTypeBankId`)
    REFERENCES `alodigaWallet`.`account_type_bank` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

ALTER TABLE `alodigaWallet`.`bank_operation` 
ADD COLUMN `bankOperationDate` DATE NULL AFTER `bankOperationNumber`,
ADD COLUMN `bankOperationAmount` FLOAT NOT NULL AFTER `bankOperationDate`,
ADD COLUMN `accountBankId` BIGINT NULL AFTER `bankId`,
ADD COLUMN `paymentTypeId` BIGINT(3) NULL AFTER `bankOperationAmount`;
ALTER TABLE `alodigaWallet`.`bank_operation` 
ADD CONSTRAINT `fk_bank_operation_account_bank1` 
FOREIGN KEY (`accountBankId`)
    REFERENCES `alodigaWallet`.`account_bank` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE `alodigaWallet`.`bank_operation` 
ADD CONSTRAINT `fk_bank_operation_payment_type1` 
FOREIGN KEY (`paymentTypeId`)
    REFERENCES `alodigaWallet`.`payment_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`status_transaction_approve_request` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`transaction_approve_request` (
  `id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
  `createDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` TIMESTAMP NULL,
  `requestNumber` VARCHAR(40) NOT NULL,
  `requestDate` DATE NOT NULL,
  `productId` BIGINT(3) NOT NULL,
  `transactionId` BIGINT(20) NOT NULL,
  `statusTransactionApproveRequestId` INT NOT NULL,
  `indApproveRequest` TINYINT(1) NULL,
  `approvedRequestDate` DATE NULL,
  `observations` VARCHAR(1000) NULL,
  `userApprovedRequestId` BIGINT(10) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_transaction_approve_request_transaction1_idx` (`transactionId` ASC),
  INDEX `fk_transaction_approve_request_user1_idx` (`userApprovedRequestId` ASC),
  INDEX `fk_transaction_approve_request_status_transaction_approve_r_idx` (`statusTransactionApproveRequestId` ASC),
  INDEX `fk_transaction_approve_request_product1_idx` (`productId` ASC),
  CONSTRAINT `fk_transaction_approve_request_transaction1`
    FOREIGN KEY (`transactionId`)
    REFERENCES `alodigaWallet`.`transaction` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_approve_request_user1`
    FOREIGN KEY (`userApprovedRequestId`)
    REFERENCES `alodigaWallet`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_approve_request_status_transaction_approve_req1`
    FOREIGN KEY (`statusTransactionApproveRequestId`)
    REFERENCES `alodigaWallet`.`status_transaction_approve_request` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_approve_request_product1`
    FOREIGN KEY (`productId`)
    REFERENCES `alodigaWallet`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;








-- Agregar Menu de collection_type
-- author: Adira Quintero
-- Fecha: 23/07/2020

INSERT INTO `alodigaWallet`.`permission` (`permissionGroupId`, `action`, `entity`, `name`, `enabled`) 
VALUES ('1', 'ListCollectionsType', 'collection_type', 'ListCollectionsType', '1');
INSERT INTO `alodigaWallet`.`permission` (`permissionGroupId`, `action`, `entity`, `name`, `enabled`) 
VALUES ('1', 'AddCollectionsType', 'collection_type', 'AddCollectionsType', '1');
INSERT INTO `alodigaWallet`.`permission` (`permissionGroupId`, `action`, `entity`, `name`, `enabled`) 
VALUES ('1', 'EditCollectionsType', 'collection_type', 'EditCollectionsType', '1');
INSERT INTO `alodigaWallet`.`permission` (`permissionGroupId`, `action`, `entity`, `name`, `enabled`) 
VALUES ('1', 'ViewCollectionsType', 'collection_type', 'ViewCollectionsType', '1');
 

INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('73', '1', 'List Collections Type', 'List Collections Type');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('73', '2', 'Listar Tipo de Recaudo', 'Listar Tipo de Recaudo');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('74', '1', 'Add Collections Type', 'Add Collections Type');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('74', '2', 'Agregar Tipo de Recaudo', 'Agregar Tipo de Recaudo');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('75', '1', 'Edit Collections Type', 'Edit Collections Type');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('75', '2', 'Editar Tipo de Recaudo', 'Editar Tipo de Recaudo');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('76', '1', 'View Collections Type', 'View Collections Type');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('76', '2', 'Ver Tipo de Recaudo', 'Ver Tipo de Recaudo');



INSERT INTO `alodigaWallet`.`permission_has_profile` (`permissionId`, `profileId`) VALUES ('73', '1');
INSERT INTO `alodigaWallet`.`permission_has_profile` (`permissionId`, `profileId`) VALUES ('74', '1');
INSERT INTO `alodigaWallet`.`permission_has_profile` (`permissionId`, `profileId`) VALUES ('75', '1');
INSERT INTO `alodigaWallet`.`permission_has_profile` (`permissionId`, `profileId`) VALUES ('76', '1');


-- Data de collection_type
-- author: Adira Quintero
-- Fecha: 23/07/2020

INSERT INTO `alodigaWallet`.`collection_type` (`id`, `description`, `countryId`) VALUES ('1', 'DOCUMENTO DE IDENTIDAD..', '1');
INSERT INTO `alodigaWallet`.`collection_type` (`id`, `description`, `countryId`) VALUES ('3', 'CONSTANCIA DE TRABAJO', '1');
INSERT INTO `alodigaWallet`.`collection_type` (`id`, `description`, `countryId`) VALUES ('4', 'REFERENCIA BANCARIA', '1');
INSERT INTO `alodigaWallet`.`collection_type` (`id`, `description`, `countryId`) VALUES ('5', 'REGISTRO DE INFORMACIÓN FISCAL', '1');
INSERT INTO `alodigaWallet`.`collection_type` (`id`, `description`, `countryId`) VALUES ('6', 'REGISTRO MERCANTIL', '1');
INSERT INTO `alodigaWallet`.`collection_type` (`id`, `description`, `countryId`) VALUES ('7', 'ACTA DE CONSTITUCIÓN DE LA EMPRESA', '1');
INSERT INTO `alodigaWallet`.`collection_type` (`id`, `description`, `countryId`) VALUES ('8', 'DRIVER LICENSE', '2');
INSERT INTO `alodigaWallet`.`collection_type` (`id`, `description`, `countryId`) VALUES ('9', 'DOCUMENTO DE IDENTIFICACION APP', '1');
INSERT INTO `alodigaWallet`.`collection_type` (`id`, `description`, `countryId`) VALUES ('10', 'FOTO CON DOCUMENTO DE IDENTIDAD', '1');
INSERT INTO `alodigaWallet`.`collection_type` (`id`, `description`, `countryId`) VALUES ('11', 'CEDULA DE IDENTIDAD...', '1');
INSERT INTO `alodigaWallet`.`collection_type` (`id`, `description`, `countryId`) VALUES ('12', 'COSNTANCIA DE DOMICILIO RESIDENCIAL', '1');
INSERT INTO `alodigaWallet`.`collection_type` (`id`, `description`, `countryId`) VALUES ('13', 'COSNTANCIA DE NACIMIENTO', '1');
INSERT INTO `alodigaWallet`.`collection_type` (`id`, `description`, `countryId`) VALUES ('14', 'ANTECEDENTES PENALES', '1');
INSERT INTO `alodigaWallet`.`collection_type` (`id`, `description`, `countryId`) VALUES ('15', 'COSNTANCIA DE RESIDENCIA', '2');
INSERT INTO `alodigaWallet`.`collection_type` (`id`, `description`, `countryId`) VALUES ('16', 'CEDULA EXTRANJEROS', '1');
INSERT INTO `alodigaWallet`.`collection_type` (`id`, `description`, `countryId`) VALUES ('17', 'REGISTRO DE INFORMACION FISCAL GOBIERNO', '1');
