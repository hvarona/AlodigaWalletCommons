package com.alodiga.wallet.common.genericEJB;

import javax.ejb.Local;

@Local
public interface WalletGenericEJBLocal
{
	void init();
    public boolean echo() throws Exception;
}
