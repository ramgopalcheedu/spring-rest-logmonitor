package com.github.ramgopalcheedu.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.BufferingClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

import com.github.ramgopalcheedu.interceptor.LoggerInterceptor;

@Configuration
public class LogConfig {

	
	@Bean(name="withLogInterceptor")
	public RestTemplate restTemplate() {
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.setRequestFactory(new BufferingClientHttpRequestFactory(restTemplate.getRequestFactory()));
		restTemplate.setInterceptors(java.util.Collections.singletonList(new LoggerInterceptor()));
		return restTemplate;
	}
}
