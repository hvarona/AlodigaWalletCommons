package com.alodiga.wallet.test;


import java.util.List;

import com.alodiga.wallet.common.ejb.BusinessPortalEJB;
import com.alodiga.wallet.common.exception.EmptyListException;
import com.alodiga.wallet.common.exception.GeneralException;
import com.alodiga.wallet.common.exception.NullParameterException;
import com.alodiga.wallet.common.model.PersonType;
import com.alodiga.wallet.common.utils.EjbConstants;

import junit.framework.TestCase;
import java.util.Properties;
import javax.naming.InitialContext;

public class BusinessPortalTest extends TestCase {

    BusinessPortalEJB businessPortalEJB;

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

    }


    public void testGetPersonTypesBycountryId() {
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

   
}
