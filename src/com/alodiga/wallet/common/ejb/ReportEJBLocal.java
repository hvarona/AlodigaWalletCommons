package com.alodiga.wallet.common.ejb;

import java.util.List;
import javax.ejb.Local;

import com.alodiga.wallet.common.exception.EmptyListException;
import com.alodiga.wallet.common.exception.GeneralException;
import com.alodiga.wallet.common.exception.NullParameterException;
import com.alodiga.wallet.common.exception.RegisterNotFoundException;
import com.alodiga.wallet.common.genericEJB.EJBRequest;
import com.alodiga.wallet.common.genericEJB.WalletGenericEJBLocal;
import com.alodiga.wallet.common.model.ParameterType;
import com.alodiga.wallet.common.model.Report;
import com.alodiga.wallet.common.model.ReportParameter;
import com.alodiga.wallet.common.model.ReportType;
import com.alodiga.wallet.common.model.User;

@SuppressWarnings("all")
@Local
public interface ReportEJBLocal extends WalletGenericEJBLocal {

    public void deleteProfileReports(EJBRequest request) throws NullParameterException, GeneralException;

    public void deleteReportParameter(EJBRequest request) throws NullParameterException, GeneralException;

    public Report enableProduct(EJBRequest request) throws GeneralException, NullParameterException, RegisterNotFoundException;

    public List<ParameterType> getParameterType(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;

    public List<Report> getReport(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;

    public List<Report> getReportByReportTypeId(Long reportTypeId, User currentUser) throws NullParameterException, GeneralException, EmptyListException;

    public List<ReportParameter> getReportParameter(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;

    public List<ReportType> getReportTypes(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;

    public ParameterType loadParameterType(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;

    public Report loadReport(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;

    public ReportParameter loadReportParameter(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;

    public List<String> runReport(EJBRequest request) throws NullParameterException, GeneralException, EmptyListException;

    public Report saveReport(EJBRequest request) throws NullParameterException, GeneralException, NullParameterException;
}
