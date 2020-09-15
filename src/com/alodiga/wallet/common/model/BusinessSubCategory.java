/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.model;

import com.alodiga.wallet.common.exception.TableNotFoundException;
import com.alodiga.wallet.common.genericEJB.AbstractWalletEntity;
import com.alodiga.wallet.common.utils.QueryConstants;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author jose
 */
@Entity
@Table(name = "business_sub_category")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BusinessSubCategory.findAll", query = "SELECT b FROM BusinessSubCategory b"),
    @NamedQuery(name = "BusinessSubCategory.findById", query = "SELECT b FROM BusinessSubCategory b WHERE b.id = :id"),
    @NamedQuery(name = "BusinessSubCategory.findByDescription", query = "SELECT b FROM BusinessSubCategory b WHERE b.description = :description"),
    @NamedQuery(name = "BusinessSubCategory.findByMccCode", query = "SELECT b FROM BusinessSubCategory b WHERE b.mccCode = :mccCode"),
    @NamedQuery(name = QueryConstants.BUSINESS_SUB_CATEGORY_BY_CATEGORY, query = "SELECT b FROM BusinessSubCategory b WHERE b.businessCategoryId.id= :businessCategoryId"),})
    @NamedQuery(name = QueryConstants.CODEMCC_EXIST_IN_BD_BUSINESS_SUB_CATEGORY, query = "SELECT b FROM BusinessSubCategory b WHERE b.mccCode= :mccCode")
public class BusinessSubCategory extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 80)
    @Column(name = "description")
    private String description;
    @Size(max = 10)
    @Column(name = "mccCode")
    private String mccCode;
    @JoinColumn(name = "businessCategoryId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private BusinessCategory businessCategoryId;

    public BusinessSubCategory() {
    }

    public BusinessSubCategory(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMccCode() {
        return mccCode;
    }

    public void setMccCode(String mccCode) {
        this.mccCode = mccCode;
    }

    public BusinessCategory getBusinessCategoryId() {
        return businessCategoryId;
    }

    public void setBusinessCategoryId(BusinessCategory businessCategoryId) {
        this.businessCategoryId = businessCategoryId;
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
        if (!(object instanceof BusinessSubCategory)) {
            return false;
        }
        BusinessSubCategory other = (BusinessSubCategory) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.BusinessSubCategory[ id=" + id + " ]";
    }

    @Override
    public Object getPk() {
        return getId();
    }

    @Override
    public String getTableName() throws TableNotFoundException {
        return super.getTableName(this.getClass());
    }

}
