
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






-- Insert en la tabla status_business_affiliation_requets
-- author: Lulymar Gutierrez
-- Fecha: 4/08/2020
INSERT INTO `alodigaWallet`.`status_business_affiliation_request` (`description`) VALUES ('Pendiente');
INSERT INTO `alodigaWallet`.`status_business_affiliation_request` (`description`) VALUES ('Aprobada');
INSERT INTO `alodigaWallet`.`status_business_affiliation_request` (`description`) VALUES ('Rechazada');

-- Insert en la tabla personClassification
-- author: Lulymar Gutierrez
-- Fecha: 4/08/2020
INSERT INTO `alodigaWallet`.`person_classification` (`id`,`description`) VALUES ('1','Emisor');
INSERT INTO `alodigaWallet`.`person_classification` (`id`,`description`) VALUES ('2','Solicitante');

-- Insert en la tabla civil_status
-- author: Lulymar Gutierrez
-- Fecha: 4/08/2020
INSERT INTO `alodigaWallet`.`civil_status` (`id`,`description`,`languageId`) VALUES ('1','Casada',2);
INSERT INTO `alodigaWallet`.`civil_status` (`id`,`description`,`languageId`) VALUES ('2','Soltera',2);

-- Insert en la tabla profession
-- author: Lulymar Gutierrez
-- Fecha: 4/08/2020
INSERT INTO `alodigaWallet`.`profession` (`name`) VALUES ('Administrador');
INSERT INTO `alodigaWallet`.`profession` (`name`) VALUES ('Contador');
INSERT INTO `alodigaWallet`.`profession` (`name`) VALUES ('Ingeniero');
INSERT INTO `alodigaWallet`.`profession` (`name`) VALUES ('Estudiante');

-- Insert en la tabla phone_type
-- author: Lulymar Gutierrez
-- Fecha: 4/08/2020
INSERT INTO `alodigaWallet`.`phone_type` (`id`, `description`) VALUES ('1', 'Local');
INSERT INTO `alodigaWallet`.`phone_type` (`id`, `description`) VALUES ('2', 'Movil');

-- Insert en la tabla phone_person
-- author: Lulymar Gutierrez
-- Fecha: 4/08/2020
INSERT INTO `alodigaWallet`.`phone_person` (`countryId`, `countryCode`, `areaCode`, `numberPhone`, `personId`, `phoneTypeId`, `createDate`) VALUES ('1', '58', '0212', '1112233', '1', '1', '2020-08-05');
INSERT INTO `alodigaWallet`.`phone_person` (`countryId`, `countryCode`, `areaCode`, `numberPhone`, `personId`, `phoneTypeId`, `createDate`) VALUES ('1', '58', '0212', '1234455', '2', '1', '2020-08-05');

-- Insert en la tabla person
-- author: Lulymar Gutierrez
-- Fecha: 4/08/2020
INSERT INTO `alodigaWallet`.`person` (`id`,`email`, `personTypeId`, `personClassificationId`, `webSite`, `countryId`, `createDate`) 
VALUES ('1', 'll@correo.com', '1', '1', 'www', '1', '2020-08-04 00:00:00');
INSERT INTO `alodigaWallet`.`person` (`id`,`email`, `personTypeId`, `personClassificationId`, `webSite`, `countryId`, `createDate`) 
VALUES ('2', 'no@posee.com', '2', '2', 'www', '1', '2020-08-05 00:00:00');


-- Insert en la tabla natural_person
-- author: Lulymar Gutierrez
-- Fecha: 4/08/2020
INSERT INTO `alodigaWallet`.`natural_person` (`personId`, `documentsPersonTypeId`, `identificationNumber`, `dueDateDocumentIdentification`, `identificactionNumberOld`, `firstName`, `lastName`, `gender`, `placeBirth`, `dateBirth`, `civilStatusId`, `professionId`, `createDate`) 
VALUES ('1', '1', '12747804', '2028-08-05', '', 'Lulymar', 'Gutierrez', 'F', 'CCS', '1980-08-05', '1', '2', '2020-08-05');

-- Insert en la tabla legal_person
-- author: Lulymar Gutierrez
-- Fecha: 4/08/2020
INSERT INTO `alodigaWallet`.`legal_person` (`createDate`, `personId`, `documentsPersonTypeId`, `identificationNumber`, `tradeName`, `businessName`, `businessCategoryId`, `registerNumber`, `dateInscriptionRegister`, `payedCapital`) 
VALUES ('2020-08-05', '2', '3', '123456', 'Puerto Azul', 'Puerto Azul', '1', '123456', '1980-08-05', '10000');

-- Insert en la tabla business_affiliation_requets
-- author: Lulymar Gutierrez
-- Fecha: 4/08/2020
INSERT INTO `alodigaWallet`.`business_affiliation_requets` (`id`, `numberRequest`, `dateRequest`, `statusBusinessAffiliationRequestId`, `businessPersonId`, `createDate`) 
VALUES ('1', '1', '2020-08-04', '1', '1', '2020-08-04');
INSERT INTO `alodigaWallet`.`business_affiliation_requets` (`id`, `numberRequest`, `dateRequest`, `statusBusinessAffiliationRequestId`, `businessPersonId`, `createDate`) 
VALUES ('2', '2', '2020-08-05', '1', '2', '2020-08-04');

-- Insert en la tabla status_business_affiliation_request y status_business_affiliation_has_final_state
-- author: Yamelis Almea
-- Fecha: 07/08/2020
INSERT INTO `alodigawallet`.`status_business_affiliation_request` (`id`, `description`, `code`) VALUES ('1', 'RECAUDOS COMPLETOS', 'REC');
INSERT INTO `alodigawallet`.`status_business_affiliation_request` (`id`, `description`, `code`) VALUES ('2', 'PENDIENTE LISTAS NEGRAS', 'PLN');
INSERT INTO `alodigawallet`.`status_business_affiliation_request` (`id`, `description`, `code`) VALUES ('3', 'APROBADA  LISTAS NEGRAS', 'ALN');
INSERT INTO `alodigawallet`.`status_business_affiliation_request` (`id`, `description`, `code`) VALUES ('4', 'RECHAZADA LISTAS NEGRAS', 'RLN');
INSERT INTO `alodigawallet`.`status_business_affiliation_request` (`id`, `description`, `code`) VALUES ('5', 'APROBADA', 'APR');
INSERT INTO `alodigawallet`.`status_business_affiliation_request` (`id`, `description`, `code`) VALUES ('6', 'RECHAZADA', 'REC');

INSERT INTO `alodigawallet`.`status_business_affiliation_has_final_state` (`id`, `statusBusinessAffiliationRequetsId`, `finalStateId`, `createDate`) VALUES ('1', '1', '2', '2020-08-04');
INSERT INTO `alodigawallet`.`status_business_affiliation_has_final_state` (`id`, `statusBusinessAffiliationRequetsId`, `finalStateId`, `createDate`) VALUES ('2', '1', '5', '2020-08-04');
INSERT INTO `alodigawallet`.`status_business_affiliation_has_final_state` (`id`, `statusBusinessAffiliationRequetsId`, `finalStateId`, `createDate`) VALUES ('3', '1', '6', '2020-08-04');


-- Insert en la tabla address_type
-- author: Lulymar Gutierrez
-- Fecha: 6/08/2020
INSERT INTO `alodigaWallet`.`address_type` (`id`, `description`) VALUES ('1', 'Habitación');
INSERT INTO `alodigaWallet`.`address_type` (`id`, `description`) VALUES ('2', 'Domicilio Fiscal');
INSERT INTO `alodigaWallet`.`address_type` (`id`, `description`) VALUES ('3', 'Facturación');
INSERT INTO `alodigaWallet`.`address_type` (`id`, `description`) VALUES ('4', 'Compañia');


-- Insert en la tabla edification_type
-- author: Lulymar Gutierrez
-- Fecha: 6/08/2020
INSERT INTO `alodigaWallet`.`edification_type` (`id`, `description`) VALUES ('1', 'Casa');
INSERT INTO `alodigaWallet`.`edification_type` (`id`, `description`) VALUES ('2', 'Quinta');
INSERT INTO `alodigaWallet`.`edification_type` (`id`, `description`) VALUES ('3', 'Building');
INSERT INTO `alodigaWallet`.`edification_type` (`id`, `description`) VALUES ('4', 'Chalet');
INSERT INTO `alodigaWallet`.`edification_type` (`id`, `description`) VALUES ('5', 'Duplex');


-- Insert en la tabla state
-- author: Lulymar Gutierrez
-- Fecha: 6/08/2020
INSERT INTO `alodigaWallet`.`state` (`id`, `countryId`, `name`) VALUES ('4', '1', 'ANZOATEGUI');


-- Insert en la tabla city
-- author: Lulymar Gutierrez
-- Fecha: 6/08/2020
INSERT INTO `alodigaWallet`.`city` (`id`, `stateId`, `name`) VALUES ('3', '4', 'ATAPIRIRE');
INSERT INTO `alodigaWallet`.`city` (`id`, `stateId`, `name`) VALUES ('4', '4', 'CANTAURA');


-- Insert en la tabla street_type
-- author: Lulymar Gutierrez
-- Fecha: 6/08/2020
INSERT INTO `alodigaWallet`.`street_type` (`id`, `description`) VALUES ('1', 'Calle');
INSERT INTO `alodigaWallet`.`street_type` (`id`, `description`) VALUES ('2', 'Avenida');
INSERT INTO `alodigaWallet`.`street_type` (`id`, `description`) VALUES ('3', 'Vereda');
INSERT INTO `alodigaWallet`.`street_type` (`id`, `description`) VALUES ('4', 'Redoma');
INSERT INTO `alodigaWallet`.`street_type` (`id`, `description`) VALUES ('5', 'Autopista');
INSERT INTO `alodigaWallet`.`street_type` (`id`, `description`) VALUES ('6', 'Bulevar');
INSERT INTO `alodigaWallet`.`street_type` (`id`, `description`) VALUES ('7', 'Callejón');
INSERT INTO `alodigaWallet`.`street_type` (`id`, `description`) VALUES ('8', 'Carretera');


-- Insert en la tabla zip_zone
-- author: Lulymar Gutierrez
-- Fecha: 6/08/2020
INSERT INTO `alodigaWallet`.`zip_zone` (`id`, `name`, `code`, `city_id`) VALUES ('1', 'Atapirire, Anzoátegui', '6052', '3');
INSERT INTO `alodigaWallet`.`zip_zone` (`id`, `name`, `code`, `city_id`) VALUES ('2', 'Cantaura, Anzoátegui', '6007', '4');
INSERT INTO `alodigaWallet`.`zip_zone` (`id`, `name`, `code`, `city_id`) VALUES ('3', 'Urbanización La Vega en Caracas', '1020', '1');
INSERT INTO `alodigaWallet`.`zip_zone` (`id`, `name`, `code`, `city_id`) VALUES ('4', 'San Andrés Central en Caracas', '1090', '1');


-- Insert en la tabla address
-- author: Lulymar Gutierrez
-- Fecha: 6/08/2020
INSERT INTO `alodigaWallet`.`address` (`id`,`countryId`,`cityId`,`countyId`,`zipCode`,`streetTypeId`,`nameStreet`,`edificationTypeId`,`nameEdification`,`tower`,`floor`,`urbanization`,`addressLine1`,`addressLine2`,`addressTypeId`,`indMainAddress`) VALUES ('1', '1', '1', '1', '3','1','Calle','1','Edificio','1','1','urbanizacion','Calle1, Edificion1, Tore 1, piso 1. Urbanizacion:urbanizacion',NULL,'1','0');
INSERT INTO `alodigaWallet`.`address` (`id`,`countryId`,`cityId`,`countyId`,`zipCode`,`streetTypeId`,`nameStreet`,`edificationTypeId`,`nameEdification`,`tower`,`floor`,`urbanization`,`addressLine1`,`addressLine2`,`addressTypeId`,`indMainAddress`) VALUES ('2', '1', '1', '1', '4','1','Calle2','1','Edificio2','2','2','urbanizacion','Calle2, Edificion2, Torre 2, piso 2. Urbanizacion:urbanizacion',NULL,'2','1');

-- Insert en la tabla person_has_address
-- author: Lulymar Gutierrez
-- Fecha: 6/08/2020
INSERT INTO `alodigaWallet`.`person_has_address` (`addressId`, `personId`) VALUES ('1', '1');
INSERT INTO `alodigaWallet`.`person_has_address` (`addressId`, `personId`) VALUES ('2', '2');

-- Insert en la tabla person_classification
-- author: Lulymar Gutierrez
-- Fecha: 10/08/2020
INSERT INTO `alodigaWallet`.`person_classification` (`description`) VALUES ('Legal Representatives');

-- Insert en la tabla person
-- author: Lulymar Gutierrez
-- Fecha: 10/08/2020
INSERT INTO `alodigaWallet`.`person` (`email`, `personTypeId`, `personClassificationId`, `webSite`, `countryId`, `createDate`) VALUES ('lr@noaplica.com', '2', '3', 'www', '1', '2020-08-10 10:38:00');

-- Insert en la tabla legal_representative
-- author: Lulymar Gutierrez
-- Fecha: 10/08/2020
INSERT INTO `alodigaWallet`.`legal_representative` (`personId`, `documentsPersonTypeId`, `identificationNumber`, `dueDateDocumentIdentification`, `firstNames`, `lastNames`, `age`, `gender`, `placeBirth`, `dateBirth`, `civilStatusId`, `createDate`) VALUES ('3', '1', '12345678', '2028-08-10', 'Legal', 'Representative', '32', 'M', 'Caracas', '1988-12-01', '1', '2020-08-10');


-- Update en la tabla legal_person
-- author: Lulymar Gutierrez
-- Fecha: 10/08/2020
UPDATE `alodigaWallet`.`legal_person` SET `legalRepresentativeId`='1' WHERE `id`='1';

-- Insert en la tabla phone_person
-- author: Lulymar Gutierrez
-- Fecha: 10/08/2020
INSERT INTO `alodigaWallet`.`phone_person` (`countryId`, `countryCode`, `areaCode`, `numberPhone`, `personId`, `phoneTypeId`) VALUES ('1', '58', '0212', '456789', '3', '1');


-- Insert en la tabla business_category
-- author: Lulymar Gutierrez
-- Fecha: 10/08/2020
INSERT INTO `business_category` (`id`,`description`,`mccCode`) VALUES (1,'Hoteles y Clubs','1234');
INSERT INTO `business_category` (`id`,`description`,`mccCode`) VALUES (2,'Talleres','1472');


-- Insert en la tabla business_sub_category
-- author: Lulymar Gutierrez
-- Fecha: 10/08/2020
INSERT INTO `business_sub_category` (`id`,`description`,`mccCode`,`businessCategoryId`) VALUES (1,'Hotel Internacional','1234',1);
INSERT INTO `business_sub_category` (`id`,`description`,`mccCode`,`businessCategoryId`) VALUES (2,'Reparacion de AA','1472.1',2);
-- data de tablas de dirección
-- author: jesús Gómez
-- Fecha: 13/08/2020
INSERT INTO `alodigaWallet`.`street_type` (`description`, `code`) VALUES ('Calle', 'CALLE');
INSERT INTO `alodigaWallet`.`street_type` (`description`, `code`) VALUES ('Avenida', 'AVENID');
INSERT INTO `alodigaWallet`.`street_type` (`description`, `code`) VALUES ('Vereda', 'VEREDA');
INSERT INTO `alodigaWallet`.`street_type` (`description`, `code`) VALUES ('Redoma', 'REDOMA');
INSERT INTO `alodigaWallet`.`street_type` (`description`, `code`) VALUES ('Autopista', 'AUTOPI');
INSERT INTO `alodigaWallet`.`street_type` (`description`, `code`) VALUES ('Bulevar', 'BULEVA');
INSERT INTO `alodigaWallet`.`street_type` (`description`, `code`) VALUES ('Carretera', 'CARRET');

INSERT INTO `alodigaWallet`.`address_type` (`description`, `code`) VALUES ('Habitación', 'HABITA');
INSERT INTO `alodigaWallet`.`address_type` (`description`, `code`) VALUES ('Domicilio Fiscal', 'DOMFIS');
INSERT INTO `alodigaWallet`.`address_type` (`description`, `code`) VALUES ('Facturación', 'FACTUR');
INSERT INTO `alodigaWallet`.`address_type` (`description`, `code`) VALUES ('Empresa', 'EMPRES');

INSERT INTO `alodigaWallet`.`edification_type` (`description`, `code`) VALUES ('Casa', 'CASA');
INSERT INTO `alodigaWallet`.`edification_type` (`description`, `code`) VALUES ('Quinta', 'QUINTA');
INSERT INTO `alodigaWallet`.`edification_type` (`description`, `code`) VALUES ('Edificio', 'EDIFIC');
INSERT INTO `alodigaWallet`.`edification_type` (`description`, `code`) VALUES ('Residencia', 'RESIDE');
INSERT INTO `alodigaWallet`.`edification_type` (`description`, `code`) VALUES ('Centro Comercial', 'CENCOM');
INSERT INTO `alodigaWallet`.`edification_type` (`description`, `code`) VALUES ('Chalet', 'CHALET');
INSERT INTO `alodigaWallet`.`edification_type` (`description`, `code`) VALUES ('Duplex', 'DUPLEX');


-- Insert en la tabla collections_request
-- author: Yamelis Almea
-- Fecha: 14/08/2020
INSERT INTO `alodigawallet`.`collections_request` (`id`, `collectionTypeId`, `personTypeId`) VALUES ('1', '1', '1');
INSERT INTO `alodigawallet`.`collections_request` (`id`, `collectionTypeId`, `personTypeId`) VALUES ('2', '3', '1');
INSERT INTO `alodigawallet`.`collections_request` (`id`, `collectionTypeId`, `personTypeId`) VALUES ('3', '4', '1');
INSERT INTO `alodigawallet`.`collections_request` (`id`, `collectionTypeId`, `personTypeId`) VALUES ('4', '5', '1');
INSERT INTO `alodigawallet`.`collections_request` (`id`, `collectionTypeId`, `personTypeId`) VALUES ('5', '6', '1');
INSERT INTO `alodigawallet`.`collections_request` (`id`, `collectionTypeId`, `personTypeId`) VALUES ('6', '1', '2');
INSERT INTO `alodigawallet`.`collections_request` (`id`, `collectionTypeId`, `personTypeId`) VALUES ('7', '3', '2');
INSERT INTO `alodigawallet`.`collections_request` (`id`, `collectionTypeId`, `personTypeId`) VALUES ('8', '4', '2');
INSERT INTO `alodigawallet`.`collections_request` (`id`, `collectionTypeId`, `personTypeId`) VALUES ('9', '5', '2');
INSERT INTO `alodigawallet`.`collections_request` (`id`, `collectionTypeId`, `personTypeId`) VALUES ('10', '6', '2');

-- business_affiliation_request

INSERT INTO `alodigawallet`.`business_affiliation_request` (`id`, `numberRequest`, `dateRequest`, `statusBusinessAffiliationRequestId`, `businessPersonId`, `createDate`) VALUES ('1', '12345', '2020-07-14', '1', '1', '2020-07-14 00:00:00');
INSERT INTO `alodigawallet`.`business_affiliation_request` (`id`, `numberRequest`, `dateRequest`, `statusBusinessAffiliationRequestId`, `businessPersonId`, `createDate`) VALUES ('2', '22222', '2020-08-05', '1', '2', '2020-08-05 00:00:00');

UPDATE `alodigawallet`.`business_affiliation_request` SET `statusBusinessAffiliationRequestId` = '8' WHERE (`id` = '1');
UPDATE `alodigawallet`.`business_affiliation_request` SET `statusBusinessAffiliationRequestId` = '8' WHERE (`id` = '2');

-- request_has_collection_request
INSERT INTO `alodigawallet`.`request_has_collection_request` (`id`, `createDate`, `collectionsRequestId`, `businessAffiliationRequestId`) VALUES ('1', '2020-07-14 00:00:00', '1', '1');
INSERT INTO `alodigawallet`.`request_has_collection_request` (`id`, `createDate`, `collectionsRequestId`, `businessAffiliationRequestId`) VALUES ('2', '2020-07-14 00:00:00', '3', '1');
INSERT INTO `alodigawallet`.`request_has_collection_request` (`id`, `createDate`, `collectionsRequestId`, `businessAffiliationRequestId`) VALUES ('3', '2020-07-14 00:00:00', '4', '1');
INSERT INTO `alodigawallet`.`request_has_collection_request` (`id`, `createDate`, `collectionsRequestId`, `businessAffiliationRequestId`) VALUES ('4', '2020-07-14 00:00:00', '5', '1');
INSERT INTO `alodigawallet`.`request_has_collection_request` (`id`, `createDate`, `collectionsRequestId`, `businessAffiliationRequestId`) VALUES ('5', '2020-07-14 00:00:00', '6', '1');
INSERT INTO `alodigawallet`.`request_has_collection_request` (`id`, `createDate`, `collectionsRequestId`, `businessAffiliationRequestId`) VALUES ('6', '2020-08-05 00:00:00', '1', '2');
INSERT INTO `alodigawallet`.`request_has_collection_request` (`id`, `createDate`, `collectionsRequestId`, `businessAffiliationRequestId`) VALUES ('7', '2020-08-05 00:00:00', '3', '2');
INSERT INTO `alodigawallet`.`request_has_collection_request` (`id`, `createDate`, `collectionsRequestId`, `businessAffiliationRequestId`) VALUES ('8', '2020-08-05 00:00:00', '4', '2');
INSERT INTO `alodigawallet`.`request_has_collection_request` (`id`, `createDate`, `collectionsRequestId`, `businessAffiliationRequestId`) VALUES ('9', '2020-08-05 00:00:00', '5', '2');
INSERT INTO `alodigawallet`.`request_has_collection_request` (`id`, `createDate`, `collectionsRequestId`, `businessAffiliationRequestId`) VALUES ('10', '2020-08-05 00:00:00', '6', '2');
