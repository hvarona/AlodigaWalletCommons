/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.model;

import com.alodiga.wallet.common.exception.TableNotFoundException;
import com.alodiga.wallet.common.genericEJB.AbstractWalletEntity;
import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.codehaus.jackson.annotate.JsonIgnore;

/**
 *
 * @author jose
 */
@Entity
@Table(name = "person")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Person.findAll", query = "SELECT p FROM Person p")
    , @NamedQuery(name = "Person.findById", query = "SELECT p FROM Person p WHERE p.id = :id")
    , @NamedQuery(name = "Person.findByEmail", query = "SELECT p FROM Person p WHERE p.email = :email")
    , @NamedQuery(name = "Person.findByWebSite", query = "SELECT p FROM Person p WHERE p.webSite = :webSite")
    , @NamedQuery(name = "Person.findByCreateDate", query = "SELECT p FROM Person p WHERE p.createDate = :createDate")
    , @NamedQuery(name = "Person.findByUpdateDate", query = "SELECT p FROM Person p WHERE p.updateDate = :updateDate")})
public class Person extends AbstractWalletEntity implements Serializable {

    @OneToOne(cascade = CascadeType.ALL, mappedBy = "personId")
    private Employee employee;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "personId")
    private Collection<User> userCollection;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Size(max = 50)
    @Column(name = "email")
    private String email;
    @Size(max = 50)
    @Column(name = "webSite")
    private String webSite;
    @Column(name = "createDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    @Column(name = "updateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateDate;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "personId")
    private NaturalPerson naturalPerson;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "personId")
    private PhonePerson phonePerson;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "personId")
    private LegalPerson legalPerson;
    @JoinColumn(name = "countryId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Country countryId;
    @JoinColumn(name = "personClassificationId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private PersonClassification personClassificationId;
    @JoinColumn(name = "personTypeId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private PersonType personTypeId;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "businessPersonId")
    private BusinessAffiliationRequest businessAffiliationRequest;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "personId")
    private ReviewOfac reviewOfac;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "personId")
    private PersonHasAddress personHasAddress;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "personId")
    private LegalRepresentative legalRepresentative;
    
    public Person() {
    }

    public Person(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getWebSite() {
        return webSite;
    }

    public void setWebSite(String webSite) {
        this.webSite = webSite;
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

    public NaturalPerson getNaturalPerson() {
        return naturalPerson;
    }

    public void setNaturalPerson(NaturalPerson naturalPerson) {
        this.naturalPerson = naturalPerson;
    }

    public PhonePerson getPhonePerson() {
        return phonePerson;
    }

    public void setPhonePerson(PhonePerson phonePerson) {
        this.phonePerson = phonePerson;
    }

    public LegalPerson getLegalPerson() {
        return legalPerson;
    }

    public void setLegalPerson(LegalPerson legalPerson) {
        this.legalPerson = legalPerson;
    }

    public Country getCountryId() {
        return countryId;
    }

    public void setCountryId(Country countryId) {
        this.countryId = countryId;
    }

    public PersonClassification getPersonClassificationId() {
        return personClassificationId;
    }

    public void setPersonClassificationId(PersonClassification personClassificationId) {
        this.personClassificationId = personClassificationId;
    }

    public PersonType getPersonTypeId() {
        return personTypeId;
    }

    public void setPersonTypeId(PersonType personTypeId) {
        this.personTypeId = personTypeId;
    }

    public BusinessAffiliationRequest getBusinessAffiliationRequest() {
        return businessAffiliationRequest;
    }

    public void setBusinessAffiliationRequest(BusinessAffiliationRequest businessAffiliationRequest) {
        this.businessAffiliationRequest = businessAffiliationRequest;
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
        if (!(object instanceof Person)) {
            return false;
        }
        Person other = (Person) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.Person[ id=" + id + " ]";
    }

    public LegalRepresentative getLegalRepresentative() {
        return legalRepresentative;
    }

    public void setLegalRepresentative(LegalRepresentative legalRepresentative) {
        this.legalRepresentative = legalRepresentative;
    }

    public PersonHasAddress getPersonHasAddress() {
        return personHasAddress;
    }

    public void setPersonHasAddress(PersonHasAddress personHasAddress) {
        this.personHasAddress = personHasAddress;
    }

    public ReviewOfac getReviewOfac() {
        return reviewOfac;
    }

    public void setReviewOfac(ReviewOfac reviewOfac) {
        this.reviewOfac = reviewOfac;
    }
    

    @Override
    public Object getPk() {
        return getId();
    }

    @Override
    public String getTableName() throws TableNotFoundException {
        return super.getTableName(this.getClass());
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    @XmlTransient
    @JsonIgnore
    public Collection<User> getUserCollection() {
        return userCollection;
    }

    public void setUserCollection(Collection<User> userCollection) {
        this.userCollection = userCollection;
    }
}
