package com.alodiga.wallet.common.utils;

public class EjbConstants {

//    public static String SERVER = "localhost";
    public static String SERVER = "alodiga.wallet.admin";
    public static String PORT = "3700";
    public static final String ACCESS_CONTROL_EJB = "ejb/wallet/AccessControlEJB";
    public static final String AUDITORY_EJB = "ejb/wallet/AuditoryEJB";
    public static final String PREFERENCES_EJB = "ejb/wallet/PreferencesEJB";
    public static final String PRODUCT_EJB = "ejb/wallet/ProductEJB";
    public static final String PROMOTION_EJB = "ejb/wallet/PromotionEJB";
    public static final String REPORT_EJB = "ejb/wallet/ReportEJB";
    public static final String TRANSACTION_EJB = "ejb/wallet/TransactionEJB";
    public static final String USER_EJB = "ejb/wallet/UserEJB";
    public static final String UTILS_EJB = "ejb/wallet/UtilsEJB";
    public static final String PERSON_EJB = "ejb/wallet/PersonEJB";
    
    public static final String PROPERTIES_PACKAGE = "com.alodiga.wallet.common.utils.";
    public static final String ERROR_FILE_NAME = PROPERTIES_PACKAGE + "system_error";
    public static final String MESSAGE_FILE_NAME = PROPERTIES_PACKAGE + "system_message";
    //ERROR
    public static final String ERR_GENERAL_EXCEPTION = "E000";
    public static final String ERR_NULL_PARAMETER = "E001";
    public static final String ERR_INCORRECT_PARAMETER = "E002";
    public static final String ERR_EMPTY_LIST_EXCEPTION = "E003";
    public static final String ERR_REGISTER_NOT_FOUND_EXCEPTION = "E004";
    public static final String ERR_INVALID_FORTMAT_EXCEPTION = "E005";
    public static final String ERR_INVALID_REFERENCE_EXCEPTION = "E006";
    public static final String ERR_PERSISTENCE_LAYER = "E020";
    public static final String ERR_CRUD_ENTITY = "E021";
    public static final String MSG_INIT_INVOCATION_METHOD = "M001";
    public static final String ERR_MAX_AMOUNT_BALANCE = "E007";
    public static final String ERR_MIN_AMOUNT_BALANCE = "E008";
    public static final String ERR_NOT_PIN_PROVISION = "E030";
    public static final String ERR_NOT_PIN_PROVISION_ANI = "E031";
    public static final String ERR_ERROR_RECHARGE = "E032";
    public static final String ERR_NOT_PROCESS_RECHARGE = "E033";
    public static final String ERR_PURCHASE_DENIED = "E034";
    public static final String ERR_TRANSACTION_NOT_AVAILABLE = "E035";
    public static final String ERR_MAX_AMOUNT_PER_TRANSACTION = "E036";
    public static final String ERR_MAX_AMOUNT_DAILY = "E037";
    public static final String ERR_MAX_PROMOTION_TRANSACTION_DAILY = "E038";
    public static final String ERR_NORESULTEXCEPTION = "E041";

    public static final int ENTERPRISE_ID_USA = 1;
    
    public static final String PARAM_PRODUCT_ID = "productId";
    public static final String PARAM_COUNTRY_ID = "countryId";
    public static final String PARAM_BUSINESS_CATEGORY_ID = "businessCategoryId";
}
