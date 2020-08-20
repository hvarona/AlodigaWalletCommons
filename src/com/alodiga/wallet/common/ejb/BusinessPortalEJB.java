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
import com.alodiga.wallet.common.model.Address;
import com.alodiga.wallet.common.model.BusinessAffiliationRequest;
import com.alodiga.wallet.common.model.City;
import com.alodiga.wallet.common.model.CollectionType;
import com.alodiga.wallet.common.model.CollectionsRequest;
import com.alodiga.wallet.common.model.Country;
import com.alodiga.wallet.common.model.DocumentsPersonType;
import com.alodiga.wallet.common.model.Enterprise;
import com.alodiga.wallet.common.model.LegalPerson;
import com.alodiga.wallet.common.model.NaturalPerson;
import com.alodiga.wallet.common.model.Person;
import com.alodiga.wallet.common.model.PersonType;
import com.alodiga.wallet.common.model.PhonePerson;
import com.alodiga.wallet.common.model.RequestHasCollectionRequest;
import com.alodiga.wallet.common.model.Sequences;
import com.alodiga.wallet.common.model.State;
import com.alodiga.wallet.common.model.TransactionApproveRequest;	


@SuppressWarnings(value = {"all"})
@Remote
public interface BusinessPortalEJB extends WalletGenericEJB {

    public List<PersonType> getPersonTypesBycountryId(Long countryId) throws EmptyListException, GeneralException, NullParameterException;

    public  List<DocumentsPersonType> getDocumentPersonTypesBypersonTypeId(Long personTypeId)throws EmptyListException, GeneralException, NullParameterException;
    
    public List<CollectionType> getCollectionTypesBycountryId(Long countryId) throws EmptyListException, GeneralException, NullParameterException;
    
    public List<CollectionsRequest> getCollectionRequestsBycollectionTypeId(Long collectionTypeId) throws EmptyListException, GeneralException, NullParameterException;
    
    public List<Country> getCountries() throws EmptyListException, GeneralException, NullParameterException;
    
    public List<State> getStatesByCountryId(Long countryId) throws EmptyListException, GeneralException, NullParameterException;
    
    public List<City> getCitiesByStateId(Long stateId) throws EmptyListException, GeneralException, NullParameterException;
    
    public List<Sequences> getSequencesByDocumentType (EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
      
    public String generateNumberSequence(List<Sequences> sequence, int originApplication) throws GeneralException, RegisterNotFoundException, NullParameterException;
    
    public Sequences saveSequences(Sequences sequence) throws RegisterNotFoundException, NullParameterException, GeneralException;
       
    public BusinessAffiliationRequest saveBusinessAffiliationRequest(Person person, NaturalPerson naturalPerson,LegalPerson legalPerson, PhonePerson phonePerson, Address address)throws NullParameterException, GeneralException;
    
    public RequestHasCollectionRequest saveRequestHasCollectionsRequest(RequestHasCollectionRequest requestHasCollectionsRequest) throws NullParameterException, GeneralException;
}

