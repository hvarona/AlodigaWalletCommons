package com.alodiga.wallet.test;


import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.alodiga.wallet.common.ejb.BusinessPortalEJB;
import com.alodiga.wallet.common.ejb.PersonEJB;
import com.alodiga.wallet.common.ejb.UtilsEJB;
import com.alodiga.wallet.common.exception.EmptyListException;
import com.alodiga.wallet.common.exception.GeneralException;
import com.alodiga.wallet.common.exception.NullParameterException;
import com.alodiga.wallet.common.exception.RegisterNotFoundException;
import com.alodiga.wallet.common.genericEJB.EJBRequest;
import com.alodiga.wallet.common.model.Address;
import com.alodiga.wallet.common.model.AddressType;
import com.alodiga.wallet.common.model.BusinessAffiliationRequest;
import com.alodiga.wallet.common.model.City;
import com.alodiga.wallet.common.model.CivilStatus;
import com.alodiga.wallet.common.model.CollectionsRequest;
import com.alodiga.wallet.common.model.DocumentsPersonType;
import com.alodiga.wallet.common.model.EdificationType;
import com.alodiga.wallet.common.model.LegalPerson;
import com.alodiga.wallet.common.model.NaturalPerson;
import com.alodiga.wallet.common.model.Person;
import com.alodiga.wallet.common.model.PersonType;
import com.alodiga.wallet.common.model.PhonePerson;
import com.alodiga.wallet.common.model.PhoneType;
import com.alodiga.wallet.common.model.Profession;
import com.alodiga.wallet.common.model.RequestHasCollectionRequest;
import com.alodiga.wallet.common.model.StatusApplicant;
import com.alodiga.wallet.common.model.StreetType;
import com.alodiga.wallet.common.utils.EjbConstants;

import junit.framework.TestCase;
import java.util.Properties;
import javax.naming.InitialContext;

public class BusinessPortalTest extends TestCase {

    BusinessPortalEJB businessPortalEJB;
    UtilsEJB utilsEJB;
    PersonEJB personEJB;

    @Override
    protected void setUp() throws Exception {
        Properties props = new Properties();
        props.setProperty("java.naming.factory.initial", "com.sun.enterprise.naming.SerialInitContextFactory");
        props.setProperty("java.naming.factory.url.pkgs", "com.sun.enterprise.naming");
        props.setProperty("java.naming.factory.state", "com.sun.corba.ee.impl.presentation.rmi.JNDIStateFactoryImpl");
        props.setProperty("org.omg.CORBA.ORBInitialHost", "localhost");
        props.setProperty("org.omg.CORBA.ORBInitialPort", "3700");
        InitialContext intialContext = new InitialContext(props);
        businessPortalEJB = (BusinessPortalEJB) intialContext.lookup(EjbConstants.BUSINESS_PORTAL_EJB);
        utilsEJB = (UtilsEJB) intialContext.lookup(EjbConstants.UTILS_EJB);
        personEJB = (PersonEJB) intialContext.lookup(EjbConstants.PERSON_EJB);

    }


    public void _testGetPersonTypesBycountryId() {
        try {
            List<PersonType> personTypes;
            personTypes = businessPortalEJB.getPersonTypesBycountryId(1L);
            System.out.println(personTypes.size());
            assertTrue(true);
        } catch (EmptyListException e) {
            fail("Error EmptyListException en testGetPersonTypesBycountryId. " + e);
        } catch (NullParameterException e) {
            fail("Error GeneralException en testGetPersonTypesBycountryId. " + e);
        } catch (GeneralException e) {
            fail("Error GeneralException en testGetPersonTypesBycountryId. " + e);
        }

    }
    
    public void _testSaveBusinessAffiliationRequestNaturalPerson() {
        try {
        	//Person
			Person person = new Person();
			EJBRequest request = new EJBRequest();
			request.setParam(1L);
			City city = utilsEJB.loadCity(request);
			person.setCountryId(city.getStateId().getCountryId());
			person.setCreateDate(new Timestamp(new Date().getTime()));
			person.setEmail("test@gmail.com");
			request = new EJBRequest();
		    request.setParam(1);
			PersonType personType = personEJB.loadPersonType(request);
			person.setPersonTypeId(personType);
			person.setWebSite("www.test.com");
			//Natural Person
			NaturalPerson naturalPerson = new NaturalPerson();
			naturalPerson.setCreateDate(new Timestamp(new Date().getTime()));
			String text = "1989-10-02 01:02:03.123456789";
			Timestamp dateBirth = Timestamp.valueOf(text);
			naturalPerson.setDateBirth(dateBirth);
			request = new EJBRequest();
		    request.setParam(1);
		    DocumentsPersonType documentsPersonType = personEJB.loadDocumentsPersonType(request);
			naturalPerson.setDocumentsPersonTypeId(documentsPersonType);
			text = "2022-10-02 01:02:03.123456789";
			Timestamp dueDateDocumentIdentification = Timestamp.valueOf(text);
			naturalPerson.setDueDateDocumentIdentification(dueDateDocumentIdentification);
			request = new EJBRequest();
		    request.setParam(1);
			CivilStatus civilStatus = personEJB.loadCivilStatus(request);
			naturalPerson.setCivilStatusId(civilStatus);
			naturalPerson.setFirstName("Nombre");
			naturalPerson.setLastName("Apellido");
			naturalPerson.setGender("F");
			naturalPerson.setIdentificationNumber("12345678");
			naturalPerson.setPlaceBirth("Caracas");
			request = new EJBRequest();
		    request.setParam(1);
			Profession profession = personEJB.loadProfession(request);
			naturalPerson.setProfessionId(profession);
			request = new EJBRequest();
		    request.setParam(1);
			StatusApplicant statusApplicant = personEJB.loadStatusApplicant(request);
			naturalPerson.setStatusApplicantId(statusApplicant);
			//LegalPerson
			LegalPerson legalPerson = null;
			//PhonePerson
			PhonePerson phonePerson = new PhonePerson();
			phonePerson.setAreaCode("0212");
			phonePerson.setCountryId(city.getStateId().getCountryId());
			phonePerson.setCountryCode("58");
			phonePerson.setCreateDate(new Timestamp(new Date().getTime()));
			request = new EJBRequest();
		    request.setParam(1);
			PhoneType phoneType = personEJB.loadPhoneType(request);
			phonePerson.setPhoneTypeId(phoneType);
			phonePerson.setNumberPhone("6712325");
			//Address
			Address address = new Address();
			address.setCountryId(city.getStateId().getCountryId());
			address.setCityId(city);
			address.setAddressLine1("addresLine1");
			address.setAddressLine2("addressLine2");
			address.setZipCode("12345");
			request = new EJBRequest();
		    request.setParam(1);
			AddressType addressType = personEJB.loadAddressType(request);
			address.setAddressTypeId(addressType);
			EdificationType edificationType = personEJB.loadEdificationType(request);
			address.setEdificationTypeId(edificationType);
			address.setFloor(1);
			address.setIndMainAddress(true);
			address.setNameEdification("nameEdification");
			address.setTower("Torre");
			address.setNameStreet("nameStreet");
			address.setUrbanization("urbanization");
			StreetType streetType = personEJB.loadStreetType(request);
			address.setStreetTypeId(streetType);
			BusinessAffiliationRequest a = businessPortalEJB.saveBusinessAffiliationRequest(person, naturalPerson,legalPerson, phonePerson, address);
			System.out.println(a.toString());
            assertTrue(true);
        }  catch (RegisterNotFoundException e) {
            fail("Error EmptyListException en testGetPersonTypesBycountryId. " + e);
        } catch (NullParameterException e) {
            fail("Error GeneralException en testGetPersonTypesBycountryId. " + e);
        } catch (GeneralException e) {
            fail("Error GeneralException en testGetPersonTypesBycountryId. " + e);
        }

    }
    
    public void testSaveRequestHasCollectionsRequest() {
        try {
            RequestHasCollectionRequest requestHasCollectionRequest = new RequestHasCollectionRequest();
            EJBRequest request = new EJBRequest();
			request.setParam(2L);
            BusinessAffiliationRequest businessAffiliationRequestId = utilsEJB.loadBusinessAffiliationRequest(request);
            requestHasCollectionRequest.setBusinessAffiliationRequestId(businessAffiliationRequestId);
            request = new EJBRequest();
			request.setParam(6);
            CollectionsRequest collectionsRequestId = utilsEJB.loadCollectionsRequest(request);
            requestHasCollectionRequest.setCollectionsRequestId(collectionsRequestId);
            requestHasCollectionRequest.setImageFileUrl("C:\\Users\\yamea\\OneDrive\\Imagenes\\ejemplo.jpg");
            requestHasCollectionRequest.setCreateDate(new Timestamp(new Date().getTime()));
//            short approved = 0;
//            requestHasCollectionRequest.setIndApproved(approved);
            requestHasCollectionRequest = businessPortalEJB.saveRequestHasCollectionsRequest(requestHasCollectionRequest);
            System.out.println(requestHasCollectionRequest.toString());
            assertTrue(true);
        } catch (RegisterNotFoundException e) {
            fail("Error EmptyListException en testGetPersonTypesBycountryId. " + e);
        } catch (NullParameterException e) {
            fail("Error GeneralException en testGetPersonTypesBycountryId. " + e);
        } catch (GeneralException e) {
            fail("Error GeneralException en testGetPersonTypesBycountryId. " + e);
        }

    }
    
    

   
}
