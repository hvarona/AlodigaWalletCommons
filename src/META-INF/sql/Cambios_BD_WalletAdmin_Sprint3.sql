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

ALTER TABLE `alodigaWallet`.`account_type_bank` 
ADD COLUMN `code` VARCHAR(10) NOT NULL AFTER `description`;

ALTER TABLE `alodigaWallet`.`status_account_bank` 
ADD COLUMN `code` VARCHAR(10) NOT NULL AFTER `description`;

ALTER TABLE `alodigaWallet`.`status_transaction_approve_request` 
ADD COLUMN `code` VARCHAR(10) NOT NULL AFTER `description`;

-- Cambios en esquema Solicitudes de Aprobación de Transacciones
-- author: Jesús Gómez
-- Fecha: 28/07/2020
ALTER TABLE `alodigaWallet`.`transaction_approve_request` 
ADD COLUMN `bankOperationId` BIGINT(20) NULL AFTER `transactionId`;
ALTER TABLE `alodigaWallet`.`transaction_approve_request` 
ADD CONSTRAINT `fk_transaction_approve_request_bank_operation1` 
FOREIGN KEY (`bankOperationId`)
    REFERENCES `alodigaWallet`.`bank_operation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

ALTER TABLE `alodigaWallet`.`transaction_approve_request` 
ADD COLUMN `UnifiedRegistryUserId` BIGINT NOT NULL AFTER `id`; 

ALTER TABLE `alodigaWallet`.`commission` 
ADD COLUMN `indApplicationCommission` INT NOT NULL AFTER `endingDate`;  


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


-- Tabla y data de document_type, origin_application y secuences
-- author: Yamelis Almea
-- Fecha: 30/07/2020

CREATE TABLE `alodigaWallet`.`origin_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

INSERT INTO `alodigaWallet`.`origin_application` (`id`, `name`) VALUES ('1', 'AlodigaWallet App');
INSERT INTO `alodigaWallet`.`origin_application` (`id`, `name`) VALUES ('2', 'Alodiga Wallet Admin Web');

CREATE TABLE `alodigaWallet`.`document_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `acronym` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

INSERT INTO `alodigaWallet`.`document_type` (`id`, `name`, `acronym`) VALUES ('1', 'Manual Recharge Approval Request', 'MRAR');
INSERT INTO `alodigaWallet`.`document_type` (`id`, `name`, `acronym`) VALUES ('2', 'Manual Withdrawal Approval Request', 'MWAR');


CREATE TABLE `alodigaWallet`.`sequences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `initialValue` int(11) DEFAULT NULL,
  `currentValue` int(11) DEFAULT NULL,
  `documentTypeId` int(11) NOT NULL,
  `originApplicationId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sequences_documentType1_idx` (`documentTypeId`),
  KEY `fk_sequences_originApplication1` (`originApplicationId`),
  CONSTRAINT `fk_sequences_documentType1` FOREIGN KEY (`documentTypeId`) REFERENCES `document_type` (`id`),
  CONSTRAINT `fk_sequences_originApplication1` FOREIGN KEY (`originApplicationId`) REFERENCES `origin_application` (`id`)
) ENGINE=InnoDB;

INSERT INTO `alodigaWallet`.`sequences` (`id`, `initialValue`, `currentValue`, `documentTypeId`, `originApplicationId`) VALUES ('1', '1', '1', '1', '1');
INSERT INTO `alodigaWallet`.`sequences` (`id`, `initialValue`, `currentValue`, `documentTypeId`, `originApplicationId`) VALUES ('2', '1', '1', '1', '2');
INSERT INTO `alodigaWallet`.`sequences` (`id`, `initialValue`, `currentValue`, `documentTypeId`, `originApplicationId`) VALUES ('3', '1', '1', '2', '1');

--Cambios en la tabla person_type
ALTER TABLE `alodigaWallet`.`person_type` 
ADD COLUMN `originApplicationId` INT(11) NOT NULL AFTER `countryId`,
ADD COLUMN `indNaturalPerson` TINYINT(1) NULL DEFAULT NULL AFTER `originApplicationId`,
ADD INDEX `fk_personType_originApplication1` (`originApplicationId` ASC) INVISIBLE;
;

UPDATE `alodigaWallet`.`person_type` SET `originApplicationId` = '1', `indNaturalPerson` = '1' WHERE (`id` = '1');
UPDATE `alodigaWallet`.`person_type` SET `originApplicationId` = '1', `indNaturalPerson` = '0' WHERE (`id` = '2');
UPDATE `alodigaWallet`.`person_type` SET `originApplicationId` = '2', `indNaturalPerson` = '1' WHERE (`id` = '3');
UPDATE `alodigaWallet`.`person_type` SET `originApplicationId` = '2', `indNaturalPerson` = '1' WHERE (`id` = '4');

ALTER TABLE `alodigaWallet`.`person_type` 
ADD CONSTRAINT `fk_personType_originApplication1`
  FOREIGN KEY (`originApplicationId`)
  REFERENCES `alodigaWallet`.`origin_application` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
UPDATE `alodigaWallet`.`person_type` SET `description` = 'Persona Natural' WHERE (`id` = '3');
UPDATE `alodigaWallet`.`person_type` SET `description` = 'Persona Juridica', `indNaturalPerson` = '0' WHERE (`id` = '4'); 
INSERT INTO `alodigaWallet`.`person_type` (`id`, `description`, `countryId`, `originApplicationId`, `indNaturalPerson`) VALUES ('5', 'Persona Natural', '1', '2', '1');
INSERT INTO `alodigaWallet`.`person_type` (`id`, `description`, `countryId`, `originApplicationId`, `indNaturalPerson`) VALUES ('6', 'Persona Juridica', '1', '2', '0');
INSERT INTO `alodigaWallet`.`person_type` (`id`, `description`, `countryId`, `originApplicationId`, `indNaturalPerson`) VALUES ('7', 'Persona Natural', '47', '1', '1');
INSERT INTO `alodigaWallet`.`person_type` (`id`, `description`, `countryId`, `originApplicationId`, `indNaturalPerson`) VALUES ('8', 'Persona Juridica', '47', '1', '0');
INSERT INTO `alodigaWallet`.`person_type` (`id`, `description`, `countryId`, `originApplicationId`, `indNaturalPerson`) VALUES ('9', 'Persona Natural', '85', '1', '1');
INSERT INTO `alodigaWallet`.`person_type` (`id`, `description`, `countryId`, `originApplicationId`, `indNaturalPerson`) VALUES ('10', 'Persona Juridica', '85', '1', '0');
INSERT INTO `alodigaWallet`.`person_type` (`id`, `description`, `countryId`, `originApplicationId`, `indNaturalPerson`) VALUES ('11', 'Persona Natural', '85', '2', '1');
INSERT INTO `alodigaWallet`.`person_type` (`id`, `description`, `countryId`, `originApplicationId`, `indNaturalPerson`) VALUES ('12', 'Persona Juridica', '85', '2', '0');

-- Eiminar FK en tabla collectionsRequest
-- author: Jesús Gómez
-- Fecha: 03/08/2020
ALTER TABLE `alodigaWallet`.`collectionsRequest`
DROP FOREIGN KEY `fk_collectionsRequest_category1`;
ALTER TABLE `alodigaWallet`.`collectionsRequest` 
DROP INDEX  `fk_collectionsRequest_category1_idx`;
ALTER TABLE `alodigaWallet`.`collectionsRequest` 
DROP COLUMN `categoryId`;


-- Cambios relacionados con esquema de solicitudes de afiliación del negocio
-- author: Jesús Gómez
-- Fecha: 03/08/2020
CREATE TABLE IF NOT EXISTS `alodigaWallet`.`person_classification` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`person` (
  `id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(50) NULL,
  `personTypeId` INT NOT NULL,
  `personClassificationId` INT NOT NULL,
  `webSite` VARCHAR(50) NULL,
  `countryId` BIGINT(3) NOT NULL,
  `createDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_person_person_type1_idx` (`personTypeId` ASC),
  INDEX `fk_person_person_classification1_idx` (`personClassificationId` ASC),
  INDEX `fk_person_country1_idx` (`countryId` ASC),
  CONSTRAINT `fk_person_person_type1`
    FOREIGN KEY (`personTypeId`)
    REFERENCES `alodigaWallet`.`person_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_person_person_classification1`
    FOREIGN KEY (`personClassificationId`)
    REFERENCES `alodigaWallet`.`person_classification` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_person_country1`
    FOREIGN KEY (`countryId`)
    REFERENCES `alodigaWallet`.`country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`phone_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`phone_person` (
  `id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
  `countryId` BIGINT(3) NOT NULL,
  `countryCode` VARCHAR(4) NULL,
  `areaCode` VARCHAR(10) NULL,
  `numberPhone` VARCHAR(10) NOT NULL,
  `personId` BIGINT UNIQUE NOT NULL,
  `phoneTypeId` INT NOT NULL,
  `extensionPhoneNumber` VARCHAR(10) NULL,
  `indMainPhone` TINYINT(1) NULL,
  `createDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_phonePerson_person1_idx` (`personId` ASC),
  INDEX `fk_phone_person_phone_type1_idx` (`phoneTypeId` ASC),
  INDEX `fk_phone_person_country1_idx` (`countryId` ASC),
  CONSTRAINT `fk_phonePerson_person1`
    FOREIGN KEY (`personId`)
    REFERENCES `alodigaWallet`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_phone_person_phone_type1`
    FOREIGN KEY (`phoneTypeId`)
    REFERENCES `alodigaWallet`.`phone_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_phone_person_country1`
    FOREIGN KEY (`countryId`)
    REFERENCES `alodigaWallet`.`country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`profession` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`civil_status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(50) NOT NULL,
  `languageId` BIGINT(3) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_civilStatus_language1_idx` (`languageId` ASC),
  CONSTRAINT `fk_civilStatus_language1`
    FOREIGN KEY (`languageId`)
    REFERENCES `alodigaWallet`.`language` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`natural_person` (
  `id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
  `personId` BIGINT UNIQUE NOT NULL,
  `documentsPersonTypeId` INT NOT NULL,
  `identificationNumber` VARCHAR(40) NULL,
  `dueDateDocumentIdentification` DATE NULL,
  `identificactionNumberOld` VARCHAR(40) NULL,
  `firstName` VARCHAR(40) NULL,
  `lastName` VARCHAR(40) NULL,
  `marriedLastName` VARCHAR(40) NULL,
  `gender` VARCHAR(1) NULL,
  `placeBirth` VARCHAR(50) NULL,
  `dateBirth` DATE NULL,
  `civilStatusId` INT NOT NULL,
  `professionId` INT NOT NULL,
  `createDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_natural_person_person1_idx` (`personId` ASC),
  INDEX `fk_natural_person_civilStatus1_idx` (`civilStatusId` ASC),
  INDEX `fk_natural_person_profession1_idx` (`professionId` ASC),
  INDEX `fk_natural_person_documents_person_type1_idx` (`documentsPersonTypeId` ASC),
  CONSTRAINT `fk_natural_person_person1`
    FOREIGN KEY (`personId`)
    REFERENCES `alodigaWallet`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_natural_person_civilStatus1`
    FOREIGN KEY (`civilStatusId`)
    REFERENCES `alodigaWallet`.`civil_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_natural_person_profession1`
    FOREIGN KEY (`professionId`)
    REFERENCES `alodigaWallet`.`profession` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_natural_person_documents_person_type1`
    FOREIGN KEY (`documentsPersonTypeId`)
    REFERENCES `alodigaWallet`.`documents_person_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`legal_person` (
  `id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
  `createDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` TIMESTAMP NULL,
  `personId` BIGINT UNIQUE NOT NULL,
  `documentsPersonTypeId` INT NOT NULL,
  `identificationNumber` VARCHAR(40) NOT NULL,
  `tradeName` VARCHAR(60) NULL,
  `businessName` VARCHAR(80) NOT NULL,
  `businessCategoryId` INT NOT NULL,
  `registerNumber` VARCHAR(45) NULL,
  `dateInscriptionRegister` DATE NULL,
  `payedCapital` FLOAT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_legal_person_person1_idx` (`personId` ASC),
  INDEX `fk_legal_person_documents_person_type1_idx` (`documentsPersonTypeId` ASC),
  INDEX `fk_legal_person_business_category1_idx` (`businessCategoryId` ASC),
  CONSTRAINT `fk_legal_person_person1`
    FOREIGN KEY (`personId`)
    REFERENCES `alodigaWallet`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_legal_person_documents_person_type1`
    FOREIGN KEY (`documentsPersonTypeId`)
    REFERENCES `alodigaWallet`.`documents_person_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_legal_person_business_category1`
    FOREIGN KEY (`businessCategoryId`)
    REFERENCES `alodigaWallet`.`business_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`zip_zone` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL,
  `code` VARCHAR(20) NULL,
  `city_id` BIGINT(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_zipZone_city1_idx` (`city_id` ASC),
  CONSTRAINT `fk_zipZone_city1`
    FOREIGN KEY (`city_id`)
    REFERENCES `alodigaWallet`.`city` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`edification_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(50) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`address_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(50) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`street_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(50) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE `alodigaWallet`.`address`;
CREATE TABLE IF NOT EXISTS `alodigaWallet`.`address` (
  `id` BIGINT(10) NOT NULL AUTO_INCREMENT,
  `countryId` BIGINT(3) NOT NULL,
  `cityId` BIGINT(10) NULL DEFAULT NULL,
  `countyId` BIGINT(10) NULL DEFAULT NULL,
  `zipCode` VARCHAR(45) NOT NULL,
  `streetTypeId` INT NOT NULL,
  `nameStreet` VARCHAR(50) NULL,
  `edificationTypeId` INT NOT NULL,
  `nameEdification` VARCHAR(50) NULL,
  `tower` VARCHAR(40) NULL,
  `floor` INT NULL,
  `urbanization` VARCHAR(50) NULL,
  `addressLine1` VARCHAR(255) NOT NULL,
  `addressLine2` VARCHAR(250) NULL,
  `addressTypeId` INT NOT NULL,
  `indMainAddress` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_address_city1` (`cityId` ASC),
  INDEX `fk_address_county1` (`countyId` ASC),
  INDEX `fk_address_country1` (`countryId` ASC),
  INDEX `fk_address_street_type1_idx` (`streetTypeId` ASC),
  INDEX `fk_address_address_type1_idx` (`addressTypeId` ASC),
  INDEX `fk_address_building_type1_idx` (`edificationTypeId` ASC),
  CONSTRAINT `fk_address_city1`
    FOREIGN KEY (`cityId`)
    REFERENCES `alodigaWallet`.`city` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_address_country1`
    FOREIGN KEY (`countryId`)
    REFERENCES `alodigaWallet`.`country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_address_county1`
    FOREIGN KEY (`countyId`)
    REFERENCES `alodigaWallet`.`county` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_address_street_type1`
    FOREIGN KEY (`streetTypeId`)
    REFERENCES `alodigaWallet`.`street_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_address_address_type1`
    FOREIGN KEY (`addressTypeId`)
    REFERENCES `alodigaWallet`.`address_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_address_edification_type1`
    FOREIGN KEY (`edificationTypeId`)
    REFERENCES `alodigaWallet`.`edification_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB; 
SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`status_business_affiliation_requets` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`business_affiliation_requets` (
  `id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
  `numberRequest` VARCHAR(40) NULL,
  `dateRequest` DATE NULL,
  `statusBusinessAffiliationRequetsId` INT NOT NULL,
  `businessPersonId` BIGINT UNIQUE NOT NULL,
  `createDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_business_affiliation_requets_status_business_affiliation_idx` (`statusBusinessAffiliationRequetsId` ASC),
  INDEX `fk_business_affiliation_requets_person1_idx` (`businessPersonId` ASC),
  CONSTRAINT `fk_business_affiliation_requets_status_business_affiliation_r1`
    FOREIGN KEY (`statusBusinessAffiliationRequetsId`)
    REFERENCES `alodigaWallet`.`status_business_affiliation_requets` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_business_affiliation_requets_person1`
    FOREIGN KEY (`businessPersonId`)
    REFERENCES `alodigaWallet`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`reviewType` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`review_business_affiliation_request` (
  `id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
  `businessAffiliationRequetsId` BIGINT UNIQUE NOT NULL,
  `userReviewId` BIGINT(10) NOT NULL,
  `ReviewDate` DATE NULL,
  `observations` VARCHAR(1000) NULL,
  `indApproved` TINYINT(1) NULL,
  `reviewTypeId` INT NOT NULL,
  `createDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_review_business_affiliation_request_business_affiliation_idx` (`businessAffiliationRequetsId` ASC),
  INDEX `fk_review_business_affiliation_request_user1_idx` (`userReviewId` ASC),
  INDEX `fk_review_business_affiliation_request_reviewType1_idx` (`reviewTypeId` ASC),
  CONSTRAINT `fk_review_business_affiliation_request_business_affiliation_r1`
    FOREIGN KEY (`businessAffiliationRequetsId`)
    REFERENCES `alodigaWallet`.`business_affiliation_requets` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_business_affiliation_request_user1`
    FOREIGN KEY (`userReviewId`)
    REFERENCES `alodigaWallet`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_business_affiliation_request_reviewType1`
    FOREIGN KEY (`reviewTypeId`)
    REFERENCES `alodigaWallet`.`reviewType` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`request_has_collection_request` (
  `id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
  `createDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` TIMESTAMP NULL,
  `collectionsRequestId` INT NOT NULL,
  `businessAffiliationRequetsId` BIGINT UNIQUE NOT NULL,
  `imageFileUrl` VARCHAR(250) NULL,
  `observations` VARCHAR(1000) NULL,
  `indApproved` VARCHAR(50) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_request_has_collection_request_collections_request1_idx` (`collectionsRequestId` ASC),
  INDEX `fk_request_has_collection_request_business_affiliation_requ_idx` (`businessAffiliationRequetsId` ASC),
  CONSTRAINT `fk_request_has_collection_request_collections_request1`
    FOREIGN KEY (`collectionsRequestId`)
    REFERENCES `alodigaWallet`.`collections_request` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_request_has_collection_request_business_affiliation_requets1`
    FOREIGN KEY (`businessAffiliationRequetsId`)
    REFERENCES `alodigaWallet`.`business_affiliation_requets` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;




