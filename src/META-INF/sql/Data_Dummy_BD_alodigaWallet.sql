
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