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
import java.util.Date;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author jose
 */
@Entity
@Table(name = "phone_person")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PhonePerson.findAll", query = "SELECT p FROM PhonePerson p"),
    @NamedQuery(name = "PhonePerson.findById", query = "SELECT p FROM PhonePerson p WHERE p.id = :id"),
    @NamedQuery(name = "PhonePerson.findByCountryCode", query = "SELECT p FROM PhonePerson p WHERE p.countryCode = :countryCode"),
    @NamedQuery(name = "PhonePerson.findByAreaCode", query = "SELECT p FROM PhonePerson p WHERE p.areaCode = :areaCode"),
    @NamedQuery(name = "PhonePerson.findByNumberPhone", query = "SELECT p FROM PhonePerson p WHERE p.numberPhone = :numberPhone"),
    @NamedQuery(name = "PhonePerson.findByExtensionPhoneNumber", query = "SELECT p FROM PhonePerson p WHERE p.extensionPhoneNumber = :extensionPhoneNumber"),
    @NamedQuery(name = "PhonePerson.findByIndMainPhone", query = "SELECT p FROM PhonePerson p WHERE p.indMainPhone = :indMainPhone"),
    @NamedQuery(name = "PhonePerson.findByCreateDate", query = "SELECT p FROM PhonePerson p WHERE p.createDate = :createDate"),
    @NamedQuery(name = "PhonePerson.findByUpdateDate", query = "SELECT p FROM PhonePerson p WHERE p.updateDate = :updateDate"),
    @NamedQuery(name = QueryConstants.PHONES_BY_MAIN, query = "SELECT p FROM PhonePerson p WHERE p.personId.id=:personId AND p.indMainPhone=true"),
    @NamedQuery(name = QueryConstants.PHONES_BY_PERSON, query = "SELECT p FROM PhonePerson p WHERE p.personId.id = :personId")})

public class PhonePerson extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Size(max = 4)
    @Column(name = "countryCode")
    private String countryCode;
    @Size(max = 10)
    @Column(name = "areaCode")
    private String areaCode;
    @Basic(optional = false)
    @Size(min = 1, max = 10)
    @Column(name = "numberPhone")
    private String numberPhone;
    @Size(max = 10)
    @Column(name = "extensionPhoneNumber")
    private String extensionPhoneNumber;
    @Column(name = "indMainPhone")
    private Boolean indMainPhone;
    @Column(name = "createDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    @Column(name = "updateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateDate;
    @JoinColumn(name = "personId", referencedColumnName = "id")
    @OneToOne(optional = false)
    private Person personId;
    @JoinColumn(name = "countryId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Country countryId;
    @JoinColumn(name = "phoneTypeId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private PhoneType phoneTypeId;

    public PhonePerson() {
    }

    public PhonePerson(Long id) {
        this.id = id;
    }

    public PhonePerson(Long id, String numberPhone) {
        this.id = id;
        this.numberPhone = numberPhone;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }

    public String getNumberPhone() {
        return numberPhone;
    }

    public void setNumberPhone(String numberPhone) {
        this.numberPhone = numberPhone;
    }

    public String getExtensionPhoneNumber() {
        return extensionPhoneNumber;
    }

    public void setExtensionPhoneNumber(String extensionPhoneNumber) {
        this.extensionPhoneNumber = extensionPhoneNumber;
    }

    public Boolean getIndMainPhone() {
        return indMainPhone;
    }

    public void setIndMainPhone(Boolean indMainPhone) {
        this.indMainPhone = indMainPhone;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public Person getPersonId() {
        return personId;
    }

    public void setPersonId(Person personId) {
        this.personId = personId;
    }

    public Country getCountryId() {
        return countryId;
    }

    public void setCountryId(Country countryId) {
        this.countryId = countryId;
    }

    public PhoneType getPhoneTypeId() {
        return phoneTypeId;
    }

    public void setPhoneTypeId(PhoneType phoneTypeId) {
        this.phoneTypeId = phoneTypeId;
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
        if (!(object instanceof PhonePerson)) {
            return false;
        }
        PhonePerson other = (PhonePerson) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.PhonePerson[ id=" + id + " ]";
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
