package com.github.ramgopalcheedu.interceptor;

import java.io.IOException;
import java.nio.charset.Charset;
import java.time.Duration;
import java.time.Instant;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.http.client.ClientHttpRequestExecution;
import org.springframework.http.client.ClientHttpRequestInterceptor;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.util.StreamUtils;

public class LoggerInterceptor implements ClientHttpRequestInterceptor {

	public static Logger logger = LoggerFactory.getLogger(LoggerInterceptor.class);

	@Override
	public ClientHttpResponse intercept(HttpRequest request, byte[] body, ClientHttpRequestExecution execution)
			throws IOException {
		
		printRequest(request,body);
		long startTime = System.currentTimeMillis();
		ClientHttpResponse response = execution.execute(request, body);
		printResponse(response);
		long endTime = System.currentTimeMillis();
		logger.debug(">>>> OutBound-Services api call response for method: {} {} "
				+ "took: {}",request.getMethod(),
				request.getURI(),Duration.between(Instant.ofEpochMilli(startTime), 
						Instant.ofEpochSecond(endTime)).toString());
		
		return response;
	}

	private void printResponse(ClientHttpResponse response) throws IOException {
		
		logger.debug("===================response begin================================");

		logger.debug("Status Code :  {}",response.getStatusCode());
		logger.debug("Status Text :  {}",response.getStatusText());
		logger.debug("Headers     :  {}",response.getHeaders());
		
		if(isBinaryContent(response)) {
			logger.debug("Response Body: {}","<Binary Content>");
		}else {
			logger.debug("Response Body: {}",StreamUtils.copyToString(response.getBody(), Charset.defaultCharset()));
		}
		
		logger.debug("===================response end================================");

		
	}

	private boolean isBinaryContent(ClientHttpResponse response) {
		
		return response.getHeaders().get(HttpHeaders.CONTENT_TYPE).stream().anyMatch(val -> (val.contains("binary") || 
				val.contains("stream")));
	}

	private void printRequest(HttpRequest request, byte[] body) {
		final int maxLength = body.length > 10000 ? 10000: body.length; 
		logger.debug("===================request begin================================");
		logger.debug("URI     : {}",request.getURI());
		logger.debug("Method  : {}",request.getMethod());
		logger.debug("Headers : {}",null!=request.getHeaders()?request.getHeaders():""); // You can mask your headers here if they contain sensitive information
		logger.debug("===================request end================================");
	}
	
}
