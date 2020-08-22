package com.alodiga.wallet.common.ejb;

import java.util.List;
import javax.ejb.Remote;
import com.alodiga.wallet.common.exception.EmptyListException;
import com.alodiga.wallet.common.exception.GeneralException;
import com.alodiga.wallet.common.exception.NullParameterException;
import com.alodiga.wallet.common.exception.RegisterNotFoundException;
import com.alodiga.wallet.common.genericEJB.EJBRequest;
import com.alodiga.wallet.common.genericEJB.WalletGenericEJB;
import com.alodiga.wallet.common.model.ComercialAgency;
import com.alodiga.wallet.common.model.DocumentsPersonType;
import com.alodiga.wallet.common.model.EmployedPosition;
import com.alodiga.wallet.common.model.Employee;
import com.alodiga.wallet.common.model.LegalPerson;
import com.alodiga.wallet.common.model.LegalRepresentative;
import com.alodiga.wallet.common.model.PersonClassification;
import com.alodiga.wallet.common.model.NaturalPerson;
import com.alodiga.wallet.common.model.Person;
import com.alodiga.wallet.common.model.PersonType;
import com.alodiga.wallet.common.model.PhonePerson;
import com.alodiga.wallet.common.model.PhoneType;
import com.alodiga.wallet.common.model.PersonHasAddress;
import com.alodiga.wallet.common.model.StatusApplicant;

@SuppressWarnings(value = {"all"})
@Remote
public interface PersonEJB extends WalletGenericEJB {

    //DocumentPersonType
    public List<DocumentsPersonType> getDocumentsPersonType(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
    public DocumentsPersonType loadDocumentsPersonType(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;
    public DocumentsPersonType saveDocumentsPersonType(DocumentsPersonType documentsPersonType) throws RegisterNotFoundException, NullParameterException, GeneralException;
    public List<DocumentsPersonType> getDocumentsPersonByCountry(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;

    //Tabla de PersonType
    public List<PersonType> getPersonTypes(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
    public List<PersonType> getPersonTypeByCountry(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
    public PersonType loadPersonType(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;
    public PersonType savePersonType(PersonType personType) throws RegisterNotFoundException, NullParameterException, GeneralException;

    //Tabla de PhonePerson
    public List<PhonePerson> getPhonePerson(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
    public List<PhonePerson> getPhoneByPerson(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
    public PhonePerson loadPhonePerson(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;
    public PhonePerson savePhonePerson(PhonePerson phonePerson) throws RegisterNotFoundException, NullParameterException, GeneralException;
    public List<PhonePerson> getValidateMainPhone(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;

    //PersonHasAddress
    public List<PersonHasAddress> getPersonHasAddresses(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
    public List<PersonHasAddress> getPersonHasAddressesByPerson(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
    public PersonHasAddress loadPersonHasAddress(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;
    public PersonHasAddress savePersonHasAddress(PersonHasAddress personHasAddress) throws RegisterNotFoundException, NullParameterException, GeneralException;

    
    //LegalRepresentative
    public List<LegalRepresentative> getLegalRepresentative(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
    public LegalRepresentative loadLegalRepresentative(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;
    public LegalRepresentative saveLegalRepresentative(LegalRepresentative legalRepresentative) throws RegisterNotFoundException, NullParameterException, GeneralException;

    //Person
    public List<Person> getPerson(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
    public Person loadPerson(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;
    public Person savePerson(Person person) throws RegisterNotFoundException, NullParameterException, GeneralException;
    
    //Natural Person
    public List<NaturalPerson> getNaturalPerson(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
    public NaturalPerson loadNaturalPerson(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;
    public NaturalPerson saveNaturalPerson(NaturalPerson naturalPerson) throws RegisterNotFoundException, NullParameterException, GeneralException;

    //Legal Person
    public List<LegalPerson> getLegalPerson(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
    public List<LegalPerson> getLegalPersonByLegalRepresentative(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
    public LegalPerson loadLegalPerson(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;
    public LegalPerson saveLegalPerson(LegalPerson legalPerson) throws RegisterNotFoundException, NullParameterException, GeneralException;
    
    //StatusApplicant
    public List<StatusApplicant> getStatusApplicant(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
    public StatusApplicant loadStatusApplicant(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;
    public StatusApplicant saveStatusApplicant(StatusApplicant statusApplicant) throws RegisterNotFoundException, NullParameterException, GeneralException;

    //Employee
    public List<Employee> getEmployee(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
    public Employee saveEmployee(Employee employee)  throws RegisterNotFoundException, NullParameterException, GeneralException;
    
    //Tabla de PersonClassification 
    public PersonClassification loadPersonClassification(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;
    
    //ComercialAgency
    public List<ComercialAgency> getComercialAgency(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;

    //EmployedPosition
    public List<EmployedPosition> getEmployedPosition(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
    
    //PhoneType
    public List<PhoneType> getPhoneType(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
}
