package com.alodiga.wallet.common.genericEJB;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


public class EntityManagerWallet {

    @PersistenceContext(unitName = "AlodigaWalletPU")
    protected EntityManager entityManager;

   
}
