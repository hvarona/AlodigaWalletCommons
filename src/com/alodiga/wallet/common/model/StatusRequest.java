/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.codehaus.jackson.annotate.JsonIgnore;
import com.alodiga.wallet.common.exception.TableNotFoundException;
import com.alodiga.wallet.common.genericEJB.AbstractWalletEntity;
import com.alodiga.wallet.common.utils.QueryConstants;

/**
 *
 * @author jose
 */
@Entity
@Table(name = "status_request")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "StatusRequest.findAll", query = "SELECT s FROM StatusRequest s"),
    @NamedQuery(name = "StatusRequest.findById", query = "SELECT s FROM StatusRequest s WHERE s.id = :id"),
    @NamedQuery(name = "StatusRequest.findByDescription", query = "SELECT s FROM StatusRequest s WHERE s.description = :description"),
    @NamedQuery(name = QueryConstants.STATUS_BUSINESS_AFFILIATON_REQUEST_BY_CODE, query = "SELECT s FROM StatusRequest s WHERE s.code = :code")})
public class StatusRequest extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Size(min = 1, max = 50)
    @Column(name = "description")
    private String description;
    @Size(max = 10)
    @Column(name = "code")
    private String code;

    public StatusRequest() {
    }

    public StatusRequest(Integer id) {
        this.id = id;
    }

    public StatusRequest(Integer id, String description) {
        this.id = id;
        this.description = description;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof StatusRequest)) {
            return false;
        }
        StatusRequest other = (StatusRequest) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.StatusBusinessAffiliationRequets[ id=" + id + " ]";
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
