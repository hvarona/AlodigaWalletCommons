package com.alodiga.wallet.common.ejb;

import java.util.List;
import javax.ejb.Remote;


import com.alodiga.wallet.common.exception.EmptyListException;
import com.alodiga.wallet.common.exception.GeneralException;
import com.alodiga.wallet.common.exception.NullParameterException;
import com.alodiga.wallet.common.exception.RegisterNotFoundException;
import com.alodiga.wallet.common.genericEJB.EJBRequest;
import com.alodiga.wallet.common.genericEJB.WalletGenericEJB;
import com.alodiga.wallet.common.model.Audit;
import com.alodiga.wallet.common.model.AuditAction;
import com.alodiga.wallet.common.model.Event;

import java.util.Date;

@Remote
public interface AuditoryEJB extends WalletGenericEJB {

    //Audit
    public List<Audit> getAudits(EJBRequest request) throws GeneralException, RegisterNotFoundException, NullParameterException, EmptyListException;

    public List<Audit> getLastAudits(EJBRequest request) throws GeneralException, RegisterNotFoundException, NullParameterException, EmptyListException;

    public Audit loadAudit(EJBRequest request) throws GeneralException, RegisterNotFoundException, NullParameterException;

    public List<Audit> searchAudit(EJBRequest request) throws GeneralException, NullParameterException, EmptyListException;

    public Audit saveAudit(EJBRequest request) throws GeneralException, NullParameterException;

    //AuditAction
    public List<AuditAction> getAuditAction(EJBRequest request) throws GeneralException, RegisterNotFoundException, NullParameterException, EmptyListException;
    
    public List<AuditAction> getAuditActions(Date beginningDate, Date endingDate) throws GeneralException, RegisterNotFoundException, NullParameterException, EmptyListException;

    public List<AuditAction> searchAuditAction(String login, String userName, Long permissionId, Date beginningDate, Date endingDate) throws GeneralException, NullParameterException, EmptyListException;

    public List<AuditAction> searchAuditActions(EJBRequest request) throws GeneralException, NullParameterException, EmptyListException;
    
    public AuditAction saveAuditAction(AuditAction action) throws GeneralException, NullParameterException;

    public List<AuditAction> getAuditActionsByUserId(Long userId, Date beginningDate, Date endingDate) throws GeneralException, RegisterNotFoundException, NullParameterException, EmptyListException;
        
    public Event loadEvent(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;
}
