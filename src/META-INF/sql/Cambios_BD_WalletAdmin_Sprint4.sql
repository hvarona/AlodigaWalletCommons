y-- Cambios relacionados con esquema de solicitudes de afiliación del negocio
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

ALTER TABLE `alodigaWallet`.`legal_representative`
ADD COLUMN `statusApplicantId` INT NOT NULL;
ALTER TABLE `alodigaWallet`.`legal_representative`
ADD CONSTRAINT `fk_legal_representative_status_applicant1`
 FOREIGN KEY (`statusApplicantId`)
 REFERENCES `alodigaWallet`.`status_applicant` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`review_ofac` (
 `id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
 `personId` BIGINT UNIQUE NOT NULL,
 `resultReview` FLOAT NOT NULL,
 `businessAffiliationRequestId` BIGINT UNIQUE NOT NULL,
 `observations` VARCHAR(1000) NULL,
 `userReviewId` BIGINT(10) NOT NULL,
 `createDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
 `updateDate` TIMESTAMP NULL,
 PRIMARY KEY (`id`),
 INDEX `fk_review_ofac_person1_idx` (`personId` ASC),
 INDEX `fk_review_ofac_business_affiliation_requets1_idx` (`businessAffiliationRequestId` ASC),
 INDEX `fk_review_ofac_user1_idx` (`userReviewId` ASC),
 CONSTRAINT `fk_review_ofac_person1`
   FOREIGN KEY (`personId`)
   REFERENCES `alodigaWallet`.`person` (`id`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 CONSTRAINT `fk_review_ofac_business_affiliation_request1`
   FOREIGN KEY (`businessAffiliationRequestId`)
   REFERENCES `alodigaWallet`.`business_affiliation_request` (`id`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 CONSTRAINT `fk_review_ofac_user1`
   FOREIGN KEY (`userReviewId`)
   REFERENCES `alodigaWallet`.`user` (`id`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Agregar tablas para CRUD de estatus de tarjetas
-- author: Jesús Gómez
-- Fecha: 13/08/2020
CREATE TABLE IF NOT EXISTS `alodigaWallet`.`status_card` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(50) NOT NULL,
  `code` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`status_card_has_final_state` (
  `id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
  `statusCardId` INT NOT NULL,
  `statusCardFinalStateId` INT NOT NULL,
  `createDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_status_card_has_final_state_status_card1_idx` (`statusCardId` ASC),
  INDEX `fk_status_card_has_final_state_status_card2_idx` (`statusCardFinalStateId` ASC),
  CONSTRAINT `fk_status_card_has_final_state_status_card1`
    FOREIGN KEY (`statusCardId`)
    REFERENCES `alodigaWallet`.`status_card` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_status_card_has_final_state_status_card2`
    FOREIGN KEY (`statusCardFinalStateId`)
    REFERENCES `alodigaWallet`.`status_card` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

ALTER TABLE `alodigaWallet`.`card`
ADD COLUMN `statusCardId` INT NULL;
ALTER TABLE `alodigaWallet`.`card`
ADD CONSTRAINT `fk_card_status_card1`
 FOREIGN KEY (`statusCardId`)
 REFERENCES `alodigaWallet`.`status_card` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION;

-- Agregar tablas para cambio de contraseña de usuario.
-- author: Jesús Gómez
-- Fecha: 18/08/2020
CREATE TABLE IF NOT EXISTS `alodigaWallet`.`comercial_agency` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(80) NOT NULL,
  `cityId` BIGINT(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comercialAgency_city1_idx` (`cityId` ASC),
  CONSTRAINT `fk_comercialAgency_city1`
    FOREIGN KEY (`cityId`)
    REFERENCES `alodigaWallet`.`city` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`employed_position` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

 CREATE TABLE IF NOT EXISTS `alodigaWallet`.`employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `identificationNumber` VARCHAR(40) NULL,
  `documentsPersonTypeId` INT NOT NULL,
  `firstNames` VARCHAR(40) NULL,
  `lastNames` VARCHAR(45) NULL,
  `personId` BIGINT UNIQUE NOT NULL,
  `employedPositionId` INT NOT NULL,
  `comercialAgencyId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Employee_employedPosition1_idx` (`employedPositionId` ASC),
  INDEX `fk_Employee_person1_idx` (`personId` ASC),
  INDEX `fk_employee_comercialAgency1_idx` (`comercialAgencyId` ASC),
  INDEX `fk_employee_documentsPersonType1_idx` (`documentsPersonTypeId` ASC),
  CONSTRAINT `fk_Employee_employedPosition1`
    FOREIGN KEY (`employedPositionId`)
    REFERENCES `alodigaWallet`.`employed_position` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_person1`
    FOREIGN KEY (`personId`)
    REFERENCES `alodigaWallet`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_comercialAgency1`
    FOREIGN KEY (`comercialAgencyId`)
    REFERENCES `alodigaWallet`.`comercial_agency` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_documentsPersonType1`
    FOREIGN KEY (`documentsPersonTypeId`)
    REFERENCES `alodigaWallet`.`documents_person_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`password_change_request` (
  `id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
  `requestNumber` VARCHAR(40) NULL,
  `requestDate` TIMESTAMP NULL,
  `indApproved` TINYINT(1) NULL,
  `userId` BIGINT(10) NOT NULL,
  `currentPassword` VARCHAR(20) NULL,
  `newPassword` VARCHAR(20) NULL,
  `createDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_password_change_request_user1_idx` (`userid` ASC),
  CONSTRAINT `fk_password_change_request_user1`
    FOREIGN KEY (`userId`)
    REFERENCES `alodigaWallet`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

SET FOREIGN_KEY_CHECKS=0;
ALTER TABLE `alodigaWallet`.`user`
ADD COLUMN `documentsPersonTypeId` INT NOT NULL,
ADD COLUMN `identificationNumber` VARCHAR(40) NOT NULL,
ADD COLUMN `personId` BIGINT NOT NULL,
ADD COLUMN `authorizedEmployeeId` INT NOT NULL,
ADD COLUMN `employeeId` INT NOT NULL;
ALTER TABLE `alodigaWallet`.`user`
ADD CONSTRAINT `fk_user_documentsPersonType1`
 FOREIGN KEY (`documentsPersonTypeId`)
 REFERENCES `alodigaWallet`.`documents_person_type` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION;
ALTER TABLE `alodigaWallet`.`user`
ADD CONSTRAINT `fk_user_person1`
 FOREIGN KEY (`personId`)
 REFERENCES `alodigaWallet`.`person` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION;
ALTER TABLE `alodigaWallet`.`user`
ADD CONSTRAINT `fk_user_authorizedEmployee1`
 FOREIGN KEY (`authorizedEmployeeId`)
 REFERENCES `alodigaWallet`.`employee` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION; 
ALTER TABLE `alodigaWallet`.`user`
ADD CONSTRAINT `fk_user_employee1`
 FOREIGN KEY (`employeeId`)
 REFERENCES `alodigaWallet`.`employee` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION;
 SET FOREIGN_KEY_CHECKS=1;

-- Modificar tabla origin_application agregar code e incluir portal de negocio.
-- author: Yamelis Almea
-- Fecha: 20/08/2020
ALTER TABLE `alodigawallet`.`origin_application` 
ADD COLUMN `code` VARCHAR(6) NOT NULL AFTER `name`;


UPDATE `alodigaWallet`.`origin_application` SET `code` = 'AWAAPP' WHERE (`id` = '1');
UPDATE `alodigaWallet`.`origin_application` SET `code` = 'AWAWEB' WHERE (`id` = '2');
INSERT INTO `alodigaWallet`.`origin_application` (`id`, `name`, `code`) VALUES ('3', 'Portal de Negocios', 'PORNEG');

-- cambios de los campos currentPassword y newPassword en la tabla password_change_request, cambiando el tamaño
-- de 20 a 255
-- author: Lulymar Gutierrez
-- Fecha: 20/08/2020
ALTER TABLE `alodigaWallet`.`password_change_request` 
CHANGE COLUMN `currentPassword` `currentPassword` VARCHAR(255) NULL DEFAULT NULL ,
CHANGE COLUMN `newPassword` `newPassword` VARCHAR(255) NULL DEFAULT NULL ;

-- Modificado el indice de personId para que acepte valores duplicados.
-- author: Jesús Gómez
-- Fecha: 21/08/2020
ALTER TABLE `alodigaWallet`.`phone_person` 
DROP INDEX `personId` ,
ADD INDEX `personId` (`personId` ASC);

-- Agregar tabla de calendar_days
-- author: Jesús Gómez
-- Fecha: 07/09/2020
CREATE TABLE IF NOT EXISTS `alodigaWallet`.`calendar_days` (
  `id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
  `countryId` BIGINT(3) NOT NULL,
  `holidayDate` DATE NULL,
  `description` VARCHAR(50) NULL,
  `createDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_calendarDays_country1_idx` (`countryId` ASC),
  CONSTRAINT `fk_calendarDays_country1`
    FOREIGN KEY (`countryId`)
    REFERENCES `alodigaWallet`.`country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

-- Agregar la preferencia MAX_NUMBER_OF_CARDS_ENABLED para el limite de tarjetas que se pueden activar diariamente por negocio
-- author: Yamelis Almea
-- Fecha: 01/09/2020

INSERT INTO `alodigawallet`.`preference_field` (`id`, `name`, `preferenceId`, `enabled`, `preferenceTypeId`) VALUES ('25', 'MAX_NUMBER_OF_CARDS_ENABLED', '3', '1', '1');
INSERT INTO `alodigawallet`.`preference_value` (`value`, `preferenceFieldId`, `preferenceClassficationId`, `createDate`, `updateDate`, `enabled`) VALUES ('5', '25', '2', '2020-07-14 14:40:46', '2020-07-14 15:17:48', '1');
INSERT INTO `alodigawallet`.`preference_value` (`value`, `preferenceFieldId`, `productId`, `transactionTypeId`, `preferenceClassficationId`, `preferenceValueParentId`, `bussinessId`, `createDate`, `updateDate`, `enabled`) VALUES ('4', '25', '1', '1', '1', '136', '1', '2020-07-19 12:50:41', '2020-07-19 12:50:41', '1');
INSERT INTO `alodigawallet`.`preference_value` (`value`, `preferenceFieldId`, `productId`, `transactionTypeId`, `preferenceClassficationId`, `preferenceValueParentId`, `bussinessId`, `createDate`, `updateDate`, `enabled`) VALUES ('4', '25', '2', '1', '1', '136', '1', '2020-07-19 12:50:41', '2020-07-19 12:50:41', '1');
INSERT INTO `alodigawallet`.`preference_value` (`value`, `preferenceFieldId`, `productId`, `transactionTypeId`, `preferenceClassficationId`, `preferenceValueParentId`, `bussinessId`, `createDate`, `updateDate`, `enabled`) VALUES ('3', '25', '1', '2', '2', '136', '2', '2020-07-19 12:49:06', '2020-07-19 12:49:06', '1');

-- Creación de las tablas para el cierre diario de las transacciones realizadas en la billetera
-- author: Jesús Gómez
-- Fecha: 09/09/2020
CREATE TABLE IF NOT EXISTS `alodigaWallet`.`daily_closing_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(50) NOT NULL,
  `code` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`daily_closing` (
  `id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
  `closingDate` DATE NOT NULL,
  `closingStartTime` TIME NULL,
  `closingEndTime` TIME NULL,
  `dailyClosingTypeId` INT NOT NULL,
  `totalTransactions` INT NULL,
  `createDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_daily_closing_daily_closing_type1_idx` (`dailyClosingTypeId` ASC),
  CONSTRAINT `fk_daily_closing_daily_closing_type1`
    FOREIGN KEY (`dailyClosingTypeId`)
    REFERENCES `alodigaWallet`.`daily_closing_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`code_error_transaction_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(50) NULL,
  `code` VARCHAR(50) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`status_transaction_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(50) NOT NULL,
  `code` VARCHAR(10) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `alodigaWallet`.`transaction_log` (
  `id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
  `transactionId` BIGINT(20) NOT NULL,
  `statusTransactionLogId` INT NOT NULL,
  `codeErrorTransactionLogId` INT NOT NULL,
  `observations` VARCHAR(1500) NULL,
  `createDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_transaction_log_transaction1_idx` (`transactionId` ASC),
  INDEX `fk_transaction_log_status_transaction_log1_idx` (`statusTransactionLogId` ASC),
  INDEX `fk_transaction_log_code_error_transaction_log1_idx` (`codeErrorTransactionLogId` ASC),
  CONSTRAINT `fk_transaction_log_transaction1`
    FOREIGN KEY (`transactionId`)
    REFERENCES `alodigaWallet`.`transaction` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_log_status_transaction_log1`
    FOREIGN KEY (`statusTransactionLogId`)
    REFERENCES `alodigaWallet`.`status_transaction_log` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_log_code_error_transaction_log1`
    FOREIGN KEY (`codeErrorTransactionLogId`)
    REFERENCES `alodigaWallet`.`code_error_transaction_log` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

ALTER TABLE `alodigaWallet`.`transaction`
ADD COLUMN `indClosed` TINYINT(1) NULL,
ADD COLUMN `dailyClosingId` BIGINT NULL;
ALTER TABLE `alodigaWallet`.`transaction`
ADD CONSTRAINT `fk_transaction_dailyClosing1`
 FOREIGN KEY (`dailyClosingId`)
 REFERENCES `alodigaWallet`.`daily_closing` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION;

-- Agregar campo en tabla Bank
-- author: Jesús Gómez
-- Fecha: 10/09/2020
ALTER TABLE `alodigaWallet`.`bank` 
CHANGE COLUMN `aba` `aba` VARCHAR(30) NULL,
ADD COLUMN `SwiftCode` VARCHAR(20) NOT NULL AFTER `aba`;

ALTER TABLE `alodigaWallet`.`bank` 
CHANGE COLUMN `countryId` `countryId` BIGINT(30) NOT NULL AFTER `id`,
CHANGE COLUMN `enterpriseId` `enterpriseId` BIGINT(20) NOT NULL AFTER `swiftCode`,
CHANGE COLUMN `aba` `abaCode` VARCHAR(30) NULL DEFAULT NULL;

-- Agregar FK en tabla collection_type
-- author: Jesús Gómez
-- Fecha: 14/09/2020
SET FOREIGN_KEY_CHECKS=0;
ALTER TABLE `alodigaWallet`.`collection_type`
ADD COLUMN `personTypeId` INT(11) NOT NULL,
ALTER TABLE `alodigaWallet`.`collection_type`
ADD CONSTRAINT `fk_collectionType_personType1`
 FOREIGN KEY (`personTypeId`)
 REFERENCES `alodigaWallet`.`person_type` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION;
 SET FOREIGN_KEY_CHECKS=1;

-- Cambios para incluir el transaccionBusinessId que se genera en el portal de negocio
-- author: Yamelis Almea
-- Fecha: 17/09/2020

ALTER TABLE `alodigaWallet`.`balance_history` 
ADD COLUMN `businessId` BIGINT(10) NULL DEFAULT NULL AFTER `adjusmentInfo`,
CHANGE COLUMN `userId` `userId` BIGINT(10) NULL DEFAULT NULL ;

ALTER TABLE `alodigaWallet`.`balance_history` 
ADD COLUMN `transactionBusinessId` BIGINT(20) NULL DEFAULT NULL AFTER `businessId`;

ALTER TABLE `alodigaWallet`.`transaction` 
ADD COLUMN `transactionBusinessId` BIGINT(20) NULL DEFAULT NULL AFTER `concept`;


CREATE TABLE `alodigaWallet`.`business_has_product` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `productId` bigint(3) NOT NULL,
  `businessId` bigint(10) NOT NULL,
  `beginningDate` datetime NOT NULL,
  `endingDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_has_provider_product2` (`productId`),
  KEY `fk_product_has_provider_business)id` (`businessId`)
) ENGINE=InnoDB;

-- Cambios para incluir el businessId para retiro manual y transferencia de saldo de un negocio a una cuenta personal. Se agrego un nuevo tipo de transaccion para identificar las transaciones de retiro manual del negocio.
-- author: Yamelis Almea
-- Fecha: 19/09/2020

INSERT INTO `alodigaWallet`.`transaction_type` (`id`, `value`) VALUES ('11', 'BUSINESS_ WITHDRAWALS_MANUAL');

ALTER TABLE `alodigaWallet`.`bank_operation` 
ADD COLUMN `businessId` BIGINT(10) NULL AFTER `additional2`;

ALTER TABLE `alodigaWallet`.`transaction_approve_request` 
ADD COLUMN `businessId` BIGINT(10) NULL AFTER `userApprovedRequestId`;

ALTER TABLE `alodigaWallet`.`transaction` 
ADD COLUMN `businessId` BIGINT(10) NULL DEFAULT NULL AFTER `dailyClosingId`;

ALTER TABLE `alodigaWallet`.`transaction` 
ADD COLUMN `businessDestinationId` BIGINT(10) NULL DEFAULT NULL AFTER `businessId`;

-- Cambios para generar transactionNumber
-- author: Yamelis Almea
-- Fecha: 21/09/2020
ALTER TABLE `alodigaWallet`.`transaction_type` 
ADD COLUMN `code` VARCHAR(6) NOT NULL AFTER `value`;

UPDATE `alodigaWallet`.`transaction_type` SET `code` = 'PROREC' WHERE (`id` = '1');
UPDATE `alodigaWallet`.`transaction_type` SET `code` = 'PROPAY' WHERE (`id` = '2');
UPDATE `alodigaWallet`.`transaction_type` SET `code` = 'PROTRA' WHERE (`id` = '3');
UPDATE `alodigaWallet`.`transaction_type` SET `code` = 'PROEXC' WHERE (`id` = '4');
UPDATE `alodigaWallet`.`transaction_type` SET `code` = 'WITMAN' WHERE (`id` = '5');
UPDATE `alodigaWallet`.`transaction_type` SET `code` = 'MANREC' WHERE (`id` = '6');
UPDATE `alodigaWallet`.`transaction_type` SET `code` = 'TOPREC' WHERE (`id` = '7');
UPDATE `alodigaWallet`.`transaction_type` SET `code` = 'TRACAR' WHERE (`id` = '8');
UPDATE `alodigaWallet`.`transaction_type` SET `code` = 'TRAREM' WHERE (`id` = '9');
UPDATE `alodigaWallet`.`transaction_type` SET `code` = 'PURBAL' WHERE (`id` = '10');
UPDATE `alodigaWallet`.`transaction_type` SET `code` = 'BUSWIM' WHERE (`id` = '11');


INSERT INTO `alodigaWallet`.`document_type` (`id`, `name`, `acronym`) VALUES ('4', 'PRODUCT_RECHARGE', 'PROREC');
INSERT INTO `alodigaWallet`.`document_type` (`id`, `name`, `acronym`) VALUES ('5', 'PRODUCT_PAYMENT', 'PROPAY');
INSERT INTO `alodigaWallet`.`document_type` (`id`, `name`, `acronym`) VALUES ('6', 'PRODUCT_TRANSFER', 'PROTRA');
INSERT INTO `alodigaWallet`.`document_type` (`id`, `name`, `acronym`) VALUES ('7', 'PRODUCT_EXCHANGE', 'PROEXC');
INSERT INTO `alodigaWallet`.`document_type` (`id`, `name`, `acronym`) VALUES ('8', 'WITHDRAWALS_MANUAL', 'WITMAN');
INSERT INTO `alodigaWallet`.`document_type` (`id`, `name`, `acronym`) VALUES ('9', 'MANUAL_RECHARGE', 'MANREC');
INSERT INTO `alodigaWallet`.`document_type` (`id`, `name`, `acronym`) VALUES ('10', 'TOP_UP_RECHARGE', 'TOPREC');
INSERT INTO `alodigaWallet`.`document_type` (`id`, `name`, `acronym`) VALUES ('11', 'TRANSFER_CARD_TO_CARD', 'TRACAR');
INSERT INTO `alodigaWallet`.`document_type` (`id`, `name`, `acronym`) VALUES ('12', 'TRANSFER_REMITTANCE', 'TRAREM');
INSERT INTO `alodigaWallet`.`document_type` (`id`, `name`, `acronym`) VALUES ('13', 'PURCHASE_BALANCE', 'PURBAL');
INSERT INTO `alodigaWallet`.`document_type` (`id`, `name`, `acronym`) VALUES ('14', 'BUSINESS_ WITHDRAWALS_MANUAL', 'BUSWIM');

INSERT INTO `alodigaWallet`.`sequences` (`id`, `initialValue`, `currentValue`, `documentTypeId`, `originApplicationId`) VALUES ('8', '1', '1', '14', '3');

-- Cambios para incluir el accountBankId del portal de negocio para el retiro manual 
-- author: Yamelis Almea
-- Fecha: 21/09/2020
ALTER TABLE `alodigaWallet`.`bank_operation` 
ADD COLUMN `accountBankBusinessId` BIGINT(10) NULL DEFAULT NULL AFTER `businessId`;

-- Agregar nuevas campos en la tabla preference_field 
-- author: Jesús Gómez
-- Fecha: 22/09/2020
ALTER TABLE `alodigaWallet`.`preference_field`
ADD COLUMN `description` VARCHAR(80) NULL AFTER `name`,
ADD COLUMN `code` VARCHAR(10) NULL AFTER `description`;

-- Modificar tamaños de campos en la tabla password_change_request 
-- author: Jesús Gómez
-- Fecha: 23/09/2020
ALTER TABLE `alodigaWallet`.`password_change_request` 
CHANGE COLUMN `currentPassword` `currentPassword` VARCHAR(80) NULL DEFAULT NULL ,
CHANGE COLUMN `newPassword` `newPassword` VARCHAR(80) NULL DEFAULT NULL ;

-- Colocar campos obligatorios en la tabla calendar_days 
-- author: Jesús Gómez
-- Fecha: 23/09/2020
ALTER TABLE `alodigaWallet`.`calendar_days` 
CHANGE COLUMN `holidayDate` `holidayDate` DATE NOT NULL ,
CHANGE COLUMN `createDate` `createDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ;

-- Agregar campo en la tabla transaction_type 
-- author: Jesús Gómez
-- Fecha: 23/09/2020
ALTER TABLE `alodigaWallet`.`transaction_type` 
ADD COLUMN `description` VARCHAR(80) NULL AFTER `code`;

-- Agregar campo code en la tabla transaction_source 
-- author: Jesús Gómez
-- Fecha: 24/09/2020
ALTER TABLE `alodigaWallet`.`transaction_source`
ADD COLUMN `code` VARCHAR(10) NULL AFTER `name`;

-- Eliminar FK en tabla daily_closing
-- author: Jesús Gómez
-- Fecha: 29/09/2020
ALTER TABLE `alodigaWallet`.`daily_closing`
DROP FOREIGN KEY `fk_daily_closing_daily_closing_type1`;
ALTER TABLE `alodigaWallet`.`daily_closing`
DROP COLUMN `dailyClosingTypeId`,
DROP INDEX `fk_daily_closing_daily_closing_type1_idx`;

-- Eliminar tabla daily_closing_type
-- author: Jesús Gómez
-- Fecha: 29/09/2020
DROP TABLE `alodigaWallet`.`daily_closing_type`;

-- Agregar FK en tabla daily_closing
-- author: Jesús Gómez
-- Fecha: 29/09/2020
ALTER TABLE `alodigaWallet`.`daily_closing`
ADD COLUMN `originApplicationId` INT NOT NULL AFTER `totalTransactions`;
ALTER TABLE `alodigaWallet`.`daily_closing`
ADD CONSTRAINT `fk_dailyClosing_originApplication1`
FOREIGN KEY (`originApplicationId`)
REFERENCES `alodigaWallet`.`origin_application` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- Agregar Incluir businessId en la tabla accountBank
-- author: Yamelis Almea
-- Fecha: 30/09/2020

ALTER TABLE `alodigaWallet`.`account_bank` 
ADD COLUMN `businessId` BIGINT(20) NULL DEFAULT NULL AFTER `createDate`,
CHANGE COLUMN `UnifiedRegistryId` `UnifiedRegistryId` BIGINT(20) NULL DEFAULT NULL ;

-- Agregar campo en tabla daily_closing
-- author: Jesús Gómez
-- Fecha: 01/10/2020
ALTER TABLE `alodigaWallet`.`daily_closing`
ADD COLUMN `transactionsAmount` FLOAT NOT NULL AFTER `totalTransactions`;

-- Modificar campo UnifiedRegistryUserId para que acepte null en tabla transaction_approve_request
-- author: Jesús Gómez
-- Fecha: 05/10/2020
ALTER TABLE `alodigaWallet`.`transaction_approve_request` 
CHANGE COLUMN `UnifiedRegistryUserId` `UnifiedRegistryUserId` BIGINT(20) NULL ;

-- Modificar FK productId para que acepte NULL en tabla balance_history
-- author: Jesús Gómez
-- Fecha: 05/10/2020
ALTER TABLE `alodigaWallet`.`balance_history` 
DROP FOREIGN KEY `fk_balance_has_product`;
ALTER TABLE `alodigaWallet`.`balance_history` 
CHANGE COLUMN `oldAmount` `oldAmount` FLOAT(20,2) NULL ,
CHANGE COLUMN `currentAmount` `currentAmount` FLOAT(20,2) NULL ,
CHANGE COLUMN `date` `date` DATETIME NULL ,
CHANGE COLUMN `productId` `productId` BIGINT(20) NULL ,
CHANGE COLUMN `version` `version` BIGINT(20) NULL ;
ALTER TABLE `alodigaWallet`.`balance_history` 
ADD CONSTRAINT `fk_balance_has_product`
  FOREIGN KEY (`productId`)
  REFERENCES `alodigaWallet`.`product` (`id`);


-- Modificar campos en tabla preference_value
-- author: Jorge Pinto
-- Fecha: 20/10/2020
ALTER TABLE `alodigaWallet`.`preference_value` 
CHANGE COLUMN `value` `value` VARCHAR(45) NULL DEFAULT NULL,
CHANGE COLUMN `updateDate` `updateDate` DATETIME NULL;

-- Incluir code en la tabla language
-- author: Jorge Pinto
-- Fecha: 20/10/2020
ALTER TABLE `alodigaWallet`.`language` 
ADD COLUMN `code` VARCHAR(10) NULL DEFAULT NULL AFTER `description`;

-- Incluir code en la tabla preference_classification
-- author: Jorge Pinto
-- Fecha: 20/10/2020
ALTER TABLE `alodigaWallet`.`preference_classification` 
ADD COLUMN `code` VARCHAR(10) NULL DEFAULT NULL AFTER `name`;


-- Cambios en BD según lo acordado en reunión efectuada con: Kerwin Gómez y Milagros Ríos
-- author: Jesús Gómez
-- Fecha: 25/10/2020
-- Eliminar varios campos en tabla bank_operation
ALTER TABLE `alodigaWallet`.`bank_operation` 
DROP COLUMN `additional2`,
DROP COLUMN `additional`;

-- Crear tabla status_bank_operation
CREATE TABLE IF NOT EXISTS `alodigaWallet`.`status_bank_operation` (
  `id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(50) NOT NULL,
  `code` VARCHAR(10) NULL,
  `createDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- Agregar campos en tabla bank_operation
ALTER TABLE `alodigaWallet`.`bank_operation` 
ADD COLUMN `statusBankOperationId` BIGINT NULL AFTER `commisionId`,
ADD COLUMN `observations` VARCHAR(1000) NULL AFTER `statusBankOperationId`,
ADD COLUMN `createDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP AFTER `observations`,
ADD COLUMN `updateDate` TIMESTAMP NULL AFTER `createDate`;

-- Agregar FK en tabla bank_operation
ALTER TABLE `alodigaWallet`.`bank_operation`
ADD CONSTRAINT `fk_bankOperation_statusBankOperation1`
FOREIGN KEY (`statusBankOperationId`)
REFERENCES `alodigaWallet`.`status_bank_operation` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- Eliminar FK de empresa en tabla bank
ALTER TABLE `alodigaWallet`.`bank` 
DROP FOREIGN KEY `fk_bank_has_enterprise_id`;
ALTER TABLE `alodigaWallet`.`bank` 
DROP COLUMN `enterpriseId`,
DROP INDEX `fk_bank_has_enterprise_id`;

-- Eliminar varios campos en tabla product
ALTER TABLE `alodigaWallet`.`product` 
DROP FOREIGN KEY `fk_product_integrationType1`,
DROP FOREIGN KEY `fk_product_enterprise1`;
ALTER TABLE `alodigaWallet`.`product` 
DROP COLUMN `accessNumberUrl`,
DROP COLUMN `ratesUrl`,
DROP COLUMN `productIntegrationTypeId`,
DROP COLUMN `enterpriseId`,
DROP INDEX `fk_product_enterprise1` ,
DROP INDEX `fk_product_integration_type1`;

-- Eliminar tabla enterprise
  DROP TABLE `alodigaWallet`.`enterprise`; 

  -- Eliminar tabla product_integration_type
  DROP TABLE `alodigaWallet`.`product_integration_type`; 

  -- Eliminar varios campos en tabla transaction
  ALTER TABLE `alodigaWallet`.`transaction` 
  DROP FOREIGN KEY `fk_transaction_has_close_id`;
  ALTER TABLE `alodigaWallet`.`transaction` 
  DROP COLUMN `closeId`,
  DROP COLUMN `additional2`,
  DROP COLUMN `additional`,
  DROP INDEX `fk_transaction_has_close_id`;

-- Eliminar tabla close
DROP TABLE `alodigaWallet`.`close`; 

-- Cambios en BD para registrar Solicitudes de Registro de Usuarios Billetera
-- author: Jesús Gómez
-- Fecha: 26/10/2020
SET FOREIGN_KEY_CHECKS=0;
-- Crear tabla request_type
CREATE TABLE IF NOT EXISTS `alodigaWallet`.`request_type` (
  `id` INT UNIQUE NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(50) NOT NULL,
  `code` VARCHAR(10) NOT NULL,
  `createDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

INSERT INTO `alodigaWallet`.`request_type` (`description`, `code`, `createDate`) VALUES ('Solicitudes de Afiliación de Negocios', 'SOAFNE', '2020-10-26 19:00:00');
INSERT INTO `alodigaWallet`.`request_type` (`description`, `code`, `createDate`) VALUES ('Solicitudes de Registro de Usuarios de Billetera ', 'SORUBI', '2020-10-26 19:00:00');

-- Cambiar nombre de tabla business_affiliation_request
RENAME TABLE `alodigaWallet`.`business_affiliation_request` TO `alodigaWallet`.`affiliation_request`;

-- Cambiar nombre de tabla status_business_affiliation_request
RENAME TABLE `alodigaWallet`.`status_business_affiliation_request` TO `alodigaWallet`.`status_request`;

-- Cambiar nombre de tabla review_business_affiliation_request
RENAME TABLE `alodigaWallet`.`review_business_affiliation_request` TO `alodigaWallet`.`review_affiliation_request`;

-- Eliminar FK de statusBusinessAffiliationId en tabla affiliation_request
ALTER TABLE `alodigaWallet`.`affiliation_request` 
DROP FOREIGN KEY `fk_business_affiliation_requets_status_business_affiliation_r1`;
ALTER TABLE `alodigaWallet`.`affiliation_request` 
DROP COLUMN `statusBusinessAffiliationRequestId`,
DROP INDEX `fk_business_affiliation_requets_status_business_affiliation_idx`;

-- Agregar FK statusRequestId en tabla affiliation_request
ALTER TABLE `alodigaWallet`.`affiliation_request` 
ADD COLUMN `statusRequestId` INT NOT NULL AFTER `dateRequest`;
ALTER TABLE `alodigaWallet`.`affiliation_request`
ADD CONSTRAINT `fk_affiliationRequest_statusRequest1`
FOREIGN KEY (`statusRequestId`)
REFERENCES `alodigaWallet`.`status_request` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

UPDATE alodigaWallet.affiliation_request SET statusRequestId = 1 where id > 0;

-- Agregar FK userRegisterUnifiedId en tabla affiliation_request
ALTER TABLE `alodigaWallet`.`affiliation_request` 
ADD COLUMN `userRegisterUnifiedId` BIGINT NULL AFTER `businessPersonId`;
ALTER TABLE `alodigaWallet`.`affiliation_request`
ADD CONSTRAINT `fk_affiliationRequest_person2`
FOREIGN KEY (`userRegisterUnifiedId`)
REFERENCES `alodigaWallet`.`person` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- Agregar FK requestTypeId en tabla affiliation_request
ALTER TABLE `alodigaWallet`.`affiliation_request` 
ADD COLUMN `requestTypeId` INT NOT NULL AFTER `statusRequestId`;
ALTER TABLE `alodigaWallet`.`affiliation_request`
ADD CONSTRAINT `fk_affiliationRequest_requestType1`
FOREIGN KEY (`requestTypeId`)
REFERENCES `alodigaWallet`.`request_type` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- Modificar FK businessPersonId para que acepte NULL
ALTER TABLE `alodigaWallet`.`affiliation_request` 
DROP FOREIGN KEY `fk_business_affiliation_requets_person1`;
ALTER TABLE `alodigaWallet`.`affiliation_request` 
CHANGE COLUMN `businessPersonId` `businessPersonId` BIGINT(20) NULL;
ALTER TABLE `alodigaWallet`.`affiliation_request` 
ADD CONSTRAINT `fk_affiliationRequest_person1`
  FOREIGN KEY (`businessPersonId`)
  REFERENCES `alodigaWallet`.`person` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- Colocar numberRequest y dateRequest como NOT NULL en tabla affiliation_request 
ALTER TABLE `alodigaWallet`.`affiliation_request` 
CHANGE COLUMN `numberRequest` `numberRequest` VARCHAR(40) NOT NULL ,
CHANGE COLUMN `dateRequest` `dateRequest` DATE NOT NULL ,
DROP INDEX `businessPersonId`;

-- Eliminar FK de businessAffiliationRequestId en tabla review_ofac
ALTER TABLE `alodigaWallet`.`review_ofac` 
DROP FOREIGN KEY `fk_review_ofac_business_affiliation_request1`;
ALTER TABLE `alodigaWallet`.`review_ofac` 
DROP COLUMN `businessAffiliationRequestId`,
DROP INDEX `fk_review_ofac_business_affiliation_requets1_idx`;

-- Agregar FK affiliationRequestsId en tabla review_ofac
ALTER TABLE `alodigaWallet`.`review_ofac` 
ADD COLUMN `affiliationRequestId` BIGINT NULL AFTER `personId`;
ALTER TABLE `alodigaWallet`.`review_ofac`
ADD CONSTRAINT `fk_reviewOfac_affiliationRequests1`
FOREIGN KEY (`affiliationRequestId`)
REFERENCES `alodigaWallet`.`affiliation_request` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- Agregar FK requestTypeId en tabla collections_request
ALTER TABLE `alodigaWallet`.`collections_request` 
ADD COLUMN `requestTypeId` INT NOT NULL AFTER `personTypeId`;
ALTER TABLE `alodigaWallet`.`collections_request`
ADD CONSTRAINT `fk_collectionsRequest_requestType1`
FOREIGN KEY (`requestTypeId`)
REFERENCES `alodigaWallet`.`request_type` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- Eliminar FK de businessAffiliationRequestId en tabla request_has_collection_request
ALTER TABLE `alodigaWallet`.`request_has_collection_request` 
DROP FOREIGN KEY `fk_request_has_collection_request_business1`;
ALTER TABLE `alodigaWallet`.`request_has_collection_request` 
DROP COLUMN `businessAffiliationRequestId`,
DROP INDEX `fk_request_has_collection_request_business_affiliation_requ_idx`;

-- Agregar FK affiliationRequestId en tabla request_has_collection_request
ALTER TABLE `alodigaWallet`.`request_has_collection_request` 
ADD COLUMN `affiliationRequestId` BIGINT NOT NULL AFTER `collectionsRequestId`;
ALTER TABLE `alodigaWallet`.`request_has_collection_request`
ADD CONSTRAINT `fk_requestHasCollectionRequest_affiliationRequests1`
FOREIGN KEY (`affiliationRequestId`)
REFERENCES `alodigaWallet`.`affiliation_request` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- Eliminar FK de businessAffiliationRequestId en tabla review_affiliation_request
ALTER TABLE `alodigaWallet`.`review_affiliation_request` 
DROP FOREIGN KEY `fk_review_business_affiliation_request_business_affiliation_r1`;
ALTER TABLE `alodigaWallet`.`review_affiliation_request` 
DROP COLUMN `businessAffiliationRequestId`,
DROP INDEX `fk_review_business_affiliation_request_business_affiliation_idx`;

-- Agregar FK affiliationRequestId en tabla review_affiliation_request
ALTER TABLE `alodigaWallet`.`review_affiliation_request` 
ADD COLUMN `affiliationRequestId` BIGINT NOT NULL AFTER `id`;
ALTER TABLE `alodigaWallet`.`review_affiliation_request`
ADD CONSTRAINT `fk_reviewAffiliationRequest_affiliationRequests1`
FOREIGN KEY (`affiliationRequestId`)
REFERENCES `alodigaWallet`.`affiliation_request` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

SET FOREIGN_KEY_CHECKS=1;

-- Agregar campo responsible en tabla bank_operation
-- author: Jesús Gómez
-- Fecha: 29/10/2020
ALTER TABLE `alodigaWallet`.`bank_operation`
ADD COLUMN `responsible` VARCHAR(50) NULL AFTER `observations`;

-- Agregar campos en tabla preference_value
-- author: Jesús Gómez
-- Fecha: 02/11/2020
ALTER TABLE `alodigaWallet`.`preference_value`
ADD COLUMN `beginningDate` DATE NULL AFTER `value`,
ADD COLUMN `endingDate` DATE NULL AFTER `beginningDate`,
ADD COLUMN `isPercentage` TINYINT(1) NULL AFTER `endingDate`;

-- Agregar campo enable en tabla collections_request
-- author: Jorge Pinto
-- Fecha: 09/11/2020
ALTER TABLE `alodigaWallet`.`collections_request` 
ADD COLUMN `enabled` TINYINT(1) NOT NULL AFTER `requestTypeId`;

-- Agregar campo en tabla product
-- author: Jesús Gómez
-- Fecha: 17/11/2020
ALTER TABLE `alodigaWallet`.`product` 
ADD COLUMN `isDefaultProduct` TINYINT(1) NULL AFTER `isFree`;

-- Agregar FK countryId en tabla product
-- author: Jesús Gómez
-- Fecha: 17/11/2020
SET FOREIGN_KEY_CHECKS=0;
ALTER TABLE `alodigaWallet`.`product` 
ADD COLUMN `countryId` BIGINT NOT NULL AFTER `categoryId`;
ALTER TABLE `alodigaWallet`.`product`
ADD CONSTRAINT `fk_product_country1`
FOREIGN KEY (`countryId`)
REFERENCES `alodigaWallet`.`country` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
SET FOREIGN_KEY_CHECKS=1;

UPDATE alodigaWallet.product SET countryId = (select c.id from alodigaWallet.country c where c.code = 58) 
WHERE id > 0;

-- Agregar transactionSequence en tabla transaction
-- author: Jesús Gómez
-- Fecha: 19/11/2020
ALTER TABLE `alodigaWallet`.`transaction` 
ADD COLUMN `transactionSequence` VARCHAR(20) NULL AFTER `transactionNumber`;

-- Agregar campo en tabla product
-- author: Jesús Gómez
-- Fecha: 20/11/2020
ALTER TABLE `alodigaWallet`.`product` 
ADD COLUMN `isUsePrepaidCard` TINYINT(1) NULL AFTER `isDefaultProduct`;

-- Agregar campo order en tabla collection_type
-- author: Jesús Gómez
-- Fecha: 02/12/2020
ALTER TABLE `alodigaWallet`.`collection_type` 
ADD COLUMN `orden` INT NULL AFTER `personTypeId`;

-- Agregar campo code_iso3 en tabla country
-- author: Jesús Gómez
-- Fecha: 14/12/2020
ALTER TABLE `alodigaWallet`.`country` 
ADD COLUMN `code_iso3` INT NULL AFTER `code`;