package com.alodiga.wallet.common.genericEJB;

import org.apache.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.web.client.RestTemplate;

import com.alodiga.wallet.common.exception.NullParameterException;
import com.alodiga.wallet.common.utils.DocumentHandler;
import com.alodiga.wallet.common.utils.WalletWSMediaType;



public class AbstractSPRESTEJB extends AbstractWalletEJB {

	private RestTemplate restTemplate;

	public AbstractSPRESTEJB() {
		restTemplate = new RestTemplate();
	}

	protected String loadData(Class clazz, EJBRequest request, Logger logger, String methodName) throws NullParameterException {
		if (request == null) {
			throw new NullParameterException( "", null);
		}
		WalletWSMediaType distMediaType = request.getMediaType();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType(distMediaType.getType(), distMediaType.getSubtype()));
		//LinkedMultiValueMap parameters = new LinkedMultiValueMap();
		//parameters.setAll(request.getParams());
		//HttpEntity httpRequest = new HttpEntity(parameters, headers);
	//	ResponseEntity<String> responseEntity = restTemplate.exchange(request.getUrl(), request.getMethod(), httpRequest, String.class);
		String data ="1123";/* responseEntity.getBody();*/
		//persistAuditData(EventTypeEnum.READ, data, request.getAuditData());
		return data;
	}

	protected Object parseObject(String o, Class clazz) {
		return DocumentHandler.objectFromXml(o, clazz);
	}
}
