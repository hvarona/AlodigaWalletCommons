package com.alodiga.wallet.common.ejb;

import java.util.List;
import javax.ejb.Remote;
import com.alodiga.wallet.common.exception.EmptyListException;
import com.alodiga.wallet.common.exception.GeneralException;
import com.alodiga.wallet.common.exception.NullParameterException;
import com.alodiga.wallet.common.exception.RegisterNotFoundException;
import com.alodiga.wallet.common.genericEJB.EJBRequest;
import com.alodiga.wallet.common.genericEJB.WalletGenericEJB;
import com.alodiga.wallet.common.model.City;
import com.alodiga.wallet.common.model.Country;
import com.alodiga.wallet.common.model.County;
import com.alodiga.wallet.common.model.Currency;
import com.alodiga.wallet.common.model.Enterprise;
import com.alodiga.wallet.common.model.Language;
import com.alodiga.wallet.common.model.Period;
import com.alodiga.wallet.common.model.Sms;
import com.alodiga.wallet.common.model.State;
import com.alodiga.wallet.common.utils.Mail;
import java.sql.Timestamp;
import java.util.Date;

@SuppressWarnings(value = {"all"})
@Remote
public interface UtilsEJB extends WalletGenericEJB {

    public List<City> getCitiesByCounty(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;

    public List<City> getCitiesByState(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;

    public List<County> getCountiesByState(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;

    public List<Country> getCountries(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;

    public List<Country> getCountries() throws EmptyListException, GeneralException, NullParameterException;

    public List<Currency> getCurrencies() throws EmptyListException, GeneralException, NullParameterException;

    public List<Enterprise> getEnterprises() throws EmptyListException, GeneralException, NullParameterException;

    public List<Language> getLanguages() throws EmptyListException, GeneralException, NullParameterException;

    public List<Period> getPeriods() throws EmptyListException, GeneralException, NullParameterException;

    public List<State> getStateByCountry(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;

    public City loadCity(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;

    public Country loadCountry(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;

    public County loadCounty(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;

    public Currency loadCurrency(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;

    public  Enterprise loadEnterprisebyId(Long enterpriseId) throws GeneralException;
    
    public Enterprise loadEnterprise(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;

    public Language loadLanguage(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;

    public Period loadPeriod(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;

    public State loadState(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;
    
    public Enterprise saveEnterprise(EJBRequest request) throws NullParameterException, GeneralException;

    public Country loadCountryByName(String name) throws RegisterNotFoundException, NullParameterException, GeneralException;

    public Country searchCountry(String name) throws RegisterNotFoundException, NullParameterException, GeneralException;

    public Country saveCountry(Country country) throws NullParameterException, GeneralException;

    public void deleteEnterpriseHasTinType(Long enterpriseId) throws NullParameterException, GeneralException;

    public Country loadCountryByShortName(String referenceCode) throws RegisterNotFoundException, NullParameterException, GeneralException;

    public Sms saveSMS(EJBRequest request) throws NullParameterException, GeneralException;

    public Period loadperiod(Period period) throws RegisterNotFoundException, NullParameterException, GeneralException;

}
