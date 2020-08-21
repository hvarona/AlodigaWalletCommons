/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-08-20T10:46:54")
@StaticMetamodel(Commission.class)
public class Commission_ { 

    public static volatile SingularAttribute<Commission, Date> beginningDate;
    public static volatile CollectionAttribute<Commission, CommissionItem> commissionItemCollection;
    public static volatile CollectionAttribute<Commission, BankOperation> bankOperationCollection;
    public static volatile SingularAttribute<Commission, Date> endingDate;
    public static volatile SingularAttribute<Commission, TransactionType> transactionTypeId;
    public static volatile SingularAttribute<Commission, Product> productId;
    public static volatile SingularAttribute<Commission, Long> id;
    public static volatile SingularAttribute<Commission, Short> isPercentCommision;
    public static volatile SingularAttribute<Commission, Float> value;

}
