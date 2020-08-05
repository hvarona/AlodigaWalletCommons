
-- Insert en la tabla person_type
-- author: Lulymar Gutierrez
-- Fecha: 22/07/2020
INSERT INTO `alodigaWallet`.`person_type` (`id`, `description`, `countryId`) VALUES ('1', 'Persona Natural', '1');
INSERT INTO `alodigaWallet`.`person_type` (`id`, `description`, `countryId`) VALUES ('2', 'Persona Juridica', '1');
INSERT INTO `alodigaWallet`.`person_type` (`id`, `description`, `countryId`) VALUES ('3', 'Natural', '47');
INSERT INTO `alodigaWallet`.`person_type` (`id`, `description`, `countryId`) VALUES ('4', 'legal', '47');


-- Insert en la tabla documents_person_type
-- author: Lulymar Gutierrez
-- Fecha: 22/07/2020
INSERT INTO `alodigaWallet`.`documents_person_type` (`id`, `description`, `personTypeId`, `codeIdentification`) 
VALUES ('1', 'Cedula de Identidad Venezolano', '1', 'CI');
INSERT INTO `alodigaWallet`.`documents_person_type` (`id`, `description`, `personTypeId`, `codeIdentification`) 
VALUES ('2', 'Cedula de Identidad Extranjero', '1', 'E');
INSERT INTO `alodigaWallet`.`documents_person_type` (`id`, `description`, `personTypeId`, `codeIdentification`) 
VALUES ('3', 'Sociedad Anónima', '2', 'SA');
INSERT INTO `alodigaWallet`.`documents_person_type` (`id`, `description`, `personTypeId`, `codeIdentification`) 
VALUES ('4', 'Fundación', '2', 'FUN');
INSERT INTO `alodigaWallet`.`documents_person_type` (`id`, `description`, `personTypeId`, `codeIdentification`) 
VALUES ('5', 'DRIVER LICENSE', '3', 'DL');
INSERT INTO `alodigaWallet`.`documents_person_type` (`id`, `description`, `personTypeId`, `codeIdentification`) 
VALUES ('6', 'GREEN CARD', '3', 'GC');


-- Insert en la tabla status_transaction_approve_request
-- author: Lulymar Gutierrez
-- Fecha: 28/07/2020
INSERT INTO `status_transaction_approve_request` (`id`,`description`,`code`) VALUES (1,'Pendiente','PEND');
INSERT INTO `status_transaction_approve_request` (`id`,`description`,`code`) VALUES (2,'Aprobada','APPR');
INSERT INTO `status_transaction_approve_request` (`id`,`description`,`code`) VALUES (3,'Rechazada','REJE');
 


-- Insert en la tabla transaction_approve_request
-- author: Lulymar Gutierrez
-- Fecha: 28/07/2020
INSERT INTO `transaction_approve_request` (`id`,`UnifiedRegistryUserId`,`createDate`,`updateDate`,`requestNumber`,`requestDate`,`productId`,`transactionId`,`bankOperationId`,`statusTransactionApproveRequestId`,`indApproveRequest`,`approvedRequestDate`,`observations`,`userApprovedRequestId`) VALUES (1,379,'2020-07-27 00:00:00',NULL,'MWAR-2020-1','2020-07-27',3,95,1,1,0,NULL,NULL,1);
INSERT INTO `transaction_approve_request` (`id`,`UnifiedRegistryUserId`,`createDate`,`updateDate`,`requestNumber`,`requestDate`,`productId`,`transactionId`,`bankOperationId`,`statusTransactionApproveRequestId`,`indApproveRequest`,`approvedRequestDate`,`observations`,`userApprovedRequestId`) VALUES (2,379,'2020-07-27 00:00:00',NULL,'MWAR-2020-2','2020-07-27',3,97,2,1,0,NULL,NULL,1);



-- Insert en la tabla status_account_bank
-- author: Lulymar Gutierrez
-- Fecha: 30/07/2020
INSERT INTO `alodigaWallet`.`status_account_bank` (`id`,`description`,`code`) VALUES (1,'Activa','ACTI');

-- Insert en la tabla account_type_bank
-- author: Lulymar Gutierrez
-- Fecha: 30/07/2020
INSERT INTO `alodigaWallet`.`account_type_bank` (`id`,`description`,`code`) VALUES (1,'Ahorro','A');
INSERT INTO `alodigaWallet`.`account_type_bank` (`id`,`description`,`code`) VALUES (2,'Corriente','C');

-- Insert en la tabla account_bank
-- author: Lulymar Gutierrez
-- Fecha: 30/07/2020
INSERT INTO `alodigaWallet`.`account_bank` (`id`,`UnifiedRegistryId`,`accountNumber`,`bankId`,`updateDate`,`statusAccountBankId`,`accountTypeBankId`,`createDate`) 
VALUES (1,0,'123456',1,NULL,1,2,'2020-07-29 00:00:00');
INSERT INTO `alodigaWallet`.`account_bank` 
(`id`, `UnifiedRegistryId`, `accountNumber`, `bankId`, `statusAccountBankId`, `accountTypeBankId`, `createDate`) 
VALUES ('2', '1', '987654', '1', '1', '2', '2020-07-29 00:00:00');

-- Update en la tabla bank_operation
-- author: Lulymar Gutierrez
-- Fecha: 30/07/2020
UPDATE `alodigaWallet`.`bank_operation` SET `accountBankId`='1' WHERE `id`='1';
UPDATE `alodigaWallet`.`bank_operation` SET `accountBankId`='2' WHERE `id`='2';

-- Update en la tabla transaction_approve_request
-- author: Lulymar Gutierrez
-- Fecha: 30/07/2020
UPDATE `alodigaWallet`.`transaction_approve_request` SET `transactionId`='95' WHERE `id`='1';
UPDATE `alodigaWallet`.`transaction_approve_request` SET `transactionId`='97' WHERE `id`='2';

-- Insert en la tabla transaction_approve_request
-- author: Yamelis Almea
-- Fecha: 30/07/2020
INSERT INTO `alodigaWallet`.`transaction_approve_request` VALUES (3,1,'2020-07-27 03:00:00',NULL,'MRAR-2020-1','2020-07-27',3,187,32,1,0,NULL,NULL,NULL),
(4,2,'2020-07-27 03:00:00',NULL,'MRAR-2020-2','2020-07-27',3,188,33,1,0,NULL,NULL,NULL),
(5,2,'2020-07-27 03:00:00',NULL,'MRAR-2020-3','2020-07-27',3,278,36,1,0,NULL,NULL,NULL);

-- Modificar data del campo indApplicationCommission para pruebas de recarga manual
-- author: Yamelis Almea
-- Fecha: 04/08/2020
UPDATE `alodigawallet`.`commission` SET `indApplicationCommission` = '1' WHERE (`id` = '11');

UPDATE `alodigawallet`.`transaction_approve_request` SET `UnifiedRegistryUserId` = '379' WHERE (`id` = '3');
UPDATE `alodigawallet`.`transaction_approve_request` SET `UnifiedRegistryUserId` = '379' WHERE (`id` = '4');
UPDATE `alodigawallet`.`transaction_approve_request` SET `UnifiedRegistryUserId` = '379' WHERE (`id` = '5');

UPDATE `alodigawallet`.`bank_operation` SET `accountBankId` = '2' WHERE (`id` = '32');
UPDATE `alodigawallet`.`bank_operation` SET `accountBankId` = '2' WHERE (`id` = '33');
UPDATE `alodigawallet`.`bank_operation` SET `accountBankId` = '2' WHERE (`id` = '36');

UPDATE `alodigawallet`.`transaction_approve_request` SET `UnifiedRegistryUserId` = '2' WHERE (`id` = '3');
UPDATE `alodigawallet`.`transaction_approve_request` SET `UnifiedRegistryUserId` = '2' WHERE (`id` = '4');
UPDATE `alodigawallet`.`transaction_approve_request` SET `UnifiedRegistryUserId` = '2' WHERE (`id` = '5');

UPDATE `alodigawallet`.`bank_operation` SET `userSourceId` = '2' WHERE (`id` = '32');
UPDATE `alodigawallet`.`bank_operation` SET `userSourceId` = '2' WHERE (`id` = '33');
UPDATE `alodigawallet`.`bank_operation` SET `userSourceId` = '2' WHERE (`id` = '36');


UPDATE `alodigawallet`.`transaction` SET `transactionNumber` = 'MRAR-2020-1', `totalTax` = '0.00' WHERE (`id` = '187');
UPDATE `alodigawallet`.`transaction` SET `transactionNumber` = 'MRAR-2020-2', `totalTax` = '0.00' WHERE (`id` = '188');
UPDATE `alodigawallet`.`transaction` SET `transactionNumber` = 'MRAR-2020-3', `totalTax` = '0.00' WHERE (`id` = '278');

UPDATE `alodigawallet`.`transaction` SET `userSourceId` = '2' WHERE (`id` = '187');
UPDATE `alodigawallet`.`transaction` SET `userSourceId` = '2' WHERE (`id` = '188');
UPDATE `alodigawallet`.`transaction` SET `userSourceId` = '2' WHERE (`id` = '278');

UPDATE `alodigawallet`.`account_bank` SET `UnifiedRegistryId` = '379' WHERE (`id` = '2');


