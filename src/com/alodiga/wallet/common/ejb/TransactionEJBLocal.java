package com.alodiga.wallet.common.ejb;

import java.util.Date;
import java.util.List;
import javax.ejb.Local;
import com.alodiga.wallet.common.exception.EmptyListException;
import com.alodiga.wallet.common.exception.GeneralException;
import com.alodiga.wallet.common.exception.NullParameterException;
import com.alodiga.wallet.common.exception.RegisterNotFoundException;
import com.alodiga.wallet.common.genericEJB.EJBRequest;
import com.alodiga.wallet.common.genericEJB.WalletGenericEJB;
import com.alodiga.wallet.common.model.DailyClosing;


@SuppressWarnings(value = {"all"})
@Local
public interface TransactionEJBLocal extends WalletGenericEJB {
    
	public DailyClosing closingDailyTransactionWallet(Date closingDate) throws GeneralException, NullParameterException;       
    
}
