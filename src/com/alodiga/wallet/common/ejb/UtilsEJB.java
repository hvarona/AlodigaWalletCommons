package com.alodiga.wallet.common.ejb;

import java.util.List;
import javax.ejb.Remote;
import com.alodiga.wallet.common.exception.EmptyListException;
import com.alodiga.wallet.common.exception.GeneralException;
import com.alodiga.wallet.common.exception.NullParameterException;
import com.alodiga.wallet.common.exception.RegisterNotFoundException;
import com.alodiga.wallet.common.genericEJB.EJBRequest;
import com.alodiga.wallet.common.genericEJB.WalletGenericEJB;
import com.alodiga.wallet.common.model.Bank;
import com.alodiga.wallet.common.model.BankOperation;
import com.alodiga.wallet.common.model.BankOperationMode;
import com.alodiga.wallet.common.model.BankOperationType;
import com.alodiga.wallet.common.model.City;
import com.alodiga.wallet.common.model.Close;
import com.alodiga.wallet.common.model.Commission;
import com.alodiga.wallet.common.model.CommissionItem;
import com.alodiga.wallet.common.model.Country;
import com.alodiga.wallet.common.model.County;
import com.alodiga.wallet.common.model.Currency;
import com.alodiga.wallet.common.model.Enterprise;
import com.alodiga.wallet.common.model.ExchangeRate;
import com.alodiga.wallet.common.model.Language;
import com.alodiga.wallet.common.model.Period;
import com.alodiga.wallet.common.model.Sms;
import com.alodiga.wallet.common.model.State;
import com.alodiga.wallet.common.model.Transaction;
import com.alodiga.wallet.common.model.TransactionType;
import java.util.Date;

@SuppressWarnings(value = {"all"})
@Remote
public interface UtilsEJB extends WalletGenericEJB {

    //City
    public List<City> getCitiesByCounty(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;

    public List<City> getCitiesByState(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;

    public City loadCity(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;

    //County
    public List<County> getCountiesByState(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;

    public County loadCounty(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;

    //Country
    public List<Country> getCountries(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;

    public List<Country> getCountries() throws EmptyListException, GeneralException, NullParameterException;

    public Country loadCountry(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;

    public Country loadCountryByName(String name) throws RegisterNotFoundException, NullParameterException, GeneralException;

    public Country searchCountry(String name) throws RegisterNotFoundException, NullParameterException, GeneralException;
    
    public Country saveCountry(Country country) throws RegisterNotFoundException, NullParameterException, GeneralException;

    public Country loadCountryByShortName(String referenceCode) throws RegisterNotFoundException, NullParameterException, GeneralException;

    //Currency
    public List<Currency> getCurrency(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
    
    public List<Currency> getCurrencies() throws EmptyListException, GeneralException, NullParameterException;
    
    public List<Currency> getSearchCurrency(String name) throws EmptyListException, GeneralException, NullParameterException;

    public Currency loadCurrency(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;
    
    public Currency saveCurrency(Currency currency) throws RegisterNotFoundException, NullParameterException, GeneralException;

    //Enterprise
    public List<Enterprise> getEnterprises(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
    
    public List<Enterprise> getEnterprises() throws EmptyListException, GeneralException, NullParameterException;

    public Enterprise loadEnterprisebyId(Long enterpriseId) throws GeneralException;

    public Enterprise loadEnterprise(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;

    public Enterprise saveEnterprise(EJBRequest request) throws NullParameterException, GeneralException;

    public void deleteEnterpriseHasTinType(Long enterpriseId) throws NullParameterException, GeneralException;

    //Language
    public List<Language> getLanguages() throws EmptyListException, GeneralException, NullParameterException;

    public Language loadLanguage(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;

    //Period
    public List<Period> getPeriods() throws EmptyListException, GeneralException, NullParameterException;

    public Period loadPeriod(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;

    public Period loadperiod(Period period) throws RegisterNotFoundException, NullParameterException, GeneralException;

    //State
    public List<State> getStateByCountry(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;

    public State loadState(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;

    //SMS
    public Sms saveSMS(EJBRequest request) throws NullParameterException, GeneralException;

    //Bank
    public List<Bank> getBank(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;

    public Bank loadBank(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;
    
    public Bank saveBank(Bank bank) throws RegisterNotFoundException, NullParameterException, GeneralException;

    //ExchangeRate
    public List<ExchangeRate> getExchangeRate(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;

    public ExchangeRate loadExchangeRate(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;
    
    public ExchangeRate saveExchangeRate(ExchangeRate exchangeRate) throws RegisterNotFoundException, NullParameterException, GeneralException;
    
    //Transaction
    public List<Transaction> getTransaction(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
    
    public List<Transaction> getTransactionByDates(Date beginningDate, Date endingDate) throws GeneralException, RegisterNotFoundException, NullParameterException, EmptyListException;
    
    public List<Transaction> getTransactionByBeginningDate(Date beginningDate) throws EmptyListException, GeneralException, NullParameterException;

    public Transaction loadTransaction(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;
    
    public Transaction saveTransaction(Transaction transaction) throws RegisterNotFoundException, NullParameterException, GeneralException;
    
    //Close
    public List<Close> getClose(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;

    public Close loadClose(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;
    
    public Close saveClose(Close close) throws RegisterNotFoundException, NullParameterException, GeneralException;
    
    //BankOperation
    public List<BankOperation> getBankOperationsByParams(EJBRequest request) throws NullParameterException, GeneralException, EmptyListException;
    
    public List<BankOperationType> getBankOperationTypes(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
    
    public List<BankOperationMode> getBankOperationModes(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;

    public List<BankOperation> getBankOperations(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
   
    //Commission
    public List<Commission> getCommission(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
    
    public List<Commission> getCommissionByProduct(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;
    
    public Commission loadCommission(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;
    
    public Commission saveCommission(Commission commission) throws RegisterNotFoundException, NullParameterException, GeneralException;
    
    //TransactionType
    public List<TransactionType> getTransactionType(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;

    public TransactionType loadTransactionType(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;
    
    public TransactionType saveTransactionType(TransactionType transactionType) throws RegisterNotFoundException, NullParameterException, GeneralException;
    
    public List<CommissionItem> getCommissionItems(Long transactionId) throws EmptyListException, GeneralException, NullParameterException;

}
