/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;



@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-08-20T10:46:54")
@StaticMetamodel(BalanceHistory.class)
public class BalanceHistory_ { 

    public static volatile SingularAttribute<BalanceHistory, Date> date;
    public static volatile SingularAttribute<BalanceHistory, Product> productId;
    public static volatile SingularAttribute<BalanceHistory, Float> oldAmount;
    public static volatile SingularAttribute<BalanceHistory, Float> currentAmount;
    public static volatile SingularAttribute<BalanceHistory, Long> id;
    public static volatile SingularAttribute<BalanceHistory, String> adjusmentInfo;
    public static volatile SingularAttribute<BalanceHistory, Long> userId;
    public static volatile SingularAttribute<BalanceHistory, Long> version;
    public static volatile SingularAttribute<BalanceHistory, Transaction> transactionId;

}
    
