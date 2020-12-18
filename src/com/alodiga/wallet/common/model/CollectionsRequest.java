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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author jose
 */
@Entity
@Table(name = "collections_request")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CollectionsRequest.findAll", query = "SELECT c FROM CollectionsRequest c"),
    @NamedQuery(name = "CollectionsRequest.findById", query = "SELECT c FROM CollectionsRequest c WHERE c.id = :id"),
    @NamedQuery(name = "CollectionsRequest.findBycollectionTypeId", query = "SELECT c FROM CollectionsRequest c WHERE c.collectionTypeId.id = :collectionTypeId"),
    @NamedQuery(name = "CollectionsRequest.findBypersonTypeId", query = "SELECT c FROM CollectionsRequest c WHERE  c.personTypeId.id=:personTypeId"),
    @NamedQuery(name = QueryConstants.COLLECTIONS_BY_PERSON_TYPE, query = "SELECT c FROM CollectionsRequest c WHERE c.personTypeId.id=:personTypeId AND c.enabled=1")})

public class CollectionsRequest extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @JoinColumn(name = "collectionTypeId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private CollectionType collectionTypeId;
    @JoinColumn(name = "personTypeId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private PersonType personTypeId;
    @JoinColumn(name = "requestTypeId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private RequestType requestTypeId;
    @Basic(optional = false)
    @Column(name = "enabled")
    private boolean enabled;

    public CollectionsRequest() {
    }

    public CollectionsRequest(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public CollectionType getCollectionTypeId() {
        return collectionTypeId;
    }

    public void setCollectionTypeId(CollectionType collectionTypeId) {
        this.collectionTypeId = collectionTypeId;
    }

    public PersonType getPersonTypeId() {
        return personTypeId;
    }

    public void setPersonTypeId(PersonType personTypeId) {
        this.personTypeId = personTypeId;
    }

    public RequestType getRequestTypeId() {
        return requestTypeId;
    }

    public void setRequestTypeId(RequestType requestTypeId) {
        this.requestTypeId = requestTypeId;
    }
    
    public boolean getEnabled() {
        return this.enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
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
        if (!(object instanceof CollectionsRequest)) {
            return false;
        }
        CollectionsRequest other = (CollectionsRequest) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.CollectionsRequest[ id=" + id + " ]";
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
