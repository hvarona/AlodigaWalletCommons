/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.model;

import java.io.Serializable;
import java.math.BigInteger;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import com.alodiga.wallet.common.exception.TableNotFoundException;
import com.alodiga.wallet.common.genericEJB.AbstractWalletEntity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 *
 * @author ltoro
 */
@Entity
@Table(name = "card")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Card.findAll", query = "SELECT c FROM Card c")
    , @NamedQuery(name = "Card.findById", query = "SELECT c FROM Card c WHERE c.id = :id")
    , @NamedQuery(name = "Card.findByNumberCard", query = "SELECT c FROM Card c WHERE c.numberCard = :numberCard")
    , @NamedQuery(name = "Card.findByParentId", query = "SELECT c FROM Card c WHERE c.parentId = :parentId")})
public class Card extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Column(name = "numberCard")
    private String numberCard;
    @Column(name = "parentId")
    private BigInteger parentId;
    @Column(name = "nameCard")
    private String nameCard;
    @Column(name = "userDestinationId")
    private BigInteger userDestinationId;
    @JoinColumn(name = "statusCardId", referencedColumnName = "id")
    @ManyToOne
    private StatusCard statusCardId;
    

    public Card() {
    }

    public Card(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNumberCard() {
        return numberCard;
    }

    public void setNumberCard(String numberCard) {
        this.numberCard = numberCard;

    }

    public BigInteger getParentId() {
        return parentId;
    }

    public void setParentId(BigInteger parentId) {
        this.parentId = parentId;
    }

    public String getNameCard() {
        return nameCard;
    }

    public void setNameCard(String nameCard) {
        this.nameCard = nameCard;
    }

    public BigInteger getUserDestinationId() {
        return userDestinationId;
    }

    public void setUserDestinationId(BigInteger userDestinationId) {
        this.userDestinationId = userDestinationId;
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
        if (!(object instanceof Card)) {
            return false;
        }
        Card other = (Card) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.model.Card[ id=" + id + " ]";
    }

    @Override
    public Object getPk() {
        return getId();
    }

    @Override
    public String getTableName() throws TableNotFoundException {
        return super.getTableName(this.getClass());
    }

    public StatusCard getStatusCardId() {
        return statusCardId;
    }

    public void setStatusCardId(StatusCard statusCardId) {
        this.statusCardId = statusCardId;
    }
    
}
