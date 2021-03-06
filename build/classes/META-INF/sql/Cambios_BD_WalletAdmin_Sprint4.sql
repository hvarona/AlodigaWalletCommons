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


-- Cambios relacionados con esquema de Prerelaciones de Estatus de Afiliación de Negocio
-- author: Jesús Gómez
-- Fecha: 05/08/2020
ALTER TABLE `alodigaWallet`.`status_business_affiliation_requets`
ADD COLUMN `code` VARCHAR(10) NULL;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`status_business_affiliation_has_final_state` (
 `id` INT NOT NULL AUTO_INCREMENT,
 `statusBusinessAffiliationRequetsId` INT NOT NULL,
 `finalStateId` INT NOT NULL,
 `createDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `updateDate` TIMESTAMP NULL,
 PRIMARY KEY (`id`),
 INDEX `fk_status_business_affiliation_has_final_state_status_busin_idx` (`statusBusinessAffiliationRequetsId` ASC),
 INDEX `fk_status_business_affiliation_has_final_state_status_busin_idx1` (`finalStateId` ASC),
 CONSTRAINT `fk_status_business_affiliation_has_final_state_status_busines1`
   FOREIGN KEY (`statusBusinessAffiliationRequetsId`)
   REFERENCES `alodigaWallet`.`status_business_affiliation_requets` (`id`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 CONSTRAINT `fk_status_business_affiliation_has_final_state_status_busines2`
   FOREIGN KEY (`finalStateId`)
   REFERENCES `alodigaWallet`.`status_business_affiliation_requets` (`id`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION)
ENGINE = InnoDB;

RENAME TABLE `alodigaWallet`.`status_business_affiliation_requets` TO `alodigaWallet`.`status_business_affiliation_request`;

ALTER TABLE `alodigaWallet`.`business_affiliation_requets`
DROP FOREIGN KEY `fk_business_affiliation_requets_status_business_affiliation_r1`;
ALTER TABLE `alodigaWallet`.`business_affiliation_requets`
CHANGE COLUMN `statusBusinessAffiliationRequetsId` `statusBusinessAffiliationRequestId` INT(11) NOT NULL ;
ALTER TABLE `alodigaWallet`.`business_affiliation_requets`
ADD CONSTRAINT `fk_business_affiliation_requets_status_business_affiliation_r1`
 FOREIGN KEY (`statusBusinessAffiliationRequestId`)
 REFERENCES `alodigaWallet`.`status_business_affiliation_request` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION;

-- Cambios relacionados con esquema de Solicitudes de Afiliación de Negocio
-- author: Jesús Gómez
-- Fecha: 06/08/2020
RENAME TABLE `alodigaWallet`.`business_affiliation_requets` TO `alodigaWallet`.`business_affiliation_request`;

ALTER TABLE `alodigaWallet`.`request_has_collection_request`
DROP FOREIGN KEY `fk_request_has_collection_request_business_affiliation_requets1`;
ALTER TABLE `alodigaWallet`.`request_has_collection_request`
CHANGE COLUMN `businessAffiliationRequetsId` `businessAffiliationRequestId` BIGINT(20) NOT NULL;
ALTER TABLE `alodigaWallet`.`request_has_collection_request`
ADD CONSTRAINT `fk_request_has_collection_request_business1`
 FOREIGN KEY (`businessAffiliationRequestId`)
 REFERENCES `alodigaWallet`.`business_affiliation_request` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION;

ALTER TABLE `alodigaWallet`.`request_has_collection_request` 
DROP INDEX `businessAffiliationRequetsId`;

ALTER TABLE `alodigaWallet`.`review_business_affiliation_request`
DROP FOREIGN KEY `fk_review_business_affiliation_request_business_affiliation_r1`;
ALTER TABLE `alodigaWallet`.`review_business_affiliation_request`
CHANGE COLUMN `businessAffiliationRequetsId` `businessAffiliationRequestId` BIGINT(20) NOT NULL ;
ALTER TABLE `alodigaWallet`.`review_business_affiliation_request`
ADD CONSTRAINT `fk_review_business_affiliation_request_business_affiliation_r1`
 FOREIGN KEY (`businessAffiliationRequestId`)
 REFERENCES `alodigaWallet`.`business_affiliation_request` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION;

ALTER TABLE `alodigaWallet`.`review_business_affiliation_request` 
DROP INDEX `businessAffiliationRequetsId`;

-- Cambios en los índices en tabla account_bank
-- author: Jesús Gómez
-- Fecha: 07/08/2020
ALTER TABLE `alodigaWallet`.`account_bank` 
ADD UNIQUE INDEX `fk_account_bank_by_bank_idx` (`bankId` ASC, `accountNumber` ASC);

ALTER TABLE `alodigaWallet`.`account_bank` 
DROP INDEX `UnifiedRegistryId` ,
ADD INDEX `UnifiedRegistryId` (`UnifiedRegistryId` ASC);

-- cambios relacionados con el representante legal del negocio y la dirección del solicitante
-- author: Jesús Gómez
-- Fecha: 09/08/2020
CREATE TABLE IF NOT EXISTS `alodigaWallet`.`person_has_address` (
  `id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
  `personId` BIGINT UNIQUE NOT NULL,
  `addressId` BIGINT(10) NOT NULL,
  `createDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_person_has_address_person2_idx` (`personId` ASC),
  INDEX `fk_person_has_address_address2_idx` (`addressId` ASC),
  CONSTRAINT `fk_person_has_address_person2`
    FOREIGN KEY (`personId`)
    REFERENCES `alodigaWallet`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_person_has_address_address2`
    FOREIGN KEY (`addressId`)
    REFERENCES `alodigaWallet`.`address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`legal_representative` (
  `id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
  `personId` BIGINT UNIQUE NOT NULL,
  `documentsPersonTypeId` INT NOT NULL,
  `identificationNumber` VARCHAR(40) NOT NULL,
  `identificationNumberOld` VARCHAR(40) NULL,
  `dueDateDocumentIdentification` DATE NULL,
  `firstNames` VARCHAR(50) NOT NULL,
  `lastNames` VARCHAR(50) NOT NULL,
  `age` INT NOT NULL,
  `gender` VARCHAR(1) NULL,
  `placeBirth` VARCHAR(50) NULL,
  `dateBirth` DATE NOT NULL,
  `civilStatusId` INT NOT NULL,
  `createDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_legalRepresentative_person1_idx` (`personId` ASC),
  INDEX `fk_legalRepresentative_documents_person_type1_idx` (`documentsPersonTypeId` ASC),
  INDEX `fk_legal_representative_civil_status1_idx` (`civilStatusId` ASC),
  CONSTRAINT `fk_legalRepresentative_person1`
    FOREIGN KEY (`personId`)
    REFERENCES `alodigaWallet`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_legalRepresentative_documents_person_type1`
    FOREIGN KEY (`documentsPersonTypeId`)
    REFERENCES `alodigaWallet`.`documents_person_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_legal_representative_civil_status1`
    FOREIGN KEY (`civilStatusId`)
    REFERENCES `alodigaWallet`.`civil_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

ALTER TABLE `alodigaWallet`.`legal_person`
ADD COLUMN `legalRepresentativeId` BIGINT NULL;
ALTER TABLE `alodigaWallet`.`legal_person`
ADD CONSTRAINT `fk_legal_person_legal_representative1`
 FOREIGN KEY (`legalRepresentativeId`)
 REFERENCES `alodigaWallet`.`legal_representative` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION;

-- cambios relacionados con feature Tipo de Servicios por Negocio
-- author: Jesús Gómez
-- Fecha: 09/08/2020
CREATE TABLE IF NOT EXISTS `alodigaWallet`.`business_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(50) NOT NULL,
  `code` VARCHAR(10) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`business_service_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(50) NULL,
  `code` VARCHAR(10) NULL,
  `businessTypeId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_business_service_type_business_type1_idx` (`businessTypeId` ASC),
  CONSTRAINT `fk_business_service_type_business_type1`
    FOREIGN KEY (`businessTypeId`)
    REFERENCES `alodigaWallet`.`business_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Definir campos que no son obligatorios en tablas relacionadas con el solicitante (negocio)
-- author: Jesús Gómez
-- Fecha: 10/08/2020
ALTER TABLE `alodigaWallet`.`natural_person` 
DROP FOREIGN KEY `fk_natural_person_profession1`;
ALTER TABLE `alodigaWallet`.`natural_person` 
CHANGE COLUMN `identificationNumber` `identificationNumber` VARCHAR(40) NOT NULL ,
CHANGE COLUMN `dueDateDocumentIdentification` `dueDateDocumentIdentification` DATE NOT NULL ,
CHANGE COLUMN `firstName` `firstName` VARCHAR(40) NOT NULL ,
CHANGE COLUMN `lastName` `lastName` VARCHAR(40) NOT NULL ,
CHANGE COLUMN `gender` `gender` VARCHAR(1) NOT NULL ,
CHANGE COLUMN `placeBirth` `placeBirth` VARCHAR(50) NOT NULL ,
CHANGE COLUMN `dateBirth` `dateBirth` DATE NOT NULL ,
CHANGE COLUMN `professionId` `professionId` INT(11) NULL ;
ALTER TABLE `alodigaWallet`.`natural_person` 
ADD CONSTRAINT `fk_natural_person_profession1`
  FOREIGN KEY (`professionId`)
  REFERENCES `alodigaWallet`.`profession` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `alodigaWallet`.`phone_person` 
CHANGE COLUMN `countryCode` `countryCode` VARCHAR(4) NOT NULL ,
CHANGE COLUMN `areaCode` `areaCode` VARCHAR(10) NOT NULL ,
CHANGE COLUMN `indMainPhone` `indMainPhone` TINYINT(1) NOT NULL ;



ALTER TABLE `alodigaWallet`.`legal_person` 
CHANGE COLUMN `registerNumber` `registerNumber` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `dateInscriptionRegister` `dateInscriptionRegister` DATE NOT NULL ,
CHANGE COLUMN `payedCapital` `payedCapital` FLOAT NOT NULL ;

-- Agregada columna en person_classification
-- author: Jesús Gómez
-- Fecha: 12/08/2020
ALTER TABLE `alodigaWallet`.`person_classification`
ADD COLUMN `code` VARCHAR(10) NULL AFTER `description`;


-- Modificado FK en business_service_type
-- author: Jesús Gómez
-- Fecha: 12/08/2020
ALTER TABLE `alodigaWallet`.`business_service_type` 
DROP FOREIGN KEY `fk_business_service_type_business_type1`;
ALTER TABLE `alodigaWallet`.`business_service_type` 
CHANGE COLUMN `businessTypeId` `businessTypeId` INT(11) NULL ;
ALTER TABLE `alodigaWallet`.`business_service_type` 
ADD CONSTRAINT `fk_business_service_type_business_type1`
  FOREIGN KEY (`businessTypeId`)
  REFERENCES `alodigaWallet`.`business_type` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
-- cambios del campo indApproved de String a boolean en request_has_collection_request
-- author: Yamelis Almea
-- Fecha: 12/08/2020
ALTER TABLE `alodigawallet`.`request_has_collection_request` 
CHANGE COLUMN `indApproved` `indApproved` TINYINT(1) NULL DEFAULT NULL ;

-- Agregar campo code en tablas de tipo listados
-- author: Jesús Gómez
-- Fecha: 13/08/2020
ALTER TABLE `alodigaWallet`.`street_type`
ADD COLUMN `code` VARCHAR(10) NULL AFTER `description`;

ALTER TABLE `alodigaWallet`.`address_type`
ADD COLUMN `code` VARCHAR(10) NULL AFTER `description`;

ALTER TABLE `alodigaWallet`.`edification_type`
ADD COLUMN `code` VARCHAR(10) NULL AFTER `description`;

-- Agregar tablas para la revisión de OFAC al solicitante de negocios
-- author: Jesús Gómez
-- Fecha: 13/08/2020
CREATE TABLE IF NOT EXISTS `alodigaWallet`.`status_applicant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(50) NOT NULL,
  `code` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

ALTER TABLE `alodigaWallet`.`legal_person`
ADD COLUMN `statusApplicantId` INT NOT NULL;
ALTER TABLE `alodigaWallet`.`legal_person`
ADD CONSTRAINT `fk_legal_person_status_applicant1`
 FOREIGN KEY (`statusApplicantId`)
 REFERENCES `alodigaWallet`.`status_applicant` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION;

ALTER TABLE `alodigaWallet`.`natural_person`
ADD COLUMN `statusApplicantId` INT NOT NULL;
ALTER TABLE `alodigaWallet`.`natural_person`
ADD CONSTRAINT `fk_natural_person_status_applicant1`
 FOREIGN KEY (`statusApplicantId`)
 REFERENCES `alodigaWallet`.`status_applicant` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`review_ofac` (
  `id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
  `personId` BIGINT UNIQUE NOT NULL,
  `resultReview` FLOAT NOT NULL,
  `businessAffiliationRequetsId` BIGINT UNIQUE NOT NULL,
  `observations` VARCHAR(1000) NULL,
  `userReviewId` BIGINT(10) NOT NULL,
  `createDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_review_ofac_person1_idx` (`personId` ASC),
  INDEX `fk_review_ofac_business_affiliation_requets1_idx` (`businessAffiliationRequetsId` ASC),
  INDEX `fk_review_ofac_user1_idx` (`userReviewId` ASC),
  CONSTRAINT `fk_review_ofac_person1`
    FOREIGN KEY (`personId`)
    REFERENCES `alodigaWallet`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_ofac_business_affiliation_requets1`
    FOREIGN KEY (`businessAffiliationRequetsId`)
    REFERENCES `alodigaWallet`.`business_affiliation_requets` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_ofac_user1`
    FOREIGN KEY (`userReviewId`)
    REFERENCES `alodigaWallet`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

