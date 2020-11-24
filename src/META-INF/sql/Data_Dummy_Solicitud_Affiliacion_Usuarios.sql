use alodigaWallet;
DROP PROCEDURE IF EXISTS dataAfiliacionUsuarios;
DELIMITER $$
CREATE PROCEDURE dataAfiliacionUsuarios()
BEGIN
    
    DECLARE countryId int;
    DECLARE personTypeId int;
    DECLARE personId int;
    DECLARE personClassificationId int;
    DECLARE documentsPersonTypeId int;
    DECLARE languageId int;
    DECLARE civilStatusId int;
    DECLARE professionId int;
    DECLARE statusApplicantId int;
    DECLARE stateId int;
    DECLARE streetTypeId int;
    DECLARE statusRequest int;
    DECLARE requestType int;
    DECLARE cityId int;
    DECLARE addressId int;
    DECLARE addressTypeId int;
    DECLARE edificationTypeId int;
    DECLARE personHasAddres int;
    DECLARE affiliationRequestId int;
    DECLARE phoneTypeId int;
    DECLARE collectionsRequestId int;
    DECLARE collectionTypeIdenti int;
    DECLARE collectionTypeConstant int;
    DECLARE requestHasCollectionId int;
    DECLARE existPersonType int;
    DECLARE existClassification int;
    DECLARE existPerson int;
    DECLARE existPersonHasAddres int;
    DECLARE existDocumentPersonType int;
    DECLARE existCivilStatus int;
    DECLARE exitAffiliationRequest int;
    DECLARE existCollectionsRequest int;
    DECLARE existRequestHasCollection int;
    

	-- Solicitante Ana Perez
    /* Verificar el tipo de persona */
	SELECT COUNT(*) INTO existPersonType FROM alodigaWallet.person_type where countryId = 1 AND originApplicationId = 1  AND indNaturalPerson = 1;
    select existPersonType;
    IF existPersonType > 0 THEN
		SELECT id INTO personTypeId FROM alodigaWallet.person_type where countryId = 1 AND originApplicationId = 1  AND indNaturalPerson = 1;
	ELSE 
		INSERT INTO `alodigaWallet`.`person_type` 
		(`description`, `countryId`, `originApplicationId`, `indNaturalPerson`) 
		VALUES ('Persona Natural',  '1', '1', '1');
        SELECT MAX(p.id) INTO personTypeId FROM `alodigaWallet`.`person_type` p;
    END IF;
    
    /* Verificar la classificación de la persona */
    SELECT COUNT(*) INTO existClassification FROM alodigaWallet.person_classification where code = "REUNUS";
	select existClassification;
    IF existClassification > 0 THEN
    SELECT id INTO personClassificationId FROM alodigaWallet.person_classification where code = "REUNUS";
	ELSE 
		INSERT INTO `alodigaWallet`.`person_classification` 
		(`description`, `code`) 
		VALUES ('Register Unified User',  'REUNUS');
        SELECT MAX(p.id) INTO personClassificationId FROM `alodigaWallet`.`person_classification` p;
    END IF;
    
    /* Guardar el país */
    SELECT id INTO countryId FROM alodigaWallet.country where name = "VENEZUELA";
	select countryId;
   /* Guardar el Estado*/
    SELECT MAX(s.id) INTO stateId FROM `alodigaWallet`.`state` s where countryId = countryId AND name = "DISTRITO CAPITAL";
	IF stateId > 0 THEN
		SET stateId = 0;
		SELECT MAX(s.id) INTO stateId FROM `alodigaWallet`.`state` s where countryId = countryId AND name = "DISTRITO CAPITAL";
    ELSE
		SET stateId = 0;
		INSERT INTO `alodigaWallet`.`state` 
		(`countryId`, `name`) 
		VALUES (countryId,  'DISTRITO CAPITAL');
        SELECT MAX(s.id) INTO stateId FROM `alodigaWallet`.`state` s where countryId = countryId AND name = "DISTRITO CAPITAL";
    END IF;
	
    /* Guardar la Ciudad */
    SELECT MAX(c.id) INTO cityId FROM `alodigaWallet`.`city` c where stateId = stateId AND name = "Caracas";
    IF  cityId > 0 THEN
		SET cityId = 0;
        SELECT MAX(c.id) INTO cityId FROM `alodigaWallet`.`city` c where stateId = stateId AND name = "Caracas";
    ELSE    
		SET cityId = 0;
        INSERT INTO `alodigaWallet`.`city` 
		(`stateId`, `name`) 
		VALUES (stateId,  'DISTRITO CAPITAL');
        SELECT MAX(c.id) INTO cityId FROM `alodigaWallet`.`city` c where stateId = stateId AND name = "Caracas";
    END IF;

    /* Tipo de calle */
    SELECT MAX(s.id) INTO streetTypeId FROM `alodigaWallet`.`street_type` s where description = "Avenida" AND code = "AVENID";
    
    /* Tipo de Edificación */
    SELECT MAX(e.id) INTO edificationTypeId FROM `alodigaWallet`.`edification_type` e where description = "Edificio" AND code = "EDIFIC";
    
    /* Tipo de Direccion */
    SELECT MAX(a.id) INTO addressTypeId FROM `alodigaWallet`.`address_type` a where description = "Habitación" AND code = "HABITA";
    
    /* Agregar el nuevo person */
    INSERT INTO `alodigaWallet`.`person` 
		(`email`, `personTypeId`, `personClassificationId`, `countryId`, `createDate`) 
		VALUES ('anaperez@gmail.com', personTypeId, personClassificationId, countryId,'2020-10-03 10:20:00');
    SELECT MAX(p.id) INTO personId FROM `alodigaWallet`.`person` p;
    
    /* Asociar el telefono de la persona */
    SELECT MAX(p.id) INTO phoneTypeId  FROM `alodigaWallet`.`phone_type` p where description = "Movil";
    
    INSERT INTO `alodigaWallet`.`phone_person` 
		(`countryId`, `countryCode`, `areaCode`, `numberPhone`, `personId`, `phoneTypeId`, `indMainPhone`, `createDate`) 
		VALUES (countryId, '58', '414', '2063128', personId, phoneTypeId, '1', '2020-10-03 10:20:00');
    
    
    /* Agregar el address de la persona */
    INSERT INTO `alodigaWallet`.`address` 
		(`countryId`, `cityId`, `zipCode`, `streetTypeId`, `nameStreet`, `edificationTypeId`, `nameEdification`, `tower`, `floor`,
        `urbanization`, `addressLine1`, `addressLine2`, `addressTypeId`, `indMainAddress`) 
		VALUES (countryId, cityId, '1060', streetTypeId, 'Calle Los Ángeles', edificationTypeId, 'Edificio Los Ángeles','1', '1', 
        'Ubanizacion el Dorado','Calle los Angeles, edificio Los Angeles Lateral al Edificio Monte Alegre', 
        'Calle los Angeles edificio Los Angeles, Lateral al centro comercial El Sambil', 
        addressTypeId , '1');
	SELECT MAX(a.id) INTO addressId  FROM `alodigaWallet`.`address` a;
    
	/* Agregar person has addres */
	INSERT INTO `alodigaWallet`.`person_has_address` 
	(`personId`, `addressId`, `createDate`, `updateDate`) 
	VALUES (personId, addressId,'2020-10-03 10:20:00', '2020-10-08 10:20:00' );

    /* Verificar Document Person Type  */
    SELECT COUNT(*) INTO existDocumentPersonType FROM alodigaWallet.documents_person_type where description ="Cedula de Identidad Venezolano" AND personTypeId = personTypeId;
    IF existDocumentPersonType > 0 THEN
		SELECT id INTO documentsPersonTypeId FROM alodigaWallet.documents_person_type where description = "Cedula de Identidad Venezolano" AND personTypeId = personTypeId AND codeIdentification = "CI";
	ELSE 
		INSERT INTO `alodigaWallet`.`documents_person_type` 
		(`description`, `personTypeId`, `codeIdentification`) 
		VALUES ('Cedula de Identidad Venezolano', personTypeId, 'CI');
        SELECT MAX(d.id) INTO documentsPersonTypeId FROM `alodigaWallet`.`documents_person_type` d;
    END IF;
    
    /* Guardar el idLanguage */
	SELECT id INTO languageId FROM alodigaWallet.language where iso = "es" and description="SPANISH" AND enabled = '1';
    
    /* Verificar el estado civil del solicitante  */
    SELECT COUNT(*) INTO existCivilStatus FROM alodigaWallet.civil_status where description ="Soltero" AND languageId = languageId;
    IF existCivilStatus > 0 THEN
		SELECT id INTO civilStatusId FROM alodigaWallet.civil_status where description ="Soltero" AND personTypeId = personTypeId;
    ELSE 
		INSERT INTO `alodigaWallet`.`civil_status` 
		(`description`, `languageId`) 
		VALUES ('Soltero', languageId);
        SELECT MAX(c.id) INTO civilStatusId FROM `alodigaWallet`.`civil_status` c;
    END IF;
    
    /* Guardar la Profession del solicitante */
    SELECT COUNT(*) INTO professionId FROM alodigaWallet.profession where name = "Administrador";
    IF professionId > 0 THEN
		SET professionId = 0;
		SELECT COUNT(*) INTO professionId FROM alodigaWallet.profession where name = "Administrador";
    ELSE
		INSERT INTO `alodigaWallet`.`profession` 
		(`name`) 
		VALUES ('Administrador');
        SELECT MAX(p.id) INTO professionId FROM `alodigaWallet`.`profession` p;
    END IF;
    
    /* Estatus inicial del solicitante natural */
    SELECT id INTO statusApplicantId FROM alodigaWallet.status_applicant where description = "ACTIVO" AND code = "ACTIVO";
    
    /* Guardar Natural Person*/
    INSERT INTO `alodigaWallet`.`natural_person` 
		(`personId`, `documentsPersonTypeId`, `identificationNumber`, `dueDateDocumentIdentification`,`firstName`, `lastName`, `gender`,
        `placeBirth`, `dateBirth` ,`civilStatusId`, `professionId`, `createDate`, `statusApplicantId`) 
		VALUES (personId, documentsPersonTypeId, '21924449', '2028-08-05', 'Ana', 'Perez', 'F', 'CCS', '1998-08-05', civilStatusId, professionId, '2020-10-03 10:20:00', statusApplicantId );
 
	/* Status de la solicitud y Tipo de Solicitud */
    SET statusRequest = 1;
    SET requestType = 2;

	/* Solicitud de usuario */
    SELECT COUNT(*) INTO exitAffiliationRequest FROM alodigaWallet.affiliation_request where userRegisterUnifiedId = personId;
    IF exitAffiliationRequest > 0 THEN
		SELECT MAX(p.id) INTO affiliationRequestId FROM alodigaWallet.affiliation_request where userRegisterUnifiedId = personId;
    ELSE
		INSERT INTO `alodigaWallet`.`affiliation_request` 
		(`numberRequest`, `dateRequest`, `statusRequestId`, `requestTypeId`, `userRegisterUnifiedId`, `createDate`) 
		VALUES ('SORUBI-2020-1', '2020-10-08 10:20:00', statusRequest, requestType, personId,'2020-10-08 10:20:00');
        SELECT MAX(a.id) INTO affiliationRequestId FROM `alodigaWallet`.`affiliation_request` a;
    END IF;
    
    /* Tipos de recaudos */
    SELECT MAX(c.id) INTO collectionTypeIdenti FROM `alodigaWallet`.`collection_type`c where description ="DOCUMENTO DE IDENTIDAD" AND countryId = countryId and personTypeId = personTypeId;
	SELECT MAX(c.id) INTO collectionTypeConstant FROM `alodigaWallet`.`collection_type`c where description ="CONSTANCIA DE TRABAJO" AND countryId = countryId and personTypeId = personTypeId;
    IF collectionTypeIdenti < 0 THEN
		INSERT INTO `alodigaWallet`.`collection_type` 
		(`description`, `countryId`, `personTypeId`) 
		VALUES ('DOCUMENTO DE IDENTIDAD', countryId, personTypeId);
        SELECT MAX(c.id) INTO collectionTypeIdenti FROM `alodigaWallet`.`collection_type` c;
    END IF;    
    
    IF collectionTypeConstant < 0 THEN
		INSERT INTO `alodigaWallet`.`collection_type` 
		(`description`, `countryId`, `personTypeId`) 
		VALUES ('CONSTANCIA DE TRABAJO', countryId, personTypeId);
        SELECT MAX(c.id) INTO collectionTypeConstant FROM `alodigaWallet`.`collection_type` c;
    END IF;   
    
    /* Recaudos de la solicitud */
    
    /* Primer tipo de recuado */
    SELECT COUNT(*) INTO existCollectionsRequest FROM alodigaWallet.collections_request where collectionTypeId = collectionTypeIdenti AND personTYpeId = personTypeId AND requestTypeId = requestTypeId;
    IF exitAffiliationRequest > 0 THEN
		SELECT MAX(p.id) INTO collectionsRequestId FROM alodigaWallet.affiliation_request where userRegisterUnifiedId = personId;
    ELSE
		INSERT INTO `alodigaWallet`.`collections_request` 
		(`collectionTypeId`, `personTypeId`, `requestTypeId`) 
		VALUES (collectionTypeIdenti, personTypeId, requestType);
        SELECT MAX(c.id) INTO collectionsRequestId FROM `alodigaWallet`.`collections_request` c;
    END IF;
    
    SELECT COUNT(*) INTO existRequestHasCollection FROM alodigaWallet.request_has_collection_request where collectionsRequestId = collectionTypeIdenti AND affiliationRequestId = affiliationRequestId;
	
    IF existRequestHasCollection > 0 THEN
		SELECT MAX(p.id) INTO requestHasCollectionId FROM alodigaWallet.request_has_collection_request where collectionsRequestId = collectionTypeIdenti AND affiliationRequestId = affiliationRequestId;
    ELSE
		INSERT INTO `alodigaWallet`.`request_has_collection_request` 
		(`createDate`, `collectionsRequestId`, `affiliationRequestId`) 
		VALUES ('2020-10-08 10:20:00', collectionsRequestId, affiliationRequestId);

    END IF;
    
    /* Segundo tipo de recuado */
    SELECT COUNT(*) INTO existCollectionsRequest FROM alodigaWallet.collections_request where collectionTypeId = collectionTypeConstant AND personTYpeId = personTypeId AND requestTypeId = requestTypeId;
    IF exitAffiliationRequest > 0 THEN
		SELECT MAX(p.id) INTO collectionsRequestId FROM alodigaWallet.affiliation_request where userRegisterUnifiedId = personId;
    ELSE
		INSERT INTO `alodigaWallet`.`collections_request` 
		(`collectionTypeId`, `personTypeId`, `requestTypeId`) 
		VALUES (collectionTypeConstant, personTypeId, requestType);
        SELECT MAX(c.id) INTO collectionsRequestId FROM `alodigaWallet`.`collections_request` c;
    END IF;
    
    SELECT COUNT(*) INTO existRequestHasCollection FROM alodigaWallet.request_has_collection_request where collectionsRequestId = collectionTypeConstant AND affiliationRequestId = affiliationRequestId;
	
    IF existRequestHasCollection > 0 THEN
		SELECT MAX(p.id) INTO requestHasCollectionId FROM alodigaWallet.request_has_collection_request where collectionsRequestId = collectionTypeConstant AND affiliationRequestId = affiliationRequestId;
    ELSE
		INSERT INTO `alodigaWallet`.`request_has_collection_request` 
		(`createDate`, `collectionsRequestId`, `affiliationRequestId`) 
		VALUES ('2020-10-08 10:20:00', collectionsRequestId, affiliationRequestId);

    END IF;
    
    -- Solicitante Jose Giraldo
    SET countryId = 0; 
    SET personTypeId = 0; 
    SET personId = 0;
    SET personClassificationId = 0;
    SET documentsPersonTypeId = 0;
    SET languageId = 0;
    SET civilStatusId = 0;
	SET professionId = 0;
    SET statusApplicantId = 0;
    SET stateId = 0;
    SET streetTypeId = 0;
    SET statusRequest = 0;
    SET requestType = 0;
    SET cityId = 0;
    SET addressId = 0;
    SET addressTypeId = 0;
    SET edificationTypeId = 0;
    SET personHasAddres = 0;
    SET affiliationRequestId = 0;
    SET phoneTypeId = 0;
    SET collectionsRequestId = 0;
    SET collectionTypeIdenti = 0;
    SET collectionTypeConstant = 0;
    SET requestHasCollectionId = 0;
    SET existPersonType = 0;
    SET existClassification = 0;
    SET existPerson = 0;
    SET existPersonHasAddres = 0;
    SET existDocumentPersonType = 0;
    SET existCivilStatus = 0;
    SET exitAffiliationRequest = 0;
    SET existCollectionsRequest = 0;
    SET existRequestHasCollection = 0;
    
    /* Verificar el tipo de persona */
	SELECT COUNT(*) INTO existPersonType FROM alodigaWallet.person_type where countryId = 1 AND originApplicationId = 1  AND indNaturalPerson = 1;
    IF existPersonType > 0 THEN
		SELECT id INTO personTypeId FROM alodigaWallet.person_type where countryId = 1 AND originApplicationId = 1  AND indNaturalPerson = 1;
	ELSE 
		INSERT INTO `alodigaWallet`.`person_type` 
		(`description`, `countryId`, `originApplicationId`, `indNaturalPerson`) 
		VALUES ('Persona Natural',  '1', '1', '1');
        SELECT MAX(p.id) INTO personTypeId FROM `alodigaWallet`.`person_type` p;
    END IF;
    
    /* Verificar la classificación de la persona */
    SELECT COUNT(*) INTO existClassification FROM alodigaWallet.person_classification where code = "REUNUS";
	IF existClassification > 0 THEN
    SELECT id INTO personClassificationId FROM alodigaWallet.person_classification where code = "REUNUS";
	ELSE 
		INSERT INTO `alodigaWallet`.`person_classification` 
		(`description`, `code`) 
		VALUES ('Register Unified User',  'REUNUS');
        SELECT MAX(p.id) INTO personClassificationId FROM `alodigaWallet`.`person_classification` p;
    END IF;
    
    /* Guardar el país */
    SELECT id INTO countryId FROM alodigaWallet.country where name = "VENEZUELA" AND code = '58';
   
   /* Guardar la Estado*/
    SELECT MAX(s.id) INTO stateId FROM `alodigaWallet`.`state` s where countryId = countryId AND name = "DISTRITO CAPITAL";
	IF stateId > 0 THEN
		SET stateId = 0;
		SELECT MAX(s.id) INTO stateId FROM `alodigaWallet`.`state` s where countryId = countryId AND name = "DISTRITO CAPITAL";
    ELSE
		SET stateId = 0;
		INSERT INTO `alodigaWallet`.`state` 
		(`countryId`, `name`) 
		VALUES (countryId,  'DISTRITO CAPITAL');
        SELECT MAX(s.id) INTO stateId FROM `alodigaWallet`.`state` s where countryId = countryId AND name = "DISTRITO CAPITAL";
    END IF;
	
    /* Guardar la Ciudad */
    SELECT MAX(c.id) INTO cityId FROM `alodigaWallet`.`city` c where stateId = stateId AND name = "Caracas";
    IF  cityId > 0 THEN
		SET cityId = 0;
        SELECT MAX(c.id) INTO cityId FROM `alodigaWallet`.`city` c where stateId = stateId AND name = "Caracas";
    ELSE    
		SET cityId = 0;
        INSERT INTO `alodigaWallet`.`city` 
		(`stateId`, `name`) 
		VALUES (stateId,  'DISTRITO CAPITAL');
        SELECT MAX(c.id) INTO cityId FROM `alodigaWallet`.`city` c where stateId = stateId AND name = "Caracas";
    END IF;

    /* Tipo de calle */
    SELECT MAX(s.id) INTO streetTypeId FROM `alodigaWallet`.`street_type` s where description = "Avenida" AND code = "AVENID";
    
    /* Tipo de Edificación */
    SELECT MAX(e.id) INTO edificationTypeId FROM `alodigaWallet`.`edification_type` e where description = "Residencia" AND code = "RESIDE";
    
    /* Tipo de Direccion */
    SELECT MAX(a.id) INTO addressTypeId FROM `alodigaWallet`.`address_type` a where description = "Habitación" AND code = "HABITA";
    
    /* Agregar el nuevo person */
    INSERT INTO `alodigaWallet`.`person` 
		(`email`, `personTypeId`, `personClassificationId`, `countryId`, `createDate`) 
		VALUES ('joseGiraldo84@gmail.com', personTypeId, personClassificationId, countryId,'2020-10-04 10:20:00');
    SELECT MAX(p.id) INTO personId FROM `alodigaWallet`.`person` p;
    
    /* Asociar el telefono de la persona */
    SELECT MAX(p.id) INTO phoneTypeId  FROM `alodigaWallet`.`phone_type` p where description = "Movil";
    
    INSERT INTO `alodigaWallet`.`phone_person` 
		(`countryId`, `countryCode`, `areaCode`, `numberPhone`, `personId`, `phoneTypeId`, `indMainPhone`, `createDate`) 
		VALUES (countryId, '58', '412', '7092432', personId, phoneTypeId, '1', '2020-10-04 10:20:00');
    
     /* Agregar el address de la persona */
    INSERT INTO `alodigaWallet`.`address` 
		(`countryId`, `cityId`, `zipCode`, `streetTypeId`, `nameStreet`, `edificationTypeId`, `nameEdification`, `tower`, `floor`,
        `urbanization`, `addressLine1`, `addressLine2`, `addressTypeId`, `indMainAddress`) 
		VALUES (countryId, cityId, '1111', streetTypeId, 'Calle los Campitos', edificationTypeId, 'Residencia Monte Alegre','1', '1', 
        'Ubanizacion Vinotinto','Calle los Campitos, residencia Monte Alegre, Frente la inglesa de los campos', 
        'Calle los Campitos, residencia Monte Alegre, Perpendicular al Gamma de los campitos', 
        addressTypeId , '1');
	SELECT MAX(a.id) INTO addressId  FROM `alodigaWallet`.`address` a;
    
    /* Agregar el person_has_addres */
    INSERT INTO `alodigaWallet`.`person_has_address` 
	(`personId`, `addressId`, `createDate`, `updateDate`) 
	VALUES (personId, addressId,'2020-10-04 10:20:00', '2020-10-04 10:20:00');
    
    /* Verificar Document Person Type  */
    SELECT COUNT(*) INTO existDocumentPersonType FROM alodigaWallet.documents_person_type where description ="Cedula de Identidad Venezolano" AND personTypeId = personTypeId;
    IF existDocumentPersonType > 0 THEN
		SELECT id INTO documentsPersonTypeId FROM alodigaWallet.documents_person_type where description = "Cedula de Identidad Venezolano" AND personTypeId = personTypeId AND codeIdentification = "CI";
	ELSE 
		INSERT INTO `alodigaWallet`.`documents_person_type` 
		(`description`, `personTypeId`, `codeIdentification`) 
		VALUES ('Cedula de Identidad Venezolano', personTypeId, 'CI');
        SELECT MAX(d.id) INTO documentsPersonTypeId FROM `alodigaWallet`.`documents_person_type` d;
    END IF;
    
    /* Guardar el idLanguage */
	SELECT id INTO languageId FROM alodigaWallet.language where iso = "es" and description="SPANISH" AND enabled = '1';
    
    /* Verificar el estado civil del solicitante  */
    SELECT COUNT(*) INTO existCivilStatus FROM alodigaWallet.civil_status where description ="Soltero" AND languageId = languageId;
    IF existCivilStatus > 0 THEN
		SELECT id INTO civilStatusId FROM alodigaWallet.civil_status where description ="Soltero" AND personTypeId = personTypeId;
    ELSE 
		INSERT INTO `alodigaWallet`.`civil_status` 
		(`description`, `languageId`) 
		VALUES ('Soltero', languageId);
        SELECT MAX(c.id) INTO civilStatusId FROM `alodigaWallet`.`civil_status` c;
    END IF;
    
    /* Guardar la Profesion del solicitante */
    SELECT COUNT(*) INTO professionId FROM alodigaWallet.profession where name = "Ingeniero";
    IF professionId > 0 THEN
		SET professionId = 0;
		SELECT COUNT(*) INTO professionId FROM alodigaWallet.profession where name = "Ingeniero";
    ELSE
		INSERT INTO `alodigaWallet`.`profession` 
		(`name`) 
		VALUES ('Administrador');
        SELECT MAX(p.id) INTO professionId FROM `alodigaWallet`.`profession` p;
    END IF;
    
    /* Estatus inicial del solicitante natural */
    SELECT id INTO statusApplicantId FROM alodigaWallet.status_applicant where description = "ACTIVO" AND code = "ACTIVO";
    
    /* Guardar Natural Person*/
    INSERT INTO `alodigaWallet`.`natural_person` 
		(`personId`, `documentsPersonTypeId`, `identificationNumber`, `dueDateDocumentIdentification`,`firstName`, `lastName`, `gender`,
        `placeBirth`, `dateBirth` ,`civilStatusId`, `professionId`, `createDate`, `statusApplicantId`) 
		VALUES (personId, documentsPersonTypeId, '12658324', '2028-10-04', 'Jose', 'Giraldo', 'M', 'CCS', '1984-02-07', civilStatusId, professionId, '2020-10-04 10:20:00', statusApplicantId );
	
    /* Status de la solicitud y Tipo de Solicitud */
    SET statusRequest = 1;
    SET requestType = 2;

	/* Solicitud de usuario */
    SELECT COUNT(*) INTO exitAffiliationRequest FROM alodigaWallet.affiliation_request where userRegisterUnifiedId = personId;
    IF exitAffiliationRequest > 0 THEN
		SELECT MAX(p.id) INTO affiliationRequestId FROM alodigaWallet.affiliation_request where userRegisterUnifiedId = personId;
    ELSE
		INSERT INTO `alodigaWallet`.`affiliation_request` 
		(`numberRequest`, `dateRequest`, `statusRequestId`, `requestTypeId`, `userRegisterUnifiedId`, `createDate`) 
		VALUES ('SORUBI-2020-2', '2020-10-08 10:20:00', statusRequest, requestType, personId,'2020-10-08 10:20:00');
        SELECT MAX(a.id) INTO affiliationRequestId FROM `alodigaWallet`.`affiliation_request` a;
    END IF;
    
    /* Tipos de recaudos */
    SELECT MAX(c.id) INTO collectionTypeIdenti FROM `alodigaWallet`.`collection_type`c where description ="DOCUMENTO DE IDENTIDAD" AND countryId = countryId and personTypeId = personTypeId;
	SELECT MAX(c.id) INTO collectionTypeConstant FROM `alodigaWallet`.`collection_type`c where description ="CONSTANCIA DE TRABAJO" AND countryId = countryId and personTypeId = personTypeId;
    IF collectionTypeIdenti < 0 THEN
		INSERT INTO `alodigaWallet`.`collection_type` 
		(`description`, `countryId`, `personTypeId`) 
		VALUES ('DOCUMENTO DE IDENTIDAD', countryId, personTypeId);
        SELECT MAX(c.id) INTO collectionTypeIdenti FROM `alodigaWallet`.`collection_type` c;
    END IF;    
    
    IF collectionTypeConstant < 0 THEN
		INSERT INTO `alodigaWallet`.`collection_type` 
		(`description`, `countryId`, `personTypeId`) 
		VALUES ('CONSTANCIA DE TRABAJO', countryId, personTypeId);
        SELECT MAX(c.id) INTO collectionTypeConstant FROM `alodigaWallet`.`collection_type` c;
    END IF;   
    
    /* Recaudos de la solicitud */
    
    /* Primer tipo de recuado */
    SELECT COUNT(*) INTO existCollectionsRequest FROM alodigaWallet.collections_request where collectionTypeId = collectionTypeIdenti AND personTYpeId = personTypeId AND requestTypeId = requestTypeId;
    IF exitAffiliationRequest > 0 THEN
		SELECT MAX(p.id) INTO collectionsRequestId FROM alodigaWallet.affiliation_request where userRegisterUnifiedId = personId;
    ELSE
		INSERT INTO `alodigaWallet`.`collections_request` 
		(`collectionTypeId`, `personTypeId`, `requestTypeId`) 
		VALUES (collectionTypeIdenti, personTypeId, requestType);
        SELECT MAX(c.id) INTO collectionsRequestId FROM `alodigaWallet`.`collections_request` c;
    END IF;
    
    SELECT COUNT(*) INTO existRequestHasCollection FROM alodigaWallet.request_has_collection_request where collectionsRequestId = collectionTypeIdenti AND affiliationRequestId = affiliationRequestId;
	
    IF existRequestHasCollection > 0 THEN
		SELECT MAX(p.id) INTO requestHasCollectionId FROM alodigaWallet.request_has_collection_request where collectionsRequestId = collectionTypeIdenti AND affiliationRequestId = affiliationRequestId;
    ELSE
		INSERT INTO `alodigaWallet`.`request_has_collection_request` 
		(`createDate`, `collectionsRequestId`, `affiliationRequestId`) 
		VALUES ('2020-10-08 10:20:00', collectionsRequestId, affiliationRequestId);

    END IF;
    
    /* Segundo tipo de recuado */
    SELECT COUNT(*) INTO existCollectionsRequest FROM alodigaWallet.collections_request where collectionTypeId = collectionTypeConstant AND personTYpeId = personTypeId AND requestTypeId = requestTypeId;
    IF exitAffiliationRequest > 0 THEN
		SELECT MAX(p.id) INTO collectionsRequestId FROM alodigaWallet.affiliation_request where userRegisterUnifiedId = personId;
    ELSE
		INSERT INTO `alodigaWallet`.`collections_request` 
		(`collectionTypeId`, `personTypeId`, `requestTypeId`) 
		VALUES (collectionTypeConstant, personTypeId, requestType);
        SELECT MAX(c.id) INTO collectionsRequestId FROM `alodigaWallet`.`collections_request` c;
    END IF;
    
    SELECT COUNT(*) INTO existRequestHasCollection FROM alodigaWallet.request_has_collection_request where collectionsRequestId = collectionTypeConstant AND affiliationRequestId = affiliationRequestId;
	
    IF existRequestHasCollection > 0 THEN
		SELECT MAX(p.id) INTO requestHasCollectionId FROM alodigaWallet.request_has_collection_request where collectionsRequestId = collectionTypeConstant AND affiliationRequestId = affiliationRequestId;
    ELSE
		INSERT INTO `alodigaWallet`.`request_has_collection_request` 
		(`createDate`, `collectionsRequestId`, `affiliationRequestId`) 
		VALUES ('2020-10-08 10:20:00', collectionsRequestId, affiliationRequestId);

    END IF;
    
    
     
END$$

DELIMITER ;
