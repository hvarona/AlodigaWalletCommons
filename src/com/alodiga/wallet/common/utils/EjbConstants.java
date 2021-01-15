package com.alodiga.wallet.common.utils;

public class EjbConstants {

    //public static String SERVER = "localhost";
    public static String SERVER = "alodiga.wallet.admin";
    public static String PORT = "3700";
    public static final String ACCESS_CONTROL_EJB = "ejb/wallet/AccessControlEJB";
    public static final String AUDITORY_EJB = "ejb/wallet/AuditoryEJB";
    public static final String PREFERENCES_EJB = "ejb/wallet/PreferencesEJB";
    public static final String PRODUCT_EJB = "ejb/wallet/ProductEJB";
    public static final String PROMOTION_EJB = "ejb/wallet/PromotionEJB";
    public static final String REPORT_EJB = "ejb/wallet/ReportEJB";
    public static final String TRANSACTION_EJB = "ejb/wallet/TransactionEJB";
    public static final String TRANSACTION_TIMER_EJB = "ejb/wallet/TransactionTimerEJB";
    public static final String USER_EJB = "ejb/wallet/UserEJB";
    public static final String UTILS_EJB = "ejb/wallet/UtilsEJB";
    public static final String PERSON_EJB = "ejb/wallet/PersonEJB";
    public static final String BUSINESS_PORTAL_EJB = "ejb/wallet/BusinessPortalEJB";
    public static final String BUSINESS_EJB = "ejb/wallet/BusinessEJB";
    
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
    public static final String PARAM_ORIGIN_APPLICATION_ID = "originApplicationId";
    public static final String PARAM_BUSINESS_CATEGORY_ID = "businessCategoryId";
    public static final String PARAM_STATUS_TRANSACTION_APPROVE_REQUEST_ID = "statusTransactionApproveRequestId";
    public static final String PARAM_CODE = "code";
    public static final String PARAM_ACRONYM = "acronym";
    public static final String PARAM_NAME = "name";
    public static final String PARAM_REQUEST_NUMBER = "requestNumber";
    public static final String PARAM_DOCUMENT_TYPE_ID = "documentTypeId";
    public static final String PARAM_PERSON_ID = "personId";
    public static final String PARAM_LEGAL_PERSON_ID = "legalPersonId";
    public static final String PARAM_REQUEST_ID = "requestId";
    public static final String PARAM_REQUEST_TYPE ="requestTypeId";
    public static final String PARAM_COLLECTION_REQUEST_ID = "collectionsRequestId";
    public static final String PARAM_IND_NATURAL_PERSON = "indNaturalPerson";
    public static final String PARAM_AFFILIATION_REQUEST = "affiliationRequestId";
    public static final String PARAM_STATUS_ID = "statusCardId";
    public static final String PARAM_REVIEW_REQUEST_TYPE_ID = "reviewTypeId";    
    public static final String PARAM_LEGAL_REPRESENTATIVE_ID = "legalRepresentativeId";
    public static final String PARAM_PERSON_TYPE_ID = "personTypeId";
    public static final String PARAM_CURRENT_PASSWORD = "currentPassword";
    public static final String PARAM_USER_ID = "userId";
    public static final String PARAM_LOGIN = "login";
    public static final String PARAM_EMPLOYEE = "employeeId";
    public static final String TRANSACTION_TYPE_KEY = "transactionTypeId";
    public static final String COMISSION_PRODUCT_KEY = "value";
    public static final String PARAM_MCC_CODE = "mccCode";
    public static final String PARAM_HOLI_DAY_DATE = "holidayDate";
    public static final String PARAM_APPLICATION_COMISSION = "indApplicationCommission";
    public static final String PARAM_PREFERENCE_FIELD_ID = "preferenceFieldId";
    public static final String PARAM_TYPE = "type";
    public static final String PARAM_PERSON_CLASSIFICATION_ID = "personClassificationId";
    
}
