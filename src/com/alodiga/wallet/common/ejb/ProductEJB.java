package com.alodiga.wallet.common.ejb;

import java.util.List;
import javax.ejb.Remote;

import com.alodiga.wallet.common.exception.EmptyListException;
import com.alodiga.wallet.common.exception.GeneralException;
import com.alodiga.wallet.common.exception.NullParameterException;
import com.alodiga.wallet.common.exception.RegisterNotFoundException;
import com.alodiga.wallet.common.genericEJB.EJBRequest;
import com.alodiga.wallet.common.genericEJB.WalletGenericEJB;
import com.alodiga.wallet.common.model.Category;
import com.alodiga.wallet.common.model.Period;
import com.alodiga.wallet.common.model.Product;
import com.alodiga.wallet.common.model.ProductData;
import com.alodiga.wallet.common.model.Provider;

@SuppressWarnings("all")
@Remote
public interface ProductEJB extends WalletGenericEJB {

    public Category deleteCategory(EJBRequest request) throws GeneralException, NullParameterException;

    public Product deleteProduct(EJBRequest request) throws GeneralException, NullParameterException;

    public void deleteProductHasProvider(Long productId) throws NullParameterException, GeneralException;

    public void deletePromotionTypeHasPromotion(EJBRequest request) throws NullParameterException, GeneralException;

    public Provider deleteProvider(EJBRequest request) throws GeneralException, NullParameterException;

    public Product enableProduct(EJBRequest request) throws GeneralException, NullParameterException, RegisterNotFoundException;

    public List<Product> filterProducts(EJBRequest request) throws GeneralException, EmptyListException, NullParameterException;

    public List<Category> getCategories(EJBRequest request) throws GeneralException, EmptyListException, NullParameterException;

    public List<Product> getProducts(EJBRequest request) throws GeneralException, EmptyListException, NullParameterException;

    public List<Product> getProductsByEnterprise(Long enterpriseId) throws GeneralException, EmptyListException, NullParameterException;

    public List<Provider> getProviders(EJBRequest request) throws GeneralException, EmptyListException, NullParameterException;

    public List<Provider> getSMSProviders(EJBRequest request) throws GeneralException, EmptyListException, NullParameterException;

    public Category loadCategory(EJBRequest request) throws GeneralException, RegisterNotFoundException, NullParameterException;

    public Product loadProduct(EJBRequest request) throws GeneralException, RegisterNotFoundException, NullParameterException;

    public Product loadProductById(Long productId) throws GeneralException, RegisterNotFoundException, NullParameterException;

    public Provider loadProvider(EJBRequest request) throws GeneralException, RegisterNotFoundException, NullParameterException;

    public Category saveCategory(EJBRequest request) throws GeneralException, NullParameterException;

    public Product saveProduct(EJBRequest request) throws GeneralException, NullParameterException;

    public ProductData saveProductData(EJBRequest request) throws GeneralException, NullParameterException;

    public Provider saveProvider(EJBRequest request) throws GeneralException, NullParameterException;

    public List<Period> getPeriods(EJBRequest request) throws GeneralException, EmptyListException, NullParameterException;
   

}
