package com.alodiga.wallet.common.ejb;

import java.util.List;

import javax.ejb.Remote;

import com.alodiga.wallet.common.exception.EmptyListException;
import com.alodiga.wallet.common.exception.GeneralException;
import com.alodiga.wallet.common.exception.NullParameterException;
import com.alodiga.wallet.common.exception.RegisterNotFoundException;
import com.alodiga.wallet.common.genericEJB.EJBRequest;
import com.alodiga.wallet.common.genericEJB.WalletGenericEJB;
import com.alodiga.wallet.common.model.AccountBank;
import com.alodiga.wallet.common.model.AccountTypeBank;
import com.alodiga.wallet.common.model.Address;
import com.alodiga.wallet.common.model.AddressType;
import com.alodiga.wallet.common.model.Bank;
import com.alodiga.wallet.common.model.AffiliationRequest;
import com.alodiga.wallet.common.model.BusinessCategory;
import com.alodiga.wallet.common.model.City;
import com.alodiga.wallet.common.model.CivilStatus;
import com.alodiga.wallet.common.model.CollectionType;
import com.alodiga.wallet.common.model.CollectionsRequest;
import com.alodiga.wallet.common.model.Country;
import com.alodiga.wallet.common.model.Currency;
import com.alodiga.wallet.common.model.DocumentType;
import com.alodiga.wallet.common.model.DocumentsPersonType;
import com.alodiga.wallet.common.model.EdificationType;
import com.alodiga.wallet.common.model.LegalPerson;
import com.alodiga.wallet.common.model.LegalRepresentative;
import com.alodiga.wallet.common.model.NaturalPerson;
import com.alodiga.wallet.common.model.OriginApplication;
import com.alodiga.wallet.common.model.Person;
import com.alodiga.wallet.common.model.PersonClassification;
import com.alodiga.wallet.common.model.PersonType;
import com.alodiga.wallet.common.model.PhonePerson;
import com.alodiga.wallet.common.model.PhoneType;
import com.alodiga.wallet.common.model.Profession;
import com.alodiga.wallet.common.model.PreferenceValue;
import com.alodiga.wallet.common.model.RequestHasCollectionRequest;
import com.alodiga.wallet.common.model.RequestType;
import com.alodiga.wallet.common.model.Sequences;
import com.alodiga.wallet.common.model.State;
import com.alodiga.wallet.common.model.StatusAccountBank;
import com.alodiga.wallet.common.model.StatusApplicant;
import com.alodiga.wallet.common.model.StreetType;
import com.alodiga.wallet.common.model.TransactionApproveRequest;	
import java.util.Date;



@Remote
public interface BusinessPortalEJB extends WalletGenericEJB {

//Getters de Lista
public List<AccountBank> getAccountBanksByBusiness(Long businessId)throws EmptyListException, GeneralException, NullParameterException;
public List<AccountTypeBank> getAccountTypeBanks(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
public List<AddressType> getAddressType(EJBRequest request)throws EmptyListException, GeneralException, NullParameterException;
public List<Bank> getBanks (EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
public List<BusinessCategory> getBusinessCategories(EJBRequest request)throws EmptyListException, GeneralException, NullParameterException;
public List<City> getCitiesByStateId(Long stateId) throws EmptyListException, GeneralException, NullParameterException;
public List<CivilStatus> getCivilStatus(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
public List<CollectionType> getCollectionTypesBycountryId(Long countryId) throws EmptyListException, GeneralException, NullParameterException;
public List<CollectionsRequest> getCollectionRequestsBycollectionTypeId(Long collectionTypeId) throws EmptyListException, GeneralException, NullParameterException;
public List<CollectionsRequest> getCollectionRequestsByPersonTypeId(Long personTypeId) throws EmptyListException, GeneralException, NullParameterException;
public List<Country> getCountries() throws EmptyListException, GeneralException, NullParameterException;
public List<Currency> getCurrencies(EJBRequest request)throws EmptyListException, GeneralException, NullParameterException;
public List<DocumentsPersonType> getDocumentPersonTypesBypersonTypeId(Long personTypeId)throws EmptyListException, GeneralException, NullParameterException;
public List<EdificationType> getEdificationType(EJBRequest request)throws EmptyListException, GeneralException, NullParameterException;
public List<PersonType> getPersonTypesBycountryId(Long countryId) throws EmptyListException, GeneralException, NullParameterException;
public List<PhoneType> getPhoneType(EJBRequest request)throws EmptyListException, GeneralException, NullParameterException;
public List<Profession> getProfession(EJBRequest request)throws EmptyListException, GeneralException, NullParameterException;
public List<State> getStatesByCountryId(Long countryId) throws EmptyListException, GeneralException, NullParameterException;
public List<StatusAccountBank> getStatusAccountBanks(EJBRequest request)throws EmptyListException, GeneralException, NullParameterException;
public List<StatusApplicant> getStatusApplicant(EJBRequest request)throws EmptyListException, GeneralException, NullParameterException;
public List<StreetType> getStreetType(EJBRequest request)throws EmptyListException, GeneralException, NullParameterException;
public List<PreferenceValue> getDiscountRateByBusiness(Long businessId, Long productId, Long transactionTypeId) throws EmptyListException, GeneralException, NullParameterException;
public List<PreferenceValue> getDiscountRateByBusinessAndValidityDate(Long businessId, Date validityDate, Long productId, Long transactionTypeId) throws EmptyListException, GeneralException, NullParameterException;
    
  //Getters Individuales
  public AccountBank loadAccountBankById(Long id) throws RegisterNotFoundException, NullParameterException, GeneralException;
  public AccountTypeBank loadAccountTypeBankById(Integer id) throws RegisterNotFoundException, NullParameterException, GeneralException;
  public AffiliationRequest loadAffiliationRequestById(Long id) throws RegisterNotFoundException, NullParameterException, GeneralException;
  public Bank loadBankById(Long id) throws RegisterNotFoundException, NullParameterException, GeneralException;
  public BusinessCategory loadBusinessCategoryById(Integer id) throws RegisterNotFoundException, NullParameterException, GeneralException;
  public Currency loadCurrencyById(Long id) throws RegisterNotFoundException, NullParameterException, GeneralException;
  public DocumentType loadDocumentTypeById(Integer id) throws RegisterNotFoundException, NullParameterException, GeneralException;
  public OriginApplication loadOriginApplicationById(Integer id) throws RegisterNotFoundException, NullParameterException, GeneralException;
  public PhoneType loadPhoneTypeById(Integer id) throws RegisterNotFoundException, NullParameterException, GeneralException;
  public RequestType loadRequestTypeByCode(String code)throws RegisterNotFoundException, NullParameterException, GeneralException;
  public StatusAccountBank loadStatusAccountBankById(Integer id) throws RegisterNotFoundException, NullParameterException, GeneralException;
  public StatusApplicant loadStatusApplicantById(Integer id) throws RegisterNotFoundException, NullParameterException, GeneralException;
    
  //Secuencias de los Documentos
  public List<Sequences> getSequencesByDocumentType(Integer documentTypeId) throws EmptyListException, GeneralException, NullParameterException;    
  public String generateNumberSequence(List<Sequences> sequence, int originApplication) throws GeneralException, RegisterNotFoundException, NullParameterException;
  public Sequences saveSequences(Sequences sequence) throws RegisterNotFoundException, NullParameterException, GeneralException;
       
  //Guardar Solicitud de Afiliacion del Negocio
  public AffiliationRequest saveNaturalPersonAffiliationRequest(Person person, NaturalPerson naturalPerson,RequestType requestType, PhonePerson phonePerson, Address address)throws NullParameterException, GeneralException;
  public AffiliationRequest saveLegalPersonAffiliationRequest(Person person, LegalPerson legalPerson,RequestType requestType, PhonePerson phonePerson, Address address, LegalRepresentative legalRepresentative)throws NullParameterException, GeneralException;
  public RequestHasCollectionRequest saveRequestHasCollectionsRequest(RequestHasCollectionRequest requestHasCollectionsRequest) throws NullParameterException, GeneralException;    
  
  //Guarda Cuenta Bancaria del Negocio
  public AccountBank saveAccountBank(AccountBank accountBank) throws RegisterNotFoundException, NullParameterException, GeneralException;    
        
}

