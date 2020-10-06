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
@Table(name = "calendar_days")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CalendarDays.findAll", query = "SELECT c FROM CalendarDays c")
    , @NamedQuery(name = "CalendarDays.findById", query = "SELECT c FROM CalendarDays c WHERE c.id = :id")
    , @NamedQuery(name = "CalendarDays.findByHolidayDate", query = "SELECT c FROM CalendarDays c WHERE c.holidayDate = :holidayDate")
    , @NamedQuery(name = "CalendarDays.findByDescription", query = "SELECT c FROM CalendarDays c WHERE c.description = :description")
    , @NamedQuery(name = "CalendarDays.findByCreateDate", query = "SELECT c FROM CalendarDays c WHERE c.createDate = :createDate")
    , @NamedQuery(name = "CalendarDays.findByUpdateDate", query = "SELECT c FROM CalendarDays c WHERE c.updateDate = :updateDate")
    , @NamedQuery(name = QueryConstants.HOLI_DAY_EXIST_IN_BD_CALENDAR_DAYS, query = "SELECT c FROM CalendarDays c WHERE c.holidayDate = :holidayDate AND c.countryId = :countryId")})
public class CalendarDays extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Basic(optional = false)
    @Column(name = "holidayDate")
    @Temporal(TemporalType.DATE)
    private Date holidayDate;
    @Size(max = 50)
    @Column(name = "description")
    private String description;
    @Basic(optional = false)
    @Column(name = "createDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    @Column(name = "updateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateDate;
    @JoinColumn(name = "countryId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Country countryId;

    public CalendarDays() {
    }

    public CalendarDays(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getHolidayDate() {
        return holidayDate;
    }

    public void setHolidayDate(Date holidayDate) {
        this.holidayDate = holidayDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
        if (!(object instanceof CalendarDays)) {
            return false;
        }
        CalendarDays other = (CalendarDays) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.CalendarDays[ id=" + id + " ]";
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
