package com.alodiga.wallet.common.model;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import com.alodiga.wallet.common.exception.TableNotFoundException;
import com.alodiga.wallet.common.genericEJB.AbstractWalletEntity;
import org.codehaus.jackson.annotate.JsonIgnore;

/**
 *
 * @author usuario
 */
@Entity
@Table(name = "product")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p"),
    @NamedQuery(name = "Product.findById", query = "SELECT p FROM Product p WHERE p.id = :id"),
    @NamedQuery(name = "Product.findByName", query = "SELECT p FROM Product p WHERE p.name = :name"),
    @NamedQuery(name = "Product.findByTaxInclude", query = "SELECT p FROM Product p WHERE p.taxInclude = :taxInclude"),
    @NamedQuery(name = "Product.findByEnabled", query = "SELECT p FROM Product p WHERE p.enabled = :enabled"),
    @NamedQuery(name = "Product.findByReferenceCode", query = "SELECT p FROM Product p WHERE p.referenceCode = :referenceCode"),
    @NamedQuery(name = "Product.findByIsFree", query = "SELECT p FROM Product p WHERE p.isFree = :isFree"),
    @NamedQuery(name = "Product.findByIsAlocashProduct", query = "SELECT p FROM Product p WHERE p.isAlocashProduct = :isAlocashProduct"),
    @NamedQuery(name = "Product.findByIsPayTopUp", query = "SELECT p FROM Product p WHERE p.isPayTopUp = :isPayTopUp"),
    @NamedQuery(name = "Product.findByIsExchangeProduct", query = "SELECT p FROM Product p WHERE p.isExchangeProduct = :isExchangeProduct"),
    @NamedQuery(name = "Product.findByIsDefaultProduct", query = "SELECT p FROM Product p WHERE p.isDefaultProduct = :isDefaultProduct AND p.enabled = 1")})

public class Product extends AbstractWalletEntity implements Serializable {

    public static final String NAME = "name";    
    public static final Long ALOCOIN_PRODUCT = 1L ;
    public static final Long ALODIGA_BALANCE = 2L ;
    public static final Long PREPAID_CARD = 3L ;
    
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @Column(name = "taxInclude")
    private boolean taxInclude;
    @Basic(optional = false)
    @Column(name = "enabled")
    private boolean enabled;
    @Basic(optional = false)
    @Column(name = "referenceCode")
    private String referenceCode;
    @Basic(optional = false)
    @Column(name = "symbol")
    private String symbol;
    @Column(name = "isDefaultProduct")
    private boolean isDefaultProduct;
    @Column(name = "isUsePrepaidCard")
    private boolean isUsePrepaidCard;
    @Basic(optional = false)
    @Column(name = "isFree")
    private boolean isFree;
    @Basic(optional = false)
    @Column(name = "isAlocashProduct")
    private boolean isAlocashProduct;
    @Column(name = "isPayTopUp")
    private boolean isPayTopUp;
    @Column(name = "isExchangeProduct")
    private boolean isExchangeProduct;
    @Column(name = "isRemettence")
    private boolean isRemettence;
    @Column(name = "isPaymentInfo")
    private boolean isPaymentInfo;
    @JoinColumn(name = "categoryId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Category categoryId;
    @JoinColumn(name = "countryId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Country countryId;
    @Column(name = "indHasAssociatedBank")
    private Boolean indHasAssociatedBank;
    @Transient
    private Float currentBalance;
    
    public Product() {
    }

    public Product(Long id) {
        this.id = id;
    }

    public Product(Long id, String name, boolean taxInclude, boolean enabled, String referenceCode, boolean isDefaultProduct, boolean isFree, boolean isAlocashProduct,String symbol, boolean isPayTopUp, boolean isExchangeProduct,boolean isRemettence_, boolean  isPaymentInfo, boolean  indHasAssociatedBank,  boolean isUsePrepaidCard) {
        this.id = id;
        this.name = name;
        this.taxInclude = taxInclude;
        this.enabled = enabled;
        this.referenceCode = referenceCode;
        this.isDefaultProduct = isDefaultProduct;
        this.isFree = isFree;
        this.isAlocashProduct = isAlocashProduct;
        this.symbol = symbol;
        this.isPayTopUp = isPayTopUp;
        this.isExchangeProduct = isExchangeProduct;
        this.isRemettence = isRemettence_;
        this.isPaymentInfo = isPaymentInfo;
        this.indHasAssociatedBank= indHasAssociatedBank;
        this.isUsePrepaidCard = isUsePrepaidCard;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean getTaxInclude() {
        return taxInclude;
    }

    public void setTaxInclude(boolean taxInclude) {
        this.taxInclude = taxInclude;
    }

    public boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public String getReferenceCode() {
        return referenceCode;
    }

    public void setReferenceCode(String referenceCode) {
        this.referenceCode = referenceCode;
    }

    public boolean getIsFree() {
        return isFree;
    }

    public void setIsFree(boolean isFree) {
        this.isFree = isFree;
    }

    public boolean isIsDefaultProduct() {
        return isDefaultProduct;
    }

    public void setIsDefaultProduct(boolean isDefaultProduct) {
        this.isDefaultProduct = isDefaultProduct;
    }

    public boolean getIsUsePrepaidCard() {
        return isUsePrepaidCard;
    }

    public void setIsUsePrepaidCard(boolean isUsePrepaidCard) {
        this.isUsePrepaidCard = isUsePrepaidCard;
    }

    public boolean getIsAlocashProduct() {
        return isAlocashProduct;
    }

    public void setIsAlocashProduct(boolean isAlocashProduct) {
        this.isAlocashProduct = isAlocashProduct;
             
    }

    public boolean isIsPayTopUp() {
        return isPayTopUp;
    }

    public void setIsPayTopUp(boolean isPayTopUp) {
        this.isPayTopUp = isPayTopUp;
    }

    public boolean isIsExchangeProduct() {
        return isExchangeProduct;
    }

    public void setIsExchangeProduct(boolean isExchangeProduct) {
        this.isExchangeProduct = isExchangeProduct;
    }

    public boolean isIsRemettence() {
        return isRemettence;
    }

    public void setIsRemettence(boolean isRemettence) {
        this.isRemettence = isRemettence;
    }

    public boolean isIsPaymentInfo() {
        return isPaymentInfo;
    }

    public void setIsPaymentInfo(boolean isPaymentInfo) {
        this.isPaymentInfo = isPaymentInfo;
    }
    
    

    public Category getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Category categoryId) {
        this.categoryId = categoryId;
    }    

    public Country getCountryId() {
        return countryId;
    }

    public void setCountryId(Country countryId) {
        this.countryId = countryId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Product)) {
            return false;
        }
        Product other = (Product) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "dto.Product[ id=" + id + " ]";
    }
    
    public void setCurrentBalance(Float currentBalance) {
        this.currentBalance = currentBalance;
}

    public Float getCurrentBalance() {
        return currentBalance;
    }
    
     public String getSymbol() {
        return symbol;
    }

    public void setSymbol(String symbol) {
        this.symbol = symbol;
    }


    @Override
    public Object getPk() {
        return getId();
    }

    @Override
    public String getTableName() throws TableNotFoundException {
        return super.getTableName(this.getClass());
    }

    public Boolean getIndHasAssociatedBank() {
        return indHasAssociatedBank;
    }

    public void setIndHasAssociatedBank(Boolean indHasAssociatedBank) {
        this.indHasAssociatedBank = indHasAssociatedBank;
    }

}

