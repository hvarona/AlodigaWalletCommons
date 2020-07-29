package com.alodiga.wallet.common.ejb;

import java.util.Date;
import java.util.List;
import javax.ejb.Remote;

import com.alodiga.wallet.common.exception.EmptyListException;
import com.alodiga.wallet.common.exception.GeneralException;
import com.alodiga.wallet.common.exception.NullParameterException;
import com.alodiga.wallet.common.exception.RegisterNotFoundException;
import com.alodiga.wallet.common.genericEJB.EJBRequest;
import com.alodiga.wallet.common.genericEJB.WalletGenericEJB;
import com.alodiga.wallet.common.model.BankHasProduct;
import com.alodiga.wallet.common.model.Category;
import com.alodiga.wallet.common.model.Period;
import com.alodiga.wallet.common.model.Product;
import com.alodiga.wallet.common.model.ProductData;
import com.alodiga.wallet.common.model.ProductIntegrationType;
import com.alodiga.wallet.common.model.Provider;
import com.alodiga.wallet.common.model.StatusTransactionApproveRequest;
import com.alodiga.wallet.common.model.Transaction;
import com.alodiga.wallet.common.model.TransactionApproveRequest;

@SuppressWarnings("all")
@Remote
public interface ProductEJB extends WalletGenericEJB {

    //Category
    public List<Category> getCategories(EJBRequest request) throws GeneralException, EmptyListException, NullParameterException;
    
    public Category loadCategory(EJBRequest request) throws GeneralException, RegisterNotFoundException, NullParameterException;
    
    public Category deleteCategory(EJBRequest request) throws GeneralException, NullParameterException;
    
    public Category saveCategory(EJBRequest request) throws GeneralException, NullParameterException;

    //Product
    public List<Product> getProducts(EJBRequest request) throws GeneralException, EmptyListException, NullParameterException;
    
    public List<Product> filterProducts(EJBRequest request) throws GeneralException, EmptyListException, NullParameterException;
    
    public List<Product> getProductsByEnterprise(Long enterpriseId) throws GeneralException, EmptyListException, NullParameterException;
    
    public Product loadProduct(EJBRequest request) throws GeneralException, RegisterNotFoundException, NullParameterException;

    public Product loadProductById(Long productId) throws GeneralException, RegisterNotFoundException, NullParameterException;
    
    public Product deleteProduct(EJBRequest request) throws GeneralException, NullParameterException;
    
    public Product enableProduct(EJBRequest request) throws GeneralException, NullParameterException, RegisterNotFoundException;

    public void deleteProductHasProvider(Long productId) throws NullParameterException, GeneralException;
    
    public Product saveProduct(EJBRequest request) throws GeneralException, NullParameterException;
    
    //Promotion
    public void deletePromotionTypeHasPromotion(EJBRequest request) throws NullParameterException, GeneralException;

    //Provider
    public Provider deleteProvider(EJBRequest request) throws GeneralException, NullParameterException;
    
    public List<Provider> getProviders(EJBRequest request) throws GeneralException, EmptyListException, NullParameterException;

    public List<Provider> getSMSProviders(EJBRequest request) throws GeneralException, EmptyListException, NullParameterException;
    
    public Provider loadProvider(EJBRequest request) throws GeneralException, RegisterNotFoundException, NullParameterException;
    
    public Provider saveProvider(EJBRequest request) throws GeneralException, NullParameterException;
    
    //ProductData
    public ProductData saveProductData(EJBRequest request) throws GeneralException, NullParameterException;
    
    //Period
    public List<Period> getPeriods(EJBRequest request) throws GeneralException, EmptyListException, NullParameterException;
   
    //ProductIntegrationType
    public List<ProductIntegrationType> getProductIntegrationType(EJBRequest request) throws GeneralException, EmptyListException, NullParameterException;
 
   //BankHasProduct
   public List<BankHasProduct> getBankHasProduct(EJBRequest request) throws GeneralException, EmptyListException, NullParameterException;
   public BankHasProduct saveBankHasProduct(BankHasProduct bankHasProduct) throws RegisterNotFoundException, NullParameterException, GeneralException;
   public List<BankHasProduct> getBankHasProductByID(BankHasProduct bankHasProduct) throws GeneralException, EmptyListException, NullParameterException;
   
   //TransactionApproveRequest
   
   public List<TransactionApproveRequest> getTransactionApproveRequestByParams(EJBRequest request) throws GeneralException, NullParameterException, EmptyListException;    
   
   public TransactionApproveRequest loadTransactionApproveRequest(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;
   
   public TransactionApproveRequest saveTransactionApproveRequest(TransactionApproveRequest transactionApproveRequest) throws RegisterNotFoundException, NullParameterException, GeneralException;

   public List<StatusTransactionApproveRequest> getStatusTransactionApproveRequests(EJBRequest request) throws GeneralException, EmptyListException, NullParameterException;

}
