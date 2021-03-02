
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



-- Insert en la tabla status_applicant
-- author: Lulymar Gutierrez
-- Fecha: 13/08/2020
INSERT INTO `alodigaWallet`.`status_applicant` (`description`, `code`) VALUES ('ACTIVO', 'ACTIVO');
INSERT INTO `alodigaWallet`.`status_applicant` (`description`, `code`) VALUES ('LISTA NEGRA OK', 'LISNOK');
INSERT INTO `alodigaWallet`.`status_applicant` (`description`, `code`) VALUES ('LISTA NEGRA', 'LISNEG');
INSERT INTO `alodigaWallet`.`status_applicant` (`description`, `code`) VALUES ('INACTIVO', 'INACTI');
INSERT INTO `alodigaWallet`.`status_applicant` (`description`, `code`) VALUES ('NEGOCIO', 'NEGOCI');


-- Update en la tabla legal_person
-- author: Lulymar Gutierrez
-- Fecha: 13/08/2020
UPDATE `alodigaWallet`.`legal_person` SET `statusApplicantId`='1' WHERE `id`='1';


-- Update en la tabla natural_person
-- author: Lulymar Gutierrez
-- Fecha: 13/08/2020
UPDATE `alodigaWallet`.`natural_person` SET `statusApplicantId`='1' WHERE `id`='1';


-- Update en la tabla natural_person
-- author: Lulymar Gutierrez
-- Fecha: 14/08/2020
INSERT INTO `alodigaWallet`.`reviewType` (`id`, `description`) VALUES ('1', 'Recaudos');
INSERT INTO `alodigaWallet`.`reviewType` (`id`, `description`) VALUES ('2', 'Lista Negra OFAC');

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

-- data de tablas de solicitudes de afiliación
-- author: jesús Gómez
-- Fecha: 14/08/2020
INSERT INTO `alodigaWallet`.`status_business_affiliation_request` (`description`, `code`) VALUES ('PENDIENTE', 'PENDIE');
INSERT INTO `alodigaWallet`.`status_business_affiliation_request` (`description`, `code`) VALUES ('RECAUDOS COMPLETOS', 'RECCOM');
INSERT INTO `alodigaWallet`.`status_business_affiliation_request` (`description`, `code`) VALUES ('RECAUDOS INCOMPLETOS', 'RECINC');
INSERT INTO `alodigaWallet`.`status_business_affiliation_request` (`description`, `code`) VALUES ('PENDIENTE LISTA NEGRA', 'PELINE');
INSERT INTO `alodigaWallet`.`status_business_affiliation_request` (`description`, `code`) VALUES ('APROBADA LISTA NEGRA', 'APLINE');
INSERT INTO `alodigaWallet`.`status_business_affiliation_request` (`description`, `code`) VALUES ('RECHAZADA LISTA NEGRA', 'RELINE');
INSERT INTO `alodigaWallet`.`status_business_affiliation_request` (`description`, `code`) VALUES ('APROBADA', 'APROBA');
INSERT INTO `alodigaWallet`.`status_business_affiliation_request` (`description`, `code`) VALUES ('RECHAZADA', 'RECHAZ');

-- data de tablas de estatus de la cuenta de banco
-- author: Moises Graterol
-- Fecha: 17/08/2020
UPDATE `alodigaWallet`.`status_account_bank` SET `code`='ACTIVA' WHERE `id`='1';
UPDATE `alodigaWallet`.`status_account_bank` SET `code`='INACTI' WHERE `id`='2';
UPDATE `alodigaWallet`.`status_account_bank` SET `code`='BLOQUE' WHERE `id`='3';


-- data de tablas de estado solicitud de afiliación de negocio
-- author: Moises Graterol
-- Fecha: 17/08/2020
UPDATE `alodigaWallet`.`status_business_affiliation_request` SET `code`='RECAUD' WHERE `id`='1';
UPDATE `alodigaWallet`.`status_business_affiliation_request` SET `code`='PELINE' WHERE `id`='2';
UPDATE `alodigaWallet`.`status_business_affiliation_request` SET `code`='APLINE' WHERE `id`='3';
UPDATE `alodigaWallet`.`status_business_affiliation_request` SET `code`='RELINE' WHERE `id`='4';
UPDATE `alodigaWallet`.`status_business_affiliation_request` SET `code`='APROBA' WHERE `id`='5';
UPDATE `alodigaWallet`.`status_business_affiliation_request` SET `code`='RECHAZ' WHERE `id`='6';

-- data de tablas estado de solicitud de aprobación de transacción 
-- author: Moises Graterol
-- Fecha: 17/08/2020
UPDATE `alodigaWallet`.`status_transaction_approve_request` SET `code`='PENDIE' WHERE `id`='1';
UPDATE `alodigaWallet`.`status_transaction_approve_request` SET `code`='APROBA' WHERE `id`='2';
UPDATE `alodigaWallet`.`status_transaction_approve_request` SET `code`='RECHAZ' WHERE `id`='3';


-- Update en la tabla status_business_affiliation_request
-- author: Lulymar Gutierrez
-- Fecha: 18/08/2020
INSERT INTO `alodigaWallet`.`status_business_affiliation_request` (`description`, `code`) VALUES ('RECAUDOS SIN APROBAR', 'RSA');

-- Insert en la tabla employed_position
-- author: Lulymar Gutierrez
-- Fecha: 19/08/2020
INSERT INTO `alodigaWallet`.`employed_position` (`id`, `name`) VALUES ('1', 'Agente Comercial');

-- Insert en la tabla comercial_agency
-- author: Lulymar Gutierrez
-- Fecha: 19/08/2020
INSERT INTO `alodigaWallet`.`comercial_agency` (`id`, `name`, `cityId`) VALUES ('1', 'CCCT', '1');

-- Insert en la tabla employee
-- author: Lulymar Gutierrez
-- Fecha: 19/08/2020
INSERT INTO `alodigaWallet`.`employee` (`id`, `identificationNumber`, `documentsPersonTypeId`, `firstNames`, `lastNames`, `personId`, `employedPositionId`, `comercialAgencyId`) VALUES ('1', '123', '1', 'Empleado', 'Prueba', '1', '1', '1');
INSERT INTO `alodigaWallet`.`employee` (`id`, `identificationNumber`, `documentsPersonTypeId`, `firstNames`, `lastNames`, `personId`, `employedPositionId`, `comercialAgencyId`) VALUES ('2', '456', '1', 'Empleado', 'Autoriza', '4', '1', '1');


-- Insert en la tabla person_classification
-- author: Lulymar Gutierrez
-- Fecha: 19/08/2020
INSERT INTO `alodigaWallet`.`person_classification` (`id`, `description`, `code`) VALUES ('4', 'Employee', 'EMPLOY');

-- Update en la tabla person_classification
-- author: Lulymar Gutierrez
-- Fecha: 19/08/2020
UPDATE `alodigaWallet`.`person_classification` SET `code`='EMISOR' WHERE `id`='1';
UPDATE `alodigaWallet`.`person_classification` SET `code`='SOLICI' WHERE `id`='2';
UPDATE `alodigaWallet`.`person_classification` SET `code`='LEGREP' WHERE `id`='3';

-- Insert en la tabla person
-- author: Lulymar Gutierrez
-- Fecha: 19/08/2020
INSERT INTO `alodigaWallet`.`person` (`id`, `email`, `personTypeId`, `personClassificationId`, `webSite`, `countryId`, `createDate`) VALUES ('4', 'empleado@noposee.com', '1', '4', 'www', '1', '2020-08-19');

-- Insert en la tabla user
-- author: Lulymar Gutierrez
-- Fecha: 19/08/2020
UPDATE `alodigaWallet`.`user` SET `documentsPersonTypeId`='1', `identificationNumber`='123456', `personId`='1', `authorizedEmployeeId`='2', `employeeId`='1' WHERE `id`='5';

-- Insert en la tabla document_type
-- author: Lulymar Gutierrez
-- Fecha: 19/08/2020
INSERT INTO `alodigaWallet`.`document_type` (`id`, `name`, `acronym`) VALUES ('3', 'Renewal Password', 'REPS');

-- Insert en la tabla sequences
-- author: Lulymar Gutierrez
-- Fecha: 20/08/2020
INSERT INTO `alodigaWallet`.`sequences` (`initialValue`, `currentValue`, `documentTypeId`, `originApplicationId`) VALUES ('1', '1', '3', '2');


-- Insert en la tabla civilStatus y sequences
-- author: Yamelis Almea
-- Fecha: 21/08/2020
INSERT INTO `alodigawallet`.`civil_status` (`id`, `description`, `languageId`) VALUES ('3', 'Divorciado', '2');
INSERT INTO `alodigawallet`.`civil_status` (`id`, `description`, `languageId`) VALUES ('4', 'Viudo', '2');
UPDATE `alodigawallet`.`civil_status` SET `description` = 'Casado' WHERE (`id` = '1');
UPDATE `alodigawallet`.`civil_status` SET `description` = 'Solter0' WHERE (`id` = '2');

INSERT INTO `alodigawallet`.`sequences` (`initialValue`, `currentValue`, `documentTypeId`, `originApplicationId`) VALUES ('1', '1', '1', '3');
INSERT INTO `alodigawallet`.`sequences` (`initialValue`, `currentValue`, `documentTypeId`, `originApplicationId`) VALUES ('1', '1', '2', '3');




-- Insert en la tabla personClassification
-- author: Jorge Pinto
-- Fecha: 20/08/2020
INSERT INTO `alodigaWallet`.`person_classification` (`id`,`description`) VALUES ('3','Employee');

-- Insert en la tabla phoneType
-- author: Jorge Pinto
-- Fecha: 20/08/2020
INSERT INTO `alodigaWallet`.`phone_type` (`id`, `description`) VALUES ('1', 'MOBILE');
INSERT INTO `alodigaWallet`.`phone_type` (`id`, `description`) VALUES ('2', 'ROOM');
INSERT INTO `alodigaWallet`.`phone_type` (`id`, `description`) VALUES ('3', 'OFFICE');
INSERT INTO `alodigaWallet`.`phone_type` (`id`, `description`) VALUES ('4', 'FIJO');

-- Update en la tabla permission_group_data
-- author: Moises Graterol
-- Fecha: 27/08/2020
UPDATE `alodigaWallet`.`permission_group_data` SET `alias`='Gestión de Seguridad', `description`='Gestión de Seguridad' WHERE `id`='4';
UPDATE `alodigaWallet`.`permission_group_data` SET `alias`='Gestión de Configuraciones', `description`='Gestión de Configuraciones' WHERE `id`='6';
UPDATE `alodigaWallet`.`permission_group_data` SET `alias`='Gestión de Reportes', `description`='Gestión de Reportes' WHERE `id`='8';
UPDATE `alodigaWallet`.`permission_group_data` SET `alias`='Gestión Transactional', `description`='Gestión Transactional' WHERE `id`='10';
UPDATE `alodigaWallet`.`permission_group_data` SET `alias`='Gestionar Solicitudes de Afiliación', `description`='Gestionar Solicitudes de Afiliación' WHERE `id`='12';

-- Update en la tabla permission_data
-- author: Moises Graterol
-- Fecha: 27/08/2020
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Cambiar Estatus de Perfil', `description`='Cambiar Estatus de Perfil' WHERE `id`='5';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Perfiles', `description`='Perfiles' WHERE `id`='9';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Profiles', `description`='Profiles' WHERE `id`='10';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Empresas', `description`='Empresas' WHERE `id`='11';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Enterprises', `description`='Enterprises' WHERE `id`='12';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Agregar Empresa', `description`='Agregar Empresa' WHERE `id`='13';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Add Enterprise', `description`='Add Enterprise' WHERE `id`='14';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Editar Empresa', `description`='Editar Empresa' WHERE `id`='15';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Edit Enterprise', `description`='Edit Enterprise' WHERE `id`='16';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Ver Empresa', `description`='Ver Empresa' WHERE `id`='17';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='View Enterprise', `description`='View Enterprise' WHERE `id`='18';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Cambiar Estatus Empresa', `description`='Cambiar Estatus Empresa' WHERE `id`='19';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Change Enterprise Status', `description`='Change Enterprise Status' WHERE `id`='20';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Productos', `description`='Productos' WHERE `id`='21';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Products', `description`='Products' WHERE `id`='22';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Agregar Producto', `description`='Agregar Producto' WHERE `id`='23';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Add Product', `description`='Add Product' WHERE `id`='24';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Editar Producto', `description`='Editar Producto' WHERE `id`='25';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Edit Product', `description`='Edit Product' WHERE `id`='26';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Ver Producto', `description`='Ver Producto' WHERE `id`='27';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='View Product', `description`='View Product' WHERE `id`='28';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Cambiar Estatus Producto', `description`='Cambiar Estatus Producto' WHERE `id`='29';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Change Product Status', `description`='Change Product Status' WHERE `id`='30';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Países', `description`='Países' WHERE `id`='31';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Countries', `description`='Countries' WHERE `id`='32';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Agregar País', `description`='Agregar País' WHERE `id`='33';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Add Country', `description`='Add Country' WHERE `id`='34';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Editar País', `description`='Editar País' WHERE `id`='35';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Edit Country', `description`='Edit Country' WHERE `id`='36';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Ver País', `description`='Ver País' WHERE `id`='37';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='View Country' WHERE `id`='38';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Cambiar Estatus País', `description`='Cambiar Estatus País' WHERE `id`='39';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Change Country Status', `description`='Change Country Status' WHERE `id`='40';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Usuarios', `description`='Usuarios' WHERE `id`='41';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Users', `description`='Users' WHERE `id`='42';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Add User', `description`='Add User' WHERE `id`='44';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Edit User', `description`='Edit User' WHERE `id`='46';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='View User', `description`='View User' WHERE `id`='48';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Cambiar Estatus Usuario', `description`='Cambiar Estatus Usuario' WHERE `id`='49';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Change User Status', `description`='Change User Status' WHERE `id`='50';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Administrar Configuraciones', `description`='Administrar Configuraciones' WHERE `id`='51';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Reportes', `description`='Reportes' WHERE `id`='55';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Reports', `description`='Reports' WHERE `id`='56';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Agregar Reporte', `description`='Agregar Reporte' WHERE `id`='57';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Add Report', `description`='Add Report' WHERE `id`='58';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Editar Reporte', `description`='Editar Reporte' WHERE `id`='59';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Edit Report', `description`='Edit Report' WHERE `id`='60';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Ver Reporte', `description`='Ver Reporte' WHERE `id`='61';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='View Report', `description`='View Report' WHERE `id`='62';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Cambiar Estatus Reporte', `description`='Cambiar Estatus Reporte' WHERE `id`='63';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Change Report Status', `description`='Change Report Status' WHERE `id`='64';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Auditoria', `description`='Auditoria' WHERE `id`='67';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Audi', `description`='Audi' WHERE `id`='68';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Ver Transacción', `description`='Ver Transacción' WHERE `id`='69';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Ver Comisión', `description`='Ver Comisión' WHERE `id`='72';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Bancos', `description`='Bancos' WHERE `id`='75';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Banks', `description`='Banks' WHERE `id`='76';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Agregar Banco', `description`='Agregar Banco' WHERE `id`='77';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Add Bank', `description`='Add Bank' WHERE `id`='78';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Editar Banco', `description`='Editar Banco' WHERE `id`='79';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Edit Bank', `description`='Edit Bank' WHERE `id`='80';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Ver Banco', `description`='Ver Banco' WHERE `id`='81';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='View Bank', `description`='View Bank' WHERE `id`='82';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Monedas', `description`='Monedas' WHERE `id`='83';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Currencies', `description`='Currencies' WHERE `id`='84';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Operaciones por Banco', `description`='Operaciones por Banco' WHERE `id`='99';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Operations by Bank', `description`='Operations by Bank' WHERE `id`='100';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Transacciones', `description`='Transacciones' WHERE `id`='103';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Transactions', `description`='Transaccions' WHERE `id`='104';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Perfiles', `description`='Perfiles' WHERE `id`='105';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Preferences', `description`='Preferences' WHERE `id`='106';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Ver Preferencias', `description`='Ver Preferencias' WHERE `id`='111';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Cambiar Estatus de Preferencias', `description`='Cambiar Estatus de Preferencias' WHERE `id`='113';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Comisiones', `description`='Comisiones' WHERE `id`='118';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Commission', `description`='Commission' WHERE `id`='117';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Agregar Comisión', `description`='Agregar Comisión' WHERE `id`='120';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Editar Comisión', `description`='Editar Comisión' WHERE `id`='122';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Documetos por Tipo de Persona', `description`='Documetos por Tipo de Persona' WHERE `id`='125';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Documents Person Type', `description`='Documents Person Type' WHERE `id`='124';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Tipo de Recaudo', `description`='Tipo de Recaudo' WHERE `id`='133';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Collections Type', `description`='Collections Type' WHERE `id`='132';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Manual Withdrawal Approval', `description`='Manual Withdrawal Approval' WHERE `id`='153';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Aprobación Retiro Manual', `description`='Aprobación Retiro Manual' WHERE `id`='154';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Agregar Aprobación Retiro Manual', `description`='Agregar Aprobación Retiro Manual' WHERE `id`='156';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Editar Aprobación Retiro Manual', `description`='Editar Aprobación Retiro Manual' WHERE `id`='158';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Ver Aprobación Retiro Manual', `description`='Ver Aprobación Retiro Manual' WHERE `id`='160';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Manual Recharges Approval', `description`='Manual Recharges Approval' WHERE `id`='161';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Aprobaciones de Recarga Manual', `description`='Aprobaciones de Recarga Manual' WHERE `id`='162';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Collections Request', `description`='Collections Request' WHERE `id`='169';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Recaudos de Solicitud', `description`='Recaudos de Solicitud' WHERE `id`='170';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Business Affiliation Requests', `description`='Business Affiliation Requests' WHERE `id`='177';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Solicitudes de Afiliación', `description`='Solicitudes de Afiliación' WHERE `id`='178';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Agregar Solicitudes de Afiliación', `description`='Agregar Solicitudes de Afiliación' WHERE `id`='180';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Editar Solicitudes de Afiliación', `description`='Editar Solicitudes de Afiliación' WHERE `id`='182';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Ver Solicitudes de Afiliación', `description`='Ver Solicitudes de Afiliación' WHERE `id`='184';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Affiliation Status Prerelationships', `description`='Affiliation Status Prerelationships' WHERE `id`='185';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Prerelaciones Estatus Afiliación', `description`='Prerelaciones Estatus Afiliación' WHERE `id`='186';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Agregar Prerelaciones Estatus Afiliación', `description`='Agregar Prerelaciones Estatus Afiliación' WHERE `id`='188';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Editar Prerelaciones Estatus Afiliación', `description`='Editar Prerelaciones Estatus Afiliación' WHERE `id`='190';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Ver Prerelaciones Estatus Afiliación', `description`='Ver Prerelaciones Estatus Afiliación' WHERE `id`='192';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Address', `description`='Address' WHERE `id`='193';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Direcciones', `description`='Direcciones' WHERE `id`='194';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Agregar Dirección', `description`='Agregar Dirección' WHERE `id`='196';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Editar Dirección', `description`='Editar Dirección' WHERE `id`='198';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Ver Dirección', `description`='Ver Dirección' WHERE `id`='200';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Legal Representative', `description`='Legal Representative' WHERE `id`='201';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Representantes Legales', `description`='Representantes Legales' WHERE `id`='202';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Business Type', `description`='Business Type' WHERE `id`='209';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Tipos de Negocios', `description`='Tipos de Negocios' WHERE `id`='210';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Collection Affiliation Request', `description`='Collection Affiliation Request' WHERE `id`='217';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Recaudos de Solicitud', `description`='Recaudos de Solicitud' WHERE `id`='218';
UPDATE `alodigaWallet`.`permission_data` SET `description`='Agregar Recaudos de Solicitud' WHERE `id`='220';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Business Service Type', `description`='Business Service Type' WHERE `id`='225';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Tipos Servicios de Negocios', `description`='Tipos Servicios de Negocios' WHERE `id`='226';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Aplicant OFAC', `description`='Aplicant OFAC' WHERE `id`='233';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Solicitante OFAC', `description`='Solicitante OFAC' WHERE `id`='234';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Status Card', `description`='Status Card' WHERE `id`='241';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Estatus de Tarjeta', `description`='Estatus de Tarjeta' WHERE `id`='242';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Editar Estatus de Tarjeta', `description`='Editar Estatus de Tarjeta' WHERE `id`='246';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Agregar Estatus de Tarjeta', `description`='Agregar Estatus de Tarjeta' WHERE `id`='244';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Ver Estatus de Tarjeta', `description`='Ver Estatus de Tarjeta' WHERE `id`='248';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Status Card Final', `description`='Status Card Final' WHERE `id`='249';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Estatus de Tarjeta Final', `description`='Estatus de Tarjeta Final' WHERE `id`='250';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Agregar Estatus de Tarjeta Final', `description`='Agregar Estatus de Tarjeta Final' WHERE `id`='252';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Editar Estatus de Tarjeta', `description`='Editar Estatus de Tarjeta Final' WHERE `id`='254';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Ver Estatus de Tarjeta Final', `description`='Ver Estatus de Tarjeta Final' WHERE `id`='256';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Tasa de Cambio', `description`='Tasa de Cambio' WHERE `id`='91';
UPDATE `alodigaWallet`.`permission_data` SET `alias`='Auditoría', `description`='Auditoría' WHERE `id`='67';

-- ALTER TABLE en la tabla country
-- author: Moises Graterol
-- Fecha: 31/08/2020
ALTER TABLE `alodigaWallet`.`country` 
ADD UNIQUE INDEX `name_UNIQUE` (`name` ASC);
-- UPDATE en la tabla country
-- author: Moises Graterol
-- Fecha: 31/08/2020
UPDATE `alodigaWallet`.`country` SET `shortName`='ANT' WHERE `id`='9';

-- Cambios person_classification
-- author: Jorge Pinto
-- Fecha: 23/09/2020
UPDATE `alodigaWallet`.`person_classification` SET `description`='Natural Business Applicant', `code`='NABUAP' WHERE `id`='1';
UPDATE `alodigaWallet`.`person_classification` SET `description`='Legal Business Applicant', `code`='LEBUAP' WHERE `id`='2';
UPDATE `alodigaWallet`.`person_classification` SET `description`='Employee', `code`='EMPLOY' WHERE `id`='3';
UPDATE `alodigaWallet`.`person_classification` SET `description`='User', `code`='USER' WHERE `id`='4';

-- Insertar en las preferencias hora de cierre de la billetera
-- author: Yamelis Almea
-- Fecha: 06/10/2020
INSERT INTO `alodigaWallet`.`preference_field` (`id`, `name`, `preferenceId`, `enabled`, `preferenceTypeId`) VALUES ('25', 'MAX_NUMBER_OF_CARDS_ENABLED', '3', '1', '1');
INSERT INTO `alodigaWallet`.`preference_field` (`id`, `name`, `preferenceId`, `enabled`, `preferenceTypeId`) VALUES ('26', 'WALLET_CLOSING_TIME', '3', '1', '1');
INSERT INTO `alodigaWallet`.`preference_field_data` (`id`, `preferenceFieldId`, `languageId`, `description`) VALUES ('27', '25', '1', 'Max number card of enabled');
INSERT INTO `alodigaWallet`.`preference_field_data` (`id`, `preferenceFieldId`, `languageId`, `description`) VALUES ('28', '25', '2', 'Cantidad maxima de tarjetas habiltar');
INSERT INTO `alodigaWallet`.`preference_field_data` (`id`, `preferenceFieldId`, `languageId`, `description`) VALUES ('29', '26', '1', 'Wallet closing time');
INSERT INTO `alodigaWallet`.`preference_field_data` (`id`, `preferenceFieldId`, `languageId`, `description`) VALUES ('30', '26', '2', 'Hora de cierre de la billetera');
INSERT INTO `alodigaWallet`.`preference_value` (`id`, `value`, `preferenceFieldId`, `preferenceClassficationId`, `createDate`, `updateDate`, `enabled`) VALUES ('136', '5', '25', '2', '2020-10-06 12:49:06', '2020-10-06 12:49:06', '1');
INSERT INTO `alodigaWallet`.`preference_value` (`id`, `value`, `preferenceFieldId`, `preferenceClassficationId`, `createDate`, `updateDate`, `enabled`) VALUES ('140', '11:38:00', '26', '1', '2020-10-06 12:49:06', '2020-10-06 12:49:06', '1');

-- Agregar tipo de reporte TRANSACTION en tabla report_type
-- author: Yamelis Almea
-- Fecha: 09/10/2020
INSERT INTO `alodigaWallet`.`report_type` (`name`, `description`) VALUES ("TRANSACTION", "Reportes de Transacciones");

-- Cambios para agregar el preference_type correspondiente a cada preference_field
-- author: Yamelis Almea
-- Fecha: 14/10/2020
INSERT INTO `alodigawallet`.`preference_type` (`id`, `type`) VALUES ('6', 'BOOLEAN');

UPDATE `alodigawallet`.`preference_field` SET `preferenceTypeId` = '2' WHERE (`id` = '1');
UPDATE `alodigawallet`.`preference_field` SET `preferenceTypeId` = '2' WHERE (`id` = '4');
UPDATE `alodigawallet`.`preference_field` SET `preferenceTypeId` = '1' WHERE (`id` = '7');
UPDATE `alodigawallet`.`preference_field` SET `preferenceTypeId` = '6' WHERE (`id` = '9');
UPDATE `alodigawallet`.`preference_field` SET `preferenceTypeId` = '2' WHERE (`id` = '10');
UPDATE `alodigawallet`.`preference_field` SET `preferenceTypeId` = '2' WHERE (`id` = '20');
UPDATE `alodigawallet`.`preference_field` SET `preferenceTypeId` = '2' WHERE (`id` = '21');
UPDATE `alodigawallet`.`preference_field` SET `preferenceTypeId` = '1' WHERE (`id` = '22');
UPDATE `alodigawallet`.`preference_field` SET `preferenceTypeId` = '1' WHERE (`id` = '23');
UPDATE `alodigawallet`.`preference_field` SET `preferenceTypeId` = '3' WHERE (`id` = '26');


-- Cambios para agregar datos en el campo code de Language
-- author: Jorge Pinto
-- Fecha: 20/10/2020
UPDATE `alodigaWallet`.`language` SET `code`='ENGLI' WHERE `id`='1';
UPDATE `alodigaWallet`.`language` SET `code`='SPANI' WHERE `id`='2';

-- Cambios para agregar datos en el campo code de preference_classification
-- author: Jorge Pinto
-- Fecha: 20/10/2020
UPDATE `alodigaWallet`.`preference_classification` SET `code`='CLIEN' WHERE `id`='1';
UPDATE `alodigaWallet`.`preference_classification` SET `code`='NEGOC' WHERE `id`='2';


-- Cambios eliminar data para las preferencias especificas
-- author: Yamelis Almea
-- Fecha: 22/10/2020
delete FROM alodigaWallet.preference_control where id>0;
delete FROM alodigaWallet.preference_value  where bussinessId=1 and preferenceClassficationId=1;
delete FROM alodigaWallet.preference_value  where bussinessId=2 and preferenceClassficationId=1;

UPDATE `alodigaWallet`.`preference_field` SET `preferenceId` = '2' WHERE (`id` = '19');



-- Data dummy para Guardar afiliacion natural person
-- author: Graterol Moises
-- Fecha: 06/11/2020
INSERT INTO `alodigaWallet`.`person_classification` (`description`, `code`) VALUES ('Register Unified User','REUNUS');


INSERT INTO `alodigaWallet`.`document_type` (`name`, `acronym`) VALUES ('BUSINESS_AFFILITION_REQUEST', 'BUAFRQ');


INSERT INTO `alodigaWallet`.`document_type` (`name`, `acronym`) VALUES ('USER_REGISTER_AFILIATION_REQUEST', 'USREAR');

INSERT INTO `alodigaWallet`.`sequences` (`initialValue`, `currentValue`, `documentTypeId`, `originApplicationId`) VALUES ('1', '1', '15', '3');

INSERT INTO `alodigaWallet`.`sequences` (`initialValue`, `currentValue`, `documentTypeId`, `originApplicationId`) VALUES ('1', '1', '16', '1');


-- Agregar fecha de inicio a las preferencias existentes en base de datos
-- author: Yamelis Almea
-- Fecha: 09/11/2020
update alodigawallet.preference_value set beginningDate='2020-01-01 00:00:00' where id>0;
update alodigawallet.preference_value set isPercentage=0 where id>0;

-- Agregar Legal Representatives en clasificacion de persona
-- author: Jorge Pinto
-- Fecha: 13/11/2020
INSERT INTO `alodigaWallet`.`person_classification` (`description`, `code`) VALUES ('Legal Representatives', 'LEGREP');


-- Data dummy para Secuencias para el servicio manualRecharge y manualWithdrawls 
-- author: Jorge Pinto
-- Fecha: 30/12/2020
INSERT INTO `alodigaWallet`.`sequences` (`initialValue`, `currentValue`, `documentTypeId`, `originApplicationId`) VALUES ('1', '0', '9', '1');
INSERT INTO `alodigaWallet`.`sequences` (`initialValue`, `currentValue`, `documentTypeId`, `originApplicationId`) VALUES ('1', '0', '8', '1');
INSERT INTO `alodigaWallet`.`sequences` (`initialValue`, `currentValue`, `documentTypeId`, `originApplicationId`) VALUES ('1', '0', '7', '1');
INSERT INTO `alodigaWallet`.`sequences` (`initialValue`, `currentValue`, `documentTypeId`, `originApplicationId`) VALUES ('1', '0', '6', '1');
INSERT INTO `alodigaWallet`.`sequences` (`initialValue`, `currentValue`, `documentTypeId`, `originApplicationId`) VALUES ('1', '0', '4', '1');

-- Data dummy para status_bank_operation
-- author: Jorge Pinto
-- Fecha: 30/12/2020
INSERT INTO `alodigaWallet`.`status_bank_operation` (`description`, `code`, `createDate`) VALUES ('PENDIENTE', 'PENDIE', '2020-11-30 09:49:20');

insert into sequences (initialValue, currentValue, documentTypeId, originApplicationId) values (1,1,8,1);

insert into sequences (initialValue,currentValue,documentTypeId,originApplicationId) (select 1,1,dt.id,1 from document_type dt where id not in (select documentTypeId from sequences where originApplicationId = 1));

insert into sequences (initialValue,currentValue,documentTypeId,originApplicationId) (select 1,1,dt.id,2 from document_type dt where id not in (select documentTypeId from sequences where originApplicationId = 2));

insert into sequences (initialValue,currentValue,documentTypeId,originApplicationId) (select 1,1,dt.id,3 from document_type dt where id not in (select documentTypeId from sequences where originApplicationId = 3));
