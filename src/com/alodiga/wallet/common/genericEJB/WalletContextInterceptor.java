package com.alodiga.wallet.common.genericEJB;

import javax.interceptor.AroundInvoke;
import javax.interceptor.InvocationContext;

import org.apache.log4j.Logger;

import com.alodiga.wallet.common.utils.EjbConstants;
import com.alodiga.wallet.common.utils.MessageFormatHelper;

public class WalletContextInterceptor
{
	private MessageFormatHelper sysMessage = new MessageFormatHelper(EjbConstants.MESSAGE_FILE_NAME);
	
	@AroundInvoke
	public Object configData(InvocationContext ctx) throws Exception
	{
		return ctx.proceed();
	}
	
	
	
	
	

}
