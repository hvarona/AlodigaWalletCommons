-- Reporte de cierre diario
-- author: Graterol Moises
-- Fecha: 20/10/2020

-- Insert tabla report
SET @ReportId = 0;
SET @ProfileId= 0;
SET @ReportTypeManagement= 0;
SET @ReportTypeControl= 0;

SELECT MAX(r.id) INTO @ReportTypeManagement FROM `alodigaWallet`.`report_type` r WHERE name = "MANAGEMENT";
INSERT INTO `alodigaWallet`.`report` (`name`, `description`, `reportTypeId`,`query`, `webServiceUrl`, `enabled`) VALUES ('CIERRE DIARIO','CIERRE DIARIO',@ReportTypeManagement,'SELECT t.id,dc.closingDate as \'FECHA DE CIERRE\' , t.creationDate AS \'FECHA DE CREACION\',\ntp.value AS \'TIPO DE TRANSACCION\',ts.name as \'ORIGEN TRANSACCION\',p.name as \'PRODUCTO\',\nt.amount as \'MONTO\'\n,t.totalAmount as \'MONTO TOTAL\',erd.value as \'TASA DE CAMBIO\',\nci.amount as \'COMISION\',t.userSourceId as \'USUARIO ORIGEN\', \nt.userDestinationId as \'USARIO DESTINO\',atb.description as \'CUENTA ORIGEN\'\n,ub.accountNumber as \'NUMERO CUENTA ORIGEN\' \n,atbd.description as \'CUENTA DESTINO\',uhb.accountNumber AS \'NUMERO CUENTA DESTINO\' \n,t.transactionStatus as \'ESTATUS\'   \nFROM alodigaWallet.transaction t \nINNER JOIN alodigaWallet.daily_closing dc ON t.dailyClosingId=dc.id\nINNER JOIN alodigaWallet.transaction_type tp  ON t.transactionTypeId=tp.id \nINNER JOIN alodigaWallet.transaction_source ts  ON t.transactionSourceId=ts.id\nINNER JOIN alodigaWallet.account_bank ab ON t.userDestinationId=ab.UnifiedRegistryId\nINNER JOIN alodigaWallet.user_has_bank ub ON t.userSourceId=ub.userSourceId\nINNER JOIN alodigaWallet.user_has_bank uhb ON t.userDestinationId=uhb.userSourceId\nINNER JOIN alodigaWallet.account_bank abt ON t.userSourceId=abt.UnifiedRegistryId \nJOIN alodigaWallet.account_type_bank atb ON abt.accountTypeBankId = atb.id\nINNER JOIN alodigaWallet.account_bank abd ON t.userDestinationId=abd.UnifiedRegistryId \nJOIN alodigaWallet.account_type_bank atbd ON abd.accountTypeBankId = atbd.id\nINNER JOIN alodigaWallet.commission_item ci ON t.id=ci.transactionId\nINNER JOIN alodigaWallet.product p ON t.productId=p.id\nINNER JOIN alodigaWallet.exchange_detail ed ON t.id=ed.transactionId\nJOIN alodigaWallet.exchange_rate erd ON ed.exchangeRateId=erd.id\nWHERE dc.closingDate = ?\nAND ts.name=\'APP BILLETERA\'\nAND tp.value=?\nAND p.name=?','',1);


-- Insert tabla report_has_profile
SELECT MAX(p.id) INTO @ProfileId FROM `alodigaWallet`.`profile` p WHERE name = "Administrator" AND enabled = 1;
SELECT MAX(r.id) INTO @ReportId FROM `alodigaWallet`.`report` r;
INSERT INTO `alodigaWallet`.`report_has_profile` (`reportId`, `profileId`) VALUES (@ReportId,@ProfileId);


-- Insert tabla report_parameter
SELECT MAX(r.id) INTO @ReportTypeManagement FROM `alodigaWallet`.`report_type` r WHERE name = "MANAGEMENT";
SELECT MAX(r.id) INTO @ReportTypeControl FROM `alodigaWallet`.`report_type` r WHERE name = "CONTROL";
INSERT INTO `report_parameter` (`parameterTypeId`, `reportId`, `name`, `required`,`indexOrder`) VALUES 
(@ReportTypeManagement,@ReportId,'Fecha de cierre',1,1),
(@ReportTypeControl,@ReportId,'Tipo de Trasaccion',1,2),
(@ReportTypeControl,@ReportId,'Nombre de Producto',1,3);

UNLOCK TABLES;