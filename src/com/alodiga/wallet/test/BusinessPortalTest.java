package com.alodiga.wallet.test;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.alodiga.wallet.common.ejb.BusinessEJB;
import com.alodiga.wallet.common.ejb.BusinessPortalEJB;
import com.alodiga.wallet.common.ejb.PersonEJB;
import com.alodiga.wallet.common.ejb.ProductEJB;
import com.alodiga.wallet.common.ejb.UtilsEJB;
import com.alodiga.wallet.common.enumeraciones.DocumentTypeE;
import com.alodiga.wallet.common.exception.EmptyListException;
import com.alodiga.wallet.common.exception.GeneralException;
import com.alodiga.wallet.common.exception.NullParameterException;
import com.alodiga.wallet.common.exception.RegisterNotFoundException;
import com.alodiga.wallet.common.genericEJB.EJBRequest;
import com.alodiga.wallet.common.model.Address;
import com.alodiga.wallet.common.model.AddressType;
import com.alodiga.wallet.common.model.AffiliationRequest;
import com.alodiga.wallet.common.model.City;
import com.alodiga.wallet.common.model.CivilStatus;
import com.alodiga.wallet.common.model.CollectionType;
import com.alodiga.wallet.common.model.CollectionsRequest;
import com.alodiga.wallet.common.model.Country;
import com.alodiga.wallet.common.model.DocumentType;
import com.alodiga.wallet.common.model.DocumentsPersonType;
import com.alodiga.wallet.common.model.EdificationType;
import com.alodiga.wallet.common.model.ExchangeRate;
import com.alodiga.wallet.common.model.LegalPerson;
import com.alodiga.wallet.common.model.NaturalPerson;
import com.alodiga.wallet.common.model.OriginApplication;
import com.alodiga.wallet.common.model.Person;
import com.alodiga.wallet.common.model.PersonType;
import com.alodiga.wallet.common.model.PhonePerson;
import com.alodiga.wallet.common.model.PhoneType;
import com.alodiga.wallet.common.model.Product;
import com.alodiga.wallet.common.model.Profession;
import com.alodiga.wallet.common.model.RequestHasCollectionRequest;
import com.alodiga.wallet.common.model.RequestType;
import com.alodiga.wallet.common.model.Sequences;
import com.alodiga.wallet.common.model.State;
import com.alodiga.wallet.common.model.StatusApplicant;
import com.alodiga.wallet.common.model.StreetType;
import com.alodiga.wallet.common.utils.Constants;
import com.alodiga.wallet.common.utils.EjbConstants;
import java.text.ParseException;
import java.text.SimpleDateFormat;
//import com.portal.business.commons.models.Business;

import java.util.HashMap;
import java.util.Map;
import junit.framework.TestCase;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;

public class BusinessPortalTest extends TestCase {

    BusinessPortalEJB businessPortalEJB;
    UtilsEJB utilsEJB;
    PersonEJB personEJB;
    ProductEJB productEJB;
    // BusinessEJB businessEJB;

    @Override
    protected void setUp() throws Exception {
        try {
            Properties props = new Properties();
            props.setProperty("java.naming.factory.initial", "com.sun.enterprise.naming.SerialInitContextFactory");
            props.setProperty("java.naming.factory.url.pkgs", "com.sun.enterprise.naming");
            props.setProperty("java.naming.factory.state", "com.sun.corba.ee.impl.presentation.rmi.JNDIStateFactoryImpl");
            props.setProperty("org.omg.CORBA.ORBInitialHost", "192.168.3.20");
            props.setProperty("org.omg.CORBA.ORBInitialPort", "3700");
            InitialContext intialContext = new InitialContext(props);
            businessPortalEJB = (BusinessPortalEJB) intialContext.lookup(EjbConstants.BUSINESS_PORTAL_EJB);
 //       businessEJB = (BusinessEJB) intialContext.lookup(EjbConstants.BUSINESS_EJB);
            utilsEJB = (UtilsEJB) intialContext.lookup(EjbConstants.UTILS_EJB);
            personEJB = (PersonEJB) intialContext.lookup(EjbConstants.PERSON_EJB);
            productEJB = (ProductEJB) intialContext.lookup(EjbConstants.PRODUCT_EJB);
        } catch (Exception e) {
            e.printStackTrace();
        }

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

    public void _testGetDocumentPersonTypesBypersonTypeId() {
        try {
            List<DocumentsPersonType> documentsPersonTypes;
            documentsPersonTypes = businessPortalEJB.getDocumentPersonTypesBypersonTypeId(1L);
            System.out.println(documentsPersonTypes.size());
            assertTrue(true);
        } catch (EmptyListException e) {
            fail("Error EmptyListException en testGetPersonTypesBycountryId. " + e);
        } catch (NullParameterException e) {
            fail("Error GeneralException en testGetPersonTypesBycountryId. " + e);
        } catch (GeneralException e) {
            fail("Error GeneralException en testGetPersonTypesBycountryId. " + e);
        }

    }

    public void _testGetCollectionTypesBycountryId() {
        try {
            List<CollectionType> collectionTypes;
            collectionTypes = businessPortalEJB.getCollectionTypesBycountryId(1L);
            System.out.println(collectionTypes.size());
            assertTrue(true);
        } catch (EmptyListException e) {
            fail("Error EmptyListException en testGetPersonTypesBycountryId. " + e);
        } catch (NullParameterException e) {
            fail("Error GeneralException en testGetPersonTypesBycountryId. " + e);
        } catch (GeneralException e) {
            fail("Error GeneralException en testGetPersonTypesBycountryId. " + e);
        }

    }

    public void _testGetCollectionRequestsBycollectionTypeId() {
        try {
            List<CollectionsRequest> collectionsRequests;
            collectionsRequests = businessPortalEJB.getCollectionRequestsBycollectionTypeId(1L);
            System.out.println(collectionsRequests.size());
            assertTrue(true);
        } catch (EmptyListException e) {
            fail("Error EmptyListException en testGetPersonTypesBycountryId. " + e);
        } catch (NullParameterException e) {
            fail("Error GeneralException en testGetPersonTypesBycountryId. " + e);
        } catch (GeneralException e) {
            fail("Error GeneralException en testGetPersonTypesBycountryId. " + e);
        }

    }

    public void _testGetCountries() {
        try {
            List<Country> country;
            country = businessPortalEJB.getCountries();
            System.out.println(country.size());
            assertTrue(true);
        } catch (EmptyListException e) {
            fail("Error EmptyListException en testGetPersonTypesBycountryId. " + e);
        } catch (NullParameterException e) {
            fail("Error GeneralException en testGetPersonTypesBycountryId. " + e);
        } catch (GeneralException e) {
            fail("Error GeneralException en testGetPersonTypesBycountryId. " + e);
        }

    }

    public void _testGetStatesByCountryId() {
        try {
            List<State> states;
            states = businessPortalEJB.getStatesByCountryId(1L);
            System.out.println(states.size());
            assertTrue(true);
        } catch (EmptyListException e) {
            fail("Error EmptyListException en testGetPersonTypesBycountryId. " + e);
        } catch (NullParameterException e) {
            fail("Error GeneralException en testGetPersonTypesBycountryId. " + e);
        } catch (GeneralException e) {
            fail("Error GeneralException en testGetPersonTypesBycountryId. " + e);
        }

    }

    public void _testGetCitiesByStateId() {
        try {
            List<City> citys;
            citys = businessPortalEJB.getCitiesByStateId(1L);
            System.out.println(citys.size());
            assertTrue(true);
        } catch (EmptyListException e) {
            fail("Error EmptyListException en testGetPersonTypesBycountryId. " + e);
        } catch (NullParameterException e) {
            fail("Error GeneralException en testGetPersonTypesBycountryId. " + e);
        } catch (GeneralException e) {
            fail("Error GeneralException en testGetPersonTypesBycountryId. " + e);
        }

    }

    public void _testGetSequencesByDocumentType() {
        try {
            List<Sequences> sequenceses;
            EJBRequest request = new EJBRequest();
            Map<String, Object> params = new HashMap<String, Object>();
            String acronym = DocumentTypeE.BUAFRQ.getDocumentTypeAcronym();
            Integer documentTypeId = utilsEJB.getDocumentTypeByCode(acronym);
            params = new HashMap<String, Object>();
            params.put(EjbConstants.PARAM_DOCUMENT_TYPE_ID, documentTypeId);
            request = new EJBRequest();
            request.setParams(params);
//            sequenceses = businessPortalEJB.getSequencesByDocumentType(request);
            //System.out.println(sequenceses.size());
            assertTrue(true);
        } catch (EmptyListException e) {
            fail("Error EmptyListException en testGetPersonTypesBycountryId. " + e);
        } catch (NullParameterException e) {
            fail("Error GeneralException en testGetPersonTypesBycountryId. " + e);
        } catch (GeneralException e) {
            fail("Error GeneralException en testGetPersonTypesBycountryId. " + e);
        } catch (RegisterNotFoundException e) {
            fail("Error GeneralException en testGetPersonTypesBycountryId. " + e);
        }

    }

    public void _testsaveSequences() {
        try {
            Sequences sequenceses = new Sequences();
            EJBRequest request = new EJBRequest();
            request.setParam(1);
//            DocumentType documentType = businessPortalEJB.loadDocumentType(request);
//            sequenceses.setDocumentTypeId(documentType);
            sequenceses.setCurrentValue(10);
            sequenceses.setInitialValue(1);
            request = new EJBRequest();
            request.setParam(1);
//            OriginApplication originApplication = businessPortalEJB.loadOriginApplication(request);
//            sequenceses.setOriginApplicationId(originApplication);
            Sequences sequences = businessPortalEJB.saveSequences(sequenceses);
            System.out.println(sequences.toString());
            assertTrue(true);
        } catch (NullParameterException e) {
            fail("Error GeneralException en testGetPersonTypesBycountryId. " + e);
        } catch (GeneralException e) {
            fail("Error GeneralException en testGetPersonTypesBycountryId. " + e);
        } catch (RegisterNotFoundException e) {
            fail("Error GeneralException en testGetPersonTypesBycountryId. " + e);
        }

    }

    public void testSaveBusinessAffiliationRequestNaturalPerson() {
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
            
            //request type
            RequestType requestType = new RequestType();
            requestType.setCode("SOAFNE");
            requestType.setDescription("Solicitudes de Afiliación de Negocios");
            requestType.setId(1);
            
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
            phonePerson.setIndMainPhone(Boolean.FALSE);
            
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
            AffiliationRequest affiliationRequest  = businessPortalEJB.saveNaturalPersonAffiliationRequest(person, naturalPerson, requestType, phonePerson, address);
            System.out.println(affiliationRequest.toString());
            assertTrue(true);
        } catch (RegisterNotFoundException e) {
            fail("Error EmptyListException en testGetPersonTypesBycountryId. " + e);
        } catch (NullParameterException e) {
            fail("Error GeneralException en testGetPersonTypesBycountryId. " + e);
        } catch (GeneralException e) {
            fail("Error GeneralException en testGetPersonTypesBycountryId. " + e);
        }

    }

    public void _testSaveRequestHasCollectionsRequest() {
        try {
            RequestHasCollectionRequest requestHasCollectionRequest = new RequestHasCollectionRequest();
            EJBRequest request = new EJBRequest();
            request.setParam(2L);
           // BusinessAffiliationRequest businessAffiliationRequestId = utilsEJB.loadBusinessAffiliationRequest(request);
            //requestHasCollectionRequest.setBusinessAffiliationRequestId(businessAffiliationRequestId);
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

    public void _testgetExchangeRateByBeginningDate() throws ParseException {

        EJBRequest request = new EJBRequest();
        request.setParam(1L);
        Date curDate = new Date(2020,8,16);
        SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
        String DateToStr = format.format(curDate);
        Date fechaDate = null;
        fechaDate = format.parse(DateToStr);
        
        String text = "2019-09-26 00:00:00.000000";
            Timestamp dateBirth = Timestamp.valueOf(text);
        try {
            Product product = productEJB.loadProductById(1L);
            ExchangeRate exchangeRate = utilsEJB.getExchangeRateByBeginningDate(product, dateBirth);
            System.out.println(exchangeRate.toString());
            assertTrue(true);
        } catch (GeneralException ex) {
            fail("Error GeneralException en testgetExchangeRateByBeginningDate " + ex);
        } catch (RegisterNotFoundException ex) {
            fail("Error RegisterNotFoundException en testgetExchangeRateByBeginningDate " + ex);
        } catch (NullParameterException ex) {
            fail("Error NullParameterException en testgetExchangeRateByBeginningDate " + ex);
        } catch (EmptyListException ex) {
            fail("Error EmptyListException en testgetExchangeRateByBeginningDate " + ex);
        }

    }

//    public void testGetBusinessById() {
//        try {
//			Business business = businessEJB.getBusinessById(1L);
//			System.out.println(business.toString());
//			assertTrue(true);
//		} catch (com.portal.business.commons.exceptions.NullParameterException e) {
//			fail("Error EmptyListException en testGetBusinessById. " + e);
//		} catch (com.portal.business.commons.exceptions.GeneralException e) {
//			fail("Error GeneralException en testGetBusinessById. " + e);
//		}
//
//    }
//    public void testGetAll() {
//        try {
//        	List<Business> business = businessEJB.getAll();
//			System.out.println(business.size());
//			assertTrue(true);
//		} catch (com.portal.business.commons.exceptions.EmptyListException e) {
//			fail("Error EmptyListException en testGetAll. " + e);
//		} catch (com.portal.business.commons.exceptions.GeneralException e) {
//			fail("Error GeneralException en testGetAll. " + e);
//		}
//
//    }
    
    
  public void _testBusinessAffiliationRequest() {

//	  	EJBRequest request = new EJBRequest();
//		request.setParam(2L);
//		try {
//			businessPortalEJB.loadBusinessAffiliationRequest(request);
//			assertTrue(true);
//		} catch (RegisterNotFoundException e) {
//			fail("Error RegisterNotFoundException en testBusinessAffiliationRequest. " + e);
//		} catch (NullParameterException e) {
//			fail("Error NullParameterException en testBusinessAffiliationRequest. " + e);
//		} catch (GeneralException e) {
//			fail("Error GeneralException en testBusinessAffiliationRequest. " + e);
//		}


}
    

   
}
