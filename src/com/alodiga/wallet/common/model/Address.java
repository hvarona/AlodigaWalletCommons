/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.model;

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
import com.alodiga.wallet.common.exception.TableNotFoundException;
import com.alodiga.wallet.common.genericEJB.AbstractWalletEntity;
import javax.xml.bind.annotation.XmlType;

/**
 *
 * @author jose
 */
@Entity
@Table(name = "address")
@XmlType(name = "maw_address")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Address.findAll", query = "SELECT a FROM Address a")
    , @NamedQuery(name = "Address.findById", query = "SELECT a FROM Address a WHERE a.id = :id")
    , @NamedQuery(name = "Address.findByZipCode", query = "SELECT a FROM Address a WHERE a.zipCode = :zipCode")
    , @NamedQuery(name = "Address.findByNameStreet", query = "SELECT a FROM Address a WHERE a.nameStreet = :nameStreet")
    , @NamedQuery(name = "Address.findByNameEdification", query = "SELECT a FROM Address a WHERE a.nameEdification = :nameEdification")
    , @NamedQuery(name = "Address.findByTower", query = "SELECT a FROM Address a WHERE a.tower = :tower")
    , @NamedQuery(name = "Address.findByFloor", query = "SELECT a FROM Address a WHERE a.floor = :floor")
    , @NamedQuery(name = "Address.findByUrbanization", query = "SELECT a FROM Address a WHERE a.urbanization = :urbanization")
    , @NamedQuery(name = "Address.findByAddressLine1", query = "SELECT a FROM Address a WHERE a.addressLine1 = :addressLine1")
    , @NamedQuery(name = "Address.findByAddressLine2", query = "SELECT a FROM Address a WHERE a.addressLine2 = :addressLine2")
    , @NamedQuery(name = "Address.findByIndMainAddress", query = "SELECT a FROM Address a WHERE a.indMainAddress = :indMainAddress")})

public class Address extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Basic(optional = false)
    @Size(min = 1, max = 45)
    @Column(name = "zipCode")
    private String zipCode;
    @Size(max = 50)
    @Column(name = "nameStreet")
    private String nameStreet;
    @Size(max = 50)
    @Column(name = "nameEdification")
    private String nameEdification;
    @Size(max = 40)
    @Column(name = "tower")
    private String tower;
    @Column(name = "floor")
    private Integer floor;
    @Size(max = 50)
    @Column(name = "urbanization")
    private String urbanization;
    @Basic(optional = false)
    @Size(min = 1, max = 255)
    @Column(name = "addressLine1")
    private String addressLine1;
    @Size(max = 250)
    @Column(name = "addressLine2")
    private String addressLine2;
    @Basic(optional = false)
    @Column(name = "indMainAddress")
    private boolean indMainAddress;
    @JoinColumn(name = "addressTypeId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private AddressType addressTypeId;
    @JoinColumn(name = "cityId", referencedColumnName = "id")
    @ManyToOne
    private City cityId;
    @JoinColumn(name = "countryId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Country countryId;
    @JoinColumn(name = "countyId", referencedColumnName = "id")
    @ManyToOne
    private County countyId;
    @JoinColumn(name = "edificationTypeId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private EdificationType edificationTypeId;
    @JoinColumn(name = "streetTypeId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private StreetType streetTypeId;

    public Address() {
    }

    public Address(Long id) {
        this.id = id;
    }

    public Address(Long id, String zipCode, String addressLine1, boolean indMainAddress) {
        this.id = id;
        this.zipCode = zipCode;
        this.addressLine1 = addressLine1;
        this.indMainAddress = indMainAddress;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getNameStreet() {
        return nameStreet;
    }

    public void setNameStreet(String nameStreet) {
        this.nameStreet = nameStreet;
    }

    public String getNameEdification() {
        return nameEdification;
    }

    public void setNameEdification(String nameEdification) {
        this.nameEdification = nameEdification;
    }

    public String getTower() {
        return tower;
    }

    public void setTower(String tower) {
        this.tower = tower;
    }

    public Integer getFloor() {
        return floor;
    }

    public void setFloor(Integer floor) {
        this.floor = floor;
    }

    public String getUrbanization() {
        return urbanization;
    }

    public void setUrbanization(String urbanization) {
        this.urbanization = urbanization;
    }

    public String getAddressLine1() {
        return addressLine1;
    }

    public void setAddressLine1(String addressLine1) {
        this.addressLine1 = addressLine1;
    }

    public String getAddressLine2() {
        return addressLine2;
    }

    public void setAddressLine2(String addressLine2) {
        this.addressLine2 = addressLine2;
    }

    public boolean getIndMainAddress() {
        return indMainAddress;
    }

    public void setIndMainAddress(boolean indMainAddress) {
        this.indMainAddress = indMainAddress;
    }

    public AddressType getAddressTypeId() {
        return addressTypeId;
    }

    public void setAddressTypeId(AddressType addressTypeId) {
        this.addressTypeId = addressTypeId;
    }

    public City getCityId() {
        return cityId;
    }

    public void setCityId(City cityId) {
        this.cityId = cityId;
    }

    public Country getCountryId() {
        return countryId;
    }

    public void setCountryId(Country countryId) {
        this.countryId = countryId;
    }

    public County getCountyId() {
        return countyId;
    }

    public void setCountyId(County countyId) {
        this.countyId = countyId;
    }

    public EdificationType getEdificationTypeId() {
        return edificationTypeId;
    }

    public void setEdificationTypeId(EdificationType edificationTypeId) {
        this.edificationTypeId = edificationTypeId;
    }

    public StreetType getStreetTypeId() {
        return streetTypeId;
    }

    public void setStreetTypeId(StreetType streetTypeId) {
        this.streetTypeId = streetTypeId;
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
        if (!(object instanceof Address)) {
            return false;
        }
        Address other = (Address) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.Address[ id=" + id + " ]";
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
