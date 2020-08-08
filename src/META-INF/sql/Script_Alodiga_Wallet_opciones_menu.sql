UPDATE `alodigaWallet`.`language` SET id = 2 WHERE id=3;

CREATE TABLE `alodigaWallet`.`user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `creationDate` datetime NOT NULL,
  `email` varchar(255) NOT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  `receiveTopUpNotification` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB;


INSERT INTO `alodigaWallet`.`user` VALUES (1,'yalmea','e10adc3949ba59abbe56e057f20f883e','Yamelis','Almea','2019-11-06 21:28:42','yamealm@gmail.com','542612594080',1,1),
(2,'mgraterol','e10adc3949ba59abbe56e057f20f883e','Moises','Graterol','2019-12-17 17:29:01','mgraterol@alodiga.com','584144565454',0,1);

CREATE TABLE `alodigaWallet`.`profile` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;


INSERT INTO `alodigaWallet`.`profile` VALUES (1,'Administrator',1);


CREATE TABLE `alodigaWallet`.`profile_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profileId` bigint(3) NOT NULL,
  `languageId` bigint(3) NOT NULL,
  `alias` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profile_data_profile1` (`profileId`),
  KEY `fk_profile_data_language1` (`languageId`),
  CONSTRAINT `fk_profile_data_language1` FOREIGN KEY (`languageId`) REFERENCES `language` (`id`),
  CONSTRAINT `fk_profile_data_profile1` FOREIGN KEY (`profileId`) REFERENCES `profile` (`id`)
) ENGINE=InnoDB;


INSERT INTO `alodigaWallet`.`profile_data` VALUES (1,1,1,'Administrator','Administrator'),(2,1,2,'Administrador','Administrador');

CREATE TABLE `alodigaWallet`.`permission_group` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

INSERT INTO `alodigaWallet`.`permission_group` VALUES (1,'Operational Management',1),(2,'Secutiry Management',1),(3,'Configurations Management',1),(4,'Report Management',1);

CREATE TABLE `alodigaWallet`.`permission_group_data` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `permissionGroupId` bigint(3) NOT NULL,
  `languageId` bigint(3) NOT NULL,
  `alias` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_permission_group_data_permission_group1` (`permissionGroupId`),
  KEY `fk_permission_group_data_language1` (`languageId`),
  CONSTRAINT `fk_permission_group_data_language1` FOREIGN KEY (`languageId`) REFERENCES `language` (`id`),
  CONSTRAINT `fk_permission_group_data_permission_group1` FOREIGN KEY (`permissionGroupId`) REFERENCES `permission_group` (`id`)
) ENGINE=InnoDB;


INSERT INTO `alodigaWallet`.`permission_group_data` VALUES (1,1,1,'Operational Management','Operational Management'),
(2,1,2,'Gestion Operacional','Gestion Operacional'),
(3,2,1,'Secutiry Management','Secutiry Management'),
(4,2,2,'Gestion de Seguridad','Gestion de Seguridad'),
(5,3,1,'Configurations Management','Configurations Management'),
(6,3,2,'Gestion de Configuraciones','Gestion de Configuraciones'),
(7,4,1,'Report Management','Report Management'),
(8,4,2,'Gestión  Reportes','Gestión  Reportes');

CREATE TABLE `alodigaWallet`.`permission` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `permissionGroupId` bigint(3) NOT NULL,
  `action` varchar(45) NOT NULL,
  `entity` varchar(45) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_constraint_permission_permissionGroup1` (`permissionGroupId`),
  CONSTRAINT `fk_constraint_permission_permissionGroup1` FOREIGN KEY (`permissionGroupId`) REFERENCES `permission_group` (`id`)
) ENGINE=InnoDB;


INSERT INTO `alodigaWallet`.`permission` VALUES (1,2,'ListProfiles','profile','List Profiles',1),
(2,2,'AddProfile','profile','Add Profiles',1),
(3,2,'ChangeProfileStatus','profile','Change Profile Status',1),
(4,2,'EditProfile','profile','Edit Profile',1),
(5,2,'ViewProfile','profile','View Profile',1),
(6,2,'ListEnterprises','enterprise','ListEntreprises',1),
(7,2,'AddEnterprise','enterprise','AddEntreprise',1),
(8,2,'EditEnterprise','enterprise','EditEntreprise',1),
(9,2,'ViewEnterprise','enterprise','ViewEntreprise',1),
(10,2,'ChangeEnterpriseStatus','enterprise','ChangeEntrepriseStatus',1),
(11,1,'ListProducts','product','ListProducts',1),
(12,1,'AddProduct','product','AddProduct',1),
(13,1,'EditProduct','product','EditProduct',1),
(14,1,'ViewProduct','product','ViewProduct',1),
(15,1,'ChangeProductStatus','product','ChangeProductStatus',1),
(16,1,'ListCountries','country','ListCountries',1),
(17,1,'AddCountry','country','AddCountry',1),
(18,1,'EditCountry','country','EditCountry',1),
(19,1,'ViewCountry','country','ViewCountry',1),
(20,1,'ChangeCountryStatus','country','ChangeCountryStatus',1),
(21,2,'ListUsers','user','ListUsers',1),
(22,2,'AddUser','user','AddUser',1),
(23,2,'EditUser','user','EditUser',1),
(24,2,'ViewUser','user','ViewUser',1),
(25,2,'ChangeUserStatus','user','ChangeUserStatus',1),
(26,3,'Admin Settings','settings','AdminSettings',1),
(27,1,'ExecuteReport','user','ExecuteReport',1),
(28,1,'ListReport','report','ListReport',1),
(29,1,'AddReport','report','AddReport',1),
(30,1,'EditReport','report','EditReport',1),
(31,1,'ViewReport','report','ViewReport',1),
(32,1,'ChangeReportStatus','report','ChangeReportStatus',1),
(33,2,'AuditAction','audit_action','AuditAction',1),
(34,1,'ListAudi','audi','ListAudi',1),
(35,1,'ViewTransaction','transaccion','ViewTransaction',1),
(36,1,'ViewCommission','commission','ViewCommission',1),
(37,1,'balanceAdjustment','user','balanceAdjustment',1),
(38,1,'ListBank','bank','ListBank',1),
(39,1,'AddBank','bank','AddBank',1),
(40,1,'EditBank','bank','EditBank',1),
(41,1,'ViewBank','bank','ViewBank',1),
(42,1,'ListCurrencies','currency','ListCurrencies',1),
(43,1,'AddCurrency','currency','AddCurrency',1),
(44,1,'EdiCurrency','currency','EditCurrency',1),
(45,1,'ViewCurrency','currency','ViewCurrency',1),
(46,1,'ListExchangeRate','exchange_rate','ListExchangeRate',1),
(47,1,'AddExchangeRate','exchange_rate','AddExchangeRate',1),
(48,1,'EdiExchangeRate','exchange_rate','EditExchangeRate',1),
(49,1,'ViewExchangeRate','exchange_rate','ViewExchangeRate',1),
(50,1,'ListOperationsBank','bank_operation','ListOperationsBank',1),
(51,1,'ViewOperationsBank','bank_operation','ViewOperationsBank',1);


CREATE TABLE `alodigaWallet`.`permission_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `permissionId` bigint(3) NOT NULL,
  `languageId` bigint(3) NOT NULL,
  `alias` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_permission_data_permission1` (`permissionId`),
  KEY `fk_permission_data_language1` (`languageId`),
  CONSTRAINT `fk_permission_data_language1` FOREIGN KEY (`languageId`) REFERENCES `language` (`id`),
  CONSTRAINT `fk_permission_data_permission1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB;


INSERT INTO `alodigaWallet`.`permission_data` VALUES (1,5,2,'Ver Perfil','Ver Perfil'),
(2,5,1,'View Profile','View Profile'),
(3,4,2,'Editar Perfil','Editar Perfil'),
(4,4,1,'Edit Profile','Edit Profile'),
(5,3,2,'Cambiar status de Perfil','Cambiar status de Perfil'),
(6,3,1,'Change Profile Status','Change Profile Status'),
(7,2,1,'Add Profile','Add Profile'),
(8,2,2,'Agregar Perfil','Agregar Perfil'),
(9,1,2,'Listar Perfiles','Listar Perfiles'),
(10,1,1,'List Profiles','List Profiles'),
(11,6,2,'Listar empresas','Listar empresas'),
(12,6,1,'List enterprises','List enterprises'),
(13,7,2,'Agregar empresa','Agregar empresa'),
(14,7,1,'Add enterprise','Add enterprise'),
(15,8,2,'Editar empresa','Editar empresa'),
(16,8,1,'Edit enterprise','Edit enterprise'),
(17,9,2,'Ver empresa','Ver empresa'),
(18,9,1,'View enterprise','View enterprise'),
(19,10,2,'Cambiar status empresa','Cambiar status empresa'),
(20,10,1,'Change enterprise status','Change enterprise status'),
(21,11,2,'Listar productos','Listar productos'),
(22,11,1,'List products','List products'),
(23,12,2,'Agregar producto','Agregar producto'),
(24,12,1,'Add product','Add product'),
(25,13,2,'Editar producto','Editar producto'),
(26,13,1,'Edit product','Edit product'),
(27,14,2,'Ver producto','Ver producto'),
(28,14,1,'View product','View product'),
(29,15,2,'Cambiar status producto','Cambiar status producto'),
(30,15,1,'Change product status','Change product status'),
(31,16,2,'Listar paises','Listar paises'),
(32,16,1,'List countries','List countries'),
(33,17,2,'Agregar pais','Agregar pais'),
(34,17,1,'Add country','Add country'),
(35,18,2,'Editar pais','Editar pais'),
(36,18,1,'Edit country','Edit country'),
(37,19,2,'Ver pais','Ver pais'),
(38,19,1,'View country','View country'),
(39,20,2,'Cambiar status pais','Cambiar status pais'),
(40,20,1,'Change country status','Change country status'),
(41,21,2,'Listar usuarios','Listar usuarios'),
(42,21,1,'List users','List users'),
(43,22,2,'Agregar Usuario','Agregar Usuario'),
(44,22,1,'Add user','Add user'),
(45,23,2,'Editar Usuario','Editar Usuario'),
(46,23,1,'Edit user','Edit user'),
(47,24,2,'Ver Usuario','Ver Usuario'),
(48,24,1,'View user','View user'),
(49,25,2,'Cambiar status Usuario','Cambiar status Usuario'),
(50,25,1,'Change user status','Change user status'),
(51,26,2,'Administrar configuraciones','Administrar configuraciones'),
(52,26,1,'Admin Settings','Admin Settings'),
(53,27,2,'Ejecutar Reporte','Ejecutar Reporte'),
(54,27,1,'Execute Report','Execute Report'),
(55,28,2,'Listar reportes','Listar reportes'),
(56,28,1,'List reports','List reports'),
(57,29,2,'Agregar reporte','Agregar reporte'),
(58,29,1,'Add report','Add report'),
(59,30,2,'Editar reporte','Editar reporte'),
(60,30,1,'Edit report','Edit report'),
(61,31,2,'Ver reporte','Ver reporte'),
(62,31,1,'View report','View report'),
(63,32,2,'Cambiar status reporte','Cambiar status reporte'),
(64,32,1,'Change report status','Change report status'),
(65,33,2,'Acciones Auditables','Acciones Auditables'),
(66,33,1,'Auditable Actions','Auditable Actions'),
(67,34,2,'Listar Auditoria','Listar Auditoria'),
(68,34,1,'List Audi','List Audi'),
(69,35,2,'Ver Transaccion','Ver Transaccion'),
(70,35,1,'View Transaction','View Transaction'),
(71,36,1,'View Commission','View Commission'),
(72,36,2,'Ver Comision','Ver Comision'),
(73,37,1,'Balance Adjustment','Balance Adjustment'),
(74,37,2,'Ajuste de Saldo','Ajuste de Saldo'),
(75,38,2,'Listar bancos','Listar bancos'),
(76,38,1,'List banks','List banks'),
(77,39,2,'Agregar banco','Agregar banco'),
(78,39,1,'Add bank','Add bank'),
(79,40,2,'Editar banco','Editar banco'),
(80,40,1,'Edit bank','Edit bank'),
(81,41,2,'Ver banco','Ver banco'),
(82,41,1,'View bank','View bank'),
(83,42,2,'Listar Monedas','Listar Monedas'),
(84,42,1,'List Currencies','List Currencies'),
(85,43,2,'Agregar Moneda','Agregar Moneda'),
(86,43,1,'Add Currency','Add Currency'),
(87,44,2,'Editar Moneda','Editar Moneda'),
(88,44,1,'Edit Currency','Edit Currency'),
(89,45,2,'Ver Moneda','Ver Moneda'),
(90,45,1,'View Currency','View Currency'),
(91,46,2,'Listar Tasa de Cambio','Listar Tasa de Cambio'),
(92,46,1,'List ExchangeRate','List ExchangeRate'),
(93,47,2,'Agregar Tasa de Cambio','Agregar Tasa de Cambio'),
(94,47,1,'Add ExchangeRate','Add ExchangeRate'),
(95,48,2,'Editar Tasa de Cambio','Editar Tasa de Cambio'),
(96,48,1,'Edit ExchangeRate','Edit ExchangeRate'),
(97,49,2,'Ver Tasa de Cambio','Ver Tasa de Cambio'),
(98,49,1,'View ExchangeRate','View ExchangeRate'),
(99,50,2,'Listar Operaciones por Banco','Listar Operqciones por Banco'),
(100,50,1,'List Operations by Bank','List Operations by Bank'),
(101,51,2,'Ver Operaciones por Banco','Ver Operaciones por Banco'),
(102,51,1,'View Operations by Bank','View Operations by Bank');

CREATE TABLE `alodigaWallet`.`permission_has_profile` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `permissionId` bigint(3) NOT NULL,
  `profileId` bigint(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_permission_has_profile_profile1` (`profileId`),
  KEY `fk_permission_has_profile_permission1` (`permissionId`),
  CONSTRAINT `fk_permission_has_profile_permission1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`),
  CONSTRAINT `fk_permission_has_profile_profile1` FOREIGN KEY (`profileId`) REFERENCES `profile` (`id`)
) ENGINE=InnoDB;

INSERT INTO `alodigaWallet`.`permission_has_profile` VALUES 
(1,1,1),
(2,2,1),
(3,3,1),
(4,4,1),
(5,5,1),
(6,6,1),
(7,7,1),
(8,8,1),
(9,9,1),
(10,10,1),
(11,11,1),
(12,12,1),
(13,13,1),
(14,14,1),
(15,15,1),
(16,16,1),
(17,17,1),
(18,18,1),
(19,19,1),
(20,20,1),
(21,21,1),
(22,22,1),
(23,23,1),
(24,24,1),
(25,25,1),
(26,26,1),
(27,27,1),
(28,28,1),
(29,29,1),
(30,30,1),
(31,31,1),
(32,32,1),
(33,33,1),
(34,34,1),
(35,35,1),
(36,36,1),
(37,37,1),
(38,38,1),
(39,39,1),
(40,40,1),
(41,41,1),
(42,42,1),
(43,43,1),
(44,44,1),
(45,45,1),
(46,46,1),
(47,47,1),
(48,48,1),
(49,49,1),
(50,50,1),
(51,51,1);

CREATE TABLE `alodigaWallet`.`event` (
  `id` int(3) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;


INSERT INTO `alodigaWallet`.`event` VALUES (1,'create','create'),
(2,'read','read'),
(3,'update','update'),
(4,'delete','delete'),
(5,'web_services_call','web_services_call');

CREATE TABLE `alodigaWallet`.`audit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `eventId` int(3) NOT NULL,
  `creationDate` datetime NOT NULL,
  `responsibleType` varchar(45) NOT NULL,
  `remoteIp` varchar(45) NOT NULL,
  `tableName` varchar(45) NOT NULL,
  `originalValues` text,
  `newValues` text,
  `extra` varchar(255) DEFAULT NULL,
  `userId` bigint(10) DEFAULT NULL,
  `permissionId` bigint(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_audit_user` (`userId`) /*!80000 INVISIBLE */,
  KEY `fk_audit_permission` (`permissionId`),
  KEY `fk_audit_event1` (`eventId`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_audit_event1` FOREIGN KEY (`eventId`) REFERENCES `event` (`id`),
  CONSTRAINT `fk_audit_permission` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`),
  CONSTRAINT `fk_audit_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB;


INSERT INTO `alodigaWallet`.`audit` VALUES (1,2,'2019-12-17 18:14:27','usuario','0:0:0:0:0:0:0:1','Product','Description:O´Ring|ActNpNsn:|BatchNumber:5346|UbicationBox:3|UbicationFolder:3|PartNumber:MS29513-139|Amount:30000.0','[serialVersionUID=1,enterprise=,stockMin=10,stockMax=15,amount=20000.0,inictialAmount=0.0,realAmount=0.0,enabled=true,category=,]',NULL,2,2);

CREATE TABLE `alodigaWallet`.`audit_action` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(3) DEFAULT NULL,
  `permissionId` bigint(3) DEFAULT NULL,
  `info` varchar(500) DEFAULT NULL,
  `date` datetime NOT NULL,
  `host` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_constraint_audit_action_user` (`userId`),
  KEY `fk_constraint_audit_action_permission` (`permissionId`),
  CONSTRAINT `fk_constraint_audit_action_permission` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`),
  CONSTRAINT `fk_constraint_audit_action_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB;


INSERT INTO `alodigaWallet`.`audit_action` VALUES (1,1,35,'listUsers.zul','2019-12-16 20:16:55','0:0:0:0:0:0:0:1'),
(2,1,35,'listUsers.zul','2019-12-16 20:17:43','0:0:0:0:0:0:0:1'),
(3,1,6,'listEnterprises.zul','2019-12-16 20:42:46','0:0:0:0:0:0:0:1');


CREATE TABLE `alodigaWallet`.`user_has_profile_has_enterprise` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `profileId` bigint(3) NOT NULL,
  `enterpriseId` bigint(3) NOT NULL,
  `userId` bigint(10) NOT NULL,
  `beginningDate` datetime NOT NULL,
  `endingDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_has_profile_has_enterprise_profile1` (`profileId`),
  KEY `fk_user_has_profile_has_enterprise_enterprise1` (`enterpriseId`),
  KEY `fk_user_has_profile_has_enterprise_user1` (`userId`),
  CONSTRAINT `fk_user_has_profile_has_enterprise_enterprise1` FOREIGN KEY (`enterpriseId`) REFERENCES `enterprise` (`id`),
  CONSTRAINT `fk_user_has_profile_has_enterprise_profile1` FOREIGN KEY (`profileId`) REFERENCES `profile` (`id`),
  CONSTRAINT `fk_user_has_profile_has_enterprise_user1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB;


INSERT INTO `alodigaWallet`.`user_has_profile_has_enterprise` VALUES (1,1,1,1,'2013-09-09 11:38:57',NULL);

-- Agregar permisos para las preferencias especificas
-- author: Yamelis Almea
-- Fecha: 20/07/2020
INSERT INTO `alodigaWallet`.`permission` VALUES (53,3,'ListPreferences','preference_value','List Preferences',1),
(54,2,'AddPreferences','preference_value','Add Preferences',1),
(55,2,'EditPreferences','preference_value','Edit Preferences',1),
(56,2,'ViewPreferences','preference_value','View Preferences',1),
(57,2,'ChangePreferencesStatus','preference_value','Change Preferences Status',1);

INSERT INTO `alodigaWallet`.`permission_data` VALUES (105,53,2,'Listar Perfiles','Listar Perfiles'),
(106,53,1,'List Preferences','List Preferences'),
(107,54,2,'Agregar Preferencias','Agregar Preferencias'),
(108,54,1,'Add Preferences','Add Preferences'),
(109,55,2,'Editar Preferencias','Editar Preferencias'),
(110,55,1,'Edit Preferences','Edit Preferences'),
(111,56,2,'Ver Perfil','Ver Preferencias'),
(112,56,1,'View Preferences','View Preferences'),
(113,57,2,'Cambiar status de Preferencias','Cambiar status de Preferencias'),
(114,57,1,'Change Preferences Status','Change Preferences Status');

INSERT INTO `alodigaWallet`.`permission_has_profile` VALUES (53,53,1),
(54,54,1),
(55,55,1),
(56,56,1),
(57,57,1);

-- Agregar opciones al menu de commission
-- author: Lulymar Gutierrez
-- Fecha: 20/07/2020
INSERT INTO `alodigaWallet`.`permission` (`permissionGroupId`, `action`, `entity`, `name`, `enabled`) 
VALUES ('1', 'ListCommission', 'Commission', 'ListCommission', '1');
INSERT INTO `alodigaWallet`.`permission` (`permissionGroupId`, `action`, `entity`, `name`, `enabled`) 
VALUES ('1', 'AddCommission', 'Commission', 'AddCommission', '1');
INSERT INTO `alodigaWallet`.`permission` (`permissionGroupId`, `action`, `entity`, `name`, `enabled`) 
VALUES ('1', 'EditCommission', 'Commission', 'EditCommission', '1');


INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) VALUES ('58', '1', 'Commission List', 'Commission List');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) VALUES ('58', '2', 'Lista de Comisiones', 'Lista de Comisiones');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) VALUES ('59', '1', 'Add Commission', 'Add Commission');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) VALUES ('59', '2', 'Agregar Commission', 'Agregar Commission');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) VALUES ('60', '1', 'Edit Commission', 'Edit Commission');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) VALUES ('60', '2', 'Editar Comision', 'Editar Comision');


INSERT INTO `alodigaWallet`.`permission_has_profile` (`id`, `permissionId`, `profileId`) VALUES ('58', '58', '1');
INSERT INTO `alodigaWallet`.`permission_has_profile` (`id`, `permissionId`, `profileId`) VALUES ('59','59', '1');
INSERT INTO `alodigaWallet`.`permission_has_profile` (`id`, `permissionId`, `profileId`) VALUES ('60','60', '1');



-- Agregar opciones al menu de Document Person Type
-- author: Lulymar Gutierrez
-- Fecha: 22/07/2020
INSERT INTO `alodigaWallet`.`permission` (`permissionGroupId`, `action`, `entity`, `name`, `enabled`) 
VALUES ('1', 'ListDocumentsPersonType', 'documents_person_type', 'ListDocumentsPersonType', '1');
INSERT INTO `alodigaWallet`.`permission` (`permissionGroupId`, `action`, `entity`, `name`, `enabled`) 
VALUES ('1', 'AddDocumentsPersonType', 'documents_person_type', 'AddDocumentsPersonType', '1');
INSERT INTO `alodigaWallet`.`permission` (`permissionGroupId`, `action`, `entity`, `name`, `enabled`) 
VALUES ('1', 'EditDocumentsPersonType', 'documents_person_type', 'EditDocumentsPersonType', '1');
INSERT INTO `alodigaWallet`.`permission` (`permissionGroupId`, `action`, `entity`, `name`, `enabled`) 
VALUES ('1', 'ViewDocumentsPersonType', 'documents_person_type', 'ViewDocumentsPersonType', '1');


INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('61', '1', 'List Documents Person Type', 'List Documents Person Type');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('61', '2', 'Lista de Documetos por Tipo de Persona', 'Lista de Documetos por Tipo de Persona');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('62', '1', 'Add Documents Person Type', 'Add Documents Person Type');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('62', '2', 'Agregar Documetos por Tipo de Persona', 'Agregar Documetos por Tipo de Persona');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('63', '1', 'Edit Documents Person Type', 'Edit Documents Person Type');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('63', '2', 'Editar Documetos por Tipo de Persona', 'Editar Documetos por Tipo de Persona');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('64', '1', 'View Documents Person Type', 'View Documents Person Type');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('64', '2', 'Ver Documetos por Tipo de Persona', 'Ver Documetos por Tipo de Persona');


INSERT INTO `alodigaWallet`.`permission_has_profile` (`permissionId`, `profileId`) VALUES ('61', '1');
INSERT INTO `alodigaWallet`.`permission_has_profile` (`permissionId`, `profileId`) VALUES ('62', '1');
INSERT INTO `alodigaWallet`.`permission_has_profile` (`permissionId`, `profileId`) VALUES ('63', '1');
INSERT INTO `alodigaWallet`.`permission_has_profile` (`permissionId`, `profileId`) VALUES ('64', '1');






-- Agregar opciones del menu Categorias de Comercio y Sub Categorias de Comercio
-- author: Lulymar Gutierrez
-- Fecha: 23/07/2020
INSERT INTO `alodigaWallet`.`permission` (`id`, `permissionGroupId`, `action`, `entity`, `name`, `enabled`) 
VALUES ('65', '1', 'ListBusinnesCategory', 'businnes_category', 'ListBusinnesCategory', '1');
INSERT INTO `alodigaWallet`.`permission` (`id`, `permissionGroupId`, `action`, `entity`, `name`, `enabled`) 
VALUES ('66', '1', 'AddBusinnesCategory', 'businnes_category', 'AddBusinnesCategory', '1');
INSERT INTO `alodigaWallet`.`permission` (`id`, `permissionGroupId`, `action`, `entity`, `name`, `enabled`) 
VALUES ('67', '1', 'EditBusinnesCategory', 'businnes_category', 'EditBusinnesCategory', '1');
INSERT INTO `alodigaWallet`.`permission` (`id`, `permissionGroupId`, `action`, `entity`, `name`, `enabled`) 
VALUES ('68', '1', 'ViewBusinnesCategory', 'businnes_category', 'ViewBusinnesCategory', '1');
INSERT INTO `alodigaWallet`.`permission` (`id`, `permissionGroupId`, `action`, `entity`, `name`, `enabled`) 
VALUES ('69', '1', 'ListBusinnesSubCategory', 'businnes_sub_category', 'ListBusinnesSubCategory', '1');
INSERT INTO `alodigaWallet`.`permission` (`id`, `permissionGroupId`, `action`, `entity`, `name`, `enabled`) 
VALUES ('70', '1', 'AddtBusinnesSubCategory', 'businnes_sub_category', 'AddtBusinnesSubCategory', '1');
INSERT INTO `alodigaWallet`.`permission` (`id`, `permissionGroupId`, `action`, `entity`, `name`, `enabled`) 
VALUES ('71', '1', 'EditBusinnesSubCategory', 'businnes_sub_category', 'EditBusinnesSubCategory', '1');
INSERT INTO `alodigaWallet`.`permission` (`id`, `permissionGroupId`, `action`, `entity`, `name`, `enabled`) 
VALUES ('72', '1', 'ViewBusinnesSubCategory', 'businnes_sub_category', 'ViewBusinnesSubCategory', '1');



INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('65', '1', 'List Businnes Category', 'List Businnes Category');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('65', '2', 'Listar Categorias de Comercio', 'Listar Categorias de Comercio');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('66', '1', 'Add Businnes Category', 'Add Businnes Category');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('66', '2', 'Agregar Categorias de Comercio', 'Agregar Categorias de Comercio');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('67', '1', 'Edit Businnes Category', 'Edit Businnes Category');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('67', '2', 'Editar Categorias de Comercio', 'Editar Categorias de Comercio');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('68', '1', 'View Businnes Category', 'View Businnes Category');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('68', '2', 'Ver Categorias de Comercio', 'Ver Categorias de Comercio');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('69', '1', 'List Businnes Sub Category', 'List Businnes Sub Category');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('69', '2', 'Listar Sub Categorias de Comercio', 'Listar Sub Categorias de Comercio');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('70', '1', 'Add Businnes Sub Category', 'Add Businnes Sub Category');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('70', '2', 'Agregar Sub Categorias de Comercio', 'Agregar Sub Categorias de Comercio');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('71', '1', 'Edit Businnes Sub Category', 'Edit Businnes Sub Category');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('71', '2', 'Editar Sub Categorias de Comercio', 'Editar Sub Categorias de Comercio');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('72', '1', 'View Businnes Sub Category', 'View Businnes Sub Category');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('72', '2', 'Ver Sub Categorias de Comercio', 'Ver Sub Categorias de Comercio');


INSERT INTO `alodigaWallet`.`permission_has_profile` (`permissionId`, `profileId`) VALUES ('65', '1');
INSERT INTO `alodigaWallet`.`permission_has_profile` (`permissionId`, `profileId`) VALUES ('66', '1');
INSERT INTO `alodigaWallet`.`permission_has_profile` (`permissionId`, `profileId`) VALUES ('67', '1');
INSERT INTO `alodigaWallet`.`permission_has_profile` (`permissionId`, `profileId`) VALUES ('68', '1');
INSERT INTO `alodigaWallet`.`permission_has_profile` (`permissionId`, `profileId`) VALUES ('69', '1');
INSERT INTO `alodigaWallet`.`permission_has_profile` (`permissionId`, `profileId`) VALUES ('70', '1');
INSERT INTO `alodigaWallet`.`permission_has_profile` (`permissionId`, `profileId`) VALUES ('71', '1');
INSERT INTO `alodigaWallet`.`permission_has_profile` (`permissionId`, `profileId`) VALUES ('72', '1');

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
INSERT INTO `alodigaWallet`.`collection_type` (`id`, `description`, `countryId`) VALUES ('12', 'CONSTANCIA DE DOMICILIO RESIDENCIAL', '1');
INSERT INTO `alodigaWallet`.`collection_type` (`id`, `description`, `countryId`) VALUES ('13', 'CONSTANCIA DE NACIMIENTO', '1');
INSERT INTO `alodigaWallet`.`collection_type` (`id`, `description`, `countryId`) VALUES ('14', 'ANTECEDENTES PENALES', '1');
INSERT INTO `alodigaWallet`.`collection_type` (`id`, `description`, `countryId`) VALUES ('15', 'CONSTANCIA DE RESIDENCIA', '2');
INSERT INTO `alodigaWallet`.`collection_type` (`id`, `description`, `countryId`) VALUES ('16', 'CEDULA EXTRANJEROS', '1');
INSERT INTO `alodigaWallet`.`collection_type` (`id`, `description`, `countryId`) VALUES ('17', 'REGISTRO DE INFORMACION FISCAL GOBIERNO', '1');



-- Agregar opciones del menu Aprobación Retiro Manual
-- author: Lulymar Gutierrez
-- Fecha: 23/07/2020
INSERT INTO `permission` (`id`,`permissionGroupId`,`action`,`entity`,`name`,`enabled`)
VALUES (77,1,'ListManualWithdrawalApproval','transaction_approve_request','ListManualWithdrawalApproval',1);
INSERT INTO `permission` (`id`,`permissionGroupId`,`action`,`entity`,`name`,`enabled`)
VALUES (78,1,'AddManualWithdrawalApproval','transaction_approve_request','AddManualWithdrawalApproval',1);
INSERT INTO `permission` (`id`,`permissionGroupId`,`action`,`entity`,`name`,`enabled`)
VALUES (79,1,'EditManualWithdrawalApproval','transaction_approve_request','EditManualWithdrawalApproval',1);
INSERT INTO `permission` (`id`,`permissionGroupId`,`action`,`entity`,`name`,`enabled`)
VALUES (80,1,'ViewManualWithdrawalApproval','transaction_approve_request','ViewManualWithdrawalApproval',1);

INSERT INTO `permission_data` (`id`,`permissionId`,`languageId`,`alias`,`description`) 
VALUES (153,77,1,'List Manual Withdrawal Approval','List Manual Withdrawal Approval');
INSERT INTO `permission_data` (`id`,`permissionId`,`languageId`,`alias`,`description`) 
VALUES (154,77,2,'Lista Aprobación Retiro Manual','Lista Aprobación Retiro Manual');
INSERT INTO `permission_data` (`id`,`permissionId`,`languageId`,`alias`,`description`) 
VALUES (155,78,1,'Add Manual Withdrawal Approval','Add Manual Withdrawal Approval');
INSERT INTO `permission_data` (`id`,`permissionId`,`languageId`,`alias`,`description`) 
VALUES (156,78,2,'Agregar Aprobación Retiro Manual','Agregar Aprobación Retiro Manual');
INSERT INTO `permission_data` (`id`,`permissionId`,`languageId`,`alias`,`description`) 
VALUES (157,79,1,'Edit Manual Withdrawal Approval','Edit Manual Withdrawal Approval');
INSERT INTO `permission_data` (`id`,`permissionId`,`languageId`,`alias`,`description`) 
VALUES (158,79,2,'Editar Aprobación Retiro Manual','Editar Aprobación Retiro Manual');
INSERT INTO `permission_data` (`id`,`permissionId`,`languageId`,`alias`,`description`) 
VALUES (159,80,1,'View Manual Withdrawal Approval','View Manual Withdrawal Approval');
INSERT INTO `permission_data` (`id`,`permissionId`,`languageId`,`alias`,`description`) 
VALUES (160,80,2,'Ver Aprobación Retiro Manual','Ver Aprobación Retiro Manual');

INSERT INTO `permission_has_profile` (`id`,`permissionId`,`profileId`) VALUES (77,77,1);
INSERT INTO `permission_has_profile` (`id`,`permissionId`,`profileId`) VALUES (78,78,1);
INSERT INTO `permission_has_profile` (`id`,`permissionId`,`profileId`) VALUES (79,79,1);
INSERT INTO `permission_has_profile` (`id`,`permissionId`,`profileId`) VALUES (80,80,1);


--Permisos para Recarga Manual
-- author: yamelis Almea
-- Fecha: 30/07/2020

INSERT INTO `alodigaWallet`.`permission` (`id`, `permissionGroupId`, `action`, `entity`, `name`, `enabled`) VALUES ('81', '1', 'ListManualRechargesApproval', 'transaction_approve_request', 'ListManualRechargesApproval', '1');
INSERT INTO `alodigaWallet`.`permission` (`id`, `permissionGroupId`, `action`, `entity`, `name`, `enabled`) VALUES ('82', '1', 'AddManualRechargesApproval', 'transaction_approve_request', 'AddManualRechargesApprovalt', '1');
INSERT INTO `alodigaWallet`.`permission` (`id`, `permissionGroupId`, `action`, `entity`, `name`, `enabled`) VALUES ('83', '1', 'EditManualRechargesApproval', 'transaction_approve_request', 'EditManualRechargesApprovalt', '1');
INSERT INTO `alodigaWallet`.`permission` (`id`, `permissionGroupId`, `action`, `entity`, `name`, `enabled`) VALUES ('84', '1', 'ViewManualRechargesApproval', 'transaction_approve_request', 'ViewManualRechargesApproval', '1');


INSERT INTO `alodigaWallet`.`permission_data` (`id`, `permissionId`, `languageId`, `alias`, `description`) VALUES ('161', '81', '1', 'List Manual Recharges Approval', 'List Manual Recharges Approval');
INSERT INTO `alodigaWallet`.`permission_data` (`id`, `permissionId`, `languageId`, `alias`, `description`) VALUES ('162', '81', '2', 'Listar Aprobaciones de Recarga Manual', 'Listar Aprobaciones de Recarga Manual');
INSERT INTO `alodigaWallet`.`permission_data` (`id`, `permissionId`, `languageId`, `alias`, `description`) VALUES ('163', '82', '1', 'Add Manual Recharges Approval', 'Add Manual Recharges Approval');
INSERT INTO `alodigaWallet`.`permission_data` (`id`, `permissionId`, `languageId`, `alias`, `description`) VALUES ('164', '82', '2', 'Agregar Aprobaciones de Recarga Manual', 'Agregar Aprobaciones de Recarga Manual');
INSERT INTO `alodigaWallet`.`permission_data` (`id`, `permissionId`, `languageId`, `alias`, `description`) VALUES ('165', '83', '1', 'Edit Manual Recharges Approval', 'Edit Manual Recharges Approval');
INSERT INTO `alodigaWallet`.`permission_data` (`id`, `permissionId`, `languageId`, `alias`, `description`) VALUES ('166', '83', '2', 'Editar Aprobaciones de Recarga Manual', 'Editar Aprobaciones de Recarga Manual');
INSERT INTO `alodigaWallet`.`permission_data` (`id`, `permissionId`, `languageId`, `alias`, `description`) VALUES ('167', '84', '1', 'View Manual Recharges Approval', 'View Manual Recharges Approval');
INSERT INTO `alodigaWallet`.`permission_data` (`id`, `permissionId`, `languageId`, `alias`, `description`) VALUES ('168', '84', '2', 'Ver Aprobaciones de Recarga Manual', 'Ver Aprobaciones de Recarga Manual');

INSERT INTO `alodigaWallet`.`permission_has_profile` (`id`, `permissionId`, `profileId`) VALUES ('81', '81', '1');
INSERT INTO `alodigaWallet`.`permission_has_profile` (`id`, `permissionId`, `profileId`) VALUES ('82', '82', '1');
INSERT INTO `alodigaWallet`.`permission_has_profile` (`id`, `permissionId`, `profileId`) VALUES ('83', '83', '1');
INSERT INTO `alodigaWallet`.`permission_has_profile` (`id`, `permissionId`, `profileId`) VALUES ('84', '84', '1');

--Grupo Manejo Transaccional
INSERT INTO `alodigawallet`.`permission_group` (`id`, `name`, `enabled`) VALUES ('5', 'Transacional Management', '1');

INSERT INTO `alodigawallet`.`permission_group_data` (`id`, `permissionGroupId`, `languageId`, `alias`, `description`) VALUES ('9', '5', '1', 'Transactional Management', 'Transactional Management');
INSERT INTO `alodigawallet`.`permission_group_data` (`id`, `permissionGroupId`, `languageId`, `alias`, `description`) VALUES ('10', '5', '2', 'Gestion Transactional', 'Gestion Transactional');

UPDATE `alodigawallet`.`permission` SET `permissionGroupId` = '5' WHERE (`id` = '77');
UPDATE `alodigawallet`.`permission` SET `permissionGroupId` = '5' WHERE (`id` = '78');
UPDATE `alodigawallet`.`permission` SET `permissionGroupId` = '5' WHERE (`id` = '79');
UPDATE `alodigawallet`.`permission` SET `permissionGroupId` = '5' WHERE (`id` = '80');
UPDATE `alodigawallet`.`permission` SET `permissionGroupId` = '5' WHERE (`id` = '81');
UPDATE `alodigawallet`.`permission` SET `permissionGroupId` = '5' WHERE (`id` = '82');
UPDATE `alodigawallet`.`permission` SET `permissionGroupId` = '5' WHERE (`id` = '83');
UPDATE `alodigawallet`.`permission` SET `permissionGroupId` = '5' WHERE (`id` = '84');
UPDATE `alodigawallet`.`permission` SET `permissionGroupId` = '5' WHERE (`id` = '52');
UPDATE `alodigawallet`.`permission` SET `permissionGroupId` = '5' WHERE (`id` = '35');
UPDATE `alodigawallet`.`permission` SET `permissionGroupId` = '5' WHERE (`id` = '36');
UPDATE `alodigawallet`.`permission` SET `permissionGroupId` = '5' WHERE (`id` = '50');
UPDATE `alodigawallet`.`permission` SET `permissionGroupId` = '5' WHERE (`id` = '51');
UPDATE `alodigawallet`.`permission` SET `permissionGroupId` = '5' WHERE (`id` = '58');
UPDATE `alodigawallet`.`permission` SET `permissionGroupId` = '5' WHERE (`id` = '59');
UPDATE `alodigawallet`.`permission` SET `permissionGroupId` = '5' WHERE (`id` = '60');

--Modificar la descripcion de las preferencias especificas en el menu
UPDATE `alodigawallet`.`permission_data` SET `alias` = 'Listar Preferencias Especificas', `description` = 'Listar Preferencias Especificas' WHERE (`id` = '105');
UPDATE `alodigawallet`.`permission_data` SET `alias` = 'List Specifics Preferences', `description` = 'List Specifics Preferences' WHERE (`id` = '106');



-- Agregar opciones del menu Aprobación Retiro Manual
-- author: Lulymar Gutierrez
-- Fecha: 23/07/2020
INSERT INTO `permission` (`id`,`permissionGroupId`,`action`,`entity`,`name`,`enabled`)
VALUES (77,1,'ListManualWithdrawalApproval','transaction_approve_request','ListManualWithdrawalApproval',1);
INSERT INTO `permission` (`id`,`permissionGroupId`,`action`,`entity`,`name`,`enabled`)
VALUES (78,1,'AddManualWithdrawalApproval','transaction_approve_request','AddManualWithdrawalApproval',1);
INSERT INTO `permission` (`id`,`permissionGroupId`,`action`,`entity`,`name`,`enabled`)
VALUES (79,1,'EditManualWithdrawalApproval','transaction_approve_request','EditManualWithdrawalApproval',1);
INSERT INTO `permission` (`id`,`permissionGroupId`,`action`,`entity`,`name`,`enabled`)
VALUES (80,1,'ViewManualWithdrawalApproval','transaction_approve_request','ViewManualWithdrawalApproval',1);

INSERT INTO `permission_data` (`id`,`permissionId`,`languageId`,`alias`,`description`) 
VALUES (153,77,1,'List Manual Withdrawal Approval','List Manual Withdrawal Approval');
INSERT INTO `permission_data` (`id`,`permissionId`,`languageId`,`alias`,`description`) 
VALUES (154,77,2,'Lista Aprobación Retiro Manual','Lista Aprobación Retiro Manual');
INSERT INTO `permission_data` (`id`,`permissionId`,`languageId`,`alias`,`description`) 
VALUES (155,78,1,'Add Manual Withdrawal Approval','Add Manual Withdrawal Approval');
INSERT INTO `permission_data` (`id`,`permissionId`,`languageId`,`alias`,`description`) 
VALUES (156,78,2,'Agregar Aprobación Retiro Manual','Agregar Aprobación Retiro Manual');
INSERT INTO `permission_data` (`id`,`permissionId`,`languageId`,`alias`,`description`) 
VALUES (157,79,1,'Edit Manual Withdrawal Approval','Edit Manual Withdrawal Approval');
INSERT INTO `permission_data` (`id`,`permissionId`,`languageId`,`alias`,`description`) 
VALUES (158,79,2,'Editar Aprobación Retiro Manual','Editar Aprobación Retiro Manual');
INSERT INTO `permission_data` (`id`,`permissionId`,`languageId`,`alias`,`description`) 
VALUES (159,80,1,'View Manual Withdrawal Approval','View Manual Withdrawal Approval');
INSERT INTO `permission_data` (`id`,`permissionId`,`languageId`,`alias`,`description`) 
VALUES (160,80,2,'Ver Aprobación Retiro Manual','Ver Aprobación Retiro Manual');

INSERT INTO `permission_has_profile` (`id`,`permissionId`,`profileId`) VALUES (77,77,1);
INSERT INTO `permission_has_profile` (`id`,`permissionId`,`profileId`) VALUES (78,78,1);
INSERT INTO `permission_has_profile` (`id`,`permissionId`,`profileId`) VALUES (79,79,1);
INSERT INTO `permission_has_profile` (`id`,`permissionId`,`profileId`) VALUES (80,80,1);



-- Agregar opciones del menu Recaudos de Solicitud
-- author: Lulymar Gutierrez
-- Fecha: 3/08/2020
INSERT INTO `permission` (`id`,`permissionGroupId`,`action`,`entity`,`name`,`enabled`) 
VALUES (85,1,'ListCollectionsRequest','collections_request','ListCollectionsRequest',1);
INSERT INTO `permission` (`id`,`permissionGroupId`,`action`,`entity`,`name`,`enabled`) 
VALUES (86,1,'AddCollectionsRequest','collections_request','AddCollectionsRequest',1);
INSERT INTO `permission` (`id`,`permissionGroupId`,`action`,`entity`,`name`,`enabled`) 
VALUES (87,1,'EditCollectionsRequest','collections_request','EditCollectionsRequest',1);
INSERT INTO `permission` (`id`,`permissionGroupId`,`action`,`entity`,`name`,`enabled`) 
VALUES (88,1,'ViewCollectionsRequest','collections_request','ViewCollectionsRequest',1);


INSERT INTO `permission_data` (`id`,`permissionId`,`languageId`,`alias`,`description`) 
VALUES (169,85,1,'List Collections Request','List Collections Request');
INSERT INTO `permission_data` (`id`,`permissionId`,`languageId`,`alias`,`description`) 
VALUES (170,85,2,'Lista Recaudos de Solicitud','Lista Recaudos de Solicitud');
INSERT INTO `permission_data` (`id`,`permissionId`,`languageId`,`alias`,`description`) 
VALUES (171,86,1,'Add Collections Request','Add Collections Request');
INSERT INTO `permission_data` (`id`,`permissionId`,`languageId`,`alias`,`description`) 
VALUES (172,86,2,'Agregar Recaudos de Solicitud','Agregar Recaudos de Solicitud');
INSERT INTO `permission_data` (`id`,`permissionId`,`languageId`,`alias`,`description`) 
VALUES (173,87,1,'Edit Collections Request','Edit Collections Request');
INSERT INTO `permission_data` (`id`,`permissionId`,`languageId`,`alias`,`description`) 
VALUES (174,87,2,'Editar Recaudos de Solicitud','Editar Recaudos de Solicitud');
INSERT INTO `permission_data` (`id`,`permissionId`,`languageId`,`alias`,`description`) 
VALUES (175,88,1,'View Collections Request','View Collections Request');
INSERT INTO `permission_data` (`id`,`permissionId`,`languageId`,`alias`,`description`) 
VALUES (176,88,2,'Ver Recaudos de Solicitud','Ver Recaudos de Solicitud');


INSERT INTO `permission_has_profile` (`id`,`permissionId`,`profileId`) VALUES (85,85,1);
INSERT INTO `permission_has_profile` (`id`,`permissionId`,`profileId`) VALUES (86,86,1);
INSERT INTO `permission_has_profile` (`id`,`permissionId`,`profileId`) VALUES (87,87,1);
INSERT INTO `permission_has_profile` (`id`,`permissionId`,`profileId`) VALUES (88,88,1);


-- Agregar opciones del menu Solicitudes de Afiliacion
-- author: Lulymar Gutierrez
-- Fecha: 4/08/2020
INSERT INTO `alodigaWallet`.`permission` (`permissionGroupId`, `action`, `entity`, `name`, `enabled`) 
VALUES ('1', 'ListBusinessAffiliationRequests', 'business_affiliation_requests', 'ListBusinessAffiliationRequests', '1');
INSERT INTO `alodigaWallet`.`permission` (`permissionGroupId`, `action`, `entity`, `name`, `enabled`) 
VALUES ('1', 'AddBusinessAffiliationRequests', 'business_affiliation_requests', 'AddBusinessAffiliationRequests', '1');
INSERT INTO `alodigaWallet`.`permission` (`permissionGroupId`, `action`, `entity`, `name`, `enabled`) 
VALUES ('1', 'EditBusinessAffiliationRequests', 'business_affiliation_requests', 'EditBusinessAffiliationRequests', '1');
INSERT INTO `alodigaWallet`.`permission` (`permissionGroupId`, `action`, `entity`, `name`, `enabled`) 
VALUES ('1', 'ViewBusinessAffiliationRequests', 'business_affiliation_requests', 'ViewBusinessAffiliationRequests', '1');


INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('89', '1', 'List Business Affiliation Requests', 'List Business Affiliation Requests');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('89', '2', 'Lista de Solicitudes de Afiliacion', 'Lista de Solicitudes de Afiliacion');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('90', '1', 'Add Business Affiliation Requests', 'Add Business Affiliation Requests');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('90', '2', 'Agregar Solicitudes de Afiliacion', 'Agregar Solicitudes de Afiliacion');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('91', '1', 'Edit Business Affiliation Requests', 'Edit Business Affiliation Requests');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('91', '2', 'Editar Solicitudes de Afiliacion', 'Editar Solicitudes de Afiliacion');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('92', '1', 'View Business Affiliation Requests', 'View Business Affiliation Requests');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) 
VALUES ('92', '2', 'Ver Solicitudes de Afiliacion', 'Ver Solicitudes de Afiliacion');


INSERT INTO `alodigaWallet`.`permission_has_profile` (`permissionId`, `profileId`) VALUES ('89', '1');
INSERT INTO `alodigaWallet`.`permission_has_profile` (`permissionId`, `profileId`) VALUES ('90', '1');
INSERT INTO `alodigaWallet`.`permission_has_profile` (`permissionId`, `profileId`) VALUES ('91', '1');
INSERT INTO `alodigaWallet`.`permission_has_profile` (`permissionId`, `profileId`) VALUES ('92', '1');



-- Agregar opciones del menu de direcciones
-- author: Lulymar Gutierrez
-- Fecha: 6/08/2020
INSERT INTO `alodigaWallet`.`permission` (`id`, `permissionGroupId`, `action`, `entity`, `name`, `enabled`) VALUES ('93', '1', 'ListAddress', 'address', 'ListAddress', '1');
INSERT INTO `alodigaWallet`.`permission` (`id`, `permissionGroupId`, `action`, `entity`, `name`, `enabled`) VALUES ('94', '1', 'AddAddress', 'address', 'AddAddress', '1');
INSERT INTO `alodigaWallet`.`permission` (`id`, `permissionGroupId`, `action`, `entity`, `name`, `enabled`) VALUES ('95', '1', 'EditAddress', 'address', 'EditAddress', '1');
INSERT INTO `alodigaWallet`.`permission` (`id`, `permissionGroupId`, `action`, `entity`, `name`, `enabled`) VALUES ('96', '1', 'ViewAddress', 'address', 'ViewAddress', '1');

INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) VALUES ('93', '1', 'List Address', 'List Address');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) VALUES ('93', '2', 'Lista de Direcciones', 'Lista de Direcciones');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) VALUES ('94', '1', 'Add Address', 'Add Address');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) VALUES ('94', '2', 'Agregar Direccion', 'Agregar Direccion');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) VALUES ('95', '1', 'Edit Address', 'Edit Address');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) VALUES ('95', '2', 'Editar Direccion', 'Editar Direccion');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) VALUES ('96', '1', 'View Address', 'View Address');
INSERT INTO `alodigaWallet`.`permission_data` (`permissionId`, `languageId`, `alias`, `description`) VALUES ('96', '2', 'Ver Direccion', 'Ver Direccion');


INSERT INTO `alodigaWallet`.`permission_has_profile` (`id`, `permissionId`, `profileId`) VALUES ('93', '93', '1');
INSERT INTO `alodigaWallet`.`permission_has_profile` (`id`, `permissionId`, `profileId`) VALUES ('94', '94', '1');
INSERT INTO `alodigaWallet`.`permission_has_profile` (`id`, `permissionId`, `profileId`) VALUES ('95', '95', '1');
INSERT INTO `alodigaWallet`.`permission_has_profile` (`id`, `permissionId`, `profileId`) VALUES ('96', '96', '1');

