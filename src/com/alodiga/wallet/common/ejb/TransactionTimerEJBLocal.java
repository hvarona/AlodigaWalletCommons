package com.alodiga.wallet.common.ejb;

import java.util.Date;
import java.util.List;
import javax.ejb.Local;
import javax.ejb.Timer;

import com.alodiga.wallet.common.exception.EmptyListException;
import com.alodiga.wallet.common.exception.GeneralException;
import com.alodiga.wallet.common.exception.NullParameterException;
import com.alodiga.wallet.common.exception.RegisterNotFoundException;
import com.alodiga.wallet.common.genericEJB.EJBRequest;
import com.alodiga.wallet.common.genericEJB.WalletGenericEJB;
import com.alodiga.wallet.common.model.DailyClosing;
import javax.ejb.Remote;
import javax.ejb.Timer;


@SuppressWarnings(value = {"all"})
@Local
public interface TransactionTimerEJBLocal extends WalletGenericEJB {
    
	public void execute(Timer timer);

    public void forceExecution() throws Exception;

    public void forceTimeout() throws Exception;

    public Date getNextExecutionDate();

    public void restart() throws Exception;

    public void start() throws Exception;

    public void stop() throws Exception;

    public Long getTimeoutInterval();
    
}
