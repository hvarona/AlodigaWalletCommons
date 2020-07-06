package com.alodiga.wallet.common.genericEJB;

import javax.ejb.Remote;

//INTERFAZ DE METODOS NO NECESARIAMENTE REMOTOS
@Remote
public interface WalletGenericEJB {

    void init();

    public boolean echo() throws Exception;
}
