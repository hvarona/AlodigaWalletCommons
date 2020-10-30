package com.alodiga.wallet.common.ejb;

import java.util.List;
import java.util.Map;
import javax.ejb.Remote;
import com.alodiga.wallet.common.exception.EmptyListException;
import com.alodiga.wallet.common.exception.GeneralException;
import com.alodiga.wallet.common.exception.NullParameterException;
import com.alodiga.wallet.common.exception.RegisterNotFoundException;
import com.alodiga.wallet.common.genericEJB.EJBRequest;
import com.alodiga.wallet.common.genericEJB.WalletGenericEJB;
import com.alodiga.wallet.common.model.Preference;
import com.alodiga.wallet.common.model.PreferenceClassification;
import com.alodiga.wallet.common.model.PreferenceControl;
import com.alodiga.wallet.common.model.PreferenceField;
import com.alodiga.wallet.common.model.PreferenceFieldData;
import com.alodiga.wallet.common.model.PreferenceType;
import com.alodiga.wallet.common.model.PreferenceValue;
import com.alodiga.wallet.common.model.TransactionType;

@SuppressWarnings("all")
@Remote
public interface PreferencesEJB extends WalletGenericEJB {

    public PreferenceField deletePreferenceField(EJBRequest request) throws GeneralException, NullParameterException;

    public PreferenceType deletePreferenceType(EJBRequest request) throws GeneralException, NullParameterException;

    public PreferenceValue deletePreferenceValue(EJBRequest request) throws GeneralException, NullParameterException;

    public Map<Long, String> getLastPreferenceValues(EJBRequest request) throws GeneralException, RegisterNotFoundException, NullParameterException, EmptyListException;

    public List<Preference> getPreference(EJBRequest request) throws GeneralException, RegisterNotFoundException, NullParameterException, EmptyListException;
    
    public Preference savePreference(Preference preference) throws RegisterNotFoundException, NullParameterException, GeneralException;
    
    public List<PreferenceField> getPreferenceFields(EJBRequest request) throws GeneralException, RegisterNotFoundException, NullParameterException, EmptyListException;

    public List<PreferenceField> getPreferenceFieldsByCode(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
    
    public List<PreferenceField> searchPreferenceField(String name) throws EmptyListException, GeneralException, NullParameterException;
    
    public List<PreferenceType> getPreferenceTypes(EJBRequest request) throws GeneralException, RegisterNotFoundException, NullParameterException, EmptyListException;

    public List<PreferenceValue> getPreferenceValues(EJBRequest request) throws GeneralException, RegisterNotFoundException, NullParameterException, EmptyListException;

    public List<PreferenceValue> getPreferenceValuesByClassificationIdAndFieldId(Long classificationId,Long fieldId) throws GeneralException, RegisterNotFoundException, NullParameterException, EmptyListException;

    public PreferenceValue loadActivePreferenceValuesByClassificationIdAndFieldId(Long classificationId, Long fieldId) throws GeneralException, RegisterNotFoundException, NullParameterException;

    public PreferenceField loadPreferenceField(EJBRequest request) throws GeneralException, RegisterNotFoundException, NullParameterException;

    public PreferenceType loadPreferenceType(EJBRequest request) throws GeneralException, RegisterNotFoundException, NullParameterException;

    public PreferenceValue loadPreferenceValue(EJBRequest request) throws GeneralException, RegisterNotFoundException, NullParameterException;

    public PreferenceField savePreferenceField(EJBRequest request) throws GeneralException, NullParameterException;

    public PreferenceType savePreferenceType(EJBRequest request) throws GeneralException, NullParameterException;

    public PreferenceType savePreferencesType(PreferenceType preferenceType) throws RegisterNotFoundException, NullParameterException, GeneralException;
    
    public List<PreferenceType> getPreferenceTypeByType(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
    
    public PreferenceValue savePreferenceValue(PreferenceValue preferenceValue) throws GeneralException, NullParameterException;

    public List<PreferenceValue> savePreferenceValues(List<PreferenceValue> preferenceValues,List<PreferenceControl> preferenceControls) throws GeneralException, NullParameterException;
    
    public List<PreferenceClassification> getPreferenceClassifications(EJBRequest request) throws GeneralException, RegisterNotFoundException, NullParameterException, EmptyListException;
    
    public PreferenceClassification loadPreferenceClassification(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;

    public List<PreferenceValue> getPreferenceValuesGroupByBussinessId(EJBRequest request) throws GeneralException, NullParameterException, EmptyListException;

    public List<TransactionType> getTransactionTypes(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
    
    public TransactionType saveTransactionType(EJBRequest request) throws GeneralException, NullParameterException;
    
    public List<TransactionType> getTransactionTypeByCode(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
    
    public List<TransactionType> searchTransactionType(String name) throws EmptyListException, GeneralException, NullParameterException;
    
    public List<PreferenceValue> getPreferenceValuesByParam(Long classificationId, Long productId, Long transactionTypeId, Long bussinessId) throws GeneralException, NullParameterException, EmptyListException;
    
    public List<PreferenceValue> getPreferenceValuesByClassificationIdAndBussinessId(Long classificationId, Long bussinessId) throws GeneralException, RegisterNotFoundException, NullParameterException, EmptyListException;
    
    public boolean validatePreferencesValues(Long classificationId,Long productId,Long transactionTypeId, Long bussinessId)throws GeneralException, NullParameterException, EmptyListException;
    
    public Map<Long, String> getLastPreferenceValuesByBusiness(EJBRequest request) throws GeneralException, RegisterNotFoundException, NullParameterException, EmptyListException;
    
    public List<PreferenceField> getPreferenceFieldsByPreferenceId(Long preferenceId) throws GeneralException, RegisterNotFoundException, NullParameterException, EmptyListException;

    public List<PreferenceFieldData> getPreferenceFieldDataByPreference(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;

    public PreferenceValue getPreferenceValuesByParamAndBussiness(Long classificationId, Long productId, Long transactionTypeId, Long bussinessId, Long preferenceFieldId) throws GeneralException, NullParameterException, RegisterNotFoundException;

    public PreferenceFieldData savePreferenceFieldData(PreferenceFieldData preferenceFieldData) throws GeneralException, NullParameterException;


}
