/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.model;

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
@Table(name = "report_has_profile")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ReportHasProfile.findAll", query = "SELECT r FROM ReportHasProfile r"),
    @NamedQuery(name = "ReportHasProfile.findById", query = "SELECT r FROM ReportHasProfile r WHERE r.id = :id"),
    @NamedQuery(name = QueryConstants.DELETE_REPORT_PROFILE, query = "DELETE FROM ReportHasProfile rp WHERE rp.reportId.id=:reportId")})

public class ReportHasProfile implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @JoinColumn(name = "profileId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Profile profileId;
    @JoinColumn(name = "reportId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Report reportId;

    public ReportHasProfile() {
    }

    public ReportHasProfile(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Profile getProfileId() {
        return profileId;
    }

    public void setProfileId(Profile profileId) {
        this.profileId = profileId;
    }

    public Report getReportId() {
        return reportId;
    }

    public void setReportId(Report reportId) {
        this.reportId = reportId;
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
        if (!(object instanceof ReportHasProfile)) {
            return false;
        }
        ReportHasProfile other = (ReportHasProfile) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.ReportHasProfile[ id=" + id + " ]";
    }
    
}
