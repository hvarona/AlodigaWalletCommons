use alodigaWallet;
DROP PROCEDURE IF EXISTS dataProcesoCierre;
DELIMITER $$
CREATE PROCEDURE dataProcesoCierre(IN date1 DATETIME, IN date2 DATETIME, IN date3 DATETIME , IN date4 DATETIME,  IN date5 DATETIME)
BEGIN
	DECLARE productRecharge int;
    DECLARE tranferCardToCard int;
    DECLARE transactionId int;
    DECLARE productExchange int;
    DECLARE withdrawalsManual int;
    DECLARE productPayment int;
    DECLARE product int;
    DECLARE existBank int;
    DECLARE bankId int;
    DECLARE existUserHasBank int;
    DECLARE accountBank int;
    DECLARE existAccountBank int;
    DECLARE transactionSource int;
    DECLARE amountTransaction int;
    DECLARE commision int;
    DECLARE existCommision int;
    DECLARE amountCommision double;
    DECLARE valueCommision double;

/*---------------------------------- CUENTAS DE BANCOS DE USUARIOS ------------------------------------  */
-- Cuentas de bancos de usuarios para las transacciones	
    -- Usuario 379
    -- Verificar si el Banco existe si no crear el banco y asignarlo a la variable
	SELECT COUNT(*) INTO existBank FROM `alodigaWallet`.`bank` b where name = "Bank of America" AND countryId = 47;
    IF existBank > 0 THEN
		SELECT MAX(b.id) INTO bankId FROM `alodigaWallet`.`bank` b where name = "Bank of America" AND countryId = 47;
    ELSE
		INSERT INTO `alodigaWallet`.`bank` 
		(`countryId`, `name`, `abaCode`, `SwiftCode`) 
		VALUES ('47', 'Bank of America', '0122', '300');
        SELECT MAX(b.id) INTO bankId FROM `alodigaWallet`.`bank` b;
    END IF;
 
    -- Verificar Cuenta de Banco del usuario que realiza estas transacciones
    SELECT COUNT(*) INTO existAccountBank FROM `alodigaWallet`.`account_bank` where UnifiedRegistryId = 379;
    IF existAccountBank > 0 THEN
		SELECT MAX(a.id) INTO accountBank FROM `alodigaWallet`.`account_bank` a where UnifiedRegistryId = 379;
	ELSE 
    INSERT INTO `alodigaWallet`.`account_bank` 
		(`UnifiedRegistryId`, `accountNumber`, `bankId`, `statusAccountBankId`,`accountTypeBankId`, `createDate`) 
		VALUES ('379', '52487531489', bankId , '1', '1', '2020-10-27 10:10:42');  
    END IF;
    
    -- User_Has_Bank del usuario que realiza estas transacciones
    SELECT COUNT(*) INTO existUserHasBank FROM `alodigaWallet`.`user_has_bank` where userSourceId = 379 and bankId = bankId;
	IF existUserHasBank > 0 THEN
		SELECT MAX(u.id) INTO accountBank FROM `alodigaWallet`.`user_has_bank` u where userSourceId = 379 and bankId = bankId;
	ELSE 
    INSERT INTO `alodigaWallet`.`user_has_bank` 
		(`userSourceId`, `bankId`, `accountNumber`) 
		VALUES ('379', bankId , '52487531489');  
    END IF;
    
     -- Usuario 355
     SET existBank = 0;
     SET bankId = 0;
	 SET existAccountBank = 0;
     SET accountBank = 0;
     SET existUserHasBank = 0;
    -- Verificar si el Banco existe si no crear el banco y asignarlo a la variable
	SELECT COUNT(*) INTO existBank FROM `alodigaWallet`.`bank` b where name = "Bank of America" AND countryId = 47;
    IF existBank > 0 THEN
		SELECT MAX(b.id) INTO bankId FROM `alodigaWallet`.`bank` b where name = "Bank of America" AND countryId = 47;
    ELSE
		INSERT INTO `alodigaWallet`.`bank` 
		(`countryId`, `name`, `abaCode`, `SwiftCode`) 
		VALUES ('47', 'Bank of America', '0122', '300');
        SELECT MAX(b.id) INTO bankId FROM `alodigaWallet`.`bank` b;
    END IF;
    
    -- Verificar Cuenta de Banco del usuario que realiza estas transacciones
    SELECT COUNT(*) INTO existAccountBank FROM `alodigaWallet`.`account_bank` where UnifiedRegistryId = 355;
    IF existAccountBank > 0 THEN
		SELECT MAX(a.id) INTO accountBank FROM `alodigaWallet`.`account_bank` a where UnifiedRegistryId = 355;
	ELSE 
    INSERT INTO `alodigaWallet`.`account_bank` 
		(`UnifiedRegistryId`, `accountNumber`, `bankId`, `statusAccountBankId`,`accountTypeBankId`, `createDate`) 
		VALUES ('355', '134679852', bankId , '1', '1', '2020-10-27 12:10:42');  
    END IF;
    
    -- User_Has_Bank del usuario que realiza estas transacciones
    SELECT COUNT(*) INTO existUserHasBank FROM `alodigaWallet`.`user_has_bank` where userSourceId = 355 and bankId = bankId;
	IF existUserHasBank > 0 THEN
		SELECT MAX(u.id) INTO accountBank FROM `alodigaWallet`.`user_has_bank` u where userSourceId = 355 and bankId = bankId;
	ELSE 
    INSERT INTO `alodigaWallet`.`user_has_bank` 
		(`userSourceId`, `bankId`, `accountNumber`) 
		VALUES ('355', bankId , '134679852');  
    END IF;
    
    -- Usuario 369
     SET existBank = 0;
     SET bankId = 0;
	 SET existAccountBank = 0;
     SET accountBank = 0;
     SET existUserHasBank = 0;
    -- Verificar si el Banco existe si no crear el banco y asignarlo a la variable
	SELECT COUNT(*) INTO existBank FROM `alodigaWallet`.`bank` b where name = "Banesco" AND countryId = 1;
    IF existBank > 0 THEN
		SELECT MAX(b.id) INTO bankId FROM `alodigaWallet`.`bank` b where name = "Banesco" AND countryId = 1;
    ELSE
		INSERT INTO `alodigaWallet`.`bank` 
		(`countryId`, `name`, `abaCode`, `SwiftCode`) 
		VALUES ('1', 'Banesco', '0134', '200');
        SELECT MAX(b.id) INTO bankId FROM `alodigaWallet`.`bank` b;
    END IF;
    
    -- Verificar Cuenta de Banco del usuario que realiza estas transacciones
    SELECT COUNT(*) INTO existAccountBank FROM `alodigaWallet`.`account_bank` where UnifiedRegistryId = 369;
    IF existAccountBank > 0 THEN
		SELECT MAX(a.id) INTO accountBank FROM `alodigaWallet`.`account_bank` a where UnifiedRegistryId = 369;
	ELSE 
    INSERT INTO `alodigaWallet`.`account_bank` 
		(`UnifiedRegistryId`, `accountNumber`, `bankId`, `statusAccountBankId`,`accountTypeBankId`, `createDate`) 
		VALUES ('369', '852753159', bankId , '1', '1', '2020-10-27 12:10:42');  
    END IF;
    
    -- User_Has_Bank del usuario que realiza estas transacciones
    SELECT COUNT(*) INTO existUserHasBank FROM `alodigaWallet`.`user_has_bank` where userSourceId = 369 and bankId = bankId;
	IF existUserHasBank > 0 THEN
		SELECT MAX(u.id) INTO accountBank FROM `alodigaWallet`.`user_has_bank` u where userSourceId = 369 and bankId = bankId;
	ELSE 
    INSERT INTO `alodigaWallet`.`user_has_bank` 
		(`userSourceId`, `bankId`, `accountNumber`) 
		VALUES ('369', bankId , '852753159');  
    END IF;
    
     -- Usuario 333
     SET existBank = 0;
     SET bankId = 0;
	 SET existAccountBank = 0;
     SET accountBank = 0;
     SET existUserHasBank = 0;
    -- Verificar si el Banco existe si no crear el banco y asignarlo a la variable
	SELECT COUNT(*) INTO existBank FROM `alodigaWallet`.`bank` b where name = "Banesco" AND countryId = 1;
    IF existBank > 0 THEN
		SELECT MAX(b.id) INTO bankId FROM `alodigaWallet`.`bank` b where name = "Banesco" AND countryId = 1;
    ELSE
		INSERT INTO `alodigaWallet`.`bank` 
		(`countryId`, `name`, `abaCode`, `SwiftCode`) 
		VALUES ('1', 'Banesco', '0134', '200');
        SELECT MAX(b.id) INTO bankId FROM `alodigaWallet`.`bank` b;
    END IF;
    
    -- Verificar Cuenta de Banco del usuario que realiza estas transacciones
    SELECT COUNT(*) INTO existAccountBank FROM `alodigaWallet`.`account_bank` where UnifiedRegistryId = 333;
    IF existAccountBank > 0 THEN
		SELECT MAX(a.id) INTO accountBank FROM `alodigaWallet`.`account_bank` a where UnifiedRegistryId = 333;
	ELSE 
    INSERT INTO `alodigaWallet`.`account_bank` 
		(`UnifiedRegistryId`, `accountNumber`, `bankId`, `statusAccountBankId`,`accountTypeBankId`, `createDate`) 
		VALUES ('333', '9633571598', bankId , '1', '1', '2020-10-27 12:10:42');  
    END IF;
    
    -- User_Has_Bank del usuario que realiza estas transacciones
    SELECT COUNT(*) INTO existUserHasBank FROM `alodigaWallet`.`user_has_bank` where userSourceId = 333 and bankId = bankId;
	IF existUserHasBank > 0 THEN
		SELECT MAX(u.id) INTO accountBank FROM `alodigaWallet`.`user_has_bank` u where userSourceId = 333 and bankId = bankId;
	ELSE 
    INSERT INTO `alodigaWallet`.`user_has_bank` 
		(`userSourceId`, `bankId`, `accountNumber`) 
		VALUES ('333', bankId , '9633571598');  
    END IF;
    
    

											/*---------- TRANSACCIONES ----------*/

-- Transaction Type PRODUCT_RECHARGE PROREC
    SET transactionSource = 1;
	SELECT MAX(t.id) INTO productRecharge FROM `alodigaWallet`.`transaction_type` t where code = "PROREC";
	SELECT MAX(p.id) INTO product FROM `alodigaWallet`.`product` p where categoryId= 1 AND name = "Tarjeta Prepagada";
	SELECT COUNT(*) INTO existCommision FROM alodigaWallet.commission where productId = product AND transactionTypeId = productRecharge AND indApplicationCommission = 1 AND isPercentCommision = 1 AND endingDate is null;
	 
    
     /* verifica si la comisión para el producto existe en BD */
    IF existCommision > 0 THEN
		SELECT id, value INTO commision, valueCommision FROM alodigaWallet.commission where productId = product AND transactionTypeId = productRecharge AND indApplicationCommission = 1 AND isPercentCommision = 1 AND endingDate is null;
	ELSE 
		INSERT INTO `alodigaWallet`.`commission` 
		(`productId`, `transactionTypeId`, `beginningDate`, `indApplicationCommission`, `isPercentCommision`,`value`) 
		VALUES (product,  productRecharge, '2020-10-27 15:00:00', '1', '1', '3');
        SELECT id, value INTO commision, valueCommision FROM alodigaWallet.commission where productId = product AND transactionTypeId = rechargeTransaction AND indApplicationCommission = 1 AND isPercentCommision = 1 AND endingDate is null;
    END IF;
	
	
    SET amountTransaction = 256;
    INSERT INTO `alodigaWallet`.`transaction` (`transactionNumber`, `userSourceId`, `productId`, `transactionTypeId`, `transactionSourceId`, `creationDate`, `amount`, `transactionStatus`, `totalAmount`, `concept`, `indClosed`) VALUES ('PROREC-2020-1', '379', product, productRecharge, transactionSource, date1, amountTransaction, 'COMPLETED', amountTransaction,'PRODUCT_RECHARGE', '0');	
    /* Calcular la comisión */ 
    SET amountCommision = (amountTransaction*valueCommision)/100; 
    SELECT MAX(t.id) INTO transactionId FROM `alodigaWallet`.`transaction` t;
    INSERT INTO `alodigaWallet`.`commission_item` (`commissionId`, `amount`, `processedDate`, `transactionId`, `isResidual`) VALUES (commision, amountCommision, date1, transactionId, '0');
	
    SET amountTransaction = 354;
    /* Calcular la comisión */ 
    SET amountCommision = (amountTransaction*valueCommision)/100; 
    INSERT INTO `alodigaWallet`.`transaction` (`transactionNumber`, `userSourceId`, `productId`, `transactionTypeId`, `transactionSourceId`, `creationDate`, `amount`, `transactionStatus`, `totalAmount`, `concept`, `indClosed`) VALUES ('PROREC-2020-2', '379', product, productRecharge, transactionSource, date1, amountTransaction, 'COMPLETED', amountTransaction,'PRODUCT_RECHARGE', '0');	
	SELECT MAX(t.id) INTO transactionId FROM `alodigaWallet`.`transaction` t;
    INSERT INTO `alodigaWallet`.`commission_item` (`commissionId`, `amount`, `processedDate`, `transactionId`, `isResidual`) VALUES (commision, amountCommision, date1, transactionId, '0');
	
    SET amountTransaction = 54;
    /* Calcular la comisión */ 
    SET amountCommision = (amountTransaction*valueCommision)/100;
    INSERT INTO `alodigaWallet`.`transaction` (`transactionNumber`, `userSourceId`, `productId`, `transactionTypeId`, `transactionSourceId`, `creationDate`, `amount`, `transactionStatus`, `totalAmount`, `concept`, `indClosed`) VALUES ('PROREC-2020-3', '379', product, productRecharge, transactionSource, date1, amountTransaction, 'COMPLETED', amountTransaction,'PRODUCT_RECHARGE', '0');
    SELECT MAX(t.id) INTO transactionId FROM `alodigaWallet`.`transaction` t;
    INSERT INTO `alodigaWallet`.`commission_item` (`commissionId`, `amount`, `processedDate`, `transactionId`, `isResidual`) VALUES (commision, amountCommision, date1, transactionId, '0');
	
    SET amountTransaction = 86;
    /* Calcular la comisión */ 
    SET amountCommision = (amountTransaction*valueCommision)/100;
    INSERT INTO `alodigaWallet`.`transaction` (`transactionNumber`, `userSourceId`, `productId`, `transactionTypeId`, `transactionSourceId`, `creationDate`, `amount`, `transactionStatus`, `totalAmount`, `concept`, `indClosed`) VALUES ('PROREC-2020-4', '379', product, productRecharge, transactionSource, date1, amountTransaction, 'COMPLETED', amountTransaction,'PRODUCT_RECHARGE', '0');
    SELECT MAX(t.id) INTO transactionId FROM `alodigaWallet`.`transaction` t;
    INSERT INTO `alodigaWallet`.`commission_item` (`commissionId`, `amount`, `processedDate`, `transactionId`, `isResidual`) VALUES (commision, amountCommision, date1, transactionId, '0');
	
    SET amountTransaction = 162;
    /* Calcular la comisión */ 
    SET amountCommision = (amountTransaction*valueCommision)/100;
    INSERT INTO `alodigaWallet`.`transaction` (`transactionNumber`, `userSourceId`, `productId`, `transactionTypeId`, `transactionSourceId`, `creationDate`, `amount`, `transactionStatus`, `totalAmount`, `concept`, `indClosed`) VALUES ('PROREC-2020-5', '379', product, productRecharge, transactionSource, date1, amountTransaction, 'COMPLETED', amountTransaction,'PRODUCT_RECHARGE', '0');
	SELECT MAX(t.id) INTO transactionId FROM `alodigaWallet`.`transaction` t;
    INSERT INTO `alodigaWallet`.`commission_item` (`commissionId`, `amount`, `processedDate`, `transactionId`, `isResidual`) VALUES (commision, amountCommision, date1, transactionId, '0');
	
    -- Transaction Type TRANSFER_CARD_TO_CARD
	SET product = 0; 
    SET amountCommision = 0;
    SET valueCommision = 0;
    SET transactionId = 0;
    SET commision = 0;
    SET existCommision = 0;
    
	SELECT MAX(t.id) INTO tranferCardToCard FROM `alodigaWallet`.`transaction_type` t where code = "TRACAR";
	SELECT MAX(p.id) INTO product FROM `alodigaWallet`.`product` p where categoryId= 1 AND name = "Tarjeta Prepagada";
	SELECT COUNT(*) INTO existCommision FROM alodigaWallet.commission where productId = product AND transactionTypeId = tranferCardToCard AND indApplicationCommission = 1 AND isPercentCommision = 1 AND endingDate is null;
	
 	/* verifica si la comisión para el producto existe en BD */
    IF existCommision > 0 THEN
		SELECT id, value INTO commision, valueCommision FROM alodigaWallet.commission where productId = product AND transactionTypeId = tranferCardToCard  AND indApplicationCommission = 1 AND isPercentCommision = 1 AND endingDate is null;
	ELSE 
		INSERT INTO `alodigaWallet`.`commission` 
		(`productId`, `transactionTypeId`, `beginningDate`, `indApplicationCommission`, `isPercentCommision`,`value`) 
		VALUES (product,  tranferCardToCard , '2020-10-27 16:00:00', '1', '1', '6');
        SELECT id, value INTO commision, valueCommision FROM alodigaWallet.commission where productId = product AND transactionTypeId = tranferCardToCard AND indApplicationCommission = 1 AND isPercentCommision = 1 AND endingDate is null;
    END IF;
	
    SET amountTransaction = 187;
    /* Calcular la comisión */ 
    SET amountCommision = (amountTransaction*valueCommision)/100;
	INSERT INTO `alodigaWallet`.`transaction` (`transactionNumber`, `userSourceId`, `userDestinationId`, `productId`, `transactionTypeId`, `transactionSourceId`, `creationDate`, `amount`, `transactionStatus`, `totalAmount`, `concept`, `indClosed`) VALUES ('TRACAR-2020-6', '379', '355', product, tranferCardToCard, transactionSource, date2, amountTransaction, 'COMPLETED', amountTransaction,'TRANSFER_CARD_TO_CARD', '0');	
	SELECT MAX(t.id) INTO transactionId FROM `alodigaWallet`.`transaction` t;
    INSERT INTO `alodigaWallet`.`commission_item` (`commissionId`, `amount`, `processedDate`, `transactionId`, `isResidual`) VALUES (commision, amountCommision, date2, transactionId, '0');
	
    SET amountTransaction = 17;
    /* Calcular la comisión */ 
    SET amountCommision = (amountTransaction*valueCommision)/100;
	INSERT INTO `alodigaWallet`.`transaction` (`transactionNumber`, `userSourceId`, `userDestinationId`, `productId`, `transactionTypeId`, `transactionSourceId`, `creationDate`, `amount`, `transactionStatus`, `totalAmount`, `concept`, `indClosed`) VALUES ('TRACAR-2020-7', '379', '355', product, tranferCardToCard, transactionSource, date2, amountTransaction, 'COMPLETED', amountTransaction,'TRANSFER_CARD_TO_CARD', '0');	
	SELECT MAX(t.id) INTO transactionId FROM `alodigaWallet`.`transaction` t;
    INSERT INTO `alodigaWallet`.`commission_item` (`commissionId`, `amount`, `processedDate`, `transactionId`, `isResidual`) VALUES (commision, amountCommision, date2, transactionId, '0');
	
    SET amountTransaction = 41;
    /* Calcular la comisión */ 
    SET amountCommision = (amountTransaction*valueCommision)/100;
	INSERT INTO `alodigaWallet`.`transaction` (`transactionNumber`, `userSourceId`, `userDestinationId`, `productId`, `transactionTypeId`, `transactionSourceId`, `creationDate`, `amount`, `transactionStatus`, `totalAmount`, `concept`, `indClosed`) VALUES ('TRACAR-2020-8', '379', '355', product, tranferCardToCard, transactionSource, date2, amountTransaction, 'COMPLETED', amountTransaction,'TRANSFER_CARD_TO_CARD', '0');	
	SELECT MAX(t.id) INTO transactionId FROM `alodigaWallet`.`transaction` t;
    INSERT INTO `alodigaWallet`.`commission_item` (`commissionId`, `amount`, `processedDate`, `transactionId`, `isResidual`) VALUES (commision, amountCommision, date2, transactionId, '0');
	
    SET amountTransaction = 63;
    /* Calcular la comisión */ 
    SET amountCommision = (amountTransaction*valueCommision)/100;
	INSERT INTO `alodigaWallet`.`transaction` (`transactionNumber`, `userSourceId`, `userDestinationId`, `productId`, `transactionTypeId`, `transactionSourceId`, `creationDate`, `amount`, `transactionStatus`, `totalAmount`, `concept`, `indClosed`) VALUES ('TRACAR-2020-9', '379', '355', product, tranferCardToCard, transactionSource, date2, amountTransaction, 'COMPLETED', amountTransaction,'TRANSFER_CARD_TO_CARD', '0');	
	SELECT MAX(t.id) INTO transactionId FROM `alodigaWallet`.`transaction` t;
    INSERT INTO `alodigaWallet`.`commission_item` (`commissionId`, `amount`, `processedDate`, `transactionId`, `isResidual`) VALUES (commision, amountCommision, date2, transactionId, '0');
	 
    SET amountTransaction = 147;
    /* Calcular la comisión */ 
    SET amountCommision = (amountTransaction*valueCommision)/100;
	INSERT INTO `alodigaWallet`.`transaction` (`transactionNumber`, `userSourceId`, `userDestinationId`, `productId`, `transactionTypeId`, `transactionSourceId`, `creationDate`, `amount`, `transactionStatus`, `totalAmount`, `concept`, `indClosed`) VALUES ('TRACAR-2020-10', '379', '355', product, tranferCardToCard, transactionSource, date2, amountTransaction, 'COMPLETED', amountTransaction,'TRANSFER_CARD_TO_CARD', '0');	
	SELECT MAX(t.id) INTO transactionId FROM `alodigaWallet`.`transaction` t;
    INSERT INTO `alodigaWallet`.`commission_item` (`commissionId`, `amount`, `processedDate`, `transactionId`, `isResidual`) VALUES (commision, amountCommision, date2, transactionId, '0');
	
-- Transaction Type PRODUCT_EXCHANGE
	SET product = 0; 
    SET valueCommision = 0;
    SET transactionId = 0;
    SET commision = 0;
    SET existCommision = 0;
    
    SELECT MAX(t.id) INTO productExchange FROM `alodigaWallet`.`transaction_type` t where code = "PROEXC";
	SELECT MAX(p.id) INTO product FROM `alodigaWallet`.`product` p where categoryId= 1 AND name = "Dolares";
	SELECT COUNT(*) INTO existCommision FROM alodigaWallet.commission where productId = product AND transactionTypeId = productExchange AND indApplicationCommission = 1 AND isPercentCommision = 1 AND endingDate is null;
	
 	/* verifica si la comisión para el producto existe en BD */
    IF existCommision > 0 THEN
		SELECT id, value INTO commision, valueCommision FROM alodigaWallet.commission where productId = product AND transactionTypeId = productExchange  AND indApplicationCommission = 1 AND isPercentCommision = 1 AND endingDate is null;
	ELSE 
		INSERT INTO `alodigaWallet`.`commission` 
		(`productId`, `transactionTypeId`, `beginningDate`, `indApplicationCommission`, `isPercentCommision`,`value`) 
		VALUES (product,  productExchange , '2020-10-27 16:00:00', '1', '1', '2');
        SELECT id, value INTO commision, valueCommision FROM alodigaWallet.commission where productId = product AND transactionTypeId = productExchange AND indApplicationCommission = 1 AND isPercentCommision = 1 AND endingDate is null;
    END IF;
    
	SET amountTransaction = 37;
    /* Calcular la comisión */ 
    SET amountCommision = (amountTransaction*valueCommision)/100;
	INSERT INTO `alodigaWallet`.`transaction` (`transactionNumber`, `userSourceId`, `userDestinationId`, `productId`, `transactionTypeId`, `transactionSourceId`, `creationDate`, `amount`, `transactionStatus`, `totalAmount`, `concept`, `indClosed`) VALUES ('PROEXC-2020-11', '369', '333', product, productExchange, transactionSource, date3, amountTransaction, 'COMPLETED', amountTransaction,'PRODUCT_EXCHANGE', '0');	
	SELECT MAX(t.id) INTO transactionId FROM `alodigaWallet`.`transaction` t;
    INSERT INTO `alodigaWallet`.`commission_item` (`commissionId`, `amount`, `processedDate`, `transactionId`, `isResidual`) VALUES (commision, amountCommision, date3, transactionId, '0');
	 
    SET amountTransaction = 84;
    /* Calcular la comisión */ 
    SET amountCommision = (amountTransaction*valueCommision)/100;
	INSERT INTO `alodigaWallet`.`transaction` (`transactionNumber`, `userSourceId`, `userDestinationId`, `productId`, `transactionTypeId`, `transactionSourceId`, `creationDate`, `amount`, `transactionStatus`, `totalAmount`, `concept`, `indClosed`) VALUES ('PROEXC-2020-12', '369', '333', product, productExchange, transactionSource, date3, amountTransaction, 'COMPLETED', amountTransaction,'PRODUCT_EXCHANGE', '0');	
	SELECT MAX(t.id) INTO transactionId FROM `alodigaWallet`.`transaction` t;
    INSERT INTO `alodigaWallet`.`commission_item` (`commissionId`, `amount`, `processedDate`, `transactionId`, `isResidual`) VALUES (commision, amountCommision, date3, transactionId, '0');
	 
    SET amountTransaction = 332;
    /* Calcular la comisión */ 
    SET amountCommision = (amountTransaction*valueCommision)/100;
	INSERT INTO `alodigaWallet`.`transaction` (`transactionNumber`, `userSourceId`, `userDestinationId`, `productId`, `transactionTypeId`, `transactionSourceId`, `creationDate`, `amount`, `transactionStatus`, `totalAmount`, `concept`, `indClosed`) VALUES ('PROEXC-2020-13', '369', '333', product, productExchange, transactionSource, date3, amountTransaction, 'COMPLETED', amountTransaction,'PRODUCT_EXCHANGE', '0');	
	SELECT MAX(t.id) INTO transactionId FROM `alodigaWallet`.`transaction` t;
    INSERT INTO `alodigaWallet`.`commission_item` (`commissionId`, `amount`, `processedDate`, `transactionId`, `isResidual`) VALUES (commision, amountCommision, date3, transactionId, '0');
	 
    SET amountTransaction = 74;
    /* Calcular la comisión */ 
    SET amountCommision = (amountTransaction*valueCommision)/100;
	INSERT INTO `alodigaWallet`.`transaction` (`transactionNumber`, `userSourceId`, `userDestinationId`, `productId`, `transactionTypeId`, `transactionSourceId`, `creationDate`, `amount`, `transactionStatus`, `totalAmount`, `concept`, `indClosed`) VALUES ('PROEXC-2020-14', '369', '333', product, productExchange, transactionSource, date3, amountTransaction, 'COMPLETED', amountTransaction,'PRODUCT_EXCHANGE', '0');	
	SELECT MAX(t.id) INTO transactionId FROM `alodigaWallet`.`transaction` t;
    INSERT INTO `alodigaWallet`.`commission_item` (`commissionId`, `amount`, `processedDate`, `transactionId`, `isResidual`) VALUES (commision, amountCommision, date3, transactionId, '0');
	 
    SET amountTransaction = 25;
    /* Calcular la comisión */ 
    SET amountCommision = (amountTransaction*valueCommision)/100;
	INSERT INTO `alodigaWallet`.`transaction` (`transactionNumber`, `userSourceId`, `userDestinationId`, `productId`, `transactionTypeId`, `transactionSourceId`, `creationDate`, `amount`, `transactionStatus`, `totalAmount`, `concept`, `indClosed`) VALUES ('PROEXC-2020-15', '369', '333', product, productExchange, transactionSource, date3, amountTransaction, 'COMPLETED', amountTransaction,'PRODUCT_EXCHANGE', '0');	
	SELECT MAX(t.id) INTO transactionId FROM `alodigaWallet`.`transaction` t;
    INSERT INTO `alodigaWallet`.`commission_item` (`commissionId`, `amount`, `processedDate`, `transactionId`, `isResidual`) VALUES (commision, amountCommision, date3, transactionId, '0');
	 
    
-- Transaction Type WITHDRAWALS_MANUAL
	SET product = 0; 
    SET valueCommision = 0;
    SET transactionId = 0;
    SET commision = 0;
    SET existCommision = 0;
    
    SELECT MAX(t.id) INTO withdrawalsManual FROM `alodigaWallet`.`transaction_type` t where code = "WITMAN";
	SELECT MAX(p.id) INTO product FROM `alodigaWallet`.`product` p where categoryId= 1 AND name = "Tarjeta Prepagada";
	SELECT COUNT(*) INTO existCommision FROM alodigaWallet.commission where productId = product AND transactionTypeId = withdrawalsManual AND indApplicationCommission = 1 AND isPercentCommision = 1 AND endingDate is null;
		
     /* verifica si la comisión para el producto existe en BD */
    IF existCommision > 0 THEN
		SELECT id, value INTO commision, valueCommision FROM alodigaWallet.commission where productId = product AND transactionTypeId = withdrawalsManual  AND indApplicationCommission = 1 AND isPercentCommision = 1 AND endingDate is null;
	ELSE 
		INSERT INTO `alodigaWallet`.`commission` 
		(`productId`, `transactionTypeId`, `beginningDate`, `indApplicationCommission`, `isPercentCommision`,`value`) 
		VALUES (product,  withdrawalsManual , '2020-10-27 16:00:00', '1', '1', '3');
        SELECT id, value INTO commision, valueCommision FROM alodigaWallet.commission where productId = product AND transactionTypeId = withdrawalsManual AND indApplicationCommission = 1 AND isPercentCommision = 1 AND endingDate is null;
    END IF;
    
    
	SET amountTransaction = 5;
    /* Calcular la comisión */ 
    SET amountCommision = (amountTransaction*valueCommision)/100;
	INSERT INTO `alodigaWallet`.`transaction` (`transactionNumber`, `userSourceId`, `productId`, `transactionTypeId`, `transactionSourceId`, `creationDate`, `amount`, `transactionStatus`, `totalAmount`, `concept`, `indClosed`) VALUES ('WITMAN-2020-16', '333', product, withdrawalsManual, transactionSource, date4, amountTransaction, 'COMPLETED', amountTransaction,'WITHDRAWALS_MANUAL', '0');	
	SELECT MAX(t.id) INTO transactionId FROM `alodigaWallet`.`transaction` t;
    INSERT INTO `alodigaWallet`.`commission_item` (`commissionId`, `amount`, `processedDate`, `transactionId`, `isResidual`) VALUES (commision, amountCommision, date4, transactionId, '0');
	 
    SET amountTransaction = 24;
    /* Calcular la comisión */ 
    SET amountCommision = (amountTransaction*valueCommision)/100;
	INSERT INTO `alodigaWallet`.`transaction` (`transactionNumber`, `userSourceId`, `productId`, `transactionTypeId`, `transactionSourceId`, `creationDate`, `amount`, `transactionStatus`, `totalAmount`, `concept`, `indClosed`) VALUES ('WITMAN-2020-17', '333', product, withdrawalsManual, transactionSource, date4, amountTransaction, 'COMPLETED', amountTransaction,'WITHDRAWALS_MANUAL', '0');	
	SELECT MAX(t.id) INTO transactionId FROM `alodigaWallet`.`transaction` t;
    INSERT INTO `alodigaWallet`.`commission_item` (`commissionId`, `amount`, `processedDate`, `transactionId`, `isResidual`) VALUES (commision, amountCommision, date4, transactionId, '0');
	 
    SET amountTransaction = 321;
    /* Calcular la comisión */ 
    SET amountCommision = (amountTransaction*valueCommision)/100;
	INSERT INTO `alodigaWallet`.`transaction` (`transactionNumber`, `userSourceId`, `productId`, `transactionTypeId`, `transactionSourceId`, `creationDate`, `amount`, `transactionStatus`, `totalAmount`, `concept`, `indClosed`) VALUES ('WITMAN-2020-18', '333', product, withdrawalsManual, transactionSource, date4, amountTransaction, 'COMPLETED', amountTransaction,'WITHDRAWALS_MANUAL', '0');	
	SELECT MAX(t.id) INTO transactionId FROM `alodigaWallet`.`transaction` t;
    INSERT INTO `alodigaWallet`.`commission_item` (`commissionId`, `amount`, `processedDate`, `transactionId`, `isResidual`) VALUES (commision, amountCommision, date4, transactionId, '0');
	 
    SET amountTransaction = 3;
    /* Calcular la comisión */ 
    SET amountCommision = (amountTransaction*valueCommision)/100;
	INSERT INTO `alodigaWallet`.`transaction` (`transactionNumber`, `userSourceId`, `productId`, `transactionTypeId`, `transactionSourceId`, `creationDate`, `amount`, `transactionStatus`, `totalAmount`, `concept`, `indClosed`) VALUES ('WITMAN-2020-19', '333', product, withdrawalsManual, transactionSource, date4, amountTransaction, 'COMPLETED', amountTransaction,'WITHDRAWALS_MANUAL', '0');	
	SELECT MAX(t.id) INTO transactionId FROM `alodigaWallet`.`transaction` t;
    INSERT INTO `alodigaWallet`.`commission_item` (`commissionId`, `amount`, `processedDate`, `transactionId`, `isResidual`) VALUES (commision, amountCommision, date4, transactionId, '0');
	 
    SET amountTransaction = 65;
    /* Calcular la comisión */ 
    SET amountCommision = (amountTransaction*valueCommision)/100;
	INSERT INTO `alodigaWallet`.`transaction` (`transactionNumber`, `userSourceId`, `productId`, `transactionTypeId`, `transactionSourceId`, `creationDate`, `amount`, `transactionStatus`, `totalAmount`, `concept`, `indClosed`) VALUES ('WITMAN-2020-20', '333', product, withdrawalsManual, transactionSource, date4, amountTransaction, 'COMPLETED', amountTransaction,'WITHDRAWALS_MANUAL', '0');	
	SELECT MAX(t.id) INTO transactionId FROM `alodigaWallet`.`transaction` t;
    INSERT INTO `alodigaWallet`.`commission_item` (`commissionId`, `amount`, `processedDate`, `transactionId`, `isResidual`) VALUES (commision, amountCommision, date4, transactionId, '0');
	 
-- Transaction Type PRODUCT_PAYMENT
	SET product = 0; 
    SET valueCommision = 0;
    SET transactionId = 0;
    SET commision = 0;
    SET existCommision = 0;
    
    SELECT MAX(t.id) INTO productPayment FROM `alodigaWallet`.`transaction_type` t where code = "PROPAY";
	SELECT MAX(p.id) INTO product FROM `alodigaWallet`.`product` p where categoryId= 1 AND name = "Tarjeta Prepagada";
	SELECT COUNT(*) INTO existCommision FROM alodigaWallet.commission where productId = product AND transactionTypeId = productPayment AND indApplicationCommission = 1 AND isPercentCommision = 1 AND endingDate is null;
		
     /* verifica si la comisión para el producto existe en BD */
    IF existCommision > 0 THEN
		SELECT id, value INTO commision, valueCommision FROM alodigaWallet.commission where productId = product AND transactionTypeId = productPayment  AND indApplicationCommission = 1 AND isPercentCommision = 1 AND endingDate is null;
	ELSE 
		INSERT INTO `alodigaWallet`.`commission` 
		(`productId`, `transactionTypeId`, `beginningDate`, `indApplicationCommission`, `isPercentCommision`,`value`) 
		VALUES (product,  productPayment , '2020-10-27 16:00:00', '1', '1', '4');
        SELECT id, value INTO commision, valueCommision FROM alodigaWallet.commission where productId = product AND transactionTypeId = productPayment AND indApplicationCommission = 1 AND isPercentCommision = 1 AND endingDate is null;
    END IF;
    
    SET amountTransaction = 25;
    /* Calcular la comisión */ 
    SET amountCommision = (amountTransaction*valueCommision)/100;
	INSERT INTO `alodigaWallet`.`transaction` (`transactionNumber`, `userSourceId`, `userDestinationId`, `productId`, `transactionTypeId`, `transactionSourceId`, `creationDate`, `amount`, `transactionStatus`, `totalAmount`, `concept`, `indClosed`) VALUES ('PROPAY-2020-21', '379', '333', product, productPayment, transactionSource, date5, amountTransaction, 'COMPLETED', amountTransaction,'PRODUCT_PAYMENT', '0');	
	SELECT MAX(t.id) INTO transactionId FROM `alodigaWallet`.`transaction` t;
    INSERT INTO `alodigaWallet`.`commission_item` (`commissionId`, `amount`, `processedDate`, `transactionId`, `isResidual`) VALUES (commision, amountCommision, date5, transactionId, '0');
	 
    SET amountTransaction = 37;
    /* Calcular la comisión */ 
    SET amountCommision = (amountTransaction*valueCommision)/100;
	INSERT INTO `alodigaWallet`.`transaction` (`transactionNumber`, `userSourceId`, `userDestinationId`, `productId`, `transactionTypeId`, `transactionSourceId`, `creationDate`, `amount`, `transactionStatus`, `totalAmount`, `concept`, `indClosed`) VALUES ('PROPAY-2020-22', '379', '333', product, productPayment, transactionSource, date5, amountTransaction, 'COMPLETED', amountTransaction,'PRODUCT_PAYMENT', '0');	
	SELECT MAX(t.id) INTO transactionId FROM `alodigaWallet`.`transaction` t;
    INSERT INTO `alodigaWallet`.`commission_item` (`commissionId`, `amount`, `processedDate`, `transactionId`, `isResidual`) VALUES (commision, amountCommision, date5, transactionId, '0');
	 
    SET amountTransaction = 147;
    /* Calcular la comisión */ 
    SET amountCommision = (amountTransaction*valueCommision)/100;
	INSERT INTO `alodigaWallet`.`transaction` (`transactionNumber`, `userSourceId`, `userDestinationId`, `productId`, `transactionTypeId`, `transactionSourceId`, `creationDate`, `amount`, `transactionStatus`, `totalAmount`, `concept`, `indClosed`) VALUES ('PROPAY-2020-23', '379', '333', product, productPayment, transactionSource, date5, amountTransaction, 'COMPLETED', amountTransaction,'PRODUCT_PAYMENT', '0');	
	SELECT MAX(t.id) INTO transactionId FROM `alodigaWallet`.`transaction` t;
    INSERT INTO `alodigaWallet`.`commission_item` (`commissionId`, `amount`, `processedDate`, `transactionId`, `isResidual`) VALUES (commision, amountCommision, date5, transactionId, '0');
	 
    SET amountTransaction = 110;
    /* Calcular la comisión */ 
    SET amountCommision = (amountTransaction*valueCommision)/100;
	INSERT INTO `alodigaWallet`.`transaction` (`transactionNumber`, `userSourceId`, `userDestinationId`, `productId`, `transactionTypeId`, `transactionSourceId`, `creationDate`, `amount`, `transactionStatus`, `totalAmount`, `concept`, `indClosed`) VALUES ('PROPAY-2020-24', '379', '333', product, productPayment, transactionSource, date5, amountTransaction, 'COMPLETED', amountTransaction,'PRODUCT_PAYMENT', '0');	
	SELECT MAX(t.id) INTO transactionId FROM `alodigaWallet`.`transaction` t;
    INSERT INTO `alodigaWallet`.`commission_item` (`commissionId`, `amount`, `processedDate`, `transactionId`, `isResidual`) VALUES (commision, amountCommision, date5, transactionId, '0');
	 
    SET amountTransaction = 87;
    /* Calcular la comisión */ 
    SET amountCommision = (amountTransaction*valueCommision)/100;
	INSERT INTO `alodigaWallet`.`transaction` (`transactionNumber`, `userSourceId`, `userDestinationId`, `productId`, `transactionTypeId`, `transactionSourceId`, `creationDate`, `amount`, `transactionStatus`, `totalAmount`, `concept`, `indClosed`) VALUES ('PROPAY-2020-25', '379', '333', product, productPayment, transactionSource, date5, amountTransaction, 'COMPLETED', amountTransaction,'PRODUCT_PAYMENT', '0');	
	SELECT MAX(t.id) INTO transactionId FROM `alodigaWallet`.`transaction` t;
    INSERT INTO `alodigaWallet`.`commission_item` (`commissionId`, `amount`, `processedDate`, `transactionId`, `isResidual`) VALUES (commision, amountCommision, date5, transactionId, '0');
	 
    
END$$

DELIMITER ;
