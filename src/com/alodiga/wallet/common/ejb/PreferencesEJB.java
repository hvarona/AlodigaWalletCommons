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
import com.alodiga.wallet.common.model.PreferenceField;
import com.alodiga.wallet.common.model.PreferenceType;
import com.alodiga.wallet.common.model.PreferenceValue;

@SuppressWarnings("all")
@Remote
public interface PreferencesEJB extends WalletGenericEJB {

    public PreferenceField deletePreferenceField(EJBRequest request) throws GeneralException, NullParameterException;

    public PreferenceType deletePreferenceType(EJBRequest request) throws GeneralException, NullParameterException;

    public PreferenceValue deletePreferenceValue(EJBRequest request) throws GeneralException, NullParameterException;

    public Map<Long, String> getLastPreferenceValues(EJBRequest request) throws GeneralException, RegisterNotFoundException, NullParameterException, EmptyListException;

    public List<PreferenceField> getPreferenceFields(EJBRequest request) throws GeneralException, RegisterNotFoundException, NullParameterException, EmptyListException;

    public List<PreferenceType> getPreferenceTypes(EJBRequest request) throws GeneralException, RegisterNotFoundException, NullParameterException, EmptyListException;

    public List<PreferenceValue> getPreferenceValues(EJBRequest request) throws GeneralException, RegisterNotFoundException, NullParameterException, EmptyListException;

    public List<PreferenceValue> getPreferenceValuesByEnterpriseIdAndFieldId(Long enterpriseId, Long fieldId) throws GeneralException, RegisterNotFoundException, NullParameterException, EmptyListException;

    public PreferenceValue loadActivePreferenceValuesByEnterpriseIdAndFieldId(Long enterpriseId, Long fieldId) throws GeneralException, RegisterNotFoundException, NullParameterException;

    public PreferenceField loadPreferenceField(EJBRequest request) throws GeneralException, RegisterNotFoundException, NullParameterException;

    public PreferenceType loadPreferenceType(EJBRequest request) throws GeneralException, RegisterNotFoundException, NullParameterException;

    public PreferenceValue loadPreferenceValue(EJBRequest request) throws GeneralException, RegisterNotFoundException, NullParameterException;

    public PreferenceField savePreferenceField(EJBRequest request) throws GeneralException, NullParameterException;

    public PreferenceType savePreferenceType(EJBRequest request) throws GeneralException, NullParameterException;

    public PreferenceValue savePreferenceValue(EJBRequest request) throws GeneralException, NullParameterException;

    public List<PreferenceValue> savePreferenceValues(EJBRequest request) throws GeneralException, NullParameterException;
}
