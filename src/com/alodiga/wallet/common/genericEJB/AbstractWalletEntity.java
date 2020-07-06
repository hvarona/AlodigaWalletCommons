package com.alodiga.wallet.common.genericEJB;

import java.io.Serializable;

import javax.persistence.Table;

import com.alodiga.wallet.common.exception.TableNotFoundException;

public abstract class AbstractWalletEntity implements WalletGenericEntity, Serializable {

	public abstract Object getPk();
	
	public abstract String getTableName() throws TableNotFoundException;

	public String getTableName(Class<?> clazz) {
		Table table = clazz.getAnnotation(Table.class);
		return table.name();
	}
}
