package com.alodiga.wallet.common.utils;

import com.alodiga.wallet.common.exception.InvalidEjbReferenceException;
import com.alodiga.wallet.common.genericEJB.WalletGenericEJB;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import org.apache.log4j.Logger;

public class EJBServiceLocator {

    private static Logger log = Logger.getLogger(EJBServiceLocator.class);
    private InitialContext initalContext;
    private Map<String, WalletGenericEJB> cache;
    private static EJBServiceLocator theInstance;

    public static EJBServiceLocator getInstance() {
        if (theInstance == null) {
            theInstance = new EJBServiceLocator();
        }
        return theInstance;
    }

    private EJBServiceLocator() {
        try {
            Properties props = System.getProperties();
            props.setProperty("java.naming.factory.initial", "com.sun.enterprise.naming.SerialInitContextFactory");
            props.setProperty("java.naming.factory.url.pkgs", "com.sun.enterprise.naming");
            props.setProperty("java.naming.factory.state", "com.sun.corba.ee.impl.presentation.rmi.JNDIStateFactoryImpl");
            props.setProperty("org.omg.CORBA.ORBInitialHost", EjbConstants.SERVER);
            props.setProperty("org.omg.CORBA.ORBInitialPort", EjbConstants.PORT);
            this.initalContext = new InitialContext(props);
            this.cache = Collections.synchronizedMap(new HashMap<String, WalletGenericEJB>());
        } catch (NamingException ex) {
            log.error("Error creating EJB Service Locator", ex);
        }
    }

    public WalletGenericEJB get(String jndiName) {
    	WalletGenericEJB ret = null;
        try {
            if (this.cache.containsKey(jndiName)) {
                ret = this.cache.get(jndiName);
                try {
                    ret.echo();
                } catch (Exception e) {
                    ret = (WalletGenericEJB) initalContext.lookup(jndiName);
                    this.cache.put(jndiName, ret);
                }
            } else {
                ret = (WalletGenericEJB) initalContext.lookup(jndiName);
                this.cache.put(jndiName, ret);
            }
            return ret;
        } catch (Exception ex) {
            log.error("Error in EJBServiceLocator CTX lookup", ex);
            return null;
        }
    }

    public WalletGenericEJB get(String jndiName, Logger logger) throws InvalidEjbReferenceException {
    	WalletGenericEJB ret = null;
        try {
            if (this.cache.containsKey(jndiName)) {
                ret = this.cache.get(jndiName);
                try {
                    ret.echo();
                } catch (Exception e) {
                    ret = (WalletGenericEJB) initalContext.lookup(jndiName);
                    this.cache.put(jndiName, ret);
                }
            } else {
                ret = (WalletGenericEJB) initalContext.lookup(jndiName);
                this.cache.put(jndiName, ret);
            }
            if (ret == null) {
                logger.error("Error getting EJB reference: " + jndiName);
                throw new InvalidEjbReferenceException("Error getting EJB reference: " + jndiName, jndiName);
            }
            return ret;
        } catch (InvalidEjbReferenceException e) {
            throw e;
        } catch (Exception ex) {
            log.error("Error in EJBServiceLocator CTX lookup", ex);
            throw new InvalidEjbReferenceException("Error getting EJB reference: " + jndiName + " " + ex.getMessage(), ex.getStackTrace(), jndiName);
        }
    }

    public WalletGenericEJB get(String jndiName, String server, String port) {
        return get(jndiName);
    }

    public WalletGenericEJB get(String jndiName, String server, String port, Logger logger) throws InvalidEjbReferenceException {
        return get(jndiName, logger);
    }
}
