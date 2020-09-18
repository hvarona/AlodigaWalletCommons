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
@Table(name = "business_service_type")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BusinessServiceType.findAll", query = "SELECT b FROM BusinessServiceType b")
    , @NamedQuery(name = "BusinessServiceType.findById", query = "SELECT b FROM BusinessServiceType b WHERE b.id = :id")
    , @NamedQuery(name = "BusinessServiceType.findByDescription", query = "SELECT b FROM BusinessServiceType b WHERE b.description = :description")
    , @NamedQuery(name = "BusinessServiceType.findByCode", query = "SELECT b FROM BusinessServiceType b WHERE b.code = :code")
    , @NamedQuery(name = QueryConstants.BUSINESS_SERVICE_TYPE_BY_BUSINESS_TYPE , query = "SELECT b FROM BusinessServiceType b WHERE b.businessTypeId.id = :businessTypeId")
    , @NamedQuery(name = QueryConstants.CODE_EXIST_IN_BD_BUSINESS_SERVICE_TYPE, query = "SELECT b FROM BusinessServiceType b WHERE b.code = :code")})

public class BusinessServiceType extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 50)
    @Column(name = "description")
    private String description;
    @Size(max = 10)
    @Column(name = "code")
    private String code;
    @JoinColumn(name = "businessTypeId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private BusinessType businessTypeId;

    public BusinessServiceType() {
    }

    public BusinessServiceType(Integer id) {
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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public BusinessType getBusinessTypeId() {
        return businessTypeId;
    }

    public void setBusinessTypeId(BusinessType businessTypeId) {
        this.businessTypeId = businessTypeId;
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
        if (!(object instanceof BusinessServiceType)) {
            return false;
        }
        BusinessServiceType other = (BusinessServiceType) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.BusinessServiceType[ id=" + id + " ]";
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
